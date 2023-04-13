####
This is a new package version

## Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

## R CMD check results
❯ On windows-x86_64-devel (r-devel)
  checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
    'lastMiKTeXException'

❯ On ubuntu-gcc-release (r-release)
  checking CRAN incoming feasibility ... NOTE
  Maintainer: ‘Andreas Gammelgaard Damsbo <agdamsbo@clin.au.dk>’
  
  Found the following (possibly) invalid URLs:
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

❯ On fedora-clang-devel (r-devel)
  checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found

0 errors ✔ | 0 warnings ✔ | 3 notes ✖

