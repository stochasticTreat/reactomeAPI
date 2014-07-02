queryFIs2014attempt3<-function(url="http://www.reactome.org:80/AnalysisService/identifiers/projection?pageSize=20&page=1&sortBy=ENTITIES_PVALUE&order=ASC&resource=TOTAL",
							   genes=c("TP53","NOTCH1","RAS")){
	library(rjson)
	library(RCurl)

	genes.json <- toJSON(x=genes)
	genes.str <- paste(genes, collapse = "\t")
	opts <- list(httpheader = c("Content-Type" = "text/plain;charset=UTF-8",
															"Accept" = "application/json"))
	pres <- postForm(uri=url, input=genes.str, .opts=opts, style="HTTPPOST")
	return(pres)
}
