% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/KeggConn.R
\name{KeggConn}
\alias{KeggConn}
\title{The connector abstract class to KEGG databases.}
\description{
The connector abstract class to KEGG databases.

The connector abstract class to KEGG databases.
}
\details{
This is the mother class of all KEGG connectors. It defines code common to
all KEGG connectors.

The constructor accepts the following arguments:

db.name: The database name as defined in
http://www.kegg.jp/kegg/docs/keggapi.html.

db.abbrev: The database abbreviated name, as defined in
http://www.kegg.jp/kegg/docs/keggapi.html.
}
\examples{
# Create an instance with default settings:
mybiodb <- biodb::newInst()

# Create a connector to a KEGG database
conn <- mybiodb$getFactory()$createConn('kegg.compound')

# Search for an entry
conn$wsFind('NADPH', retfmt='parsed')

# Terminate instance.
mybiodb$terminate()

}
\section{Super classes}{
\code{\link[biodb:BiodbConnBase]{biodb::BiodbConnBase}} -> \code{\link[biodb:BiodbConn]{biodb::BiodbConn}} -> \code{KeggConn}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-KeggConn-new}{\code{KeggConn$new()}}
\item \href{#method-KeggConn-wsList}{\code{KeggConn$wsList()}}
\item \href{#method-KeggConn-wsFind}{\code{KeggConn$wsFind()}}
\item \href{#method-KeggConn-clone}{\code{KeggConn$clone()}}
}
}
\if{html}{\out{
<details><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getBaseUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getBaseUrl'><code>biodb::BiodbConnBase$getBaseUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getConnClass"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getConnClass'><code>biodb::BiodbConnBase$getConnClass()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getConnClassName"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getConnClassName'><code>biodb::BiodbConnBase$getConnClassName()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getDbClass"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getDbClass'><code>biodb::BiodbConnBase$getDbClass()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getEntryClass"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getEntryClass'><code>biodb::BiodbConnBase$getEntryClass()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getEntryClassName"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getEntryClassName'><code>biodb::BiodbConnBase$getEntryClassName()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getEntryContentType"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getEntryContentType'><code>biodb::BiodbConnBase$getEntryContentType()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getEntryFileExt"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getEntryFileExt'><code>biodb::BiodbConnBase$getEntryFileExt()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getEntryIdField"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getEntryIdField'><code>biodb::BiodbConnBase$getEntryIdField()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getName"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getName'><code>biodb::BiodbConnBase$getName()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getPropSlots"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getPropSlots'><code>biodb::BiodbConnBase$getPropSlots()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getPropValSlot"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getPropValSlot'><code>biodb::BiodbConnBase$getPropValSlot()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getPropertyValue"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getPropertyValue'><code>biodb::BiodbConnBase$getPropertyValue()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getSchedulerNParam"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getSchedulerNParam'><code>biodb::BiodbConnBase$getSchedulerNParam()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getSchedulerTParam"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getSchedulerTParam'><code>biodb::BiodbConnBase$getSchedulerTParam()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getToken"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getToken'><code>biodb::BiodbConnBase$getToken()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getUrl'><code>biodb::BiodbConnBase$getUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getUrls"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getUrls'><code>biodb::BiodbConnBase$getUrls()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getWsUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getWsUrl'><code>biodb::BiodbConnBase$getWsUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getXmlNs"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getXmlNs'><code>biodb::BiodbConnBase$getXmlNs()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="hasProp"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-hasProp'><code>biodb::BiodbConnBase$hasProp()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="hasPropSlot"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-hasPropSlot'><code>biodb::BiodbConnBase$hasPropSlot()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="isSlotProp"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-isSlotProp'><code>biodb::BiodbConnBase$isSlotProp()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="propExists"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-propExists'><code>biodb::BiodbConnBase$propExists()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setBaseUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setBaseUrl'><code>biodb::BiodbConnBase$setBaseUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setPropValSlot"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setPropValSlot'><code>biodb::BiodbConnBase$setPropValSlot()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setPropertyValue"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setPropertyValue'><code>biodb::BiodbConnBase$setPropertyValue()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setSchedulerNParam"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setSchedulerNParam'><code>biodb::BiodbConnBase$setSchedulerNParam()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setSchedulerTParam"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setSchedulerTParam'><code>biodb::BiodbConnBase$setSchedulerTParam()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setToken"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setToken'><code>biodb::BiodbConnBase$setToken()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setUrl'><code>biodb::BiodbConnBase$setUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setWsUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setWsUrl'><code>biodb::BiodbConnBase$setWsUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="updatePropertiesDefinition"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-updatePropertiesDefinition'><code>biodb::BiodbConnBase$updatePropertiesDefinition()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="addNewEntry"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-addNewEntry'><code>biodb::BiodbConn$addNewEntry()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="allowEditing"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-allowEditing'><code>biodb::BiodbConn$allowEditing()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="allowWriting"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-allowWriting'><code>biodb::BiodbConn$allowWriting()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="annotateMzValues"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-annotateMzValues'><code>biodb::BiodbConn$annotateMzValues()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="checkDb"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-checkDb'><code>biodb::BiodbConn$checkDb()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="collapseResultsDataFrame"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-collapseResultsDataFrame'><code>biodb::BiodbConn$collapseResultsDataFrame()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="correctIds"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-correctIds'><code>biodb::BiodbConn$correctIds()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="deleteAllCacheEntries"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-deleteAllCacheEntries'><code>biodb::BiodbConn$deleteAllCacheEntries()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="deleteAllEntriesFromPersistentCache"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-deleteAllEntriesFromPersistentCache'><code>biodb::BiodbConn$deleteAllEntriesFromPersistentCache()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="deleteAllEntriesFromVolatileCache"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-deleteAllEntriesFromVolatileCache'><code>biodb::BiodbConn$deleteAllEntriesFromVolatileCache()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="deleteWholePersistentCache"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-deleteWholePersistentCache'><code>biodb::BiodbConn$deleteWholePersistentCache()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="disallowEditing"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-disallowEditing'><code>biodb::BiodbConn$disallowEditing()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="disallowWriting"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-disallowWriting'><code>biodb::BiodbConn$disallowWriting()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="download"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-download'><code>biodb::BiodbConn$download()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="editingIsAllowed"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-editingIsAllowed'><code>biodb::BiodbConn$editingIsAllowed()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="filterEntriesOnRt"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-filterEntriesOnRt'><code>biodb::BiodbConn$filterEntriesOnRt()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getAllCacheEntries"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getAllCacheEntries'><code>biodb::BiodbConn$getAllCacheEntries()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getAllVolatileCacheEntries"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getAllVolatileCacheEntries'><code>biodb::BiodbConn$getAllVolatileCacheEntries()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getBiodb"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getBiodb'><code>biodb::BiodbConn$getBiodb()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getCacheFile"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getCacheFile'><code>biodb::BiodbConn$getCacheFile()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getCacheId"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getCacheId'><code>biodb::BiodbConn$getCacheId()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getChromCol"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getChromCol'><code>biodb::BiodbConn$getChromCol()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getDownloadPath"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getDownloadPath'><code>biodb::BiodbConn$getDownloadPath()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getEntry"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getEntry'><code>biodb::BiodbConn$getEntry()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getEntryContent"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getEntryContent'><code>biodb::BiodbConn$getEntryContent()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getEntryContentFromDb"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getEntryContentFromDb'><code>biodb::BiodbConn$getEntryContentFromDb()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getEntryContentRequest"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getEntryContentRequest'><code>biodb::BiodbConn$getEntryContentRequest()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getEntryIds"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getEntryIds'><code>biodb::BiodbConn$getEntryIds()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getEntryImageUrl"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getEntryImageUrl'><code>biodb::BiodbConn$getEntryImageUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getEntryPageUrl"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getEntryPageUrl'><code>biodb::BiodbConn$getEntryPageUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getId"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getId'><code>biodb::BiodbConn$getId()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getMatchingMzField"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getMatchingMzField'><code>biodb::BiodbConn$getMatchingMzField()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getMzValues"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getMzValues'><code>biodb::BiodbConn$getMzValues()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getNbEntries"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getNbEntries'><code>biodb::BiodbConn$getNbEntries()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getNbPeaks"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getNbPeaks'><code>biodb::BiodbConn$getNbPeaks()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="getSearchableFields"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-getSearchableFields'><code>biodb::BiodbConn$getSearchableFields()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="isCompounddb"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-isCompounddb'><code>biodb::BiodbConn$isCompounddb()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="isDownloadable"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-isDownloadable'><code>biodb::BiodbConn$isDownloadable()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="isDownloaded"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-isDownloaded'><code>biodb::BiodbConn$isDownloaded()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="isEditable"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-isEditable'><code>biodb::BiodbConn$isEditable()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="isExtracted"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-isExtracted'><code>biodb::BiodbConn$isExtracted()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="isMassdb"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-isMassdb'><code>biodb::BiodbConn$isMassdb()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="isRemotedb"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-isRemotedb'><code>biodb::BiodbConn$isRemotedb()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="isSearchableByField"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-isSearchableByField'><code>biodb::BiodbConn$isSearchableByField()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="isWritable"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-isWritable'><code>biodb::BiodbConn$isWritable()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="makeRequest"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-makeRequest'><code>biodb::BiodbConn$makeRequest()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="makesRefToEntry"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-makesRefToEntry'><code>biodb::BiodbConn$makesRefToEntry()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="msmsSearch"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-msmsSearch'><code>biodb::BiodbConn$msmsSearch()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="print"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-print'><code>biodb::BiodbConn$print()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="requiresDownload"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-requiresDownload'><code>biodb::BiodbConn$requiresDownload()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="searchByName"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-searchByName'><code>biodb::BiodbConn$searchByName()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="searchCompound"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-searchCompound'><code>biodb::BiodbConn$searchCompound()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="searchForEntries"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-searchForEntries'><code>biodb::BiodbConn$searchForEntries()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="searchForMassSpectra"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-searchForMassSpectra'><code>biodb::BiodbConn$searchForMassSpectra()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="searchMsEntries"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-searchMsEntries'><code>biodb::BiodbConn$searchMsEntries()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="searchMsPeaks"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-searchMsPeaks'><code>biodb::BiodbConn$searchMsPeaks()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="searchMzRange"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-searchMzRange'><code>biodb::BiodbConn$searchMzRange()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="searchMzTol"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-searchMzTol'><code>biodb::BiodbConn$searchMzTol()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="setDownloadedFile"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-setDownloadedFile'><code>biodb::BiodbConn$setDownloadedFile()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="setEditingAllowed"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-setEditingAllowed'><code>biodb::BiodbConn$setEditingAllowed()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="setMatchingMzField"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-setMatchingMzField'><code>biodb::BiodbConn$setMatchingMzField()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="setWritingAllowed"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-setWritingAllowed'><code>biodb::BiodbConn$setWritingAllowed()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="write"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-write'><code>biodb::BiodbConn$write()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConn" data-id="writingIsAllowed"><a href='../../biodb/html/BiodbConn.html#method-BiodbConn-writingIsAllowed'><code>biodb::BiodbConn$writingIsAllowed()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-KeggConn-new"></a>}}
\if{latex}{\out{\hypertarget{method-KeggConn-new}{}}}
\subsection{Method \code{new()}}{
New instance initializer. Connector classes must not be instantiated
directly. Instead, you must use the createConn() method of the factory class.
The parameters of this function are for the use of subclasses.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{KeggConn$new(
  db.name = NA_character_,
  db.abbrev = NA_character_,
  accession.prefix = NA_character_,
  ...
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{db.name}}{The database name as defined in
www.kegg.jp/kegg/docs/keggapi.html.}

\item{\code{db.abbrev}}{The database abbreviation as defined in
www.kegg.jp/kegg/docs/keggapi.html.}

\item{\code{accession.prefix}}{The prefix used for accession identifiers.}

\item{\code{...}}{All parameters are passed to the super class initializer.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Nothing.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-KeggConn-wsList"></a>}}
\if{latex}{\out{\hypertarget{method-KeggConn-wsList}{}}}
\subsection{Method \code{wsList()}}{
Gets the full list of entry IDs. See
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{KeggConn$wsList(retfmt = c("plain", "request", "ids"))}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{retfmt}}{Use to set the format of the returned value. 'plain' will
return the raw result from the server, as a character value. 'request' will
return the request as it would have been sent, as a BiodbRequest object.
'ids' will return a character vector containing entry IDs.}

\item{\code{http}}{//www.kegg.jp/kegg/docs/keggapi.html for details.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Depending on `retfmt`.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-KeggConn-wsFind"></a>}}
\if{latex}{\out{\hypertarget{method-KeggConn-wsFind}{}}}
\subsection{Method \code{wsFind()}}{
Searches for entries. See http://www.kegg.jp/kegg/docs/keggapi.html
for details.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{KeggConn$wsFind(
  query,
  option = c("NONE", "formula", "exact_mass", "mol_weight", "nop"),
  retfmt = c("plain", "request", "parsed", "ids", "ids.no.prefix")
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{query}}{The query to send to the database web service. When searching by
mass (i.e. 'option' parameter set to either 'exact_mass' or 'mol_weight'),
this query field must be set to either an exact (i.e. 174.05) or a range
(i.e. '250-260').}

\item{\code{option}}{Set this parameter to 'NONE' for querying on fields 'ENTRY',
'NAME', 'DESCRIPTION', 'COMPOSITION', 'DEFINITION' and 'ORTHOLOGY'. See
http //www.kegg.jp/kegg/docs/keggapi.html for an exact list of fields that
are searched for each database, and also for other possible values of this
'option' paramater.}

\item{\code{retfmt}}{Use to set the format of the returned value. 'plain' will
return the raw result from the server, as a character value. 'request' will
return the request as it would have been sent, as a BiodbRequest object.
'parsed' will return a data frame. 'ids' will return a character vector
containing the IDs of the matching entries.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Depending on `retfmt`.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-KeggConn-clone"></a>}}
\if{latex}{\out{\hypertarget{method-KeggConn-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{KeggConn$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
