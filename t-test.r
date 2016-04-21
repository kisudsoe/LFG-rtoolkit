# t-test tutorial by Kim, Seung-Soo
# v1.0 2016-04-21 THU
## Input group information & t-test
group = c("CC-ALD","CC-ALD","CC-ALD","AMN","AMN","AMN","AMN","CC-ALD")

ttest.iter = function(data, group) {
  n = length(rownames(data))
  group = as.factor(group)
  print(summary(group))
  grp1_id = which(group==levels(group)[1])
  grp2_id = which(group==levels(group)[2])
  
  raw.p = NULL
  
  #Calculate t-test p-value
  for(i in 1:n) {
    pval = t.test(data[i,grp1_id],data[i,grp2_id])$p.value
    raw.p = c(raw.p,pval)
    
    #######################
    # Create progress bar #
    #######################
    if (i==1) { # set progress bar
      cat('\nProcess iteration =',n,'\n')
      pb = txtProgressBar(min=0,max=100,width=50,initial=0,style=3)
      time1 = Sys.time()
    } else { setTxtProgressBar(pb, (i/n)*100) } # show progress bar
    if(i==n) { # Duration time check
      close(pb)
      time2 = Sys.time()
      cat('\n')
      print(time2-time1)
    } 
    #######################
  }
  raw.p = cbind(rownames(data),raw.p)
  return(raw.p)
}

raw.p = ttest.iter(data_gene_mainNum, group)