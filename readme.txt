# This file contains a brief introduction to the code package.
The folder prog contains function files of the proposed tMeta in the paper, detailed as follows.
tMeta.m
-- tMeta obtains the ML estimate for the tMeta model.

The folder expr contains the codes for section 3 in the paper, detailed as follows.
demo_cdp.m
-- demo_cdp shows model fitting (Table 4) and outlier detection (Figure 7) for different methods on the original and extended cdp datasets, 
   as well as a forest plot Figure 6 for the dataset.

demo_fluoride.m
-- demo_fluoride shows model fitting (Table 3) and outlier detection (Figure 5) for different methods on the original and extended fluoride datasets, 
   as well as a forest plot Figure 4 for the dataset.

demo_hipfrac.m
-- demo_hipfrac shows model fitting (Table 2) and outlier detection (Figure 3) for different methods on the hipfrac dataset, 
   as well as a forest plot Figure 1 for the dataset.

demo_mag.m
-- demo_mag shows model fitting (Table 1) and outlier detection (Figure 2) for different methods on the mag dataset, 
   as well as a forest plot Figure 1 for the dataset.


demo_tme.m
-- demo_tme shows the results on the mag dataset by tMeta.
   Note: To run the results on another dataset, you can replace the mag dataset.

plot_outm.m
-- plot_outm shows the outlier detection results of different methods.

simu_1.m
-- simu_1 is a function of the fitting results of one experiment of the tMeta model.