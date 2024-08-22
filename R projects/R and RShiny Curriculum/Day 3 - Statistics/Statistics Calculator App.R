library(shiny)
library(shinydashboard)
library(shinyWidgets)


# Layout/Table of Contents ------------------------------------------------
# 1. Create Header, Sidebar, Body --> UI
# 2. Create/import mathematical/formatting functions
# 3. Instantiate global variables
# 4. Create server that responds to user interaction
# 5. Deploy App
# -------------------------------------------------------------------------


# 1. a) Header ------------------------------------------------------------------
header <- dashboardHeader(
  title="Statistics by Lucas Pao",
  titleWidth=400
)


# 1. b) Sidebar --------------------------------------------------------------
sidebar <- dashboardSidebar(
  disable=TRUE
)


# 1. c) Body ------------------------------------------------------------------
body <- dashboardBody(
  fluidRow(
    box(
      width=12,
      h3("Statistics Calculator"),
      textInput(inputId="statsInput", label="Enter a set of numbers in csv form, e.g. 1,2,3,4,5", width=300),
      radioButtons(inputId="statsFunction", label="Find:", choices=c("mean", "median")),
      actionButton(inputId="statsButton", label="Compute!"),
      h4("Result:"),
      uiOutput(outputId="statsResult")
    )
  )
)

# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)

# 2. Create/Import mathematical/formatting functions ----------------------
calculate <- function(list, operation) {
  if(operation == "mean") {
    return(mean(list))
  }
  if(operation == "median") {
    return(median(list))
  }
}


# 3. Instantiate global variables with default values ----------------------
inputList <- c()
operation <- ""


# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {
  observeEvent(input$statsButton, { #Responds to the button
    
    #Assign new values to the global variables
    inputList <<- unlist(strsplit(input$statsInput, split=","))
    operation <<- input$statsFunction
    
    if(any(is.na(as.numeric(inputList)))) {
      output$statsResult <- renderUI("Error. Inputs must be numbers.") #Error handling message
    } else {
      #result <- calculate(as.numeric(input1), as.numeric(input2), operation)
      inputList <- as.numeric(inputList)
      result <- round(calculate(inputList, operation), digits=6)
      outputMessage <- paste("The", input$statsFunction, "of", input$statsInput, "is:", result)
      output$statsResult <- renderUI(outputMessage)
    }
  })
}


# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)

