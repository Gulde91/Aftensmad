library(shiny)
library(shinydashboard)
library(DT)
library(wordcloud2)
library(dplyr)
library(ggwordcloud)
library(rsconnect)

# henter retter og opskrifter
source("./data.R")

# Define UI for application that draws a histogram ----
ui <- fluidPage(

    # Application title
    titlePanel("Planl\u00E6g aftensmad"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(width = 3,
            div(style = "display: inline-block;vertical-align:top; width: 140px;",
                selectInput("mandag", "Mandag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 100px;",
                numericInput("man_antal_pers", "Antal personer", value = 2)),

            div(style = "display: inline-block;vertical-align:top; width: 140px;",
                selectInput("tirsdag", "Tirsdag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 100px;",
                numericInput("tirs_antal_pers", "Antal personer", value = 2)),

            div(style = "display: inline-block;vertical-align:top; width: 140px;",
                selectInput("onsdag", "Onsdag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 100px;",
                numericInput("ons_antal_pers", "Antal personer", value = 2)),

            div(style = "display: inline-block;vertical-align:top; width: 140px;",
                selectInput("torsdag", "Torsdag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 100px;",
                numericInput("tors_antal_pers", "Antal personer", value = 2)),

            div(style = "display: inline-block;vertical-align:top; width: 140px;",
                selectInput("fredag", "Fredag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 100px;",
                numericInput("fre_antal_pers", "Antal personer", value = 2)),

            div(style = "display: inline-block;vertical-align:top; width: 140px;",
                selectInput("lordag", "L\u00F8rdag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 100px;",
                numericInput("lor_antal_pers", "Antal personer", value = 2)),

            div(style = "display: inline-block;vertical-align:top; width: 140px;",
                selectInput("sondag", "S\u00F8ndag:", choices = retter$retter)),
            div(style = "display: inline-block;vertical-align:top; width: 100px;",
                numericInput("son_antal_pers", "Antal personer", value = 2))
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
                             box(width = 4,DT::dataTableOutput("indkobsseddel"))
                             )
                 )
             )
        )
    )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {

    # word cloud plot
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
    
    display_opskrift <- function(opskrift, dag) {
        
        if (dag != "V\u00E6lg ret") {
            
            # output data
            opskrift[[dag]] <- paste(opskrift$maengde, opskrift$enhed, opskrift[[dag]])
            opskrift[[dag]] <- gsub("NA", "", opskrift[[dag]]) %>% trimws()
            opskrift <- opskrift[, c(dag)]
        } else {
            opskrift <- NULL
        }

        DT::datatable(opskrift, rownames = NULL, 
                      options = list(dom = 't', ordering = FALSE))
    }
    
    mandag <- reactive(opskrift(opskrifter, retter, input$mandag, input$man_antal_pers))
    tirsdag <- reactive(opskrift(opskrifter, retter, input$tirsdag, input$tirs_antal_pers))
    onsdag <- reactive(opskrift(opskrifter, retter, input$onsdag, input$ons_antal_pers))
    torsdag <- reactive(opskrift(opskrifter, retter, input$torsdag, input$tors_antal_pers))
    fredag <- reactive(opskrift(opskrifter, retter, input$fredag, input$fre_antal_pers))
    lordag <- reactive(opskrift(opskrifter, retter, input$lordag, input$lor_antal_pers))
    sondag <- reactive(opskrift(opskrifter, retter, input$sondag, input$son_antal_pers))

    output$dt_mandag <- DT::renderDataTable(display_opskrift(mandag(), input$mandag))
    output$dt_tirsdag <- DT::renderDataTable(display_opskrift(tirsdag(), input$tirsdag))
    output$dt_onsdag <- DT::renderDataTable(display_opskrift(onsdag(), input$onsdag))
    output$dt_torsdag <- DT::renderDataTable(display_opskrift(torsdag(), input$torsdag))
    output$dt_fredag <- DT::renderDataTable(display_opskrift(fredag(), input$fredag))
    output$dt_lordag <- DT::renderDataTable(display_opskrift(lordag(), input$lordag))
    output$dt_sondag<- DT::renderDataTable(display_opskrift(sondag(), input$sondag))
    
    # Indkøbsliste ----
    indkobsseddel <- reactive({
        
        indkob <- list(mandag(), tirsdag(), onsdag(), torsdag(), 
                       fredag(), lordag(), sondag())
        
        indkob <- indkob[lengths(indkob) != 0]
        
        if (length(indkob) > 0) {
            
            col_names <- c("Indkobsliste", "maengde", "enhed")
            indkob <- lapply(indkob, setNames, col_names)
            indkob <- bind_rows(indkob)
            
            indkob <- indkob %>% 
                group_by(Indkobsliste, enhed) %>% 
                summarise(maengde = sum(maengde), .groups = "drop")
            
            indkob$Indkobsliste <- paste(indkob$maengde, indkob$enhed, indkob$Indkobsliste)
            indkob$Indkobsliste <- gsub("NA", "", indkob$Indkobsliste) %>% trimws()
            indkob <- indkob[, "Indkobsliste"]
            names(indkob) <- "Indk\u00F8bsliste"
            
            
        } else {
            indkob <- NULL
        }
        
        indkob
    })
    
    output$indkobsseddel <- DT::renderDataTable({

        DT::datatable(indkobsseddel(), rownames = NULL, extensions = 'Buttons',
                      options = list(dom = "B", ordering = FALSE,
                                     pageLength = nrow(indkobsseddel()),
                                     buttons = list('copy',
                                                    list(
                                                      extend = "csv",
                                                      charset = "utf-8",
                                                      bom = TRUE
                                                    ))
                                     ),
                      editable = TRUE
                      )
        })
    
}

# Run the application 
shinyApp(ui = ui, server = server)


