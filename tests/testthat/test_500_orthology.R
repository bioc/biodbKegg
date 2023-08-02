test_search_by_name <- function(conn) {
    id <- conn$searchForEntries(list(name='dolichyl-diphosphooligosaccharide'),
        max.results=1)
    expect_true(length(id) > 0)
}

# Set context
biodb::testContext("Test Kegg Orthology connector.")

# Instantiate Biodb
biodb <- biodb::createBiodbTestInstance(ack=TRUE)

# Load package definitions
file <- system.file("definitions.yml", package='biodbKegg')
biodb$loadDefinitions(file)

# Create connector
conn <- biodb$getFactory()$createConn('kegg.orthology')

# Run tests
testRefFolder <- system.file("testref", package='biodbKegg')
# Turn off generic tests.
#biodb::runGenericTests(conn, pkgName='biodbKegg', testRefFolder=testRefFolder,
#    opt=list(skip.searchable.fields=c('ref.accession', 'ref.authors', 'ref.doi',
#        'ref.journal', 'ref.title')))
biodb::testThat('We can search entry by name.', test_search_by_name, conn=conn)

# Terminate Biodb
biodb$terminate()

