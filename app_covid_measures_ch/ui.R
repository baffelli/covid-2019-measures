#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Implementation of control measures to mitigate the spread COVID-19 in Switzerland"),

  # Sidebar with a slider input for number of bins
  # Show a plot of the generated distribution
  mainPanel(
    hr(),
    tags$div(class="header", checked=NA,
             tags$p("This Shiny app provides an interactive display of the data set on COVID19 intervention measures in Switzerland provided and described",
                    tags$a(href = "https://github.com/baffelli/covid-2019-measures", "here"),
                    "To see the details (incl. a link to the respective source) for a specific canton and day click into the plot."),
             tags$p("This is work and progress as we will be update and complete the data over the coming weeks.")
    ),
    hr(),
    selectInput("category", label = "Choose category of intervantion:",
                choices = c("Recommendations and information campaigns" = "recommendations",
                            "Events and mass gatherings" = "events",
                            "Cross-border mobility" = "mobilityint",
                            "Retail, gastronomy and entertainment" = "retailgastro",
                            "Schools" = "schools",
                            "Universities" = "universities",
                            "Public places (museums, sports facilities)" = "publicplaces",
                            "Explicit stay-at-home recommendation" = "stayathome",
                            "Public transport" = "publictransport",
                            "Short- and long-term care facilities" = "carefacilities",
                            "Case management (testing, isolation, quarantine, triage)" = "casemanagement",
                            "Public offices" = "publicoffices",
                            "Day care" = "daycare"),
                selected = "events"),
    plotOutput("distPlot", width = "150%", height = "600px", click = "coord_click", hover = "coord_hover"),
    hr(),
    tags$b("Details (upon click on dots in plot):"),
    hr(),
    htmlOutput("details"),
    hr(),
    tags$p(""),
    tags$p("Data collection: Simone Baffelli, Fabienne Krauer, Johannes Bracher,
           Maria Bekker-Nielsen Dunbar, Muriel Buri, Nicolo Lardelli, Jonas Oesch."),
    tags$p("Figures: Fabienne Krauer",
           tags$a(href = "https://github.com/fkrauer",
                  "https://github.com/fkrauer")),
    tags$p("Shiny app: Johannes Bracher",
           tags$a(href = "https://github.com/jbracher",
                  "https://github.com/jbracher"))
  )
))
