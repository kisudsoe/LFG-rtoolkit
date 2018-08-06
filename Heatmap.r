### see documents @ https://bioconductor.org/packages/release/bioc/html/ComplexHeatmap.html
#source("https://bioconductor.org/biocLite.R")
#biocLite("ComplexHeatmap")
library(ComplexHeatmap)
mat = as.matrix(dat) # dataframe to matrix
mat.s = t(scale(t(mat))) # scaling

library(circlize)
mat.s_max = max(mat.s); mat.s_min = min(mat.s) 
col.rg = c(mat.s_min,0,mat.s_max) # color min-max range setting
#col.rg = c(-1.5,0,1.5)
cell.cols = colorRamp2(col.rg,c("Cyan","black","Yellow")) # Cell color setting

hm = Heatmap(matrix=mat.s,
             name="Probeset\nintensity\n(Scaled)",
             col=cell.cols,
             rect_gp=  gpar(col="black",lwd=.5),
             show_row_names=F
             )