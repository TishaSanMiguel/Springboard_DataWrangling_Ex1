# Springboard_DataWrangling_Ex2
library(tidyverse)
titanic <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/titanic_original.csv")
titanic %>% glimpse
titanic <-tbl_df(titanic)

#Find the missing values and replace them with S
missing <- is.na(titanic$embarked)
titanic$embarked[missing] <- "S"

#Calculate the mean of the Age column and use that value to populate the missing values
ages <- mean(titanic$age)
titanic$Age[titanic$age == ""] <- ages

#Fill these empty slots in Lifeboat with a dummy value e.g. the string 'None' or 'NA'
titanic$boat[titanic$boat == ""] <- NA

#Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise