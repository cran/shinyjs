% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/showLog.R
\name{showLog}
\alias{showLog}
\title{Print any JavaScript console.log messages in the R console}
\usage{
showLog()
}
\description{
When developing and debugging a Shiny that uses custom JavaScript code,
it can be helpful to use \code{console.log()} messages in JavaScript. This
function allows you to see these messages printed in the R console directly
rather than having to open the JavaScript console in the browser to view the
messages.\cr\cr
This function must be called in a Shiny app's server.
}
\note{
Log messages that cannot be serialized in JavaScript (such as many
JavaScript Event objects that are cyclic) will not be printed in R.
}
\examples{
if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),
      textInput("text", "Type something")
    ),
    server = function(input, output) {
      showLog()
      logjs("App started")
      observe({
        logjs(paste("Length of text:", nchar(input$text)))
      })
    }
  )
}
}
\seealso{
\code{\link[=logjs]{logjs()}}
}
