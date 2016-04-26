ss.tukey = function(data) { # function 'ss.tukey' start
	library(multcompView) # package multcompView install needed

	row = rownames(data)
	result = 0
	out = ""

	n = length(row)-1
	groups = as.character(t(data)[,1]) # data.frame to vector by row

	for(i in 1:n) { # 'for' statement start
		values = as.numeric(t(data)[,i+1])

		# post hoc tests - tukey #
		a1 = aov(values~groups)
		posthoc = TukeyHSD(x=a1, conf.level=0.95) # 95% confidence interval
		plot(posthoc) # generate graph
		text(0,10.7,cex=1.2,labels=row[i+1],xpd=TRUE) # ID on the graph

		# using multcompView package #
		tmp = extract_p(posthoc$groups)
		sigroup = multcompLetters(tmp)

		if(i==1) {
			out = cbind(row[i+1],t(data.frame(sigroup$Letters)))
		} else {
			tmp2 = cbind(row[i+1],t(data.frame(sigroup$Letters)))
			out = cbind(out,tmp2)
		}
	} # 'for' statement end
	return(out)
} # function 'ss.tukey' end