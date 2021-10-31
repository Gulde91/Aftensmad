
# retter ----
retter <- tibble::tribble(
  ~retter, ~key, ~type,
  "V\u00E6lg ret", "", "",
  "M\u00F8rbradgryde", "morbrad_opskr", "gris", 
  "Carbonara", "carbonara_opskr", "gris",
  "Fiskefilet", "fiskefilet_opskr", "fisk",
  "Pizza", "pizza_opskr", "vegetar|gris|okse",
  "Burger", "burger_opskr", "okse|gris",
  "Frikadeller", "frikadeller_opskr", "gris",
  "Dahl", "dahl_opskr", "vegetar",
  "Madpandekager", "madpandekager_opskr", "kylling", 
  "Ravioli", "ravioli_opskr", "vegetar",
  "Bacon kyllinge t\u00E6rte", "bacon_kylling_taerte_opskr", "gris",
  "Kyllingebowl", "kyllingebowl_opskr", "kylling",
  "Lasagne", "lasagne_opskr", "kylling",
  "Kalkunschnitzel", "kalkunschnitzel_opskr", "kalkun",
  "Risengr\u00F8d", "risengrod_opskr", "vegetar",
  "Madpangekager p\u00E5 panden", "madpangekager_paa_panden_opskr", "kylling",
  "Chili con carne", "chili_con_carne_opskr", "okse",
  "Br\u00E6ndende k\u00E6rlighed", "braendende_kaerlighed_opskr", "gris",
  "Kartoffel-porre suppe", "kartoffel_porre_suppe_opskr", "gris")

retter$count <- 1

# mørbradgryde ----
morbrad_opskr <- tibble::tribble(
  ~"M\u00F8rbradgryde", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "svinem\u00F8rbrad", 0.5, "stk", "k\u00F8d", "",
  "cocktailp\u00F8lser", 100, "gram", "kød", "p\u00E5l\u00E6g",
  "bacon i skiver", 40, "gram", "k\u00F8d", "p\u00E5l\u00E6g",
  "l\u00F8g", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "tomatpure", 0.5, "d\u00E5se(r)", "konserves", "tomat",
  "gr\u00F8nsagsbouillon", 0.5, "stk", "konserves", "krydderi",
  "oksebouillon", 0.5, "stk", "konserves", "krydderi",
  "madlavningsfl\u00F8de", 0.1, "liter", "mejeri", "m\u00E6lk",
  "ribsgele (tilsmagning)", NA, "", "konserves", "",
  "paprika (tilsmagning)", NA, "", "konserves", "krydderi",
  "engelsk sovs (tilsmagning)", NA, "", "konserves", ""
)

# carbonara ----
carbonara_opskr <- tibble::tribble(
  ~"Carbonara", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "spaghetti", 90, "gram", "konserves", "",
  "parmesan", 25, "gram", "mejeri", "ost",
  "\u00E6ggeblommer", 1, "stk", "mejeri", "",
  "piskefl\u00F8de", 0.5, "dl", "mejeri", "m\u00E6lk",
  "l\u00F8g", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "bacon i tern", 100, "gram", "k\u00F8d", "p\u00E5l\u00E6g"
)

# fiskefilet ----
fiskefilet_opskr <- tibble::tribble(
  ~"Fiskefilet", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "fiskefilet", 1, "stk", "frost", "",
  "remoulade (tilbeh\u00F8r)", NA, "", "konserves", "dressing",
  "citronsaft (tilbeh\u00F8r)", NA, "", "konserves", "",
  "kartofler", 0.5, "kg", "frugt_gr\u00F8nt", ""
)

# pizza ----
pizza_opskr <- tibble::tribble(
  ~"Pizza", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "tipo 00 mel", 125, "gram", "konserves", "mel",
  "durummel", 25, "gram", "konserves", "mel",
  "l\u00F8g", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "hvidl\u00F8g", 1, "stk", "frugt_gr\u00F8nt", "",
  "balsamico", 0.05, "dl", "konserves", "",
  "tomatpure", 0.5, "d\u00E5se(r)", "konserves", "tomat",
  "hakkede tomater", 0.5, "d\u00E5se(r)", "konserves", "tomat",
  "engelsk sovs (tilsmagning)", NA, "", "konserves", "",
  "frisk mozzarella", 1, "stk", "mejeri", "ost"
)

