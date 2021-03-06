% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jsFunc-click.R
\name{click}
\alias{click}
\title{Click on a Shiny button}
\usage{
click(id, asis = FALSE)
}
\arguments{
\item{id}{The id of the button}

\item{asis}{If \code{TRUE}, use the ID as-is even when inside a module
(instead of adding the namespace prefix to the ID).}
}
\description{
The \code{click()} function can be used to programatically simulate a click
on a Shiny \code{actionButton()}.
}
\note{
\code{shinyjs} must be initialized with a call to \code{useShinyjs()}
in the app's ui.
}
\examples{
if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      "Count:", textOutput("number", inline = TRUE), br(),
      actionButton("btn", "Click me"), br(),
      "The button will be pressed automatically every 3 seconds"
    ),
    server = function(input, output) {
      output$number <- renderText({
        input$btn
      })
      observe({
        click("btn")
        invalidateLater(3000)
      })
    }
  )
}
}
\seealso{
\code{\link[shinyjs]{useShinyjs}},
\code{\link[shinyjs]{runExample}}
}
