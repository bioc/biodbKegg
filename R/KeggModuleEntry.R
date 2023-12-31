
#' KEGG Module entry class.
#'
#' This is the entry class for KEGG Module database
#'
#' @examples
#' # Create an instance with default settings:
#' mybiodb <- biodb::newInst()
#'
#' # Create a connector
#' conn <- mybiodb$getFactory()$createConn('kegg.module')
#'
#' # Get an entry
#' e <- conn$getEntry('M00009')
#'
#' # Terminate instance.
#' mybiodb$terminate()
#'
#' @include KeggEntry.R
#' @export
KeggModuleEntry <- R6::R6Class("KeggModuleEntry",
inherit=KeggEntry,


public=list(
),

private=list(
makesRefToEntryRecurse=function(db, oid) {

    makes_ref <- FALSE

    if (db == 'kegg.enzyme' && self$hasField('kegg.reaction.id')) {

        # We need to check that the oid is listed
        # in at least one of the reactions
        krc <- self$getBiodb()$getFactory()$getConn('kegg.reaction')
        reaction.ids <- self$getFieldValue('kegg.reaction.id')
        makes_ref <- krc$makesRefToEntry(reaction.ids, db=db, oid=oid,
            any=TRUE, recurse=TRUE)
    }

    return(makes_ref)
},

doParseFieldsStep2=function(parsed.content) {

    # Name
    private$parseNames(parsed.content)

    # Compounds
    private$parseCompoundIds(parsed.content)

    # Reactions
    private$parseReactionIds(parsed.content)

    # Pathway
    private$parsePathwayIds(parsed.content)
}
))