# burger ----
burger_opskr <- tibble::tribble(
  ~"Burger", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "hakket oksek\u00F8d", 0.175, "kg", "k\u00F8d", "",
  "bacon i skiver", 50, "gram", "k\u00F8d", "p\u00E5l\u00E6g",
  "brioche bolle", 1, "stk", "br\u00F8d", "",
  "agurk", 0.2, "stk", "frugt_gr\u00F8nt", "",
  "iceberg", 0.1, "stk", "frugt_gr\u00F8nt", "",
  "toastost", 2, "skiver", "mejeri", "ost",
  "ketchup (tilbeh\u00F8r)", NA, "", "konserves", "",
  "remoulade (tilbeh\u00F8r)", NA, "", "konserves", "dressing",
  "ristet l\u00F8g (tilbeh\u00F8r)", NA, "", "konserves", "",
  "BBQ dressing (tilsmagning)", NA, "", "konserves", "dressing",
  "eddike (tilsmagning)", NA, "", "konserves", ""
)

# frikadeller ----
frikadeller_opskr <- tibble::tribble(
  ~"Frikadeller", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
)

# dahl ----
dahl_opskr <- tibble::tribble(
  ~"Dahl", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "hvidl\u00F8g", 1.25, "stk", "frugt_gr\u00F8nt", "",
  "ingef\u00E6r", 0.5, "spsk", "frugt_gr\u00F8nt", "",
  "karry (tilsmagning)", NA, "", "konserves", "krydderi",
  "spidskommen (tilsmagning)", NA, "", "konserves", "krydderi",
  "koriander (tilsmagning)", NA, "", "konserves", "krydderi",
  "kardemomme (tilsmagning)", NA, "", "konserves", "krydderi",
  "chiliflager (tilsmagning)", NA, "", "konserves", "krydderi",
  "gr\u00F8ntsagsbouillon (tilsmagning)", NA, "", "konserves", "krydderi",
  "r\u00F8de linser", 50, "gram", "konserves", "",
  "hakkede tomater", 0.5, "d\u00E5se(r)",  "konserves", "tomat",
  "yoghurt naturel", 0.5, "dl", "mejeri", "m\u00E6lk",
  "agurk", 0.13, "stk", "frugt_gr\u00F8nt", "",
  "naanbr\u00F8d", 1, "stk", "br\u00F8d", "",
  "peanuts", 0.5, "pose(r)", "konserves", "chips"
)

# madpandekager ----
madpandekager_opskr <- tibble::tribble(
  ~"Madpandekager", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "kylling", 0.1, "kg", "k\u00F8d", "",
  "crispy chicken tex mex", 0.5, "stk",  "konserves", "mexico",
  "madpandekager", 1, "stk",  "konserves", "mexico",
  "tacoskal", 1, "stk",  "konserves", "mexico",
  "r\u00F8d peber", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "agurk", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "frosne majs", 0.1, "kg", "frost", "",
  "iceberg", 0.2, "stk", "frugt_gr\u00F8nt", "",
  "creme fraiche dressing", 50, "gram", "mejeri", "m\u00E6lk"
)

# ravioli ----
ravioli_opskr <- tibble::tribble(
  ~"Ravioli", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "ravioli", 100, "gram", "k\u00F8l", "",
  "pesto", 30, "gram", "konserves", ""
)

# bacon kyllinge tærte ----
bacon_kylling_taerte_opskr <- tibble::tribble(
  ~"Bacon kyllinge t\u00E6rte", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "f\u00E6rdig t\u00E6rtedej", 0.25, "rulle", "k\u00F8l", "",
  "bacon i tern", 0.25, "pakke(r)", "k\u00F8d", "p\u00E5l\u00E6g",
  "for\u00E5rsl\u00F8g", 0.25, "bundt", "frugt_gr\u00F8nt", "",
  "frosne \u00E6rter", 50, "gram", "frost", "",
  "karry (tilsmagning)", NA, "", "konserves", "krydderi",
  "chiliflager (tilsmagning)", NA, "", "konserves", "krydderi",
  "\u00E6g", 1.25, "stk", "mejeri", "",
  "creme fraiche", 0.63, "dl", "mejeri", "m\u00E6lk",
  "revet mozzarella", 18.75, "gram", "mejeri", "ost"
)

