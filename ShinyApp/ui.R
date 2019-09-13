library(shiny)
library(tidyr)
data("population")
shinyUI(fluidPage(
        headerPanel("See the Population!"),
        titlePanel("With this app you can see the population of 4060 Countries in the world!"),
        h4("Start by simply selecting a country from the drop-down menu below. If you would like to view a linear model of the population, check the box underneath. To change the Title of the plot or the names of the x and y axis, fill in the corresponding text box."),
        sidebarLayout(
                
                sidebarPanel(
                        selectInput(
                                "select",
                                label = h3("Select Country"),
                                choices = unique(population$country),
                                selected = NULL
                        ),
                        checkboxInput("ShowModel", "Show/Hide Linear Model",value = FALSE),
                        textInput("box1","Enter Text for X-Axis:", value = "Year"),
                        textInput("box2","Enter Text for Y-Axis:", value = "Population (In Millions)"),
                        textInput("box3","Enter Text for Title:", value = "Population of My Country!")
                ),
                mainPanel(
                        
                        plotOutput("plot1")
                )
        ),
        h6("The data used in this app comes from the R dataset 'population' in the tidyr package")
))