#loading packages
library(tidyverse)
library(gapminder)
library(sjPlot)
library(stats)
library(jtools)
library(knitr)
library(janitor)
library(ggplot2)
library(dplyr)
install.packages("ggpubr")
library(ggpubr)

#reading dataset
animal_shelter<-read.csv("dataset18.csv")
head(animal_shelter)
glimpse(animal_shelter)

#probability density function of the number of days animal spends in the shelter
ggplot(animal_shelter, aes(x = time_at_shelter)) + 
  geom_density(color = "blue")

#transform data format
animal_shelter$animal_type <- as.factor(animal_shelter$animal_type)
levels(animal_shelter$chip_status) <- c("BIRD", "DOG","CAT","WILDLIFE","LIVESTOCK")
animal_shelter$intake_type <- as.factor(animal_shelter$intake_type)
animal_shelter$outcome_type <- as.factor(animal_shelter$outcome_type)
animal_shelter$chip_status <- as.factor(animal_shelter$chip_status)

#Barchart of animal_type and time_in _shelter
ggplot(data = animal_shelter, mapping = aes(x = animal_type,fill=animal_type))+
  geom_bar(stat="count", width= 0.5) +
  labs(x = "Animal types", y = "The number of days",
       title = "The number of days spent in the shelter of different animals") 
#Boxplot of animal_type and time_in _shelter
ggplot(data = animal_shelter, aes(x = animal_type, y = time_at_shelter, fill = animal_type)) +
  geom_boxplot() +
  labs(x = "The number of days spent in the shelter of different animals", y = "The number of days")+ 
  theme(legend.position = "none")
##many outliers

#Barchart of month and time_in _shelter:
animal_shelter$month
factor(animal_shelter$month)
ggplot(data = animal_shelter, mapping = aes(x = factor(month),fill=month))+
  geom_bar(stat="count", width= 0.5) +
  labs(x = "Month", y = "The number of days",
       title = "The number of days spent in the shelter of different month") +
  scale_x_discrete(labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                              "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))


#Boxplot of year and time_in _shelter:
animal_shelter$year <- as.factor(animal_shelter$year)
ggplot(data = animal_shelter, aes(x = year, y = time_at_shelter, fill = year)) +
  geom_boxplot() +
  labs(x = "The number of days spent in the shelter on different years", y = "The number of days")+ 
  theme(legend.position = "none")

#Boxplot of intake_type and time_in _shelter:
ggplot(data = animal_shelter, aes(x = intake_type, y = time_at_shelter, fill = intake_type)) +
  geom_boxplot() +
  labs(x = "The number of days spent in the shelter of different intake types", y = "The number of days")+ 
  theme(legend.position = "none")

#Boxplot of outcome_type and time_in _shelter:
ggplot(data = animal_shelter, aes(x = outcome_type, y = time_at_shelter, fill = outcome_type)) +
  geom_boxplot() +
  labs(x = "The number of days spent in the shelter of different outcome types", y = "The number of days")+ 
  theme(legend.position = "none")

#Boxplot of chip_status and time_in _shelter:
ggplot(data = animal_shelter, aes(x = chip_status, y = time_at_shelter, fill = chip_status)) +
  geom_boxplot() +
  labs(x = "The number of days spent in the shelter of different chip status", y = "The number of days")+ 
  theme(legend.position = "none")






















