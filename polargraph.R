library(datasets)
library(ggplot2)
library(RColorBrewer)
colors1 <- brewer.pal(9, "Greens")
palette1 <- colorRampPalette(colors1)
colors2 <- brewer.pal(9, "YlOrRd")
palette2 <- colorRampPalette(colors2)

# read in fitness test data
testdata <- read.csv("10AttributesFitnessData.csv")

# create a TO DO list, inverse of test results
todo <- testdata
todo[,2] <- abs(todo[,2] - 10)

# if a Score is 0, make it a 1
for (i in 1:nrow(todo)) 
{
        if (todo[i,2] == 0)  {todo[i,2] <- todo[i,2] + 1}
}


# plot of Fitness Test
png("fittest.png", width = 960, height = 960)
testplot <- ggplot(testdata, aes(Attribute, Score, fill = factor(Score))) + 
        geom_bar(stat="identity") + 
        coord_polar() +
        theme(legend.position="none") +
        labs(x="June 26, 2014") + 
        labs(y="") + 
        scale_y_continuous(limits=c(0,10)) +
        labs(title="10 Attributes of Fitness Test Results") +     
        scale_fill_manual(values=palette1(10)) +
        theme(plot.title = element_text(size = rel(2), face="bold"))
testplot
dev.off()

# plot of ToDo list (inverse of Fitness Test)
png("todo.png", width = 960, height = 960)
todoplot <- ggplot(todo, aes(Attribute, Score, fill = factor(Score))) + 
        geom_bar(stat="identity") + 
        coord_polar() +
        theme(legend.position="none") +
        labs(x="June 26, 2014") + 
        labs(y="") + 
        scale_y_continuous(limits=c(0,10)) +
        labs(title="To Do List") +     
        scale_fill_manual(values=palette2(10)) +
        theme(plot.title = element_text(size = rel(2), face="bold"))
todoplot
dev.off()

png("both.png", width = 960, height = 960)
source('~/CourseraHW/R_functions/multiplot.R')
multiplot(testplot, todoplot, cols=1)
dev.off()
