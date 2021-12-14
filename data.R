
# RETTER ----
retter <- tibble::tribble(
  ~retter, ~key, ~type,
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
  "Kartoffel-porre suppe", "kartoffel_porre_suppe_opskr", "gris",
  "Kylling kiev", "kylling_kiev_opskr", "kylling",
  "Pitabr\u00F8d", "pitabrod_opskr", "vegetar|kylling|gris",
  "Pulled chicken", "pulledchicken_opskr", "kylling",
  "Pulled pork", "pulledpork_opskr", "gris",
  "Gullasch", "gullasch_opskr", "okse",
  "Chicken Tikka Masala", "chickentikka_opskr", "kylling",
  "Fyldte peberfrugter", "fyldtepeberfrugter_opskr", "okse"
  ) %>% arrange(retter)

retter$count <- 1

# mørbradgryde ----
morbrad_opskr <- tibble::tribble(
  ~"M\u00F8rbradgryde", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "svinem\u00F8rbrad", 0.25, "stk", "k\u00F8d", "",
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
  "kartofler", 0.25, "kg", "frugt_gr\u00F8nt", ""
)

# pizza ----
pizza_opskr <- tibble::tribble(
  ~"Pizza", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "tipo 00 mel", 125, "gram", "konserves", "mel",
  "durummel", 25, "gram", "konserves", "mel",
  "l\u00F8g", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "hvidl\u00F8g", 1, "stk", "frugt_gr\u00F8nt", "",
  "hvidvinseddike", 0.05, "dl", "konserves", "",
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
  "hakket svinek\u00F8d", 166.6, "gram", "k\u00F8d", "",
  "l\u00F8g", 0.33, "stk", "frugt_gr\u00F8nt", "",
  "hvedemel", 10, "gram", "konserves", "mel",
  "havregryn", 10, "gram", "konserves", "mel",
  "salt (tilsmagning)", NA, "", "konserves", "krydderi",
  "\u00E6g", 0.33, "stk", "mejeri", "",
  "m\u00E6lk", 0.066, "liter", "mejeri", "m\u00E6lk"
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
  "kylling", 100, "gram", "k\u00F8d", "",
  "crispy chicken tex mex", 0.5, "stk",  "konserves", "mexico",
  "madpandekager", 1, "stk",  "konserves", "mexico",
  "tacoskal", 1, "stk",  "konserves", "mexico",
  "r\u00F8d peber", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "agurk", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "frosne majs", 0.1, "kg", "frost", "",
  "iceberg", 0.2, "stk", "frugt_gr\u00F8nt", "",
  "creme fraiche dressing", 50, "gram", "konserves", "dressing"
)

