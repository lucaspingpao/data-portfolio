#Created by Lucas Pao on July 27, 2020
#Last Edited: July 27, 2020


# 1. Data Structures --------------------------------------
# Create covidData
names <- c("Alice", "Bob", "Charlie", "David", "Eve"); names
ages <- c(14,15,15,16,17); ages
colors <- c("red", "orange", "yellow", "green", "blue"); colors

# a) Combine data into a matrix -------------------------------------------
# Matrices can only contain data of the same type
matrixExample <- cbind(names, ages, colors); matrixExample
matrixExample <- matrix(c(names, ages, colors), nrow=5, ncol=3); matrixExample
rownames(matrixExample) <- c("Student 1", "Student 2", "Student 3", "Student 4", "Student 5"); matrixExample
colnames(matrixExample) <- c("names", "ages", "colors"); matrixExample

# b) Combine data into a list ---------------------------------------------
# Lists only allow you to access information in 1 dimension
listExample <- list(names, ages, colors); listExample
names(listExample) <- c("names", "ages", "colors"); listExample


# c) Combine data into a data frame ---------------------------------------
# Data frames are a combination of matrix tables and lists
dataframeExample <- data.frame(names, ages, colors); dataframeExample

# Create data frame from scratch
data2 <- data.frame(
  row.names = c("Student 1", "Student 2", "Student 3", "Student 4", "Student 5"),
  names = c("Alice", "Bob", "Charlie", "David", "Eve"),
  ages = c(14,15,15,16,17),
  colors = c("red", "orange", "yellow", "green", "blue")
);
data2

# 2. Operating with Data Frames ----------------------------------------------------------

# Accessing Data Frame Elements ----------------------------------------
dataframeExample
data2[1,] #row 1
data2[c(1,2),] #row 1 and 2
data2[,1] #column 1
data2[1,1] #row 1 column 1

# Create row/column names and access elements by name
dataframeExample
rownames(dataframeExample) <- c("Student 1", "Student 2", "Student 3", "Student 4", "Student 5"); dataframeExample
dataframeExample$names #column 1
dataframeExample$names[1] #row 1 column 1
dataframeExample["Student 1",] #row 1
dataframeExample[c("Student 1","Student 2"),] #row 1 and 2
dataframeExample[,"names"] #column 1
dataframeExample["Student 1", "names"] #row 1 column 1


# 3. Conditional Operators ------------------------------------------------
# Or: |, And: &, Not: !, Equals: ==
0 < 1 #True statement
0 == 1 #False statement

# a) The "OR" operator returns true if at least one of the conditional statements is true
if(0 < 1 | 0 == 1) {
  print("This conditional is true")
} else {
  print("This conditional is false")
}

# b) The "AND" operator returns true only if both of the conditional statements is true
if(0 < 1 & 0 == 1) {
  print("This conditional is true")
} else {
  print("This conditional is false")
}

# c) The "NOT" operator flips the value of the conditional statement
if(0 != 1) {
  print("This conditional is true")
} else {
  print("This conditional is false")
}

# Subsetting data with conditionals (subset, which, unique)
dataframeExample
subset(dataframeExample, dataframeExample$age == 15)
subset(dataframeExample$names, dataframeExample$age == 15)
which(dataframeExample$age == 15)
dataframeExample[which(dataframeExample$age == 15),]
unique(dataframeExample$ages)


# 4. Data Analytics -------------------------------------------------------

# Reading data files
# Go to "Session" -> "Set Working Directory" -> "Choose Directory"
# Then choose the folder in which the covidData file is located
covidData <- read.csv("Wave5-RShiny-Covid-Dataset.csv")

# Previewing data (View, head, tail, str, summary, nrow, ncol)
View(covidData)
head(covidData)
tail(covidData)
str(covidData)
summary(covidData)
nrow(covidData)
ncol(covidData)

# Analyze the data!
# How many total covid deaths have there been in Asia?
# On how many days has the U.S. reported more than 10,000 cases?
# What is the median population of the countries that have ever reported over 2,020 cases?

sum(subset(covidData$deaths, covidData$continentExp == "Asia"))
nrow(subset(covidData, covidData$cases > 10000 & countriesAndTerritories == "United_States_of_America"))
median(unique(subset(covidData$popData2019, covidData$cases > 2020)))

# Confirming last result
unique(subset(covidData$countriesAndTerritories, covidData$popData2019 == 50339443))
View(subset(covidData, covidData$countriesAndTerritories == "Colombia"))




