For a CRAN submission we recommend that you fix all NOTEs, WARNINGs and ERRORs.
## Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

## R CMD check results
❯ On windows-x86_64-devel (r-devel)
  checking CRAN incoming feasibility ... [22s] NOTE

❯ On windows-x86_64-devel (r-devel)
  checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
  
    'lastMiKTeXException'

❯ On ubuntu-gcc-release (r-release)
  checking CRAN incoming feasibility ... NOTE
  Maintainer: ‘Andreas Gammelgaard Damsbo <agdamsbo@clin.au.dk>’
  
  Found the following (possibly) invalid URLs:
    URL: https://beta.openai.com/overview (moved to https://platform.openai.com/overview)
      From: inst/doc/toolbox.html
      Status: 200
      Message: OK
    URL: https://doi.org/10.1161/STROKEAHA.117.020067
      From: inst/doc/toolbox.html
      Status: 403
      Message: Forbidden
    URL: https://doi.org/10.1161/STROKEAHA.121.037744
      From: inst/doc/toolbox.html
            NEWS.md
      Status: 403
      Message: Forbidden
  
  Found the following (possibly) invalid DOIs:
    DOI: 10.1161/STROKEAHA.117.020067
      From: DESCRIPTION
      Status: Forbidden
      Message: 403
    DOI: 10.1161/STROKEAHA.121.037744
      From: DESCRIPTION
      Status: Forbidden
      Message: 403

❯ On ubuntu-gcc-release (r-release)
  checking examples ... [13s/58s] NOTE
  Examples with CPU (user + system) or elapsed time > 5s
                  user system elapsed
  generic_stroke 4.556  0.082  22.210
  label_select   1.648  0.008   7.649
  ci_plot        1.441  0.028   6.253

❯ On fedora-clang-devel (r-devel)
  checking CRAN incoming feasibility ... [10s/73s] NOTE
  Maintainer: ‘Andreas Gammelgaard Damsbo <agdamsbo@clin.au.dk>’
  
  Found the following (possibly) invalid URLs:
    URL: https://beta.openai.com/overview (moved to https://platform.openai.com/overview)
      From: inst/doc/toolbox.html
      Status: 200
      Message: OK

❯ On fedora-clang-devel (r-devel)
  checking examples ... [13s/56s] NOTE
  Examples with CPU (user + system) or elapsed time > 5s
                  user system elapsed
  generic_stroke 4.819  0.063  21.203
  label_select   1.557  0.007   6.411
  ci_plot        1.494  0.009   6.765

❯ On fedora-clang-devel (r-devel)
  checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found

0 errors ✔ | 0 warnings ✔ | 7 notes ✖
