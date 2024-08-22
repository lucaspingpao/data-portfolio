#Created by Lucas Pao on July 27, 2020
#Last Edited: August 21, 2020


# 1. Plotting -------------------------------------------------------------
library(graphics) # If you haven't done so already, run the command install.packages("graphics") to download this package
# Other libraries for data visualization: plotrix, ggplot, tidyverse

# a) Scatterplots
plot(x=NULL, y=NULL, xlab="x", ylab="y", xlim=c(0,10), ylim=c(-2,2), asp=1, main="Title", axes=TRUE)

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
points(x, y, col="blue", pch=20, cex=0.5)
lines(x, y, col="blue", lty=1, lwd=0.5)
abline(v=5, col="red", lty=2)
abline(h=0, col="red", lty=2)
text(x=5, y=0, "Hello world", cex=1)

# c) Segments and arrows
# x0: from(x), x1: to(x), y0: from(y), y1: to(y)
plot(x=NULL, y=NULL, xlab="x", ylab="y", xlim=c(0,10), ylim=c(0,10), asp=1, main="Title", axes=TRUE)
arrows(x0=1, y0=1, x1=3, y1=3, col="green", lty=1, lwd=2)
segments(x0=4, y0=4, x1=6, y1=6, col="green", lty=1, lwd=2)

# d) Barplots and Histograms
random <- sample(1:100, 12, replace=TRUE); random
barplot(height=random, names.arg=month.name, xlab="x", ylab="y", main="Title", col="blue", border="red", axes=TRUE)
hist(random, breaks=0:10*10, xlab="x", ylab="y", main="Title", col="blue", border="red", axes=TRUE)


# 2. Visualize Coronavirus Data -------------------------------------------

# a) Create Data Set
#Go to "Session" -> "Set Working Directory" -> "Choose Directory"
#Then choose the folder in which the dataset file is located
covidData <- read.csv("Wave5-RShiny-Covid-Dataset.csv")
newcovidData <- subset(covidData, covidData$year == 2020)
newcovidData$time <- newcovidData$month * 30 + newcovidData$day
Brazil <- subset(newcovidData, newcovidData$countriesAndTerritories == "Brazil")
Colombia <- subset(newcovidData, newcovidData$countriesAndTerritories == "Colombia")
Argentina <- subset(newcovidData, newcovidData$countriesAndTerritories == "Argentina")
Peru <- subset(newcovidData, newcovidData$countriesAndTerritories == "Peru")
Venezuela <- subset(newcovidData, newcovidData$countriesAndTerritories == "Venezuela")

# b) Plot line graph comparing cases in different countries over time
plot.new() # Clears all plots
plot(x = Brazil$time, y = Brazil$cases, xlab = "Time (days after Jan 1, 2020)", ylab = "Cases per day", main = "Coronavirus Cases", col = "red", type="l")
points(x = Colombia$time, y = Colombia$cases, col = "orange", type="l")
points(x = Argentina$time, y = Argentina$cases, col = "yellow", type="l")
points(x = Peru$time, y = Peru$cases, col = "green", type="l")
points(x = Venezuela$time, y = Venezuela$cases, col = "blue", type="l")

# c) Plot bar graph comparing averages cases in different countries
barplot(
  height = c(mean(Brazil$cases), mean(Colombia$cases), mean(Argentina$cases), mean(Peru$cases), mean(Venezuela$cases)),
  names.arg=c("Brazil", "Colombia", "Argentina", "Peru", "Venezuela"),
  xlab="Country",
  ylab="Average Cases Per Day",
  main="Coronavirus Cases",
)

# d) Histogram showing frequency of days in Peru with over 1000 cases reported
hist(subset(Peru$time, Peru$cases>1000), xlab="Time (days after Jan 1, 2020)", main="Days in Peru with over 1000 cases", col="blue", border="red", axes=TRUE)


