opskrift <- function(opskrifter, retter, salater, salater_opskrifter, tilbehor, 
                     dag_ret, dag_salat, antal, dag_tilbehor) {

  if (dag_ret != "V\u00E6lg ret") {
    ret <- opskrifter[[retter$key[retter$retter == dag_ret]]]
    ret$maengde <- ret$maengde * antal
  } else {
    ret <- NULL
  }
  
  if (!is.null(dag_tilbehor)) {
    tilbehor_all <- filter(tilbehor, Indkobsliste %in% dag_tilbehor)
    tilbehor_all$maengde <- tilbehor_all$maengde * antal / length(dag_tilbehor)
    tilbehor_all$maengde <- round(tilbehor_all$maengde, 4)
    if(!is.null(ret)) names(tilbehor_all)[1] <-  names(ret)[1]
  } else {
    tilbehor_all <- NULL
  }
  
  if (dag_salat != "") {
    salat <- salater_opskrifter[[salater$key[salater$retter == dag_salat]]]
    salat$maengde <- salat$maengde * antal
  } else {
    salat <- NULL
  }

  if (!is.null(ret) & !is.null(salat)) {
    name_ret <- paste(names(ret)[1], "m.", names(salat)[1])
    names(ret)[1] <- name_ret
    names(salat)[1] <- name_ret
    if (!is.null(tilbehor_all)) names(tilbehor_all)[1] <- name_ret
  }
  
  rbind(ret, tilbehor_all, salat)
  
}

display_opskrift <- function(ret_opskr) {
  
  if (!is.null(ret_opskr)) {
    ret_opskr[[1]] <- paste(ret_opskr$maengde, ret_opskr$enhed, ret_opskr[[1]])
    ret_opskr[[1]] <- gsub("NA", "", ret_opskr[[1]]) %>% trimws()
    ret_opskr <- ret_opskr[, 1]
  } else {
    ret_opskr <- NULL
  }
  
  DT::datatable(ret_opskr, rownames = NULL,
                options = list(dom = 't', 
                               ordering = FALSE,
                               pageLength = nrow(ret_opskr)))
}

parseDeleteEvent <- function(idstr) {
  res <- as.integer(sub(".*_([0-9]+)", "\\1", idstr))
  if (!is.na(res)) res
}

add_slet_knap <- function(i) {
  as.character(
    actionButton(
      # The id prefix with index
      paste('delete_button', i, sep="_"),
      label = "Slet",
      icon = icon("calendar"), #'trash'),
      onclick = 'Shiny.setInputValue(\"deletePressed\", this.id, {priority: "event"})'))
}

add_links <- function(retter, links) {
  
  stopifnot(is.list(retter), is.data.frame(links))
  
  retter_navne <- names(retter)
  
  retter <- mapply(x = retter, y = retter_navne, SIMPLIFY = FALSE,
                   function(x, y) {
                     y_kor <- stringr::str_replace(y, " m\\..+$", "")
                     if (y_kor %in% links$ret) {
                       x[nrow(x) + 1, 1] <- links$link[links$ret == y_kor]
                     }
                     return(x)
                   }
  )
  
  names(retter) <- retter_navne
  
  return(retter)
  
}


mest_brugte_varer <- function(enheder) {
  
  files <- list.files("./indkobssedler/")
  
  varer <- lapply(files, find_varer) |> bind_rows()
  
  varer$Indkøbsliste <- sub("\\((tilsmagning|tilbehør)\\)", "", varer$Indkøbsliste)
  varer$Indkøbsliste <- sub("\\d+\\.*\\d*", "", varer$Indkøbsliste, perl =TRUE)
  
  enhed <- setdiff(unique(enheder), "")
  enhed <- paste0(enhed, collapse = "|")
  enhed <- gsub("\\(", "\\\\(", enhed)
  enhed <- gsub("\\)", "\\\\)", enhed)
  
  varer$Indkøbsliste <- sub(enhed, "", varer$Indkøbsliste, perl = T)
  varer$Indkøbsliste <- trimws(varer$Indkøbsliste)
  
  out <- varer |> 
    group_by(Indkøbsliste) |> 
    summarise(count = n()) |> 
    arrange(desc(count)) |> 
    select(Indkøbsliste)
  
}

find_varer <- function(x) {
  
  load(paste0("./indkobssedler/", x))
  
  medtag_kun_varer(df)
}

medtag_kun_varer <- function(x) {
  
  index <- which(x$Indkøbsliste == "")[1] - 1
  
  if (is.na(index)) {
    index <- nrow(x)
  }
  
  x[1:index, ]
  
}

rens_varer <- function(varer, enheder) {
  
  varer <- sub("\\((tilsmagning|tilbehør)\\)", "", varer)
  varer <- sub("\\d+\\.*\\d*", "", varer, perl = TRUE)
  
  enhed <- setdiff(unique(enheder), "")
  enhed <- paste0(enhed, collapse = "|")
  enhed <- gsub("\\(", "\\\\(", enhed)
  enhed <- gsub("\\)", "\\\\)", enhed)
  
  varer <- sub(enhed, "", varer, perl = TRUE)
  varer <- trimws(varer)
  
  varer
}

create_day_inputs <- function(day_prefix, day_name) {
  tagList(
    h4(strong(day_name)),
    div(style = "display: inline-block;vertical-align:top; width: 200px;",
        selectInput(paste0(day_prefix, "_ret"), "Ret", 
                   choices = c("V\u00E6lg ret", retter$retter))),
    div(style = "display: inline-block;vertical-align:top; width: 70px;",
        numericInput(paste0(day_prefix, "_pers"), "Pers.", value = 2)),
    div(style = "display: inline-block;vertical-align:top; width: 135px;",
        selectInput(paste0(day_prefix, "_salat"), "Salat", 
                   choices = c("", salater$retter))),
    div(style = "display: inline-block;vertical-align:top; width: 135px;",
        selectInput(paste0(day_prefix, "_tilbehor"), "Tilbeh\u00F8r", 
                   choices = tilbehor$Indkobsliste,
                   multiple = TRUE)),
    hr()
  )
}


