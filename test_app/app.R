library(shiny)
library(shintoMCE)


options(shinto_mce_apikey = "<<API KEY HERE>>")


ui <- fluidPage(
  fluidRow(
    column(6, offset = 3,
           hr(),
           h2('tinyMCE Editor:'),
           tinyMCE('editor1', ''),
           hr(),
           h2('Editor Content:'),
           verbatimTextOutput('editor1_content')
    )
    
  ),
  fluidRow(
    column(6, offset = 3, 
           
           actionButton("btn_go", "Update!")
           )
  )
)

server <- function(input, output, session) { 
  output$editor1_content <- renderPrint({input$editor1})
  
  observeEvent(input$btn_go, {
    
    updateTinyMCE(session, "editor1", content = "<p>werkt dit?</p><p><b>HALLO</b></p>")
    
  })
}


shinyApp(ui, server)

