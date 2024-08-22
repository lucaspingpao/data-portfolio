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
  title = "Graphing by Lucas Pao",
  titleWidth = 400
)


# 1. b) Sidebar --------------------------------------------------------------
sidebar <- dashboardSidebar(
  disable = TRUE
)


# 1. c) Body ------------------------------------------------------------------
body <- dashboardBody(
  h3("Plot your own graph!"),
  column(
    width = 6,
    numericInput(inputId = "xlow", label = "x Lower Limit", value=0),
    numericInput(inputId = "xhigh", label = "x Upper Limit", value=10),
    numericInput(inputId = "ylow", label = "y Lower Limit", value=0),
    numericInput(inputId = "yhigh", label = "y Upper Limit", value=10),
    actionButton(inputId = "newPlot", label = "Create new plot"),
  ),
  column(
    width = 6,
    tableOutput(outputId = "data")
  ),
  plotOutput(outputId = "graph", click = "plot_click"),
)

# 1. d) This code generates the UI based on all the above elements --------
ui <- dashboardPage(header, sidebar, body)



# 2. Create/Import mathematical/formatting functions ----------------------
graph <- function(xlow, xhigh, ylow, yhigh, points) {
  plot(x=NULL, y=NULL, xlim = c(xlow,xhigh), ylim = c(ylow,yhigh), axes = TRUE)
  print(points)
  points(x = points$x, y=points$y)
}


# 3. Instantiate global variables with default values ----------------------
xlow <- 0
xhigh <- 10
ylow <- 0
yhigh <- 10
points <- data.frame(x=0, y=0)


# 4. Create server that responds to user interaction ----------------------
server <- function(session, input, output) {
  
  #Initialize User Interface
  output$data <- renderTable(points)
  
  #Responds to the button
  #Assign new values to the global variables with the "<<-" operator
  observeEvent(input$newPlot, {
    xlow <<- input$xlow
    xhigh <<- input$xhigh
    ylow <<- input$ylow
    yhigh <<- input$yhigh
    
    output$graph <- renderPlot(graph(xlow, xhigh, ylow, yhigh, points))
  })
  
  #Responds to the plot click
  observeEvent(input$plot_click, {
    x <- input$plot_click$x
    y <- input$plot_click$y
    points <<- rbind(points, c(x,y))
    output$graph <- renderPlot(graph(xlow, xhigh, ylow, yhigh, points))
    output$data <- renderTable(points)
  })
  
}

# 5. Run the app ----------------------------------------------------------
shinyApp(ui = ui, server = server)



