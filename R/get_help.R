#' get help
#'
#' build help object from package
#'
#' @param pkg where function to get help.
#' @param fn function name to get help. Default is NULL and raise errer.
#' @importFrom tools Rd2HTML
#' @importFrom xml2 read_html
#' @export
get_help <- function(pkg, fn = NULL) {
  stopifnot(!is.null(fn))
  rdb_file <- file.path(find.package(pkg), "help", pkg)
  rdb <- tools:::fetchRdDB(rdb_file, key = fn)
  tools::Rd2HTML(rdb, "help_html")
  res <- xml2::read_html("help_html")
  file.remove("help_html")
  class(res) <- c("help","xml_document", "xml_node")
  return(res)
}

#' @importFrom rvest html_node html_text
get_element <- function(element) {
  func <- function(help){
    stopifnot(help_class_chk(help))
    help %>%
      rvest::html_node(element) %>%
      rvest::html_text() %>%
      trimws() %>%
      return()
  }
  return(func)
}

#' help_class_chk
#'
#' @param help help class to check
help_class_chk <- function(help){
  any(class(help) == "help")
}

#' get form help
#'
#' @aliases get_title get_description get_usage
#' @param help help object from package [get_help]
#' @name getfrom
NULL

#' @export
#' @rdname getfrom
get_title <- get_element("h2")

#' @export
#' @rdname getfrom
get_description <- get_element("p")

#' @export
#' @rdname getfrom
get_usage <- get_element("pre")
