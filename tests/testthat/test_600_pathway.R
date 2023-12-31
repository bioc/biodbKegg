library(igraph)
library(magick)

test_kegg_pathway_getReactions = function(conn) {
    reactions <- conn$getReactions('mmu00260', drop=FALSE)
    testthat::expect_is(reactions, 'list')
    testthat::expect_true(length(reactions) > 0)
    react_type <- vapply(reactions,
                        function(x) methods::is(x, 'KeggReactionEntry'),
                        FUN.VALUE=TRUE)
    testthat::expect_true(all(react_type))
}

test_kegg_pathway_buildPathwayGraph = function(conn) {
    graph = conn$buildPathwayGraph('mmu00260')
    testthat::expect_is(graph, 'list')
    testthat::expect_equal(names(graph), c('vertices', 'edges'))
}

test_kegg_pathway_getPathwayIgraph = function(conn) {
    graph = conn$getPathwayIgraph('mmu00260')
    testthat::expect_is(graph, 'igraph')
}

test_getDecoratedGraphPicture = function(conn) {
 
    c = list(yellow = c('4.2.1.22', '4.2.3.1'), green = c('C00101', 'C00168'))
    graph_pix = conn$getDecoratedGraphPicture('mmu00260', color2ids=c)
    if (require('magick')) {
        detach('package:magick') # Force using namespace.
        testthat::expect_is(graph_pix, 'magick-image')
        path <- file.path(biodb::getTestOutputDir(),
                          'test_getDecoratedGraphPicture_image.png')
        magick::image_write(graph_pix, path=path, format='png')
    }
    else
        testthat::expect_null(graph_pix)
}

test_getDecoratedGraphPicture_not_a_compound = function(conn) {

    c = list(red = 'not_a_compound')
    fn <- 'test_getDecoratedGraphPicture_not_a_compound_image.png'
    fp <- file.path(biodb::getTestOutputDir(), fn)
    graph_pix = conn$getDecoratedGraphPicture('mmu00260', color2ids = c)
    if (require('magick')) {
        detach('package:magick') # Force using namespace.
        testthat::expect_is(graph_pix, 'magick-image')

        magick::image_write(graph_pix, path = fp, format = 'png')
    }
    else
        testthat::expect_null(graph_pix)
}

test_extractPathwayMapShapes <- function(conn) {

    pw <- 'map00500'

    items <- c('3.2.1.133'=2, '3.2.1.1'=2, # Enzymes.
               'C00089'=2, 'C00103'=1 # Compounds.
    )

    for (i in names(items)) {
        color2ids <- c(red=i)
        shapes <- conn$extractPathwayMapShapes(id=pw, color2ids=color2ids)
        labels <- vapply(shapes, function(x) x$getLabel(), FUN.VALUE='')
        testthat::expect_length(shapes, items[[i]])
        testthat::expect_true(all(labels == i))
    }
}

# Set context
biodb::testContext("Test Kegg Pathway connector.")

# Instantiate Biodb
biodb <- biodb::createBiodbTestInstance(ack=TRUE)

# Load package definitions
file <- system.file("definitions.yml", package='biodbKegg')
biodb$loadDefinitions(file)

# Create connector
conn <- biodb$getFactory()$createConn('kegg.pathway')

# Run tests
testRefFolder <- system.file("testref", package='biodbKegg')
biodb::runGenericTests(conn, pkgName='biodbKegg', testRefFolder=testRefFolder,
    opt=list(skip.searchable.fields=c('ref.accession', 'ref.authors', 'ref.doi',
        'ref.journal', 'ref.title')))
biodb::testThat('getReactions() works correctly.',
          test_kegg_pathway_getReactions, conn=conn)
biodb::testThat('buildPathwayGraph() works correctly.',
          test_kegg_pathway_buildPathwayGraph, conn=conn)
biodb::testThat('getPathwayIgraph() works correctly.',
          test_kegg_pathway_getPathwayIgraph, conn=conn)
biodb::testThat('We can build a decorated pathway graph.',
          test_getDecoratedGraphPicture, conn=conn)
biodb::testThat('getDecoratedGraphPicture() does not fail when called with
unexisting compounds.',
          test_getDecoratedGraphPicture_not_a_compound,
          conn=conn)
biodb::testThat('extractPathwayMapShapes() works correctly.',
          test_extractPathwayMapShapes, conn=conn)

# Terminate Biodb
biodb$terminate()
