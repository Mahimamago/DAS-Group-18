library(MASS)

animal_shelter<-read.csv("dataset18.csv")
sum(is.na(animal_shelter))
str(animal_shelter)
# convert categorical variables to factors
animal_shelter$animal_type <- factor(animal_shelter$animal_type)
animal_shelter$intake_type <- factor(animal_shelter$intake_type)
animal_shelter$outcome_type <- factor(animal_shelter$outcome_type)
animal_shelter$chip_status <- factor(animal_shelter$chip_status)

# check for missing values
sum(is.na(animal_shelter))

# check for outliers using boxplot
boxplot(animal_shelter$time_at_shelter, main = "Time at Shelter")

# fit a Poisson GLM with main effects only
model1 <- glm(time_at_shelter ~ animal_type + month + year + intake_type + outcome_type + chip_status,
             data = animal_shelter, family = "poisson")
summary(model1)

#Extract the residuals
residuals<- model1$residuals
# Perform the Shapiro-Wilk test
shapiro.test(residuals)

# log-transform and add a small constant value to the response variable to avoid negative values
animal_shelter$log_time_at_shelter <- log(animal_shelter$time_at_shelter + 2.5)

# Fit the GLM with log-transformed response variable and gamma distribution
model_log_gamma <- glm(log_time_at_shelter ~ animal_type + month + year + 
                         intake_type + outcome_type + chip_status, 
                       family = "Gamma", data = animal_shelter)

# Summarize the model
summary(model_log_gamma)

# Add interaction term here to improve fit
model_int <- glm(log_time_at_shelter ~ animal_type * intake_type + month + year + outcome_type + chip_status, family = "Gamma", data = animal_shelter)
summary(model_int)

# Drop non-significant predictors
model_sig <- update(model_int, . ~ . - month - year)

# Check significance of predictors again
summary(model_sig)

# add quadratic terms for better fit
animal_shelter$month_sq <- animal_shelter$month^2
model_quad <- glm(log_time_at_shelter ~ animal_type + intake_type + outcome_type + chip_status + animal_type:intake_type + month + month_sq, family = "Gamma", data = animal_shelter)
summary(model_quad)
