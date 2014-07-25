library(shiny)


shinyUI(pageWithSidebar(
  headerPanel("Auto Part-Of-Speech tagger"),
  sidebarPanel(
    h4('Typeing any sentence, the app will generate POS tags for you'),
    textInput(inputId="text1", label = "Input Sentences",value="This is a sentence. Have a nice day."),
    submitButton('Submit')
  ),
  mainPanel(
    h3('POS Tagging Results'),
    dataTableOutput('textout'),
    textOutput('textout2')
  )
))
