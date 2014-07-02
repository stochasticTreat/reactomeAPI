library(rjson)
library(RCurl)

genes=c("TP53","NOTCH1","RAS")
genes.json = toJSON(x=genes)

opts <- list(httpheader = c("Content-Type" = "text/plain;charset=UTF-8",
                                                        "Accept" = "application/json"))
#url obtained from http://www.reactome.org/AnalysisService/index.html
#from the heading:  /identifiers/projection  Analise the post identifiers over the different species and projects the result to Homo Sapiens
#by entering the above gene symbols and clicking the "Try it out!" button
url="http://www.reactome.org:80/AnalysisService/identifiers/projection?pageSize=20&page=1&sortBy=ENTITIES_PVALUE&order=ASC&resource=TOTAL"
pres = postForm(uri=url, input=genes.json, .opts=opts, style="POST")

#this result is obtained
  # > pres
  # [1] "{\"summary\":{\"token\":\"MjAxNDA3MDExOTU2MDlfMTUy\",\"type\":\"OVERREPRESENTATION\",\"sampleName\":null,\"species\":null,\"text\":true,\"fileName\":null},\"expression\":{\"columnNames\":[],\"min\":null,\"max\":null},\"identifiersNotFound\":1,\"pathwaysFound\":0,\"pathways\":[],\"resourceSummary\":[{\"resource\":\"TOTAL\",\"pathways\":0}]}"
  # attr(,"Content-Type")
  # 
  # "application/json" 
