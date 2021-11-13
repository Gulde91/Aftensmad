library(shiny)
library(shinydashboard)
library(DT)
library(wordcloud2)
library(dplyr)
library(purrr)

# henter retter og opskrifter
source("./data.R")
source("./funktioner.R")


# Define UI for application that draws a histogram ----
ui <- fluidPage(

    # Application title
    titlePanel("Planl\u00E6g aftensmad"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(width = 3,
            
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("man_ret", "Mandag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 50px;",
                numericInput("man_pers", "Pers.", value = 2)),
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("man_salat", "Salat", choices = salater)),
            #br(),

            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("tirs_ret", "Tirsdag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 50px;",
                numericInput("tirs_pers", "Pers.", value = 2)),
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("tirs_salat", "Salat", choices = salater)),
            
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("ons_ret", "Onsdag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 50px;",
                numericInput("ons_pers", "Pers.", value = 2)),
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("ons_salat", "Salat", choices = salater)),
            
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("tors_ret", "Torsdag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 50px;",
                numericInput("tors_pers", "Pers.", value = 2)),
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("tors_salat", "Salat", choices = salater)),
            
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("fre_ret", "Fredag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 50px;",
                numericInput("fre_pers", "Pers.", value = 2)),
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("fre_salat", "Salat", choices = salater)),
            
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("lor_ret", "L\u00F8rdag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 50px;",
                numericInput("lor_pers", "Pers.", value = 2)),
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("lor_salat", "Salat", choices = salater)),
            
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("son_ret", "S\u00F8ndag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 50px;",
                numericInput("son_pers", "Pers.", value = 2)),
            div(style = "display: inline-block;vertical-align:top; width: 110px;",
                selectInput("son_salat", "Salat", choices = salater)),
            
            ),

        # Show a plot of the generated distribution
        mainPanel(
             fluidRow(
                 tabsetPanel(
                    tabPanel("Inspiration",
                        selectInput("menu_type", "V\u00E6lg type",
                                    c("Alle", "Vegetar", "Kylling", "Gris", "Okse")),
                        wordcloud2Output("wordcloud_retter")
                    ),
                    tabPanel("Opskrifter",
                             fluidRow(
                        box(width = 3, title = "Mandag", status = "warning",
                            DT::dataTableOutput("dt_mandag")),
                        box(width = 3, title = "Tirsdag", status = "warning",
                            DT::dataTableOutput("dt_tirsdag")),
                        box(width = 3, title = "Onsdag", status = "warning",
                            DT::dataTableOutput("dt_onsdag")),
                        box(width = 3, title = "Torsdag", status = "warning",
                            DT::dataTableOutput("dt_torsdag"))
                        ),
                        fluidRow(
                        box(width = 3, title = "Fredag", status = "warning",
                            DT::dataTableOutput("dt_fredag")),
                        box(width = 3, title = "L\u00F8rdag", status = "warning",
                            DT::dataTableOutput("dt_lordag")),
                        box(width = 3, title = "S\u00F8ndag", status = "warning",
                            DT::dataTableOutput("dt_sondag"))
                        )
                    ),
                    tabPanel("Indk\u00F8bsliste",
                             br(),
                             box(width = 4,DT::dataTableOutput("indkobsseddel")),
                             box(
                             div(style = "display: inline-block;vertical-align:top; width: 110px;",
                                 selectInput("basis_varer", "Tilf\u00F8j varer", varer$Indkobsliste)),
                             div(style = "display: inline-block;vertical-align:top; width: 70px;",
                                 numericInput("antal_basis_varer", "Antal", value = 1)),
                             div(style = "display: inline-block;vertical-align:top; 
                                 margin-top: 25px; width: 50px;",
                                 actionButton("add_varer", "Tilf\u00F8j", class = "btn-success")),
                             )
                             
                             )
                 )
             )
        )
    )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {

    # word cloud plot ----
    output$wordcloud_retter <- renderWordcloud2({

        retter_tmp <- retter

        if (input$menu_type != "Alle") {
            retter_tmp <- filter(retter_tmp, grepl(tolower(input$menu_type), type))
        }

        retter_tmp %>%
         filter(retter != "V\u00E6lg ret") %>%
         select(retter, count) %>%
         wordcloud2(retter, size = .3, color = 'random-dark', backgroundColor = "white",
                    minRotation = pi/3, maxRotation = pi/2, shape = "cardioid",
                    rotateRatio = 0.3)
    })

    # Opskrifter ----
    ret_man <- reactive(
      opskrift(opskrifter, retter, salater, salater_opskrifter,
               input$man_ret, input$man_salat, input$man_pers)
      )
    
    ret_tirs <- reactive(
      opskrift(opskrifter, retter, salater, salater_opskrifter,
               input$tirs_ret, input$tirs_salat, input$tirs_pers)
      )
    
    ret_ons <- reactive(
      opskrift(opskrifter, retter, salater, salater_opskrifter,
               input$ons_ret, input$ons_salat, input$ons_pers)
      )
    
    ret_tors <- reactive(
      opskrift(opskrifter, retter, salater, salater_opskrifter,
               input$tors_ret, input$tors_salat, input$tors_pers)
      )
    
    ret_fre <- reactive(
      opskrift(opskrifter, retter, salater, salater_opskrifter,
               input$fre_ret, input$fre_salat, input$fre_pers)
      )
    
    ret_lor <- reactive(
      opskrift(opskrifter, retter, salater, salater_opskrifter,
               input$lor_ret, input$lor_salat, input$lor_pers)
      )
    
    ret_son <- reactive(
      opskrift(opskrifter, retter, salater, salater_opskrifter,
               input$son_ret, input$son_salat, input$son_pers)
      )

    output$dt_mandag <- renderDataTable(display_opskrift(ret_man()))
    output$dt_tirsdag <- renderDataTable(display_opskrift(ret_tirs()))
    output$dt_onsdag <- renderDataTable(display_opskrift(ret_ons()))
    output$dt_torsdag <- renderDataTable(display_opskrift(ret_tors()))
    output$dt_fredag <- renderDataTable(display_opskrift(ret_fre()))
    output$dt_lordag <- renderDataTable(display_opskrift(ret_lor()))
    output$dt_sondag<- renderDataTable(display_opskrift(ret_son()))
    
    # Indkøbsliste ----
    rv <- reactiveValues(df = NULL)

    ret_all <- reactive({
      
      ret_all <- list(ret_man(), ret_tirs(), ret_ons(), ret_tors(), 
                      ret_fre(), ret_lor(), ret_son())
      
      uge_navne <- c("Mandag", "Tirsdag", "Onsdag", "Torsdag",
                     "Fredag", "L\u00F8rdag", "S\u00F8ndag")
      
      names(ret_all) <- uge_navne
      ret_all <- ret_all[lengths(ret_all) != 0]
      
      ret_all
    })

    observe({ 

      if (length(ret_all()) > 0) {
        
        col_names <- c("Indkobsliste", "maengde", "enhed", "kat_1", "kat_2")
        indkob <- lapply(ret_all(), setNames, col_names)
        indkob <- bind_rows(indkob)
        rv$df <- indkob
      }
    })
    
    observeEvent(input$add_varer, {

      if (input$basis_varer != "V\u00E6lg vare") {
        varer_tmp <- varer[varer$Indkobsliste == input$basis_varer, ]
        varer_tmp$maengde <- varer_tmp$maengde * input$antal_basis_varer

        rv$df <- bind_rows(varer_tmp, rv$df)
      }

    })

    indkobsseddel <- reactiveValues(data = NULL)
    
    observe({
        
      if (length(rv$df) > 0) {
        
        indkob <- rv$df
        
        rund_op <- c("stk", "d\u00E5se(r)", "pakke(r)")
        indkob$maengde <- ifelse(indkob$enhed %in% rund_op, 
                                 ceiling(indkob$maengde), indkob$maengde)
        
        indkob <- indkob %>% 
          group_by(Indkobsliste, enhed, kat_1, kat_2) %>% 
          summarise(maengde = sum(maengde), .groups = "drop") %>% 
          arrange(kat_1, kat_2)
        
        indkob$Indkobsliste <- paste(indkob$maengde, indkob$enhed, indkob$Indkobsliste)
        indkob$Indkobsliste <- gsub("NA", "", indkob$Indkobsliste) %>% trimws()
        indkob <- indkob[, "Indkobsliste"]
        
        # sætter ugedage
        opskr_navne <- lapply(ret_all(), function(x) names(x)[1]) %>% unlist()
        uge_overblik <- paste(names(opskr_navne), opskr_navne, sep = ": ")
        uge_overblik_df <- data.frame(Indkobsliste = c("", uge_overblik))
        
        # sætter opskrifter
        ingr_pr_ret <- map(ret_all(), ~mutate(.x, ret = names(.x)[1])) %>%
                       map(~rename(.x, "ingredienser" = names(.x)[1])) %>%
                       bind_rows() %>%
                       group_by(ingredienser, enhed, kat_1, kat_2, ret) %>%
                       summarise(maengde = sum(maengde), .groups = "drop")

        ingr_pr_ret <- split(ingr_pr_ret, ingr_pr_ret$ret) %>%
                       map(~mutate(.x, Indkobsliste = paste(maengde, enhed, ingredienser) %>%
                                             gsub("NA", "", .) %>% trimws())) %>%
                       map(~bind_rows(
                         data.frame(Indkobsliste = c("", paste0(.x$ret[1], ":"))),
                         select(.x, Indkobsliste)
                       )) %>%
                       bind_rows()

        indkob <- bind_rows(indkob, uge_overblik_df, ingr_pr_ret)
        
        names(indkob) <- "Indk\u00F8bsliste"
        
        indkobsseddel$data <- indkob
        
       }
    })
    
    observeEvent(input$deletePressed, {
      rowNum <- parseDeleteEvent(input$deletePressed)
      
      # Delete the row from the data frame
      indkobsseddel$data <- indkobsseddel$data[-rowNum,]
    })
    
    deleteCol <- reactive({
      
      if (!is.null(indkobsseddel$data)) 
      unlist(lapply(seq_len(nrow(indkobsseddel$data)), f))
      
      })

    output$indkobsseddel <- DT::renderDataTable({

      page_len <- which(indkobsseddel$data[["Indk\u00F8bsliste"]] == "")[1] - 1
      
      # Return a data table
      DT::datatable(cbind(indkobsseddel$data, delete = deleteCol()), 
                    rownames = NULL, colnames = NULL, extensions = 'Buttons',
                    # Need to disable escaping for html as string to work
                    escape = FALSE, editable = TRUE,
                    options = list(
                      dom = "B", ordering = FALSE, pageLength = page_len,
                      buttons = list(list(extend = 'copy', 
                                          title = NULL),
                                     list(extend = "csv",
                                          charset = "utf-8",
                                          bom = TRUE,
                                          title = NULL
                                     )),
                      # Disable sorting for the delete column
                      columnDefs = list(
                        list(targets = 1, sortable = FALSE))
                    ))
      
      
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)


