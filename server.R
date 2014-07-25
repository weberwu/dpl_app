library(shiny)
library(openNLP)
require(NLP)
POS_Annotator <-function(s){
  s <- as.String(s)
  sent_token_annotator <- Maxent_Sent_Token_Annotator()
  word_token_annotator <- Maxent_Word_Token_Annotator()
  a2 <- annotate(s, list(sent_token_annotator, word_token_annotator))
  pos_tag_annotator <- Maxent_POS_Tag_Annotator()
  a3 <- annotate(s, pos_tag_annotator, a2)
  a3w <- subset(a3, type == "word")
  tags <- sapply(a3w$features, `[[`, "POS")
  d <- data.frame(cbind(s[a3w],tags))
  names(d) <- c('Word (words in your sentence)','POS (tags for your words)')
  return(d)
}
shinyServer(
  function(input, output) {
    #output$textout<-renderText({input$text1})
    #taggingResults <- POS_Annotator(input$text1)
    output$textout<-renderDataTable({POS_Annotator(input$text1)},options = list( iDisplayLength = 20))

  }
)