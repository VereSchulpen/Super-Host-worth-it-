#loaddata
load("./gen/analysis/input/data_cleaned.RData")

# Calculate the average price of a room in Venice
mean(df_cleaned$price_numeric)

# Create a subset of the mean prices of a superhost vs a non-superhost
mean <- subset(df_cleaned, !is.na(price_numeric) & !is.na(host_is_superhost_binary)) %>% group_by(host_is_superhost_binary) %>% summarize(mean = mean(price_numeric)) 
View(mean)

#Model1
m1 <- lm(price_num ~ host_is_superhost, df_cleaned)


# Save results
save(m1, file="./gen/analysis/output/model_results.RData")
