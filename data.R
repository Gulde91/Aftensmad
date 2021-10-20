
# retter
retter <- tibble::tribble(
  ~retter, ~key, ~type,
  "V\u00E6lg ret", "", "",
  "M\u00F8rbradgryde", "morbrad_opskr", "gris", 
  "Carbonara", "carbonara_opskr", "gris",
  "Fiskefilet", "fiskefilet_opsk", "fisk",
  "Pizza", "pizza_opsk", "vegetar|gris|okse",
  "Burger", "", "okse|gris",
  "Frikadeller", "", "gris",
  "Dahl", "", "vegetar",
  "Madpandekager", "", "kylling", 
  "Ravioli", "", "vegetar",
  "Bacon broccoli T\u00E6rte", "", "gris",
  "Kyllingebowl", "", "kylling",
  "Lasagne", "", "kylling",
  "Kalkunschnitzel", "", "kalkun",
  "Risengr\u00F8d", "", "vegetar",
  "Madpangekager p\u00E5 panden", "", "kylling",
  "Chili con carne", "", "okse",
  "Br\u00E6ndende k\u00E6rlighed", "", "gris",
  "Kartoffel-porre suppe", "", "gris")

retter$count <- 1

# opskrifter
morbrad_opskr <- tibble::tribble(
  ~"M\u00F8rbradgryde", ~"maengde", ~"enhed", 
  "svinem\u00F8rbrad", 0.5, "stk",
  "cocktailp\u00F8lser", 100, "gram", 
  "bacon i skiver", 0.5, "pakke(r)",
  "l\u00F8g", 0.5, "stk",
  "tomatpure", 0.5, "d\u00E5se(r)",
  "gr\u00F8nsagsbouillon", 0.5, "stk",
  "oksebouillon", 0.5, "stk",
  "Ribsgele (tilsmagning)", NA, "",
  "Paprika (tilsmagning)", NA, "",
  "Engelsk sovs (tilsmagning)", NA, ""
)

carbonara_opskr <- tibble::tribble(
  ~"Carbonara", ~"maengde", ~"enhed",
  "spaghetti", 90, "gram",
  "parmesan", 25, "gram",
  "\u00E6ggeblommer", 1, "stk",
  "piskefl\u00F8de", 0.5, "dl",
  "l\u00F8g", 0.5, "stk",
  "bacon i tern", 100, "gram"
)

fiskefilet_opsk <- tibble::tribble(
  ~"Fiskefilet", ~"maengde", ~"enhed",
  "fiskefilet", 1, "stk",
  "remoulade (tilbeh\u00F8r)", NA, "",
  "citronsaft (tilbeh\u00F8r)", NA, "",
  "kartofler", 0.5, "kg"
)

pizza_opsk <- tibble::tribble(
  ~"Pizza", ~"maengde", ~"enhed",
  "tipo 00 mel", 125, "gram",
  "durummel", 25, "gram",
  "l\u00F8g", 0.25, "stk",
  "hvidl\u00F8g", 1, "stk",
  "balsamico", 0.05, "dl",
  "tomatpure", 0.5, "d\u00E5se(r)",
  "fl\u00E5et tomater", 0.5, "d\u00E5se(r)",
  "Engelsk sovs (tilsmagning)", NA, "",
  "frisk mozzarella", 1, "stk"
)

opskrifter <- list(morbrad_opskr = morbrad_opskr,
                   carbonara_opskr = carbonara_opskr,
                   fiskefilet_opsk = fiskefilet_opsk,
                   pizza_opsk = pizza_opsk)