# kyllingebowl ----
kyllingebowl_opskr <- tibble::tribble(
  ~"Kyllingebowl", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "r\u00F8d peber", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "gul peber", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "r\u00F8dl\u00F8g", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "frosne majs", 50, "gram", "frost", "",
  "hvidl\u00F8gsfed", 1, "stk", "frugt_gr\u00F8nt", "",
  "basmatiris", 50, "gram", "konserves", "",
  "kylling", 0.14, "kg", "k\u00F8d", "",
  "lime", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "creme fraiche", 35, "gram", "mejeri", "m\u00E6lk",
  "fajita tex mex", 10, "gram", "konserves", "mexico"
)

# lasagne ----
lasagne_opskr <- tibble::tribble(
  ~"Lasagne", ~"maengde", ~"enhed",  ~"kat_1", ~"kat_2",
  "kylling", 0.125, "kg", "k\u00F8d", "",
  "hakkede tomater", 100, "gram", "konserves", "tomas",
  "l\u00F8g", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "piskefl\u00F8de", 0.63, "dl", "mejeri", "m\u00E6lk",
  "ketchup (tilsmagning)", NA, "", "konserves", "",
  "lasagneplader", 2.25, "stk", "konserves", "",
  "revet mozzarella", 50, "gram", "mejeri", "ost",
  "paprika (tilsmagning)", NA, "", "konserves", "krydderi",
  "oregano (tilsmagning)", NA, "", "konserves", "krydderi"
)

# kalkunschnitzel ----
kalkunschnitzel_opskr <- tibble::tribble(
  ~"Kalkunschnitzel", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "kalkun", 150, "gram", "k\u00F8d", "", 
  "kartofler", 150, "gram", "frugt_gr\u00F8nt", "",
  "guler\u00F8dder", 100, "gram", "frugt_gr\u00F8nt", "",
  "sm\u00F8r", 10, "gram", "mejeri", "",
  "hvidl\u00F8gsflute", 0.5, "stk", "frost", ""
)

# risengrød ----
risengrod_opskr <- tibble::tribble(
  ~"Risengr\u00F8d", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "gr\u00F8dris", 90, "gram", "konserves", "",
  "s\u00F8dm\u00E6lk", 0.5, "liter", "mejeri", "m\u00E6lk",
  "sukker", 2, "spsk", "konserves", "",
  "kanel (tilsmagning)", NA, "", "konserves", "krydderi"
)

# madpandekager på panden ----
madpangekager_paa_panden_opskr <- tibble::tribble(
  ~"Madpangekager p\u00E5 panden", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "l\u00F8g", 2, "stk", "frugt_gr\u00F8nt", "",
  "kylling", 150, "gram", "k\u00F8d", "",
  "r\u00F8d peberfrugt", 1, "stk", "frugt_gr\u00F8nt", "",
  "revet mozzarella", 50, "gram", "mejeri", "ost",
  "madpandekager", 2, "stk", "konserves", "mexico",
  "salsa", 0.5, "d\u00E5se(r)", "konserves", "mexico"
)

# chili con carne -----
chili_con_carne_opskr <- tibble::tribble(
  ~"Chili con carne", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "spidskommen (tilsmagning)", NA, "", "konserves", "krydderi",
  "kanel (tilsmagning)", NA, "", "konserves", "krydderi",
  "chiliflager (tilsmagning)", NA, "", "konserves", "krydderi",
  "hvidl\u00F8g", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "l\u00F8g", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "hakket oksek\u00F8d", 87.5, "gram", "k\u00F8d", "",
  "hakkede tomater", 0.25, "d\u00E5se(r)", "konserves", "tomat",
  "solt\u00F8rrede tomater", 0.75, "spsk", "konserves", "tomat",
  "oksebouillon (tilsmagning)", NA, "", "konserves", "krydderi",
  "kidneyb\u00F8nner", 0.25, "d\u00E5se(r)", "konserves", "", 
  "m\u00F8rk chokolade", 10, "", "gram", "slik",
  "olivenolie (tilsmagning)", NA, "", "konserves", "",
  "nachos", 31.25, "gram", "chips", "",
  "ris", 0.75, "dl", "konserves", "",
  "creme fraiche", 0.5, "dl", "mejeri", "m\u00E6lk",
  "revet cheddar", 37.5, "gram", "mejeri", "ost"
)

