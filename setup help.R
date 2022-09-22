usethis::use_description(list(License = "GPL-3"))
usethis::use_namespace()
dir.create("R")
usethis::use_package_doc()
usethis::use_roxygen_md()

usethis::use_package()

spelling::spell_check_setup()

pkgdown:::build_site()

# https://privefl.github.io/advr38book/packages.html#pkg-start

# Update version
source("ver_upd.R")

updatePackageVersion()

# Commit and push
commit_message<-"Version naming updated, script added"

git2r::commit(all=TRUE, message=paste(commit_message,lubridate::now()))

system("/usr/bin/git push origin HEAD:refs/heads/master")
