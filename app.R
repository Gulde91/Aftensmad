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

      create_day_inputs("man", "Mandag"),
      create_day_inputs("tirs", "Tirsdag"),
      create_day_inputs("ons", "Onsdag"),
      create_day_inputs("tors", "Torsdag"),
      create_day_inputs("fre", "Fredag"),
      create_day_inputs("lor", "L\u00F8rdag"),
      create_day_inputs("son", "S\u00F8ndag"),
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
            box(width = 6, DT::dataTableOutput("indkobsseddel"),
              br(),
              actionButton("gem_indkobsseddel", "Gem indkøbsseddel",
                           class = "btn-primary")
            ),
            box(width = 6,
              # liste med basisvarer
              div(style = "display: inline-block;vertical-align:top; width: 200px;",
                  selectInput("basis_varer", "Tilf\u00F8j varer fra liste",
                              sort(varer$Indkobsliste))),
              div(style = "display: inline-block;vertical-align:top; width: 60px;",
                  numericInput("antal_basis_varer", "M\u00E6ngde", value = 1)),
              div(style = "display: inline-block;vertical-align:top; width: 100px;",
                  selectInput("enhed_alle_varer", "Enhed", "", "stk")),
              div(style = "display: inline-block;vertical-align:top; 
                          margin-top: 25px; width: 50px;",
                  actionButton("add_varer", "Tilf\u00F8j", class = "btn-success")),
              hr(style = "border-color:grey;"),
              # manuelt input
              div(style = "display: inline-block;vertical-align:top; width: 200px;",
                  textInput("basis_varer_manuel", label = "Tilf\u00F8j varer manuelt")),
              div(style = "display: inline-block;vertical-align:top; width: 80px;",
                  numericInput("antal_basis_varer_manuel", "M\u00E6ngde", value = 1)),
              div(style = "display: inline-block;vertical-align:top; width: 100px;",
                  selectInput("enhed_basis_varer_manuel", "Enhed",
                              map_df(opskrifter, ~select(.x, enhed))$enhed |>
                                append("pakke(r)") |> unique() |> sort())),
              div(style = "display: inline-block;vertical-align:top; width: 130px;",
                  selectInput("add_kat_1", "Kategori 1", kategori_1, "konserves")),
              div(style = "display: inline-block;vertical-align:top; width: 130px;",
                  selectInput("add_kat_2", "Kategori 2", kategori_2)),
              div(style = "display: inline-block;vertical-align:top; 
                          margin-top: 25px; width: 50px;",
                  actionButton("add_varer_manuel", "Tilf\u00F8j", class = "btn-success")),
              div(style = "display: inline-block;vertical-align:top;
                          margin-top: 25px; width: 50px;",
                  actionButton("gem_vare", "Gem", class = "btn-primary")),
              hr(style = "border-color:grey;"),
              # guide
              h5(strong("Guide til at redigere indk\u00F8bslisten:")),
              h6("1) Tilf\u00F8j varer"),
              h6("2) Fjern/slet varer"),
              h6("3) Rediger m\u00E6ngder"),
              hr(style = "border-color:grey;"),
              # Forslag til manglende varer
              h5(strong("Forslag til manglende varer:")),
              tableOutput("tidl_kob")
            )
          )
        )
      )
    )
  )
)



