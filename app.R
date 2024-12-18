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
ui <- dashboardPage(
  dashboardHeader(title = "Planlæg Aftensmad"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Inspiration", tabName = "inspiration", icon = icon("lightbulb")),
      menuItem("Opskrifter", tabName = "opskrifter", icon = icon("book")),
      menuItem("Indkøbsliste", tabName = "indkobsliste", icon = icon("shopping-cart"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "inspiration",
        fluidRow(
          box(title = "Vælg type", status = "primary", solidHeader = TRUE, width = 4,
              selectInput("menu_type", "Vælg type",
                          c("Alle", "Vegetar", "Kylling", "Gris", "Okse"))),
          box(title = "Wordcloud", status = "primary", solidHeader = TRUE, width = 8,
              wordcloud2Output("wordcloud_retter"))
        )
      ),
      tabItem(tabName = "opskrifter",
        fluidRow(
          lapply(c("Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag", "Lørdag", "Søndag"), function(day) {
            box(title = day, status = "warning", width = 3,
                selectInput(paste0("ret_", tolower(day)), "Vælg ret",
                            choices = c("Vælg ret", retter$retter)),
                DT::dataTableOutput(paste0("dt_", tolower(day))))
          })
        )
      ),
      tabItem(tabName = "indkobsliste",
        fluidRow(
          box(title = "Indkøbsliste", status = "primary", solidHeader = TRUE, width = 6,
              DT::dataTableOutput("indkobsseddel"),
              br(),
              actionButton("gem_indkobsseddel", "Gem indkøbsseddel", class = "btn-primary")),
          box(title = "Tilføj varer", status = "primary", solidHeader = TRUE, width = 6,
              # liste med basisvarer
              div(style = "display: inline-block;vertical-align:top; width: 200px;",
                  selectInput("basis_varer", "Tilføj varer fra liste",
                              sort(varer$Indkobsliste))),
              div(style = "display: inline-block;vertical-align:top; width: 60px;",
                  numericInput("antal_basis_varer", "Mængde", value = 1)),
              div(style = "display: inline-block;vertical-align:top; width: 100px;",
                  selectInput("enhed_alle_varer", "Enhed", "", "stk")),
              div(style = "display: inline-block;vertical-align:top; 
                          margin-top: 25px; width: 50px;",
                  actionButton("add_varer", "Tilføj", class = "btn-success")),
              hr(style = "border-color:grey;"),
              # manuelt input
              div(style = "display: inline-block;vertical-align:top; width: 200px;",
                  textInput("basis_varer_manuel", label = "Tilføj varer manuelt")),
              div(style = "display: inline-block;vertical-align:top; width: 80px;",
                  numericInput("antal_basis_varer_manuel", "Mængde", value = 1)),
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
                  actionButton("add_varer_manuel", "Tilføj", class = "btn-success")),
              div(style = "display: inline-block;vertical-align:top;
                          margin-top: 25px; width: 50px;",
                  actionButton("gem_vare", "Gem", class = "btn-primary")),
              hr(style = "border-color:grey;"),
              # guide
              h5(strong("Guide til at redigere indkøbslisten:")),
              h6("1) Tilføj varer"),
              h6("2) Fjern/slet varer"),
              h6("3) Rediger mængder"),
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

# Define server logic required to draw a histogram ----
server <- function(session, input, output) {

  # Initialiser reaktive værdier
  rv <- reactiveValues(df = NULL)
  indkobsseddel <- reactiveValues(data = NULL)

  # Sørg for, at alle input har standardværdier
  observe({
    updateSelectInput(session, "menu_type", selected = "Alle")
    updateSelectInput(session, "basis_varer", selected = "Vælg vare")
    updateSelectInput(session, "enhed_alle_varer", selected = "stk")
  })

  # loader tidligere indkøbssedler
  tidl_kob <- mest_brugte_varer(c(varer$enhed, varer_custom$enhed))

  # word cloud plot ----
  output$wordcloud_retter <- renderWordcloud2({

    retter_tmp <- retter

    if (input$menu_type != "Alle") {
      retter_tmp <- filter(retter_tmp, grepl(tolower(input$menu_type), type))
    }

    retter_tmp %>%
      filter(retter != "Vælg ret") %>%
      select(retter, count) %>%
      wordcloud2(retter, size = .3, color = 'random-dark', backgroundColor = "white",
                 minRotation = pi / 3, maxRotation = pi / 2, shape = "cardioid",
                 rotateRatio = 0.3)
  })

  # Reaktive opskrifter for hver dag
  ret_man <- create_reactive_recipe("man", input)
  ret_tirs <- create_reactive_recipe("tirs", input)
  ret_ons <- create_reactive_recipe("ons", input)
  ret_tors <- create_reactive_recipe("tors", input)
  ret_fre <- create_reactive_recipe("fre", input)
  ret_lor <- create_reactive_recipe("lor", input)
  ret_son <- create_reactive_recipe("son", input)

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
                   "Fredag", "Lørdag", "Søndag")

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

    if (input$basis_varer != "Vælg vare") {
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
      rund_op <- c("stk", "dåse(r)", "pakke(r)", "rulle(r)")
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

      names(indkob) <- "Indkøbsliste"

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
    rowNum <- parse_delete_event(input$deletePressed)
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
                  ifelse(any(indkobsseddel$data[["Indkøbsliste"]] == ""),
                         which(indkobsseddel$data[["Indkøbsliste"]] == "")[1] - 1,
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