reactomeAPI
===========

Attempt to run gene set analyses through Reactome's Analysis API

Current issues to be addressed: 
1)
Differences between results from API via R and API via http://www.reactome.org/AnalysisService/index.html 
(10 paths returned via R where 18 paths were returned using the documentation example)

2) 
Empty response that is sometimes found when passing a set of genes with gene identifiers that cannot be found.
