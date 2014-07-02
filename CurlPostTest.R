queryReactomeAnalysisAPI<-function(url="http://www.reactome.org:80/AnalysisService/identifiers/projection?pageSize=8000&page=1&sortBy=ENTITIES_PVALUE&order=ASC&resource=TOTAL",
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

gs1 = c('AKAP13', 'ALG6', 'ANK2')

res1 = queryReactomeAnalysisAPI(genes=gs1)
#this returns a set of results with 10 pathways in JSON format

res3 = queryReactomeAnalysisAPI(genes=c('ABCA13', 'ABCG4', 'ACSM2B'))
#this returns the following empty JSON response:
### > restres
### [1] "{\"summary\":{\"token\":\"MjAxNDA3MDIwNDIzNTFfMjIy\",\"type\":\"OVERREPRESENTATION\",\"sampleName\":null,\"species\":null,\"text\":true,\"fileName\":null},\"expression\":{\"columnNames\":[],\"min\":null,\"max\":null},\"identifiersNotFound\":4,\"pathwaysFound\":0,\"pathways\":[],\"resourceSummary\":[{\"resource\":\"TOTAL\",\"pathways\":0}]}"
### attr(,"Content-Type")
###                   
### "application/json" 
