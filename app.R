library(shiny)
library(shinyjs)

gender <- function(x){
  t <- substr(x,8,8)
  cat('\n SSN 에서 추출한 값 :',t)
  y <- switch(t,
              '1' = '남성',
              '2' = '여성',
              '3' = '남성',
              '4' = '여성',
              '5' = '외국인',
              '6' = '외국인',
              '잘못된 값'
  )
  cat('\n 결과 :',y)
  return (y)
}

ui <- fluidPage(
  useShinyjs(),
  textInput("txt",
            label = h3("주민번호앞자리 입력"),
            value="(예시)900101-2"),
  actionButton("btn","확 인"),
  hidden(
    div(id="div",
        verbatimTextOutput("value")
        )
  )
)

server <- function(input, output, session) {
  onclick("btn",observeEvent(input$btn,{
    toggle("div")
    output$value <- renderText({gender(input$txt)})
  }))

}

shinyApp(ui, server)
