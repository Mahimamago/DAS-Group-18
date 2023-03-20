# DAS-Group-18

Factors Influencing Length of Stay for Animals in Dallas Animal Shelter

In this project, we are interested in what factors influence the length of time an animal stays in the shelter. There are 4 character variables and 3 numeric variables in our data set. The response variable is Time_at_shelter. Firstly we do the exploratory analysis to explore if there is any relationship between factors and response variable. In formal analysis, we fit the model by using negative binomial GLM model for count response. Then we remove insignificant variables: animal types, month and year from the model and remove outliers for model selection. Finally, we check the GLM model assumption and obtain our final GLM model. As for further work, the model residuals are not perfectly linearly distributed, so more effective methods of dealing with outliers can be tried.
