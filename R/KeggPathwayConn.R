
#' The connector class to KEGG Pathway database.
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
#' # Get connector
#' conn=mybiodb$getFactory()$createConn('kegg.pathway')
#'
#' # Retrieve all reactions related to a mouse pathway:
#' reactions=conn$getReactions('mmu00260')
#'
#' # Get a pathway graph
#' graph=conn$buildPathwayGraph('mmu00260')
#'
#' # Terminate instance.
#' mybiodb$terminate()
#'
#' @include KeggConn.R
#' @export
KeggPathwayConn <- R6::R6Class("KeggPathwayConn",
inherit=KeggConn,

public=list(

#' @description
#' New instance initializer. Connector classes must not be instantiated
#' directly. Instead, you must use the createConn() method of the factory class.
#' @param ... All parameters are passed to the super class initializer.
#' @return Nothing.
initialize=function(...) {
    super$initialize(db.name='pathway', db.abbrev='path', ...)
},

#' @description
#' Retrieves all reactions part of a KEGG pathway. Connects to
#'     KEGG databases, and walk through all pathways submitted, and
#'     their modules, to find all reactions they are composed of.
#' @param id A character vector of entry IDs.
#' @param drop If set to TRUE, returns a single KEGG reaction object
#'     instead of a list, if the list contains only one element.
#' @return A list of KEGG reaction objects.
getReactions=function(id, drop=TRUE) {

    reactions <- list()
    react_ids <- character()
    
    kegg.mod.conn <- self$getBiodb()$getFactory()$getConn('kegg.module')
    
    # Loop on all Pathway IDs
    for (path.id in id) {
        
        path <- self$getEntry(path.id)
        if ( ! is.null(path) && path$hasField('kegg.module.id')) {
            
            # Loop on all modules
            for (mod.id in path$getFieldValue('kegg.module.id')) {
                mod <- kegg.mod.conn$getEntry(mod.id)
                if ( ! is.null(mod) && mod$hasField('kegg.reaction.id'))
                    react_ids <- c(react_ids,
                        mod$getFieldValue('kegg.reaction.id'))
            }
        }
    }

    react_ids <- unique(react_ids)

    kegg.react.conn <- self$getBiodb()$getFactory()$getConn('kegg.reaction')
    reactions <- kegg.react.conn$getEntry(react_ids, drop=FALSE)
    reactions <- reactions[ ! vapply(reactions, is.null, FUN.VALUE=TRUE)]

    # Drop
    if (drop && length(reactions) <= 1) {
        reactions <- (if (length(reactions) == 1) reactions[[1]] else NULL)
    }

    return(reactions)
},

#' @description
#' Takes a list of pathways IDs and converts them to the specified organism,
#' filtering out the ones that do not exist in KEGG.
#' @param id A character vector of entry IDs.
#' @param org The organism in which to search for pathways, as a KEGG organism
#' code (3-4 letters code, like 'hsa', 'mmu', ...). See
#' https //www.genome.jp/kegg/catalog/org_list.html for a complete list of KEGG
#' organism codes.
#' @return A character vector, the same length as `id`, containing the
#' converted IDs.
convertToOrgPathways=function(id, org) {

    # Set organism code in IDs
    id <- sub('^[^0-9]+', org, id)

    # Get entries to check existence
    entries <- self$getEntry(id, drop=FALSE)

    # Filter out non existing entries
    id <- id[ ! vapply(entries, is.null, FUN.VALUE=TRUE)]

    return(id)
},

#' @description
#' Builds a pathway graph in the form of two tables of vertices and edges,
#' using KEGG database.
#' @param id A character vector of KEGG pathway entry IDs.
#' @param directed If set to TRUE, use available direction information to
#' create directed edges, duplicating if necessary the vertices.
#' @param drop If set to TRUE and the output list contains only one element,
#' then the returned value is a single list of two data frames.
#' @return A named list whose names are the pathway IDs, and values are lists
#' containing two data frames named vertices and edges.
buildPathwayGraph=function(id, directed=FALSE, drop=TRUE) {

    graph <- list()

    # Loop on all pathway IDs
    for (path.id in id) {

        edg <- NULL
        vert <- NULL

        # Loop on all reactions
        for (react in self$getReactions(id)) {
            g <- private$buildReactionGraph(react, directed)
            if ( ! is.null(g)) {
                edg <- rbind(edg, g$edges)
                vert <- rbind(vert, g$vertices)
            }
        }

        # Build graph
        if ( ! is.null(edg)) {
            vert <- vert[ ! duplicated(vert[['name']]), ]
            graph[[path.id]]=list(vertices=vert, edges=edg)
        }
        else
            graph[[path.id]]=NULL
    }

    # Drop
    if (drop && length(graph) <= 1)
        graph <- if (length(graph) == 1) graph[[1]] else NULL
    
    return(graph)
},

#' @description
#' Builds a pathway graph, as an igraph object, using KEGG database.
#' @param id A character vector of KEGG pathway entry IDs.
#' @param directed If set to TRUE, use available direction information to
#' create directed edges, duplicating if necessary the vertices.
#' @param drop If set to TRUE and the output list contains only one element,
#' then the returned value is a single igraph object.
#' @return A list of igraph objects, or an empty list if the igraph library is
#' not available.
getPathwayIgraph=function(id, directed=FALSE, drop=TRUE) {

    graph <- list()

    if (require('igraph', quietly=TRUE, warn.conflicts=FALSE)) {
        detach('package:igraph') # Force using namespace.
        
        g <- self$buildPathwayGraph(id=id, directed=directed, drop=FALSE)
        for (n in names(g)) {
            
            # Get edges and vertices
            e <- g[[n]][['edges']]
            v <- g[[n]][['vertices']]
            
            # Set colors and shapes

            # Create igraph object
            graph[[n]] <- igraph::graph_from_data_frame(e, directed=directed,
                vertices <- v)
        }
    }

    # Drop
    if (drop && length(graph) <= 1)
        graph <- if (length(graph) == 1) graph[[1]] else NULL

    return(graph)
},

#' @description
#' Create a pathway graph picture, with some of its elements colorized.
#' @param id A KEGG pathway ID.
#' @param color2ids A named list defining colors for entry IDs that are present
#' on the graph. The names of the list are standard color names. The values are
#' character vector of entry IDs.
#' @return An image object or NULL if the package magick is not available.
getDecoratedGraphPicture=function(id, color2ids) {

    pix <- NULL
    
    if (require('magick', quietly=TRUE, warn.conflicts=FALSE)) {
        detach('package:magick') # Force using namespace.
        
        # Get image
        pix <- private$getPathwayImage(id)
        
        # Extract shapes
        shapes <- self$extractPathwayMapShapes(id=id, color2ids=color2ids)
        
        # Draw shapes
        dev <- magick::image_draw(pix)
        for (shape in shapes)
            shape$draw()
        dev.off()
        pix <- dev
    }
    
    return(pix)
}

#' @description
#' Extracts shapes from a pathway map image.
#' @param id A KEGG pathway ID.
#' @param color2ids A named list defining colors for entry IDs that are present
#' on the graph. The names of the list are standard color names. The values are
#' character vector of entry IDs.
#' @return A list of BiodbShape objects.
,extractPathwayMapShapes=function(id, color2ids) {

    shapes <- list()

    html <- private$getPathwayHtml(id)

    for (color in names(color2ids)) {

        for (id in color2ids[[color]]) {

            # Escape special chars
            eid <- gsub('\\.', '\\\\.', id)

            # Look for lines containing shapes definition

# <area shape="circle" coords="336,170,4" href="/dbget-bin/www_bget?C00089"
# title="C00089 (Sucrose)" onmouseover="popupTimer(&quot;C00089&quot;,
# &quot;C00089 (Sucrose)&quot;, &quot;#ffffff&quot;)" onmouseout="hideMapTn()">
#
# <area shape="rect" coords="1015,505,1061,522"
# href="/dbget-bin/www_bget?K05992+K01208+3.2.1.133+R02112"
# title="K05992 (amyM), K01208 (cd), 3.2.1.133, R02112">
            regex=paste0('shape="?([^" ]+)"?\\s+',
                'coords="?([^" ]+)"?\\s+.+',
                'title="([^"]+[ ,])?(', eid, ')[ ,][^"]*"')
            g <- stringr::str_match_all(html, regex)[[1]]
            if (nrow(g) > 0)
                shapes <- private$extractShapes(shapes=shapes, g=g, color=color)
        }
    }

    return(shapes)
}
),

private=list(

extractShapes=function(shapes, g, color) {

    for (i in seq_len(nrow(g))) {

        type <- g[i, 2]
        c <- as.integer(strsplit(g[i, 3], ',')[[1]])
        s <- switch(type,
            rect=KeggRect$new(label=g[i, 5], color=color,
                left=c[[1]], top=c[[2]], right=c[[3]],
                bottom=c[[4]]),
            circle=KeggCircle$new(label=g[i, 5], color=color,
                x=c[[1]], y=c[[2]], r=c[[3]]),
            NULL)

        # Append new shape to list
        if ( ! is.null(s)) {
            is_new <- TRUE
            for (shape in shapes) {
                if (shape$equals(s)) {
                    is_new <- FALSE
                    break
                }
            }
            if (is_new)
                shapes <- c(shapes, list(s))
        }
    }

    return(shapes)
}

,getPathwayHtml=function(id) {

    # Extract pathway number
    path_idx <- sub('^[^0-9]+', '', id)

    # Build Request
    url=biodb::BiodbUrl$new(url=c(self$getPropValSlot('urls', 'base.url'), 'kegg-bin',
        'show_pathway'),
        params=c(org_name='map', mapno=path_idx,
        mapscale='1.0', show_description='hide'))
    request=self$makeRequest(url=url)

    # Send request and get HTML page
    html=self$getBiodb()$getRequestScheduler()$sendRequest(request)

    return(html)
},

getPathwayImage=function(id) {

    html <- private$getPathwayHtml(id)
    path_idx <- sub('^[^0-9]+', '', id)

    cache <- self$getBiodb()$getPersistentCache()
    img_filename <- paste0('pathwaymap-', path_idx)
    cid <- self$getCacheId()
    if ( ! cache$fileExists(cid, img_filename, 'png')) {
        img_url <- stringr::str_match(html,
            'src="([^"]+)"(\\s+.*)?\\s+(name|id)="pathwayimage"')
        if (is.na(img_url[1, 1]))
            biodb::error0('Impossible to find pathway image path inside',
                ' HTML page for pathway ID ', id, '.')
        u <- self$getPropValSlot('urls', 'base.url')
        img_url <- biodb::BiodbUrl$new(url=c(u, img_url[1, 2]))
        tmp_file <- file.path(cache$getTmpFolderPath(),
            paste(img_filename, 'png', sep='.'))
        self$getBiodb()$getRequestScheduler()$downloadFile(url=img_url,
            dest.file=tmp_file)
        cache$addFilesToCache(tmp_file, cache.id=cid, name=img_filename,
            ext='png', action='move')
    }
    img_file <- cache$getFilePath(cid, img_filename, 'png')

    return(magick::image_read(img_file))
},

buildReactionGraph=function(react, directed) {

    graph <- NULL
    
    # Get substrates and products
    subst=react$getFieldValue('substrates')
    prod=react$getFieldValue('products')
    
    if ( ! is.null(subst) && ! is.null(prod)) {

        # Create compound vertices
        ids <- c(subst, prod)
        vert=data.frame(name=ids, type='compound', id=ids)
        
        # Create reaction edge
        rid=react$getFieldValue('accession')
        vert=rbind(vert,
            data.frame(name=rid, type='reaction', id=rid))
        edg=rbind(data.frame(from=subst, to=rid),
            data.frame(from=rid, to=prod))
        
        # Create reverse reaction edge
        if (directed) {
            rvid=paste(rid, 'rev', sep='_')
            vert=rbind(vert,
                data.frame(name=rvid, type='reaction',
                id=rid))
            edg=rbind(edg, data.frame(from=prod, to=rvid),
                data.frame(from=rvid, to=subst))
        }
        
        graph=list(edges=edg, vertices=vert)
    }
    
    return(graph)
}
))
