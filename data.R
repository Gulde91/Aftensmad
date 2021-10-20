retter <- tibble::tribble(
  ~retter, ~key, ~type,
  "V\u00E6lg ret", "", "",
  "M\u00F8rbradgryde", "morbrad_opskr", "gris", 
  "Carbonara", "carbonara_opskr", "gris",
  "Fiskefilet", "", "fisk",
  "Pizza", "", "vegetar|gris|okse",
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

opskrifter <- list(morbrad_opskr = morbrad_opskr,
                   carbonara_opskr = carbonara_opskr)
