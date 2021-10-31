opskrift <- function(opskrifter, retter, dag, antal) {
  
  if (dag != "V\u00E6lg ret") {
    
    opskrift <- opskrifter[[retter$key[retter$retter == dag]]]
    
    # tilpasser enheder
    opskrift$maengde <- opskrift$maengde * antal
    
    opskrift
    
  } else {
    NULL
  }
}

display_opskrift <- function(ret_opskr, ret, salat_opskr, salat) {
  
  if (ret != "V\u00E6lg ret") {
    ret_opskr[[ret]] <- paste(ret_opskr$maengde, ret_opskr$enhed, ret_opskr[[ret]])
    ret_opskr[[ret]] <- gsub("NA", "", ret_opskr[[ret]]) %>% trimws()
    ret_opskr <- ret_opskr[, c(ret)]
  } else {
    ret_opskr <- NULL
  }
  
  if (salat != "V\u00E6lg salat") {
    salat_opskr[[salat]] <- paste(salat_opskr$maengde, salat_opskr$enhed, salat_opskr[[salat]])
    salat_opskr[[salat]] <- gsub("NA", "", salat_opskr[[salat]]) %>% trimws()
    salat_opskr <- salat_opskr[, c(salat)]
    names(salat_opskr) <- ret
  } else {
    salat_opskr <- NULL
  }
  
  output <- bind_rows(ret_opskr, salat_opskr)
  
  DT::datatable(output, rownames = NULL,
                options = list(dom = 't', 
                               ordering = FALSE,
                               pageLength = nrow(output)))
}
