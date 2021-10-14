#################
### ANALYSIS ####
#################

#library
library(dplyr)

#loaddata
load("./gen/analysis/input/data_cleaned.RData")

################ first stage analysis #########################

# Compare the average prices of a superhost vs a non-superhost
mean1 <- subset(df_cleaned, !is.na(price_numeric) & !is.na(superhost_binary)) %>% group_by(superhost_binary) %>% summarize(mean = mean(price_numeric), var = var(price_numeric)) 
View(mean1)

library(car)
leveneTest(price_numeric ~ as.factor(superhost_binary), df_cleaned, center=mean)
t.test(price_numeric ~ as.factor(superhost_binary), df_cleaned, var.equal=FALSE)

# estimate the actual linear regression model - model1
# the relationship between the price and whether someone is a super host or not
# Immediately after we ask for a summary of m1 
m1 <- lm(price_numeric ~ superhost_binary, df_cleaned); summary(m1)

# Whenever estimating a model with the interaction between “superhost_binary” and one of the other three named variables, the coefficient of the “superhost_binary” turned out to be no significant anymore. Therefore, no valid conclusion can be drawn.
m2 <- lm(price_numeric ~ superhost_binary * reviews_per_month, df_cleaned); summary(m2)

# check for assumptions for m1:
library(broom)
# normality assumption
# residuals should be normally distributed
# access the residuals of m1
m1_res <- augment(m1)
# create a histogram of these residuals
# check for normality
# We look for a bell shaped curve 
ggplot(m1_res, aes(.resid)) + geom_histogram(aes(y = ..density..), binwidth = 5) + stat_function(fun = dnorm, args = list(mean = mean(m1_res$.resid), sd = sd(m1_res$.resid)), color="red", size=2)
# there is a bell shaped curve with a long right tail, so the distribution of data is right skewed. 

# we have also ran another plot to check for normality - the normal QQ
# The findings were that the QQ plot right-skewed data appears curved. 
qqnorm(m1_res$.std.resid, pch = 1, frame = FALSE)


############ second stage analysis #################

# compare different price ranges
# price > $0 and <= $50
mean_between_0_and_50 <- subset(df_cleaned1, !is.na(price_numeric) & !is.na(superhost_binary)) %>% group_by(superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
leveneTest(price_numeric ~ as.factor(superhost_binary), df_cleaned1, center=mean)
t.test(price_numeric ~ as.factor(superhost_binary), df_cleaned1, var.equal=TRUE)
lm_0_and_50 <- lm(price_numeric ~ superhost_binary, df_cleaned1); summary(lm_0_and_50)


# price > $50 and <= $100
mean_between_50_and_100 <- subset(df_cleaned2, !is.na(price_numeric) & !is.na(superhost_binary)) %>% group_by(superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
leveneTest(price_numeric ~ as.factor(superhost_binary), df_cleaned2, center=mean)
t.test(price_numeric ~ as.factor(superhost_binary), df_cleaned2, var.equal=FALSE)
lm_50_and_100 <- lm(price_numeric ~ superhost_binary, df_cleaned2); summary(lm_50_and_100)


# price > $100 and <= $150
mean_between_100_and_150 <- subset(df_cleaned3, !is.na(price_numeric) & !is.na(superhost_binary)) %>% group_by(superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
leveneTest(price_numeric ~ as.factor(superhost_binary), df_cleaned3, center=mean)
t.test(price_numeric ~ as.factor(superhost_binary), df_cleaned3, var.equal=TRUE)
lm_100_and_150 <- lm(price_numeric ~ superhost_binary, df_cleaned3); summary(lm_100_and_150)


# price > $150 and <= 200
mean_between_150_and_200 <- subset(df_cleaned4, !is.na(price_numeric) & !is.na(superhost_binary)) %>% group_by(superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
leveneTest(price_numeric ~ as.factor(superhost_binary), df_cleaned4, center=mean)
t.test(price_numeric ~ as.factor(superhost_binary), df_cleaned4, var.equal=TRUE)
lm_150_and_200 <- lm(price_numeric ~ superhost_binary, df_cleaned4); summary(lm_150_and_200)


# price > $200 and <= $250
mean_between_200_and_250 <- subset(df_cleaned5, !is.na(price_numeric) & !is.na(superhost_binary)) %>% group_by(superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
leveneTest(price_numeric ~ as.factor(superhost_binary), df_cleaned5, center=mean)
t.test(price_numeric ~ as.factor(superhost_binary), df_cleaned5, var.equal=TRUE)
lm_200_and_250 <- lm(price_numeric ~ superhost_binary, df_cleaned5); summary(lm_200_and_250)


# price > $250
mean_bigger_250 <- subset(df_cleaned6, !is.na(price_numeric) & !is.na(superhost_binary)) %>% group_by(superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
leveneTest(price_numeric ~ as.factor(superhost_binary), df_cleaned6, center=mean)
t.test(price_numeric ~ as.factor(superhost_binary), df_cleaned6, var.equal=FALSE)
lm_250 <- lm(price_numeric ~ superhost_binary, df_cleaned6); summary(lm_250)


# Save results
dir.create("./gen/analysis/output")
save(m1, lm_0_and_50, lm_50_and_100, lm_100_and_150, lm_150_and_200, lm_200_and_250, lm_250  file="./gen/analysis/output/model_results.RData")


