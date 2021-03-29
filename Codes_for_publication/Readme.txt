##############Code Guide:#############

The optimal parameter experiments can be run from optimal_parameter_test.m and the perturbed parameter experiments
can be run from nonstandard_parameter_test.m. The latter requires a 7xn (where n is larger than the number of trials)
matrix of random perturbations saved in random_numbers.mat. Both of these files generate covariate and response data
to be used in the Python script ENSO_figure.py. This Python script takes the .mat outputs from optimal_parameter_test.m
or nonstandard_parameter_test.m and trains neural networks. The neural net architecture (and helper functions) are located
in pyfunctionsforkeras.py. The default network architecture is a densely connected Tanh network but code for other networks
is also available. Note that different architectures may require modification of optimal_parameter_test.m and nonstandard_parameter_test.m 
in order to generate appropriately shaped covariate data.

After running either optimal_parameter_test.m or nonstandard_parameter_test.m, the data is prepared for plotting using gen_data.m
(for the optimal parameter case) or gen_data_nonstandard.m (for the perturbed parameter case). 

Finally, gen_figures.m and gen_figures_nonstandard.m are used to generate the figures for the optimal and perturbed parameter case, respectively.
These .m files only require standardload.mat or nonstandardloadall.mat. Note that the figures will not look exactly as in the text because some
visual features (font size, figure size, colors, titles) were edited after generating the figures.
