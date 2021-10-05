#loaddata
load("./gen/analysis/input/data_cleaned.RData")

# Dependent variable transformation -> make the variable numeric
df_cleaned$price_num <- as.numeric((gsub("[$,]","", df_cleaned$price)))
# Independent variable transformation -> make the variable binary with 1 = superhost and 0 = non-superhost
df_cleaned$host_is_superhost_TRUE <- ifelse(df_cleaned$host_is_superhost == 'TRUE', 1, 0)
df_cleaned$host_is_superhost_TRUE[is.na(df_cleaned$host_is_superhost_TRUE)] <- 0 

#Model1
m1 <- lm(price_num ~ host_is_superhost, df_cleaned)


# Save results
save(m1, file="./gen/analysis/output/model_results.RData")
