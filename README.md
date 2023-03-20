# DAS-Group-18

Factors Influencing Length of Stay for Animals in Dallas Animal Shelter

In this project, we are interested in what factors influence the length of time an animal stays in the shelter. There are 4 character variables and 3 numeric variables in our data set. The response variable is Time_at_shelter. 
Firstly we did the exploratory analysis to explore the relationship between factors and the response variable. A few data outliers were removed.
Formal analysis was then done to fit a model to our data, through the following steps:
1. Response variable being counts data, poisson distribution was used first to fit the Generalized linear model.
2. Overdispersion was found in the data, leaving two options - Quasi Poisson or Negative binomial distribution.
3. Negative binomial gave a lower AIC and deviance, hence was considered as a better fit to the data.
4. Feature reduction was then done and the final model was checked to see if assumptions were being followed.

