library(shiny)
#library(vioplot)

ui <- pageWithSidebar(
    
    headerPanel("Test App"),
    
    sidebarPanel(
        selectInput(inputId = "userColourChoice",
                    label = "What colour would you like?",
                    choices = c("Black", "White", "Red")
        )
    ),
    
    mainPanel(
        plotOutput("MyAmazingGraph")
    )
)

server <- function(input, output) (
    
    output$MyAmazingGraph <- renderPlot ({
        
        myPreciousData <- read.csv("BeautifulExperiment.csv")
        
        boxplot(cholesterol ~ interventionType,
                data = myPreciousData,
                xlab = "Intervention",
                ylab = "Blood cholesterol level (mmol/L)",
                main = "Effect of different interventions on blood cholesterol level",
                col = input$userColourChoice
        )
    })
)

shinyApp(ui = ui, server = server)
