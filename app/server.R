#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

data <- read.csv("../measures_CH.csv", stringsAsFactors = FALSE)
data$date <- as.Date(data$date)
cantons <- sort(unique(data$unit))


details <- read.csv("../measures_detailed_CH.csv", na = "", stringsAsFactors = FALSE)
details$unit <- gsub(x = details$unit, pattern = "CH-", replacement = "") # re-code unit
details$date <- as.Date(details$date)
categories <- unique(details$category)

# create data sets indicating when interventions occurred:
dates_interventions <- list()

for(cat in categories){
  # cantonal interventions
  dates_interventions[[cat]] <- data.frame(subset(details, category == cat &
                                                              unit != "CH")[, c("unit", "date")],
                                                     level = "cantonal")
  # add federal interventions for each canton, if any:
  dates_federal_interventions0 <- subset(details, category == cat & unit == "CH")$date
  if(length(dates_federal_interventions0) > 0){
    dates_federal_interventions <- data.frame(unit = rep(cantons, length(dates_federal_interventions0)),
                                              date = rep(dates_federal_interventions0, each = length(cantons)),
                                              level = "federal")
    dates_interventions[[cat]] <- rbind(dates_interventions[[cat]],
                                        dates_federal_interventions)
  }

}


list_plots <- list(
  events = ggplot(data) +
    geom_tile(aes(x = date, y = unit, fill = as.factor(events)), color = "grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_brewer(palette="Blues",
                      labels=c("no restriction", "events > 1000 banned",
                               "events > 500 banned", "events > 100 banned",
                               "events > 50 banned", "events > 10 banned",
                               "events > 5 banned")) +
    ggtitle("Events and mass gatherings") +
    geom_point(data = dates_interventions$events, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  carefacilities = ggplot(data) + geom_tile(aes(y=unit, x=date,
                                                fill=as.factor(carefacilities)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_brewer(palette="Greens",
                      labels=c("no restriction", "access restricted",
                               "access prohibited")) +
    ggtitle("Short- and long-term care facilities") +
    geom_point(data = dates_interventions$carefacilities, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  retailgastro = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(retailgastro)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_brewer(palette="Purples",
                      labels=c("no restriction", "access restricted",
                               "closed")) +
    ggtitle("Retail, gastronomy and entertainment") +
    geom_point(data = dates_interventions$retailgastro, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  publicplaces = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(publicplaces)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_manual(values=c("white", "grey50"),
                      labels=c("no restriction", "closed")) +
    ggtitle("Public places (museums, sports facilities)") +
    geom_point(data = dates_interventions$publicplaces, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  mobilityint = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(mobilityint)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_manual(values=c("white", "grey50"),
                      labels=c("no restriction", "restricted incoming mobility")) +
    ggtitle("Cross-border mobility") +
    geom_point(data = dates_interventions$mobilityint, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  daycare = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(daycare)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_manual(values=c("white", "grey50"),
                      labels=c("no restriction", "closed or restricted access")) +
    ggtitle("Day care") +
    geom_point(data = dates_interventions$daycare, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  schools = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(schools)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_manual(values=c("white", "grey50"),
                      labels=c("open", "closed")) +
    ggtitle("Schools") +
    geom_point(data = dates_interventions$schools, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  universities = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(universities)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_manual(values=c("white", "grey50"),
                      labels=c("open", "closed")) +
    ggtitle("Universities") +
    geom_point(data = dates_interventions$universities, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  publicoffices = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(publicoffices)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_manual(values=c("white", "grey50"),
                      labels=c("open", "closed")) +
    ggtitle("Public offices") +
    geom_point(data = dates_interventions$publicoffices, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  publictransport = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(publictransport)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_manual(values=c("white", "grey50"),
                      labels=c("normal", "reduced")) +
    ggtitle("Public transport") +
    geom_point(data = dates_interventions$publictransport, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  stayathome = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(stayathome)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_manual(values=c("white", "grey50"),
                      labels=c("no", "yes")) +
    ggtitle("Explicit stay-at-home recommendation") +
    geom_point(data = dates_interventions$stayathome, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  casemanagement = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(casemanagement)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_manual(values=c("white", "grey50"),
                      labels=c("no", "yes")) +
    ggtitle("Case management (testing, isolation, quarantine, triage)") +
    geom_point(data = dates_interventions$casemanagement, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)"),

  recommendations = ggplot(data) + geom_tile(aes(y=unit, x=date, fill=as.factor(recommendations)), color="grey") +
    xlab(NULL) + ylab(NULL)  +
    scale_x_date(expand=c(0,0)) +
    theme(axis.text.x=element_text(angle=90, vjust=0.5),
          axis.ticks.x = element_blank()) + labs(fill="category") +
    scale_fill_manual(values=c("white", "grey50"),
                      labels=c("no", "yes")) +
    ggtitle("Recommendations and information campaigns") +
    geom_point(data = dates_interventions$recommendations, aes(x = date, y = unit, pch = level)) +
    scale_shape_manual(values = c(federal = 0, cantonal = 20), name = "Measures (click for details)")
)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    if(is.null(coords$click)){
      list_plots[[input$category]]
    }else{
      dat_coords <- data.frame(x = as.Date(coords$click$x, origin = "1970-01-01"),
                               y = coords$click$y,
                               domain_bottom = coords$click$domain$left,
                               domain_left = coords$click$domain$left,
                               domain_top = coords$click$domain$left,
                               domain_right = coords$click$domain$left)
      print(dat_coords$x)
      list_plots[[input$category]] +
        geom_rect(data = dat_coords, size = 1, fill = NA, colour="black",
                  aes(xmin = x - 0.5, xmax = x + 0.5, ymin = y - 0.5, ymax=y + 0.5))
    }

  })

  coords <- reactiveValues(click = NULL)
  observe({
    input$coord_click
    if(!is.null(input$coord_click)){
      coords$click <- input$coord_click
    }
  })

  output$details <- renderText({

    if(!is.null(coords$click)){
      date_click <- as.character(as.Date(round(coords$click$x), origin = "1970-01-01"))
      ind_unit_click <- ceiling(26*
                                  (coords$click$y - coords$click$domain$bottom)/
                                  (coords$click$domain$top - coords$click$domain$bottom))

      unit_click <- coords$click$domain$discrete_limits$y[[ind_unit_click]]

      print(date_click)
      print(unit_click)

      s <- subset(details,
                  unit %in% c("CH", unit_click) &
                    date == date_click &
                    category == input$category)

      print(s)

      paste("<b>Geographic unit:</b>", s$unit, "<br>",
            "<b>Date:</b>", s$date, "<br>",
            "<b>Description:</b>", s$measure, "<br>",
            '<b>Source:</b> <a href="', s$source, '">', s$source, '</a>',
            collapse = "<br> <br>")
    }
  })

})
