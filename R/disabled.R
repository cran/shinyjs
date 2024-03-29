#' Initialize a Shiny input as disabled
#'
#' Create a Shiny input that is disabled when the Shiny app starts. The input can
#' be enabled later with [toggleState()] or [enable()].
#'
#' @param ... Shiny input (or tagList or list of of tags that include inputs) to
#' disable.
#' @seealso [useShinyjs()], [toggleState()], [enable()], [disable()]
#' @note \code{shinyjs} must be initialized with a call to \code{useShinyjs()}
#' in the app's ui.
#' @return The tag (or tags) that was given as an argument in a disabled state.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   shinyApp(
#'     ui = fluidPage(
#'       useShinyjs(),  # Set up shinyjs
#'       actionButton("btn", "Click me"),
#'       disabled(
#'         textInput("element", NULL, "I was born disabled")
#'       )
#'     ),
#'     server = function(input, output) {
#'       observeEvent(input$btn, {
#'         enable("element")
#'       })
#'     }
#'   )
#' }
#'
#' library(shiny)
#' disabled(numericInput("num", NULL, 5), dateInput("date", NULL))
#' @export
disabled <- function(...) {
  tags <- list(...)

  # recursively add the disabled class to all tags
  if (length(tags) == 1 && inherits(tags[[1]], "shiny.tag")) {
    # don't do anything if an input has a head tag associated to it
    if (tags[[1]][['name']] == "head") {
      return(tags[[1]])
    }
    tags[[1]] <-
      shiny::tagAppendAttributes(
        tags[[1]],
        class = "shinyjs-disabled"
      )
    return( tags[[1]] )
  } else if (length(tags) == 1 && is.list(tags[[1]])) {
    return( lapply(tags[[1]], disabled) )
  } else if (length(tags) > 1) {
    return( lapply(tags, disabled) )
  } else {
    errMsg("Invalid shiny tags given to `disabled`")
  }
}
