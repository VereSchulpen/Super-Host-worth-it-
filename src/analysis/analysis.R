#loaddata
load("./gen/analysis/input/data_cleaned.RData")

# Calculate the average price of a room in Venice
mean(df_cleaned$price_numeric)

# Compare the price of a specific host with the average price of all hosts in Venice
# So a we can see if the host is priced above the average or below the average
if(df_cleaned$price_numeric[1] > mean(df_cleaned$price_numeric)){
  print("This room is priced above the average price")
} else {
  print("This room is priced below the average price")
}

# Create a subset of the mean prices of a superhost vs a non-superhost
mean <- subset(df_cleaned, !is.na(price_numeric) & !is.na(host_is_superhost_binary)) %>% group_by(host_is_superhost_binary) %>% summarize(mean = mean(price_numeric)) 
View(mean)

# estimate the actual linear regression model
df_cleaned_lm1 <- lm(price_numeric ~ host_is_superhost_binary, df_cleaned); summary(df_cleaned_lm1)

#hypothesis testing, independent samples t-test
leveneTest(price_numeric ~ as.factor(host_is_superhost_binary), df_cleaned, center=mean)
t.test(price_numeric ~ as.factor(host_is_superhost_binary), df_cleaned, var.equal=TRUE)

#Model1
m1 <- lm(price_num ~ host_is_superhost, df_cleaned)


# compare different price ranges
# price > $0 and <= $50
df_cleaned1 <- df_cleaned %>% filter(price_numeric > 0 & price_numeric <= 50)
mean_between_0_and_50 <- subset(df_cleaned1, !is.na(price_numeric) & !is.na(host_is_superhost_binary)) %>% group_by(host_is_superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
lm_0_and_50 <- lm(price_numeric ~ host_is_superhost_binary, df_cleaned1); summary(lm_0_and_50)
correlation_test <- cor.test(df_cleaned1$price_numeric, df_cleaned1$host_is_superhost_binary, method = "pearson")
correlation_test

# price > $50 and <= $100
df_cleaned2 <- df_cleaned %>% filter(price_numeric > 50 & price_numeric <= 100)
mean_between_50_and_100 <- subset(df_cleaned2, !is.na(price_numeric) & !is.na(host_is_superhost_binary)) %>% group_by(host_is_superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
lm_50_and_100 <- lm(price_numeric ~ host_is_superhost_binary, df_cleaned2); summary(lm_50_and_100)
correlation_test <- cor.test(df_cleaned2$price_numeric, df_cleaned2$host_is_superhost_binary, method = "pearson")
correlation_test

# price > $100 and <= $150
df_cleaned3 <- df_cleaned %>% filter(price_numeric > 100 & price_numeric <= 150)
mean_between_100_and_150 <- subset(df_cleaned3, !is.na(price_numeric) & !is.na(host_is_superhost_binary)) %>% group_by(host_is_superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
lm_100_and_150 <- lm(price_numeric ~ host_is_superhost_binary, df_cleaned3); summary(lm_100_and_150)
correlation_test <- cor.test(df_cleaned3$price_numeric, df_cleaned3$host_is_superhost_binary, method = "pearson")
correlation_test

# price > $150 and <= 200
df_cleaned4 <- df_cleaned %>% filter(price_numeric > 150 & price_numeric <= 200)
mean_between_150_and_200 <- subset(df_cleaned4, !is.na(price_numeric) & !is.na(host_is_superhost_binary)) %>% group_by(host_is_superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
lm_150_and_200 <- lm(price_numeric ~ host_is_superhost_binary, df_cleaned4); summary(lm_150_and_200)
correlation_test <- cor.test(df_cleaned4$price_numeric, df_cleaned4$host_is_superhost_binary, method = "pearson")
correlation_test

# price > $200 and <= $250
df_cleaned5 <- df_cleaned %>% filter(price_numeric > 200 & price_numeric <= 250)
mean_between_200_and_250 <- subset(df_cleaned5, !is.na(price_numeric) & !is.na(host_is_superhost_binary)) %>% group_by(host_is_superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
lm_200_and_250 <- lm(price_numeric ~ host_is_superhost_binary, df_cleaned5); summary(lm_200_and_250)
correlation_test <- cor.test(df_cleaned5$price_numeric, df_cleaned5$host_is_superhost_binary, method = "pearson")
correlation_test

# price > $250
df_cleaned6 <- df_cleaned %>% filter(price_numeric > 250)
mean_bigger_250 <- subset(df_cleaned6, !is.na(price_numeric) & !is.na(host_is_superhost_binary)) %>% group_by(host_is_superhost_binary) %>% summarise(mean = mean(price_numeric), var = var(price_numeric)) 
lm_250 <- lm(price_numeric ~ host_is_superhost_binary, df_cleaned6); summary(lm_250)
correlation_test <- cor.test(df_cleaned6$price_numeric, df_cleaned6$host_is_superhost_binary, method = "pearson")
correlation_test


# Save results
save(m1, file="./gen/analysis/output/model_results.RData")
