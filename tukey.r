##################################################
# data =
# AffyID	W14	W14	W14	W29	W29	W29	W44	W44	W44
# 10338001	11.4837	11.7008	11.7659	11.5656	11.6093	11.586	11.7589	11.873	11.6949
# 10338002	6.80003	6.97436	6.91835	6.89342	6.96118	7.08451	6.86678	6.84341	6.79208
# 10338003	9.68097	9.96586	10.0416	9.79909	9.86064	9.93208	10.0513	10.1735	9.93717
# 10338004	8.84225	9.02493	9.01762	8.75296	8.85096	8.93739	9.03833	9.36237	9.22987
# 10338005	1.94426	1.92378	1.97042	2.04153	1.96249	1.99254	1.93952	2.1011	1.93058
# 10338006	2.29337	2.33853	2.39776	2.37722	2.4056	2.50266	2.37623	2.4066	2.2644
# 10338007	3.08485	3.26351	3.22896	3.10209	3.26751	3.52586	3.15351	3.17831	3.07021
# 10338008	4.39303	4.62232	4.55331	4.51155	4.63673	4.7567	4.56948	4.61107	4.32505
#
# groups = c("W14","W14","W14","W29","W29","W29","W44","W44","W44")
##################################################

## Tukey for post hoc test
ss.tukey = function(data,groups) { # function 'ss.tukey' start
	library(multcompView) # package multcompView install needed
	result = 0
	row = rownames(data)
	n = length(row)
	groups = as.vector(groups)
	out = NULL
  
	for(i in 1:n) { # 'for' statement start
		values = as.numeric(t(data)[,i])
    
		# post hoc tests - tukey #
		a1 = aov(values~groups)
		posthoc = TukeyHSD(x=a1, conf.level=0.95) # 95% confidence interval
		#plot(posthoc) # generate graph
		#text(0,10.7,cex=1.2,labels=row[i],xpd=TRUE) # ID on the graph
    
		# using multcompView package #
		ex.pval = extract_p(posthoc$groups)
		sigroup = multcompLetters(ex.pval)
    
		# stack iterative results
		out = rbind(out,t(data.frame(sigroup$Letters)))
    
		#######################
		# Create progress bar #
		#######################
		if (i==1) { # set progress bar
			cat('\nProcess iteration =',n,'\n')
			pb = txtProgressBar(min=0,max=100,width=30,initial=0,style=3)
			time1 = Sys.time()
		} else { setTxtProgressBar(pb, (i/n)*100) } # show progress bar
		if(i==n) { # Duration time check
			close(pb)
			time2 = Sys.time()
			cat('\nProcess done.\n')
			print(time2-time1)
		} 
		#######################
	} # 'for' statement end
	colnames(out) = rownames(data.frame(sigroup$Letters))
	rownames(out) = row
	return(out)
} # function 'ss.tukey' end
