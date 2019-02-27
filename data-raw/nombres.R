library(dplyr)
library(readr)

if (!file.exists("data-raw/historico-nombres.csv")) {
  tmp <- tempfile(fileext = ".zip")
  download.file("http://infra.datos.gob.ar/catalog/otros/dataset/2/distribution/2.1/download/historico-nombres.zip", tmp,
                quiet = TRUE)
  unzip(tmp, exdir = "data-raw")
  unlink(tmp)
}

nombres_2 <- read_csv("data-raw/historico-nombres.csv") %>%
  group_by(anio, nombre) %>%
  summarise(cantidad = sum(cantidad)) %>%
  select(anio, nombre, cantidad) %>%
  arrange(anio, nombre)

write_csv(head(nombres,10), "data-raw/nombredepersonas_sample.csv")

usethis::use_data(nombres, compress = "xz", overwrite = T)
