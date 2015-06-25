#' Display/hide an element
#'
#' Display or hide an HTML element.\cr\cr
#' \strong{\code{show}} makes an element visible, \strong{\code{hide}} makes
#' an element invisible, \strong{\code{toggle}} displays the element if it it
#' hidden and hides it if it is visible.\cr\cr
#' If \code{condition} is given to \code{toggle}, that condition will be used
#' to determine if to show or hide the element. The element will be shown if the
#' condition evalutes to \code{TRUE} and hidden otherwise. If you find
#' yourself writing code such as \code{if (test()) show(id) else hide(id)}
#' then you can use \code{toggle} instead: \code{toggle(id = id, condition = test())}.
#'
#'
#' @param ... The following parameters are available:
#' \tabular{ll}{
#'   \strong{\code{id}}         \tab The id of the element/Shiny tag \cr
#'   \strong{\code{anim}}       \tab If \code{TRUE} then animate the behaviour
#'                                   (default: \code{FALSE}) \cr
#'   \strong{\code{animType}}   \tab The type of animation to use,
#'                                   either \code{"slide"} or \code{"fade"}
#'                                   (default: \code{"slide"}) \cr
#'   \strong{\code{time}}       \tab The number of seconds to make the
#'                                   animation last
#'                                   (default: \code{0.5}) \cr
#'   \strong{\code{delay}}      \tab The number of seconds to wait before
#'                                   hiding/showing the element
#'                                   (default: \code{0}) \cr
#'   \strong{\code{selector}}   \tab JQuery selector of the elements to show/hide.
#'                                   Ignored if the \code{id} argument is given.
#'                                   For example, to select all span elements with
#'                                   class x, use \code{selector = "span.x"}\cr
#'   \strong{\code{condition}}  \tab An optional argument to \code{toggle}, see
#'                                   'Details' below. \cr
#' }
#' @seealso \code{\link[shinyjs]{useShinyjs}},
#' \code{\link[shinyjs]{runExample}},
#' \code{\link[shinyjs]{hidden}}
#' @note \code{shinyjs} must be initialized with a call to \code{useShinyjs()}
#' in the app's ui.
#' @examples
#' if (interactive()) {
#'   shiny::shinyApp(
#'     ui = shiny::fluidPage(
#'       useShinyjs(),  # Set up shinyjs
#'       shiny::actionButton("btn", "Click me"),
#'       shiny::p(id = "element", "Watch what happens to me")
#'     ),
#'     server = function(input, output, session) {
#'       shiny::observeEvent(input$btn, {
#'         # Change the following line for more examples
#'         toggle("element")
#'       })
#'     }
#'   )
#' }
#' \dontrun{
#'   # The shinyjs function call in the above app can be replaced by
#'   # any of the following examples to produce similar Shiny apps
#'   toggle(id = "element")
#'   toggle("element", TRUE)
#'   toggle("element", TRUE, "fade", 2)
#'   toggle(id = "element", delay = 1)
#'   toggle(id = "element", time = 1, anim = TRUE, animType = "slide")
#'   show("element")
#'   show(id = "element", anim = TRUE)
#'   hide("element")
#'   hide(id = "element", anim = TRUE)
#' }
#'
#' ## toggle can be given an optional `condition` argument, which
#' ## determines if to show or hide the element
#' if (interactive()) {
#'   shiny::shinyApp(
#'     ui = shiny::fluidPage(
#'       useShinyjs(),
#'       shiny::checkboxInput("checkbox", "Show the text", TRUE),
#'       shiny::p(id = "element", "Watch what happens to me")
#'     ),
#'     server = function(input, output, session) {
#'       shiny::observe({
#'         toggle(id = "element", condition = input$checkbox)
#'       })
#'     }
#'   )
#' }
#' @name visibilityFuncs
NULL

#' @export
#' @rdname visibilityFuncs
show <- jsFunc
#' @export
#' @rdname visibilityFuncs
hide <- jsFunc
#' @export
#' @rdname visibilityFuncs
toggle <- jsFunc