#loaddata
load("./gen/analysis/input/data_cleaned.RData")

# Calculate the average price of a room in Venice
mean(df_cleaned$price_numeric)

#Model1
m1 <- lm(price_num ~ host_is_superhost, df_cleaned)


# Save results
save(m1, file="./gen/analysis/output/model_results.RData")
