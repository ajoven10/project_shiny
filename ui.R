library(shiny)

shinyUI(fluidPage(

  titlePanel("Quality Control: probability of being defective"),
  sidebarLayout(
    sidebarPanel(
      selectInput("modelo", "Degrees of polinom", choices=c(1,2,3,4,5,6,7,8,9), selected=3),
      submitButton("Submit")
    ),
    mainPanel(
      h2("Acceptance Chart"),
      plotOutput("plot1"),
      h2("Confussion Matrix"),
      verbatimTextOutput("tabla"),
      h2("Model"), 
      verbatimTextOutput("mod"),
      h2("Explain"),
      p("This graph shows the results of two tests applied to 118 microchips, indicating in 
         red the microchips that are correct according to quality control and in blue
         those that are defective."),
      p("A polynomial classifier is fitted to the Test 1 and Test2 data. The degree of the
        polynomial is selected by the user between the values 1 and 9."),
      p("In the case of selecting degree 3, the explanatory variables of the model are:"),
      code("X1, X1^2, X1^3, X2, X1X2, X1^2X2, X2^2, X1X2^2, X2^3"),
      p(""),
      p("The app shows the observed values on the graph, and on them draws a level 
        curve that shows the points for which the classifier gives a probability equal
        to the microchip being defective or correct."),
      p("The app presents the confusion matrix indicating how many microchips have
        been classified as correctly."),
      p("Finally, the model summary is presented")
    )
  )
))
