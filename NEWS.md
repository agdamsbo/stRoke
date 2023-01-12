# stRoke 0.23.1.4

## Functions:

* plot_olr() has been deprecated and removed. 
* ci_plot() functionality extended to include logistic model plotting.
* age_calc() use vapply() instead of sapply()
* gt_plot() function added to plot gt elements as ggplots. From [bstfun](https://github.com/MSKCC-Epi-Bio/bstfun). Not all done and satisfied with the layout with patchwork.

## Documentation

* Trying to complete all flags from goodpractice and inteRgrate

# stRoke 0.23.1.3

## Functions:

* files_filter() added. Simple function to get file names in path with specified filter.
* updated cpr_dob to give warnings if format is not recognised and return NAs.
* ci_plot() updated to actually handle binary factors. Uses glm(), not lm().

## Documentation:

* test, test and tests to satisfy codecov and, of course, ensure higher quality
* changes to comply with goodpractices::gp()

...and probably some more.

# stRoke 0.23.1.2

## Functions:

* cpr_dob() now includes `format=`.
* Other minor updates.

## Documentation:

* Two new vignettes
* Taking last steps in documenting before releasing on CRAN

## Other:

* New hex logo

# stRoke 0.23.1.1

## Functions:

* age_calc() now also outputs a numeric vector for units="days", and not a character vector as difftime() would.

## Documentation:

* Added a `NEWS.md` file to track changes to the package.
* Added codecov
* Added tests with the help of gpttools
