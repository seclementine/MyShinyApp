library(shiny)
library(dplyr)
library(tidyr)
shinyServer(function(input,output){
        data("population")
        population$population<-population$population/1000000
        selector<-reactive({
                population%>%filter(country == input$select)
        })
        
      
        output$plot1<-renderPlot({
                xlab<-input$box1
                ylab<-input$box2
                main<-input$box3
                plot(selector()$year,selector()$population,xlab = xlab, ylab=ylab, main=main)
                fit<-lm(selector()$population~selector()$year)
                if(input$ShowModel==TRUE){
                        abline(fit,col="red",lwd=2)  
                }
        })
})

