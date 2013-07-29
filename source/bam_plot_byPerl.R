# TODO: Add comment
# 
# Author: zhaos
###############################################################################

resultDir<-commandArgs()[5]
fileName<-paste(resultDir,'/bamResult/bamSummary.txt',sep="")
if (!file.exists(fileName)) {
	fileName<-paste(getwd(),'/',fileName,sep="")
}
allResult<-read.delim(fileName,header=T,row.names=1,check.names=F)

figureDir<-paste(resultDir,"/bamFigure/",sep="")
dir.create(figureDir, showWarnings = FALSE)
oldwd<-getwd()
setwd(figureDir)
file.remove(list.files("."))
if (ncol(allResult)==29) {
	colList<-list(5:11,c(12:14,NA,15:17),c(18:20,NA,21:23),c(24:26,NA,27:29))
} else {
	colList<-list(5:11,c(12:14,NA,15:17),c(18:20,NA,21:23))
}
plot_dataFrame(allResult,colList=colList)
setwd(oldwd)