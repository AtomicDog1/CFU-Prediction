library(shiny)
ui <- fluidPage(
  sliderInput("PT", "Percent T", min = 50, max = 100, step = 0.1, value = 80.0),
  submitButton("Submit"),
  verbatimTextOutput("prediction")
)
Data = read.csv("~/R/DATA824/ShinyAppData.csv")
mdl <- lm(Backtitre~PercT, data = Data)

server <- function(input, output) {
  output$prediction <- renderPrint({predict(mdl, list(PercT = input$PT))})
}

shinyApp(ui = ui, server = server)

