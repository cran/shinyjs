#' Show a message
#'
#' \code{alert} (and its alias \code{info}) shows a message to the user as a
#' simple popup.\cr\cr
#' \code{logjs} writes a message to the JavaScript console. \code{logjs} is
#' mainly used for debugging purposes as a way to non-intrusively print
#' messages, but it is also visible to the user if they choose to inspect the
#' console. You can also use the \code{\link[shinyjs]{showLog}} function to
#' print the JavaScript message directly to the R console.
#'
#' @param text The message to show.  Can be either simple text or an R object.
#' @seealso \code{\link[shinyjs]{useShinyjs}},
#' \code{\link[shinyjs]{runExample}},
#' \code{\link[shinyjs]{showLog}}
#' @note \code{shinyjs} must be initialized with a call to \code{useShinyjs()}
#' in the app's ui.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   shinyApp(
#'     ui = fluidPage(
#'       useShinyjs(),  # Set up shinyjs
#'       actionButton("btn", "Click me")
#'     ),
#'     server = function(input, output) {
#'       observeEvent(input$btn, {
#'         # Change the following line for more examples
#'         alert(paste0("The date is ", date()))
#'       })
#'     }
#'   )
#' }
#' \dontrun{
#'   # The shinyjs function call in the above app can be replaced by
#'   # any of the following examples to produce similar Shiny apps
#'   alert("Hello!")
#'   alert(text = R.Version())
#'   logjs(R.Version())
#' }
#' @name messageFuncs
NULL

#' @export
#' @rdname messageFuncs
alert <- function(text) {
  fxn <- "alert"
  params <- list(text = text)
  jsFuncHelper(fxn, params)
}
#' @export
#' @rdname messageFuncs
info <- alert
#' @export
#' @rdname messageFuncs
logjs <- function(text) {
  fxn <- "logjs"
  params <- list(text = text)
  jsFuncHelper(fxn, params)
}
