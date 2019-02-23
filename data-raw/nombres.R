library(dplyr)

if (!file.exists("data-raw/historico-nombres.csv")) {
  tmp <- tempfile(fileext = ".zip")
  download.file("http://infra.datos.gob.ar/catalog/otros/dataset/2/distribution/2.1/download/historico-nombres.zip", tmp,
                quiet = TRUE)
  unzip(tmp, exdir = "data-raw")
  unlink(tmp)
}

nombres <- read.csv("data-raw/historico-nombres.csv", stringsAsFactors = FALSE)

usethis::use_data(nombres, compress = "xz", overwrite = T)

