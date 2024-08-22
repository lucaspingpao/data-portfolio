#Created by Lucas Pao on July 27, 2020
#Last Edited: August 21, 2020


# 1. Plotting -------------------------------------------------------------
library(graphics) # If you haven't done so already, run the command install.packages("graphics") to download this package
# Other libraries for data visualization: plotrix, ggplot, tidyverse

# a) Scatterplots


# Generate random points
x <- seq(from=1, to=10, by=0.5); x
y <- sin(x); y

# b) Points, lines, curves, text
?par #Find all the parameters here
?pch #Find all styles here
#pch: type of point
#cex: size of points/texts
#lty: type of line
#lwd: line thickness



# c) Segments and arrows
# x0: from(x), x1: to(x), y0: from(y), y1: to(y)


# d) Barplots and Histograms
random <- sample(1:100, 12, replace=TRUE); random



# 2. Visualize Coronavirus Data -------------------------------------------

# a) Create Data Set
#Go to "Session" -> "Set Working Directory" -> "Choose Directory"
#Then choose the folder in which the dataset file is located
covidData <- read.csv("Wave5-RShiny-Covid-Dataset.csv")


# b) Plot line graph comparing cases in different countries over time
plot.new() # Clears all plots


# c) Plot bar graph comparing averages cases in different countries


# d) Histogram showing frequency of days in Peru with over 1000 cases reported


