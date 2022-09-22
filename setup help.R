usethis::use_description(list(License = "GPL-3"))
usethis::use_namespace()
dir.create("R")
usethis::use_package_doc()
usethis::use_roxygen_md()

usethis::use_package()

spelling::spell_check_setup()

pkgdown:::build_site()