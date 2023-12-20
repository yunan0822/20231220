library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Ploting your data"), 
  
  sidebarPanel(
    fileInput(inputId="files", label=h4("Upload your data file:"), multiple=FALSE, accept="text/plain"),
    helpText("Note: you only can upload the .txt file."),
    radioButtons("Color", "Select the color of histogram:", choices = c("Red" = "red", "Blue" = "blue", "Green" = "green"))
  ),
  
  mainPanel(
    plotOutput("scatterPlot"),
    downloadButton("download", label = "Download plot", class = NULL),
  )  
  
))