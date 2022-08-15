#libraries to load : 

library(ggplot2)
library(factoextra)
library(datasets)

#transformation : 
data("iris")
iris_data<-iris[1:4]


#K-means clustering : 

#step 1 : find optimal value for K : 

#elbow graph : 

fviz_nbclust(iris_data,kmeans,method = "wss")

#number of clusters equals 3 

#step 2 : running the algorithm : 
km<-kmeans(iris_data,centers = 3,nstart = 100)

#step3 : visualisation of the result : 
fviz_cluster(list(data = iris_data,cluster=km$cluster))

#step4 : saving the result as png : 
dev.copy(png,"kmeans.png")
dev.off()

#hierachical clustering :

#step 1 : calculating the dist metric ( default is euclidian) :
distmatrix<-dist(iris_data)

#step 2 : running the algortihm : 
res<-hclust(distmatrix)

#step 3 :visualisation : 
plot(res)

#step 4 : in depth study : 

#cluster assignement per point : 
res$order

#height of each possible cluster  : 
res$height

#method used for the algorithm : (complete , average ....)
res$method


