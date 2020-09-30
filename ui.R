library(shiny)
library(ggplot2)

data(economics) 
names(economics)[2:6]<- c("consumption",
                          "population",
                          "savings_rate",
                          "duration_of_unemployment",
                          "unemployed")

fluidPage(
    
    titlePanel("Economy in the US"),
    
    sidebarPanel( 
        
        dateRangeInput('dateRange', 'Date Range', min=economics$date[[1]], 
                       max=economics$date[[nrow(economics)]],
                    start=economics$date[[1]],end=economics$date[[nrow(economics)]]),

        selectInput('y', 'Select variable', names(economics)[-1]),
        submitButton('Submit')
    ),
    
    mainPanel(
        plotOutput('plot')
    )
)