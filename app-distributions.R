# app.R
library(shiny)

ui <- fluidPage(
  titlePanel("Class Distributions: Normal, Skewed, and Discrete"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Enter values for the three variables. Separate with spaces or commas."),
      
      textAreaInput("heights", "Heights (cm):", 
                    placeholder = "e.g. 170 165 180 172 168"),
      textAreaInput("sleep", "Hours of sleep per night:", 
                    placeholder = "e.g. 6 7 8 5 9 7"),
      textAreaInput("siblings", "Number of siblings:", 
                    placeholder = "e.g. 0 1 2 2 3 1 0 4"),
      
      numericInput("bins", "Number of bins (for height & sleep):", 
                   10, min = 5, max = 30, step = 1),
      checkboxInput("showNormal", "Overlay normal curve (for Height)", TRUE)
    ),
    
    mainPanel(
      fluidRow(
        column(4, plotOutput("histHeight")),
        column(4, plotOutput("histSleep")),
        column(4, plotOutput("barSiblings"))
      ),
      hr(),
      verbatimTextOutput("summary")
    )
  )
)

server <- function(input, output, session) {
  
  # Helper: clean text input to numeric
  toNumeric <- function(x) {
    txt <- gsub("[,;]", " ", x)
    vals <- as.numeric(unlist(strsplit(txt, "\\s+")))
    vals <- vals[!is.na(vals)]
    vals
  }
  
  # Reactives
  heights  <- reactive({ toNumeric(input$heights) })
  sleep    <- reactive({ toNumeric(input$sleep) })
  siblings <- reactive({ toNumeric(input$siblings) })
  
  # Histogram for height (with optional normal overlay)
  output$histHeight <- renderPlot({
    data <- heights()
    if (length(data) == 0) return(NULL)
    
    hist(data, breaks = input$bins, freq = FALSE,
         main = "Height (cm)", xlab = "Height (cm)",
         col = "lightblue", border = "white")
    
    if (input$showNormal && length(data) > 1) {
      m <- mean(data)
      s <- sd(data)
      if (s > 0) {
        xfit <- seq(min(data), max(data), length = 100)
        yfit <- dnorm(xfit, mean = m, sd = s)
        lines(xfit, yfit, col = "red", lwd = 2)
      }
    }
  })
  
  # Histogram for sleep hours (no normal overlay, expect skewness)
  output$histSleep <- renderPlot({
    data <- sleep()
    if (length(data) == 0) return(NULL)
    
    hist(data, breaks = input$bins, freq = FALSE,
         main = "Hours of Sleep per Night", xlab = "Hours",
         col = "lightgreen", border = "white")
  })
  
  # Bar chart for siblings (discrete counts)
  output$barSiblings <- renderPlot({
    data <- siblings()
    if (length(data) == 0) return(NULL)
    
    tab <- table(data)
    barplot(tab, col = "lightpink",
            main = "Number of Siblings",
            xlab = "Siblings", ylab = "Count")
  })
  
  # Summary statistics
  output$summary <- renderPrint({
    cat("Summary statistics:\n\n")
    
    if (length(heights()) > 0) {
      cat("Heights:\n")
      print(summary(heights()))
      cat("Mean:", mean(heights()), "  SD:", sd(heights()), "\n\n")
    }
    
    if (length(sleep()) > 0) {
      cat("Sleep hours:\n")
      print(summary(sleep()))
      cat("Mean:", mean(sleep()), "  SD:", sd(sleep()), "\n\n")
    }
    
    if (length(siblings()) > 0) {
      cat("Siblings:\n")
      print(table(siblings()))
      cat("Mean:", mean(siblings()), "  SD:", sd(siblings()), "\n\n")
    }
  })
}

shinyApp(ui, server)