# brændende kærlighed ----
braendende_kaerlighed_opskr <- tibble::tribble(
  ~"Br\u00E6ndende k\u00E6rlighed", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "kartofler", 0.38, "kg", "frugt_gr\u00F8nt", "",
  "sm\u00F8r", 37.5, "gram", "mejeri", "", 
  "m\u00E6lk", 0.25, "dl", "mejeri", "m\u00E6lk",
  "bacon i skiver", 87.5, "gram", "k\u00F8d", "p\u00E5l\u00E6g",
  "l\u00F8g", 0.75, "stk", "frugt_gr\u00F8nt", "",
  "r\u00F8dbeder (tilbeh\u00F8r)", NA, "", "konserves", "",
  "persille (tilbeh\u00F8r)", NA, "", "frugt_gr\u00F8nt", "",
)

# kartoffel pore suppe ----
kartoffel_porre_suppe_opskr <- tibble::tribble(
  ~"Kartoffel-porre suppe", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "sm\u00F8r", 2.5, "gram", "mejeri", "",
  "l\u00F8g", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "kartofler", 125, "gram", "frugt_gr\u00F8nt", "",
  "porre", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "gr\u00F8ntsagsbouillon (tilsmagning)", NA, "", "konserves", "krydderi",
  "piskefl\u00F8de", 0.25, "dl", "mejeri", "m\u00E6lk",
  "bacon i skiver", 37.5, "gram", "k\u00F8d", "p\u00E5l\u00E6g",
  "br\u00F8d (tilbeh\u00F8r)", NA, "", "br\u00F8d", ""
)


# alle retter ----
opskrifter <- list(morbrad_opskr = morbrad_opskr,
                   carbonara_opskr = carbonara_opskr,
                   fiskefilet_opskr = fiskefilet_opskr,
                   pizza_opskr = pizza_opskr,
                   burger_opskr = burger_opskr,
                   frikadeller_opskr = frikadeller_opskr,
                   dahl_opskr = dahl_opskr,
                   madpandekager_opskr = madpandekager_opskr,
                   ravioli_opskr = ravioli_opskr,
                   bacon_kylling_taerte_opskr = bacon_kylling_taerte_opskr,
                   kyllingebowl_opskr = kyllingebowl_opskr,
                   lasagne_opskr = lasagne_opskr,
                   kalkunschnitzel_opskr = kalkunschnitzel_opskr,
                   risengrod_opskr = risengrod_opskr,
                   madpangekager_paa_panden_opskr = madpangekager_paa_panden_opskr,
                   chili_con_carne_opskr = chili_con_carne_opskr,
                   braendende_kaerlighed_opskr = braendende_kaerlighed_opskr,
                   kartoffel_porre_suppe_opskr = kartoffel_porre_suppe_opskr
                   )



# salater ----
salater <- tibble::tribble(
  ~retter, ~key, ~type,
  "V\u00E6lg salat", "", "",
  "Revet guler\u00F8dder", "revet_gulerodder_opskr", "vegetar",
  "Broccoli salat", "", ""
)

revet_gulerodder_opskr <- tibble::tribble(
  ~"Revet guler\u00F8dder", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "guler\u00F8dder", 75, "gram", "frugt_gr\u00F8nt", "",
  "rosiner", 10, "gram", "konserves", "",
  "citronsaft (tilbeh\u00F8r)", NA, "", "konserves", ""
)

salater_opskrifter <- list(
  revet_gulerodder_opskr = revet_gulerodder_opskr
)