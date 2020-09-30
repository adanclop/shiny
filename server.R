library(shiny)
library(ggplot2)
library(plotly)

function(input, output) {
    
    output$plot <- renderPlot({
        p<-economics %>% filter(date>= input$dateRange[1] & date <= input$dateRange[2])
        names(p)[2:6]<- c("consumption",
                          "population",
                          "savings_rate",
                          "duration_of_unemployment",
                          "unemployed")
        ggplot(data = p,aes(x=date))+geom_line(aes_string(y=input$y))
    })
    
}