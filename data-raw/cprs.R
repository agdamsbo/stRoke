## code to prepare `cprs` dataset goes here

usethis::use_data(cprs, overwrite = TRUE)

cprs <- data.frame(cpr=sample(c("2310450637", "010115-4000", "0101896000",
                                "010189-3000","300450-1030","010150-4021",
                                "011085-AKE3","0101EJ-ATW3"),200,TRUE))
save(cprs,file="data/cprs.rda")
