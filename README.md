# Winchester_EVENTER

Data and code for:

Winchester, G.†, Steele, O.G.†*, Liu, S., Chagas, A.M., Aziz, W., Penn, A.C.  (2024) Reproducible supervised learning-assisted classification of spontaneous synaptic waveforms with Eventer. *Front Neuroinform*. Submitted

† These authors contributed equally to this work and share first authorship  
\* Correspondence:  [Steele, Oliver G.](mailto:O.Steele@BSMS.ac.uk)   
  
[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/acpennlab/statistics-resampling-online/jammy-docker?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Facp29%252FWinchester_EVENTER%26urlpath%3Dlab%252Ftree%252FWinchester_EVENTER%252Findex.ipynb%26branch%3Dmaster)

The following links display jupyter notebooks rendered in HTML:
* [Figure 5 analysis](https://htmlpreview.github.io/?https://github.com/acp29/Winchester_EVENTER/blob/a2771b5170b057165bdc257c8a5a92b2bb6e91d9/output/fig5.html)
* [Figure 7 analysis](https://htmlpreview.github.io/?https://github.com/acp29/Winchester_EVENTER/blob/ac730a626528072a95f03ee2858d01150e266e74/output/fig7.html)

The Matlab script for simulating synaptic currents on real whole-cell recording noise is in the `matlab/fig5` folder. For simulating synaptic currents with white noise, and for evaluating the receiver operating characteristic (ROC) features and detection/classification accuracy, see the `simPSCs` and `invcompE` respectively, which are both available in the `base` folder of the [eventer](https://github.com/acp29/eventer) GitHub repository.