# Define server logic required to draw a histogram ----
server <- function(session, input, output) {

  # loader tidligere indkøbssedler
  tidl_kob <- mest_brugte_varer(c(varer$enhed, varer_custom$enhed))

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
                 minRotation = pi / 3, maxRotation = pi / 2, shape = "cardioid",
                 rotateRatio = 0.3)
  })

  # Opskrifter ----
  ret_man <- reactive(
    opskrift(opskrifter, retter, salater, salater_opskrifter, tilbehor,
             input$man_ret, input$man_salat, input$man_pers, input$man_tilbehor)
  )

  ret_tirs <- reactive(
    opskrift(opskrifter, retter, salater, salater_opskrifter, tilbehor,
             input$tirs_ret, input$tirs_salat, input$tirs_pers, input$tirs_tilbehor)
  )

  ret_ons <- reactive(
    opskrift(opskrifter, retter, salater, salater_opskrifter, tilbehor,
             input$ons_ret, input$ons_salat, input$ons_pers, input$ons_tilbehor)
  )

  ret_tors <- reactive(
    opskrift(opskrifter, retter, salater, salater_opskrifter, tilbehor,
             input$tors_ret, input$tors_salat, input$tors_pers, input$tors_tilbehor)
  )

  ret_fre <- reactive(
    opskrift(opskrifter, retter, salater, salater_opskrifter, tilbehor,
             input$fre_ret, input$fre_salat, input$fre_pers, input$fre_tilbehor)
  )

  ret_lor <- reactive(
    opskrift(opskrifter, retter, salater, salater_opskrifter, tilbehor,
             input$lor_ret, input$lor_salat, input$lor_pers, input$lor_tilbehor)
  )

  ret_son <- reactive(
    opskrift(opskrifter, retter, salater, salater_opskrifter, tilbehor,
             input$son_ret, input$son_salat, input$son_pers, input$son_tilbehor)
  )

  output$dt_mandag <- renderDataTable(display_opskrift(ret_man()))
  output$dt_tirsdag <- renderDataTable(display_opskrift(ret_tirs()))
  output$dt_onsdag <- renderDataTable(display_opskrift(ret_ons()))
  output$dt_torsdag <- renderDataTable(display_opskrift(ret_tors()))
  output$dt_fredag <- renderDataTable(display_opskrift(ret_fre()))
  output$dt_lordag <- renderDataTable(display_opskrift(ret_lor()))
  output$dt_sondag <- renderDataTable(display_opskrift(ret_son()))

  # Indkøbsliste ----
  rv <- reactiveValues(df = NULL)
  indkobsseddel <- reactiveValues(data = NULL)

  # samler alle ugens retter i en liste
  ret_all <- reactive({

    ret_all <- list(ret_man(), ret_tirs(), ret_ons(), ret_tors(), 
                    ret_fre(), ret_lor(), ret_son())

    uge_navne <- c("Mandag", "Tirsdag", "Onsdag", "Torsdag",
                   "Fredag", "L\u00F8rdag", "S\u00F8ndag")

    names(ret_all) <- uge_navne
    ret_all <- ret_all[lengths(ret_all) != 0]

    ret_all
  })

  indkob_retter <- reactive({

    if (length(ret_all()) > 0) {

      col_names <- c("Indkobsliste", "maengde", "enhed", "kat_1", "kat_2")
      indkob_retter <- lapply(ret_all(), setNames, col_names)
      indkob_retter <- bind_rows(indkob_retter)
      indkob_retter

    } else {
      indkob_retter <- data.frame()
    }

    indkob_retter
  })

  # mulighed for at tilføje varer
  observeEvent(input$add_varer, {

    if (input$basis_varer != "V\u00E6lg vare") {
      varer_tmp <- varer[varer$Indkobsliste == input$basis_varer, ]
      varer_tmp$maengde <- varer_tmp$maengde * input$antal_basis_varer
      varer_tmp$enhed <- input$enhed_alle_varer

      rv$df <- bind_rows(varer_tmp, rv$df)
    }

  })

  observe({ # viser enhed på valgt vare

    updateSelectInput(
      session = session,
      inputId = "enhed_alle_varer",
      choices = sort(setdiff(unique(varer$enhed), "")),
      selected = varer[varer$Indkobsliste == input$basis_varer, ]$enhed
    )
  })

  observeEvent(input$add_varer_manuel, {

    varer_manuel_tmp <- data.frame(
      Indkobsliste = input$basis_varer_manuel,
      maengde = input$antal_basis_varer_manuel,
      enhed = input$enhed_basis_varer_manuel,
      kat_1 =  input$add_kat_1,
      kat_2 = input$add_kat_2
    )

    rv$df <- bind_rows(varer_manuel_tmp, rv$df)

  })

  # gør det muligt at gemme manuelt indtastede vare til basisliste
  observeEvent(input$gem_vare, {

    varer_manuel_tmp <- data.frame(
      Indkobsliste = input$basis_varer_manuel,
      maengde = input$antal_basis_varer_manuel,
      enhed = input$enhed_basis_varer_manuel,
      kat_1 =  input$add_kat_1,
      kat_2 = input$add_kat_2
    )

    varer_custom_new <- bind_rows(varer_custom, varer_manuel_tmp)
    write.csv(varer_custom_new, file = "./basis_varer.txt", 
              row.names = FALSE,
              fileEncoding = "UTF-8")
    message(input$basis_varer_manuel, " er nu gemt i basis_varer.txt")

  })

  # binder hele indkøbslisten
  observe({

    if (length(rv$df) > 0 | nrow(indkob_retter()) > 0) {

      indkob <- bind_rows(rv$df, indkob_retter())

      # summerer indkøb
      indkob <- indkob %>%
        group_by(Indkobsliste, enhed, kat_1, kat_2) %>%
        summarise(maengde = sum(maengde, na.rm = TRUE), .groups = "drop") %>%
        arrange(kat_1, kat_2)

      # runder op
      rund_op <- c("stk", "d\u00E5se(r)", "pakke(r)", "rulle(r)")
      indkob$maengde <- ifelse(indkob$enhed %in% rund_op,
                               ceiling(indkob$maengde), indkob$maengde)

      indkob$Indkobsliste <- paste(indkob$maengde, indkob$enhed, indkob$Indkobsliste)
      indkob$Indkobsliste <- gsub("NA", "", indkob$Indkobsliste) %>% trimws()
      indkob <- indkob[, "Indkobsliste"]

      # sætter ugedage
      if (length(ret_all()) > 0) {

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
          add_links(links) %>%
          bind_rows()

        indkob <- bind_rows(indkob, ingr_pr_ret)
      }

      names(indkob) <- "Indk\u00F8bsliste"

      indkobsseddel$data <- indkob

    }
  })

  # konstruerer "slet-knap" kolonne
  deleteCol <- reactive({
    if (!is.null(indkobsseddel$data)) {
      unlist(lapply(seq_len(nrow(indkobsseddel$data)), add_slet_knap))
    }
  })

  # mulighed for at slette række
  observeEvent(input$deletePressed, {
    rowNum <- parseDeleteEvent(input$deletePressed)
    indkobsseddel$data <- indkobsseddel$data[-rowNum,]
  })

  # finder forslag til mangler på listen
  observe({

    if (!is.null(indkobsseddel$data)) {
      paa_listen <- medtag_kun_varer(indkobsseddel$data)
      paa_listen <- rens_varer(paa_listen$Indkøbsliste,
                              c(varer$enhed, varer_custom$enhed))

      tidl_kob_out <- tidl_kob[!tidl_kob$Indkøbsliste %in% paa_listen, ] |> slice(1:10)

      output$tidl_kob <- renderTable(
        tidl_kob_out,
        colnames = FALSE
      )
    }

  })

  # final data table output
  output$indkobsseddel <- DT::renderDataTable(server = FALSE, {

    page_len <- ifelse(is.null(indkobsseddel$data), 1,
                  ifelse(any(indkobsseddel$data[["Indk\u00F8bsliste"]] == ""),
                         which(indkobsseddel$data[["Indk\u00F8bsliste"]] == "")[1] - 1,
                         nrow(indkobsseddel$data)))

    # Return a data table
    DT::datatable(cbind(indkobsseddel$data, delete = deleteCol()),
      rownames = NULL, colnames = NULL, extensions = "Buttons",
      escape = FALSE,
      editable = TRUE,
      options = list(
        dom = "B", ordering = FALSE, pageLength = page_len,
        buttons = list(
          list(extend = "copy",
            title = NULL,
            exportOptions = list(columns = 0)
          ),
          list(extend = "csv",
            charset = "utf-8",
            bom = TRUE,
            title = NULL,
            exportOptions = list(columns = 0)
          )
        ),
        # Disable sorting for the delete column
        columnDefs = list(
          list(targets = 1, sortable = FALSE)
        )
      )
    )
  })

  # gemmer indkøbsseddel
  observeEvent(input$gem_indkobsseddel, {

    df <- indkobsseddel$data
    path <- paste0("./indkobssedler/indkobsseddel_", gsub("-", "", Sys.Date()), ".rda")
    save(df, file = path)

  })

}

# Run the application
shinyApp(ui = ui, server = server)