<!-- badges: start -->
[![Github Actions](https://github.com/agdamsbo/stRoke/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/agdamsbo/stRoke/actions/workflows/R-CMD-check.yaml)
[![Page deployed](https://github.com/agdamsbo/stRoke/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/agdamsbo/stRoke/actions/workflows/pages/pages-build-deployment)
[![codecov](https://codecov.io/github/agdamsbo/stRoke/branch/main/graph/badge.svg?token=U0RBZYSKG5)](https://codecov.io/github/agdamsbo/stRoke)
<!-- badges: end -->

# stRoke package <img src="man/figures/hexlogo.png" align="right" />

This is an R-toolbox of custom functions for convenient data management and analysis in clinical health research and teaching.
The package is mainly collected for personal use, but any use beyond that is encouraged.
This package has migrated functions from the agdamsbo/daDoctoR-package, and new functions has been added.

# A few notes
The function `generic_stroke()`can be used with `data(talos)` or a custom data set to illustrate the classic analysis of mRS outcome from stroke trials.

In documenting and testing the package, I have used [OpenAI's](https://beta.openai.com/overview) chatgpt with [gpttools](https://jameshwade.github.io/gpttools/). The chatgpt is an interesting tool, that is in no way perfect, but it helps with tedious tasks. Both `gpttools` and [`gptstudio`](https://michelnivard.github.io/gptstudio/) are interesting implementations in R and RStudio.

# Source

This package is [shared on GitHub](https://github.com/agdamsbo/stRoke), and you are very welcome to contribute by opening an issue or a pull request.

# Installation

The package can be installed from GitHub:

```
remotes::install_github("agdamsbo/stRoke")
```
