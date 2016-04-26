data = input(2) # data input

ss.hclust = function(data) {
  d = dist(as.matrix(data))
  hc = hclust(d)
  plot(hc) # generate graph

  return(hc)
}

hclust = ss.hclust(data) #  put the result to variable ¡®hclust