# ravioli ----
ravioli_opskr <- tibble::tribble(
  ~"Ravioli", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "ravioli", 100, "gram", "k\u00F8l", "",
  "pesto", 30, "gram", "konserves", ""
)
# pulled chicken ----
pulledchicken_opskr <- tibble::tribble(
  ~"Pulled chicken", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "pulled chicken", 0.5, "stk", "k\u00F8d", "p\u00E5l\u00E6g",
  "coleslaw", 0.33, "stk", "frugt_gr\u00F8nt", "",
  "brioche bolle", 1, "stk", "br\u00F8d", "",
  "mayonnaise (tilbeh\u00F8r)", NA, "", "konserves", "dressing"
)
# pulled pork ----
pulledpork_opskr <- tibble::tribble(
  ~"Pulled pork", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "pulled pork", 0.5, "stk", "k\u00F8d", "p\u00E5l\u00E6g",
  "coleslaw", 0.33, "stk", "frugt_gr\u00F8nt", "",
  "brioche bolle", 1, "stk", "br\u00F8d", "",
  "mayonnaise (tilbeh\u00F8r)", NA, "", "konserves", "dressing"
)
# gullasch ----
gullasch_opskr <- tibble::tribble(
  ~"Gullasch", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "l\u00F8g", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "hvidl\u00F8g", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "kartofler", 0.25, "kg", "frugt_gr\u00F8nt", "",
  "guler\u00F8dder", 25, "gram", "frugt_gr\u00F8nt", "",
  "oksebov", 125, "gram", "k\u00F8l", "",
  "paprika (tilsmagning)", NA, "", "konserves", "krydderi",
  "spidskommen (tilsmagning)", NA, "", "konserves", "krydderi",
  "gr\u00F8ntsagsbouillon (tilsmagning)", NA, "", "konserves", "krydderi",
  "tomatpure", 25, "gram", "konserves", "",
  "m\u00E6lk", 0.38, "liter", "mejeri", "m\u00E6lk",
  "sm\u00F8r", 25, "gram", "mejeri", ""
)
# chicken tikka masala ----
chickentikka_opskr <- tibble::tribble(
  ~"Chicken Tikka Masala", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "gr\u00E6sk yoghurt", 50, "gram", "mejeri", "m\u00E6lk",
  "hvidl\u00F8g", 1.5, "stk", "frugt_gr\u00F8nt", "",
  "frisk ingef\u00E6r", 40, "gram", "frugt_gr\u00F8nt", "",
  "garam masala (tilsmagning)", NA, "", "konserves", "krydderi",
  "gurkemeje (tilsmagning)", NA, "", "konserves", "krydderi",
  "chiliflager (tilsmagning)", NA, "", "konserves", "krydderi",
  "st\u00F8dt nelike (tilsmagning)", NA, "", "konserves", "krydderi",
  "limesaft (tilsmagning)", NA, "", "konserves", "",
  "kylling", 150, "gram", "k\u00F8l", "",
  "l\u00F8g", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "tomatpure", 20, "gram", "konserves", "",
  "piskefl\u00F8de", 0.5, "dl", "mejeri", "m\u00E6lk",
  "ris", 50, "gram", "konserves", ""
)
# fyldte peberfrugter ----
fyldtepeberfrugter_opskr <- tibble::tribble(
  ~"Fyldte peberfrugter", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "r\u00F8d peberfrugt", 1, "stk", "frugt_gr\u00F8nt", "",
  "l\u00F8g", 0.3, "stk", "frugt_gr\u00F8nt", "",
  "paprika (tilsmagning)", NA, "", "konserves", "krydderi",
  "chiliflager (tilsmagning)", NA, "", "konserves", "krydderi",
  "tomatpure", 18, "gram", "konserves", "",
  "hakket oksek\u00F8d", 90, "gram", "k\u00F8l", "",
  "revet cheddar", 15, "gram", "mejeri", "ost",
  "ris", 35, "gram", "konserves", ""
)
# bacon kyllinge tærte ----
bacon_kylling_taerte_opskr <- tibble::tribble(
  ~"Bacon kyllinge t\u00E6rte", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "f\u00E6rdig t\u00E6rtedej", 0.25, "rulle(r)", "k\u00F8l", "",
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
  "kylling", 140, "gram", "k\u00F8d", "",
  "lime", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "creme fraiche", 35, "gram", "mejeri", "m\u00E6lk",
  "fajita tex mex", 10, "gram", "konserves", "mexico"
)

# lasagne ----
lasagne_opskr <- tibble::tribble(
  ~"Lasagne", ~"maengde", ~"enhed",  ~"kat_1", ~"kat_2",
  "kylling", 125, "gram", "k\u00F8d", "",
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
  "m\u00E6lk", 0.5, "liter", "mejeri", "m\u00E6lk",
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
  "creme fraiche", 0.5, "dl", "mejeri", "m\u00E6lk"
)

