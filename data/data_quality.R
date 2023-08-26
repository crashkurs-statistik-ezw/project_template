library(assertr)



# Gereinigter Datensatz laden ---------------------------------------------
dframe <- read_csv("data/bestand/ags_liste_bw.csv") |> pull(ags)



# Data Quality Checks ausführen -------------------------------------------
dframe |> 
  verify(has_only_names("Jahr", "Schule", "Schultyp", "Klasse",
                        "SuS", "Z\u0081uege", "ST")) |>
  verify(SuS >= 0) |> 
  assert(in_set("1", "2", "3", "4", "GST"), Klasse) |> 
  assert(in_set("GS", "SBBZ"), Schultyp) |> 
  assert(in_set("oe", "p"), ST) |> 
  assert(in_set(schulen_abk_alle), Schule) |>
  verify(has_class("Jahr", class = "integer"))

