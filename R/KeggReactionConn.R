
#' The connector class to KEGG Reaction database.
#'
#' This is a concrete connector class. It must never be instantiated directly,
#' but instead be instantiated through the factory \code{BiodbFactory}.
#' Only specific methods are described here. See super classes for the
#' description of inherited methods.
#'
#' @seealso \code{\link{KeggConn}}.
#'
#' @examples
#' # Create an instance with default settings:
#' mybiodb <- biodb::newInst()
#'
#' # Create a connector
#' conn <- mybiodb$getFactory()$createConn('kegg.reaction')
#'
#' # Get an entry
#' e <- conn$getEntry('R00105')
#'
#' # Terminate instance.
#' mybiodb$terminate()
#'
#' @include KeggConn.R
#' @export
KeggReactionConn <- R6::R6Class("KeggReactionConn",
inherit=KeggConn,


public=list(

#' @description
#' New instance initializer. Connector classes must not be instantiated
#' directly. Instead, you must use the createConn() method of the factory class.
#' @param ... All parameters are passed to the super class initializer.
#' @return Nothing.
initialize=function(...) {
    super$initialize(db.name='reaction', db.abbrev='rn', accession.prefix='R',
        ...)
}
),

private=list(
))