# brændende kærlighed ----
braendende_kaerlighed_opskr <- tibble::tribble(
  ~"Br\u00E6ndende k\u00E6rlighed", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "kartofler", 0.38, "kg", "frugt_gr\u00F8nt", "",
  "sm\u00F8r", 37.5, "gram", "mejeri", "", 
  "m\u00E6lk", 0.025, "liter", "mejeri", "m\u00E6lk",
  "bacon i skiver", 87.5, "gram", "k\u00F8d", "p\u00E5l\u00E6g",
  "l\u00F8g", 0.75, "stk", "frugt_gr\u00F8nt", "",
  "r\u00F8dbeder (tilbeh\u00F8r)", NA, "", "konserves", "",
  "persille (tilbeh\u00F8r)", NA, "", "frugt_gr\u00F8nt", "",
)

# kartoffel porre suppe ----
kartoffel_porre_suppe_opskr <- tibble::tribble(
  ~"Kartoffel-porre suppe", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "sm\u00F8r", 2.5, "gram", "mejeri", "",
  "l\u00F8g", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "hvidl\u00F8gsfed", 0.5, "stk",  "frugt_og_gr\u00F8nt", "",
  "kartofler", 125, "gram", "frugt_gr\u00F8nt", "",
  "porre", 0.5, "stk", "frugt_gr\u00F8nt", "",
  "h\u00F8nsefondbouillon", 2, "stk", "konserves", "krydderi",
  "piskefl\u00F8de", 0.25, "dl", "mejeri", "m\u00E6lk",
  "bacon i skiver", 37.5, "gram", "k\u00F8d", "p\u00E5l\u00E6g",
  "br\u00F8d (tilbeh\u00F8r)", NA, "", "br\u00F8d", "",
)

# kylling kiev ----
kylling_kiev_opskr <- tibble::tribble(
~"Kylling kiev", ~"maengde",  ~"enhed", ~"kat_1",  ~"kat_2",
"kyllingebrystfilet", 1, "stk", "k\u00F8d", "",
"rodfrugter", 150, "gram", "frugt_og_gr\u00F8nt", "",
"spinat", 30, "gram",  "frugt_og_gr\u00F8nt", "",
"citron",  0.5, "stk", "frugt_og_gr\u00F8nt", "",
"persille", 20, "gram", "frugt_og_gr\u00F8nt", "",
"r\u00F8dl\u00F8g", 0.5, "stk", "frugt_og_gr\u00F8nt", "",
"hvidl\u00F8gsfed", 0.5, "stk",  "frugt_og_gr\u00F8nt", "",
"panko", 15, "gram", "konserves", "",
"aioli", 25, "gram", "konserves", "dressing",
"\u00E6gg", 0.5, "stk", "mejeri", "",
"sm\u00F8r", 30, "gram", "mejeri", ""
)



# pitabrød ----
pitabrod_opskr <- tibble::tribble(
  ~"Pitab\u00F8d", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "Pitabr\u00F8d", 2, "stk",  "frost", "",
  "kylling", 80, "gram", "k\u00F8d", "",
  "pepperoni", 60, "gram", "k\u00F8d", "p\u00E5l\u00E6g",
  "bacon i skiver", 60, "gram", "k\u00F8d", "p\u00E5l\u00E6g",
  "cocktailp\u00F8lser", 40, "gram", "k\u00F8d", "p\u00E5l\u00E6g",
  "r\u00F8d peber", 0.4, "stk", "frugt_gr\u00F8nt", "",
  "agurk", 0.2, "stk", "frugt_gr\u00F8nt", "",
  "frosne majs", 0.04, "kg", "frost", "",
  "iceberg", 0.1, "stk", "frugt_gr\u00F8nt", "",
  "creme fraiche dressing", 50, "gram", "konserves", "dressing"
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
                   kartoffel_porre_suppe_opskr = kartoffel_porre_suppe_opskr,
                   kylling_kiev_opskr = kylling_kiev_opskr,
                   pitabrod_opskr = pitabrod_opskr,
                   pulledchicken_opskr = pulledchicken_opskr,
                   pulledpork_opskr = pulledpork_opskr,
                   gullasch_opskr = gullasch_opskr,
                   chickentikka_opskr = chickentikka_opskr,
                   fyldtepeberfrugter_opskr = fyldtepeberfrugter_opskr
                   )




