library(datasets)
library(ggplot2)
library(RColorBrewer)

colors <- brewer.pal(12, "Paired")

# read in fitness test data
testdata <- read.csv("~/CourseraHW/R/10AttributesFitnessData.csv")

# create a TO DO list, inverse of test results
todo <- testdata
todo[,2] <- abs(todo[,2] - 10)

for (i in 1:nrow(todo)) 
{
        if (todo[i,2] == 0)  {todo[i,2] <- todo[i,2] + 1}
}


ggplot(todo, aes(Attribute, Score)) + geom_bar(stat="identity") + coord_polar() +
        xlab("June 26, 2014") + ylab("") + ggtitle("TO DO List") 


ggplot(testdata, aes(Attribute, Score)) + geom_bar(stat="identity") + coord_polar() +
        xlab("Test Results June 26, 2014") + ylab("")



# # library(RColorBrewer)
# # cols <- brewer.pal(12, "Paired")


png("plot6.png", width = 960, height = 960)
gB <- ggplot(B, aes(SCC.Level.Three, Emissions, fill=SCC.Level.Three))          # Baltimore 
gB <- gB + geom_bar(stat="identity") + facet_grid(. ~ year) 
gB <- gB + scale_x_discrete(breaks=NULL)                                        # suppress x-axis label
gB <- gB + xlab("") + ylab("PM2.5 Emissions (in tons)")
gB <- gB + ggtitle("Baltimore City, Maryland | Motor Vehicle PM2.5 Emissions") 
gB <- gB + labs(fill = "Vehicle Type")
gLA <- ggplot(LA, aes(SCC.Level.Three, Emissions, fill=SCC.Level.Three))        # LA
gLA <- gLA + geom_bar(stat="identity") + facet_grid(. ~ year) 
gLA <- gLA + scale_x_discrete(breaks=NULL)                                      # suppress x-axis label
gLA <- gLA + xlab("") + ylab("PM2.5 Emissions (in tons)")
gLA <- gLA + ggtitle("Los Angeles County, California | Motor Vehicle PM2.5 Emissions") 
gLA <- gLA + labs(fill = "Vehicle Type")
multiplot(gB, gLA, cols=1)
dev.off()
