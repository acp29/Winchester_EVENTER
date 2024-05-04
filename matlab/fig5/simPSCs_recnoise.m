filename = 'Sim6';
noise_wave = 1;

%  Script to simulate mEPSCs with amplitude and kinetics 
  
  Time=9.9;
  n=40; % set between 5 (0.5 Hz) and 40 (4 Hz)
  sample_rate=40000;
  N=sample_rate*Time;
  Event=zeros(N,1);
  EventMarkers=Event;
  Trace=zeros(N,1);
  T = (0:N-1)'*1/sample_rate;

  % Generating the timings and amplitudes of events
  for i=1:n
    Event=zeros(N,1);
    W=1e-12*exp(random('norm',2.46,0.35));	% Log-normal distributed random values with std = cv
    j=randi(N);
    Event(j)=1;
    EventMarkers=EventMarkers+Event;
  % Generating the template event
    tau_r=1e-3*exp(random('norm',-0.31,0.60));
    tau_d=0;
    while tau_d <= tau_r
      tau_d=1e-3*exp(random('norm',1.48,0.46));
    end
    peakdelay(i,:) = tau_d*tau_r/(tau_d-tau_r)*log(tau_d/tau_r);
    tempTime = [0:1/sample_rate:peakdelay(i,:)];
    maxslope = max(diff(-exp(-tempTime/tau_r)+exp(-tempTime/tau_d)));
    maxslopetime = tempTime(dsearchn([-exp(-tempTime/tau_r)+exp(-tempTime/tau_d)]',maxslope));
    Template = -exp(-T/tau_r)+exp(-T/tau_d);
    TemplatePeak = max(Template);
    Template = Template/TemplatePeak;
    Template = Template*-1;
    Template_FFT = fft(Template);
    Event_FFT = fft(Event);
    temp = real(ifft(Event_FFT.*Template_FFT));
    temp = temp*W;
    Trace=Trace+temp;


  end
  n = numel(find(EventMarkers~=0));

  S=ephysIO('./noiseDB.phy');
  Noisy = Trace+S.array(:,noise_wave+1);

  h1= figure(1);
  plot(T,Noisy)
  title('Simulated Trace');
  xlabel('Time (s)');
  ylabel('Current(A)');
  %Creating the folder to save stuff
  if exist(filename)==7
   rmdir(filename, 's')
  end
  mkdir(filename);
  cd (filename);



  %Save simulation
  ephysIO ('Simulation.phy',[T,Noisy],'s','A',{},{},'int32');
  saveas(h1,'Simulation.fig','fig');
  %Save EventMarkers(event times with amplitude)
  ephysIO ('EventMarkers.phy',[T,EventMarkers],'s','A',{},{},'int32');

  %Save Event Times
  EventTimes=find(EventMarkers~=0)/sample_rate;
  fid=(fopen('Event Times.txt','wt'));
  fprintf(fid, '%.9e\n', EventTimes);
  fclose(fid);

  %Go back to old directory
  mydir=pwd;
  idcs   = strfind(mydir,filesep);
  newdir = mydir(1:idcs(end)-1);
  cd(newdir);


