% A novel robust meta-analysis model using the t distribution 
% for outlier accommodation and detection (tMeta).
% Version 1.0 (R2024) 06-Jun-2024

%In the /expr directory:
% Reproduce the results on the four datasets:
%   demo_mag               - shows the forest plot (Figure 1), model fitting results (Table 1), and outlier detection results (Figure 2) 
%                            for the mag dataset in Section 4.1.
%   demo_hipfrac           - shows the forest plot (Figure 1), model fitting results (Table 2), and outlier detection results (Figure 3) 
%                            for the hipfrac dataset in Section 4.2. 
%   demo_fluoride          - shows the forest plot (Figure 4), model fitting results (Table 3), and outlier detection results (Figure 5) 
%                            for the original and modified fluoride datasets in Section 4.3.
%   demo_cdp               - shows the forest plot (Figure 6), model fitting results (Table 4), and outlier detection results (Figure 7) 
%                            for the original and modified cdp datasets in Section 4.4.
% Demo
%   demo_tmeta             - Fitting tMeta on mag dataset.
%
% Basic functions:
%   plot_out               - detects outliers by various methods.
%   simu_1                 - conducts a single experiment using the tMeta model.
%   methods_results        - integrate results.
%   fore                   - shows forest plot and evolement of log-likelihood
%                            versus number of iterations.
%
%In the /prog directory:
%   tMeta                  - obtains the maximum likelihood estimates for the tMeta model.
%   Metaini                - initializes the parameters for tMeta.
%
% References:
%   [1] Wang, Y., Zhao, J.H, Jiang, F., Shi, L., & Pan, J.X. (2024).  
%       A novel robust meta-analysis model using the t distribution for outlier accommodation and detection. 
%       School of Statistics and Mathematics, Yunnan University of Finance and Economics, Kunming 650221, China.
%       arXiv preprint https://arxiv.org/pdf/2401.02203
%
% Author(s):
%    Jianhua Zhao                                                
%    Yue Wang      <ywang.ynufe@qq.com> 
%
% Copyright:
%
%   A novel robust meta-analysis model using the t distribution for 
%   outlier accommodation and detection is
%   Copyright (C) 2024 by Jianhua Zhao and Yue Wang.
%
%   The software package is free software; you can redistribute it
%   and/or modify it under terms of GNU General Public License as
%   published by the Free Software Foundation; either version 2 of
%   the license, or any later version. For more details see licenses
%   at http://www.gnu.org
%
%   The software package is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%   See the GNU General Public License for more details.
%
%   As stated in the GNU General Public License it is not possible to
%   include this software library or even parts of it in a proprietary
%   program wihtout written permission from the owners of the copyright.
%   If you wish to obtain such permission, you can reach us by mail:
%
%      A novel robust meta-analysis model using the t distribution 
%      for outlier accommodation and detection
%      School of Statistics and Mathematics 
%      Yunnan University of Finance and Economics
%      Kunming, 650221
%      China
%
%
%  and by e-mail:
%      
%      ywang.ynufe@qq.com
%
%  Please, if you find any bugs contact authors.
%
%   $Name:  $ $Revision: 1.0 $  $Date: 2024-06-07$
%

