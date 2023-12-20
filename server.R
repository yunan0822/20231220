library(shiny)

shinyServer(function(input, output) {
  
  DATA = reactive({
    if (is.null(input$files)) {return()} else {
      dat = read.table(input$files$datapath,header=T)
      return(dat) 
    }
  })
  
  output$scatterPlot = renderPlot({
    dat = DATA()
    if (is.null(dat)) {return()} else {
      plot(dat,col=input$Color)
    }
  })
  
  output$download = downloadHandler(
    filename = function() {'plot.pdf'},
    content = function(con) {
      dat = DATA()
      if (is.null(dat)) {return()} else {
        pdf(con)
        plot(dat,col=input$Color)
        dev.off()
      }
    }
  )
  
})