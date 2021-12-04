
opskrift <- function(opskrifter, retter, salater, salater_opskrifter, 
                     dag_ret, dag_salat, antal) {
  
  if (dag_ret != "V\u00E6lg ret") {
    
    ret <- opskrifter[[retter$key[retter$retter == dag_ret]]]
    ret$maengde <- ret$maengde * antal
    
  } else {
    ret <- NULL
  }
  
  if (dag_salat != "V\u00E6lg salat") {
    
    salat <- salater_opskrifter[[salater$key[salater$retter == dag_salat]]]
    salat$maengde <- salat$maengde * antal

  } else {
    salat <- NULL
  }
  
  if (!is.null(ret) & !is.null(salat)) {
    name_ret <- paste(names(ret)[1], "m.", names(salat)[1])
    names(ret)[1] <- name_ret
    names(salat)[1] <- name_ret
  }
  
  rbind(ret, salat)
  
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
  if (! is.na(res)) res
}

f <- function(i) {
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
                     if (y %in% links$ret) {
                       x[nrow(x) + 1, 1] <- links$link[links$ret == y]
                     }
                     return(x)
                   }
  )
  
  names(retter) <- retter_navne
  
  return(retter)
  
}