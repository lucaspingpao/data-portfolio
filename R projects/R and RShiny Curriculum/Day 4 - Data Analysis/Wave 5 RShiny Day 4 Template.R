#Created by Lucas Pao on July 27, 2020
#Last Edited: July 27, 2020


# 1. Data Structures --------------------------------------
# Create covidData
names <- c("Alice", "Bob", "Charlie", "David", "Eve"); names
ages <- c(14,15,15,16,17); ages
colors <- c("red", "orange", "yellow", "green", "blue"); colors

# a) Combine data into a matrix -------------------------------------------
# Matrices can only contain data of the same type



# b) Combine data into a list ---------------------------------------------
# Lists only allow you to access information in 1 dimension



# c) Combine data into a data frame ---------------------------------------
# Data frames are a combination of matrix tables and lists


# Create data frame from scratch


# 2. Operating with Data Frames ----------------------------------------------------------

# Accessing Data Frame Elements ----------------------------------------
dataframeExample
#row 1
#row 1 and 2
#column 1
#row 1 column 1

# Create row/column names and access elements by name
dataframeExample
rownames(dataframeExample) <- c("Student 1", "Student 2", "Student 3", "Student 4", "Student 5"); dataframeExample
#column 1
#row 1 column 1
#row 1
#row 1 and 2
#column 1
#row 1 column 1


# 3. Conditional Operators ------------------------------------------------
# Or: |, And: &, Not: !, Equals: ==
0 < 1 #True statement
0 == 1 #False statement

# a) The "OR" operator returns true if at least one of the conditional statements is true



# b) The "AND" operator returns true only if both of the conditional statements is true



# c) The "NOT" operator flips the value of the conditional statement



# Subsetting data with conditionals (subset, which, unique)
dataframeExample



# 4. Data Analytics -------------------------------------------------------

# Reading data files
# Go to "Session" -> "Set Working Directory" -> "Choose Directory"
# Then choose the folder in which the covidData file is located
covidData <- read.csv("Wave5-RShiny-Covid-Dataset.csv")


# Previewing data (View, head, tail, str, summary, nrow, ncol)


# Analyze the data!
# How many total covid deaths have there been in Asia?
# On how many days has the U.S. reported more than 10,000 cases?
# What is the median population of the countries that have ever reported over 2,020 cases?



# Confirming last result




