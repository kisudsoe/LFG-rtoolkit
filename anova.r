data = input(1) # Set variable 'data' with input data

ssanova2 = function(data) { # function start
	row = rownames(data)
	result = 0
	out = ""

	n = length(row)-1
	groups = as.character(t(data)[,1]) # data.frame to vector by row
	print(groups) # 'print' frunction to check the process

	for(i in 1:n) { # 'for' statement start
		values = as.numeric(t(data)[,i+1])

		fit = lm(values~groups)
		result = anova(fit)
		anovaP = result$'Pr(>F)'[1]

		if(i==1) { # 'if' statement start
		out = data.frame(row[i+1],anovaP)
		} else { # 'else' statement start
		tmp = data.frame(row[i+1],anovaP)
		out = rbind(out,tmp)
		} # 'else' statement end
	} # 'for' statement end

	return(out) # return the variable 'out'

} # function end