# TILBEHØR ----
tilbehor <- tibble::tribble(
  ~"Indkobsliste", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "kartofler", 0.25, "kg", "frugt_gr\u00F8nt", "",
  "sweet potato fries", 0.25, "kg", "frost", "",
  "guler\u00F8dder", 100, "gram", "frugt_gr\u00F8nt", "",
  "curly fries", 0.25, "kg", "frost", ""
)


# SALATER ----
salater <- tibble::tribble(
  ~retter, ~key, ~type,
  "", "", "",
  "Revet guler\u00F8dder", "revet_gulerodder_opskr", "vegetar",
  "Broccoli salat", "broccoli_salat_opskr", "vegetar",
  "Spidsk\u00E5lsalat med agurk og edamameb\u00F8nner", "spidskaal_agurk_opskr", "vegetar",
  "Hytteostsalat", "hytteost_salat_opskr", "vegetar",
  "Broccoli", "broccoli_opskr", "",
  "B\u00F8nnesalat", "boenne_salat_opskr", "vegetar"
  ) %>% arrange(retter)

# revet gulerødder ----
revet_gulerodder_opskr <- tibble::tribble(
  ~"Revet guler\u00F8dder", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "guler\u00F8dder", 75, "gram", "frugt_gr\u00F8nt", "",
  "rosiner", 10, "gram", "konserves", "",
  "citronsaft (tilbeh\u00F8r)", NA, "", "konserves", ""
)

# broccolisalat ----
broccoli_salat_opskr <- tibble::tribble(
  ~"Broccolisalat", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "broccoli", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "granat\u00E6ble", 0.125, "stk", "frugt_gr\u00F8nt", "",
  "solsikkekerner", 5, "gram", "konserves", "",
  "t\u00F8rrede traneb\u00E6r", 10, "gram", "konserves", "",
  "creme fraiche", 0.25, "dl", "mejeri", "",
  "mayonnaise", 10, "gram", "konserves", "",
  "sukker", 5, "gram", "konserves", ""
)
# boennesalat ----
boenne_salat_opskr <- tibble::tribble(
  ~"B\u00F8nnesalat", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "gr\u00F8nne b\u00F8nner (frost)", 75, "gram", "frugt_gr\u00F8nt", "",
  "solt\u00F8rrede tomater i tern", 12.5, "gram", "konserves", "",
  "fetaost", 25, "gram", "mejeri", "",
  "br\u00F8dcroutoner", 50, "gram", "konserves", ""
)
# spidskål agurk salat ----
spidskaal_agurk_opskr <- tibble::tribble(
  ~"Spidsk\u00E5lsalat med agurk og edamameb\u00F8nner", 
  ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "spidsk\u00E5l", 0.15, "stk", "frugt_gr\u00F8nt", "",
  "agurk", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "edamameb\u00F8nner (frost)", 25, "gram", "frost", ""
)

# hytteost salat ----
hytteost_salat_opskr <- tibble::tribble(
  ~"Hytteostsalat", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "spidsk\u00E5l", 1/8, "stk", "frugt_gr\u00F8nt", "",
  "blomk\u00E5l", 0.13, "stk", "frugt_gr\u00F8nt", "",
  "edamameb\u00F8nner (frost)", 25, "gram", "frost", "",
  "\u00E6ble", 0.25, "stk", "frugt_gr\u00F8nt", "",
  "hytteost", 50, "gram", "mejeri", "ost"
)

# broccoli ----
broccoli_opskr <- tibble::tribble(
  ~"Broccoli", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "broccoli", 0.25, "stk", "frugt_gr\u00F8nt", "",
)

# alle salater ----
salater_opskrifter <- list(
  revet_gulerodder_opskr = revet_gulerodder_opskr,
  broccoli_salat_opskr = broccoli_salat_opskr,
  spidskaal_agurk_opskr = spidskaal_agurk_opskr,
  hytteost_salat_opskr = hytteost_salat_opskr,
  broccoli_opskr = broccoli_opskr,
  boenne_salat_opskr = boenne_salat_opskr
)

# basis varer ----
varer <- tibble::tribble(
  ~"Indkobsliste", ~"maengde", ~"enhed", ~"kat_1", ~"kat_2",
  "V\u00E6lg vare", NA, "", "", "",
  "m\u00E6lk", 1, "liter", "mejeri", "m\u00E6lk",
  "sm\u00F8r", 1, "stk", "mejeri", "",
  "libero str. 4", 1, "stk", "baby", "",
  "babypads", 1, "stk", "baby", "",
  "rugbr\u00F8d", 1, "pakke(r)", "br\u00F8d", "",
  "\u00E6blejuice", 1, "liter", "konserves", "juice",
  "appelsinjuice", 1, "liter", "konserves", "juice",
  "multijuice", 1, "liter", "konserves", "juice",
  "brie", 1, "stk", "mejeri", "ost",
  "leverpostej", 1, "pakke(r)", "k\u00F8d", "p\u00E5l\u00F8g",
  "\u00E6ggesalat", 1, "pakke(r)", "p\u00E5l\u00F8g", "",
  "m\u00F8rk p\u00E5l\u00F8gschokolade", 1, "pakke(r)", "konserves", "",
  "kn\u00E6kbr\u00F8d wasa sport", 1, "pakke(r)", "konserves", "",
  "bananer", 1, "stk", "frugt_gr\u00F8nt", "",
  "\u00E6bler", 1, "pose(r)", "frugt_gr\u00F8nt", "",
  "skyr", 1, "kg", "mejeri", "",
  "m\u00FCsli fra kornkammeret (med appelsinknas)", 1, "pakke(r)", "konserves", "",
  "k\u00F8kkenrulle", 1, "pakke", "husholdning", "",
  "toiletpapir", 1, "pakke", "husholdning", "",
  "bagepapir", 1, "stk", "husholdning", "",
  "husholdningsfilm", 1, "stk", "husholdning", "",
  "fryseposer 4L", 1, "stk", "husholdning", "",
  "fryseposer 8L", 1, "stk", "husholdning", "",
  "skraldeposer 30L", 1, "stk", "husholdning", "",
  "hvedemel", 1, "pakke(r)", "konserves", "",
  "s\u00F8lvpapir", 1, "stk", "husholdning", "",
  "opvaskemiddel", 1, "stk", "husholdning", "",
  "h\u00E5nds\u00E6be", 1, "stk", "husholdning", "",
  "flydende margarine", 1, "stk", "konserves", "",
  "farvet flydende vaskemiddel", 1, "stk", "husholdning", "",
  "hvid flydende vaskemiddel", 1, "stk", "husholdning", ""
)

# links ----
links <- tibble::tribble(
  ~ret, ~link,
  "M\u00F8rbradgryde", "https://www.femina.dk/mad/aftensmad/klassisk-moerbradgryde",
  "Carbonara", "https://www.valdemarsro.dk/carbonara_opskrift/",
  "Pizza", "https://rigeligtsmor.dk/opskrift-pizzadej-med-surdej/",
  "Kyllingebowl", "https://www.hellofresh.dk/recipes/fajita-kyllingebowl-5fa3dff00e1d695ec60e5721",
  "Dahl", "https://www.valdemarsro.dk/dhal-med-raita/",
  "Lasagne", "https://www.dk-kogebogen.dk/opskrifter/19934/kyllingelasagne-med-spinat",
  "Chili con carne", "https://www.valdemarsro.dk/chili-con-carne/",
  "Br\u00E6ndende k\u00E6rlighed", "https://www.valdemarsro.dk/braendende-kaerlighed/",
  "Kartoffel-porre suppe", "https://madensverden.dk/kartoffel-porre-suppe/",
  "Kylling kiev", "https://www.hellofresh.dk/recipes/chicken-kiev-5efed5bde9cd8816990b92d6"
)

