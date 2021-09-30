#Load data
load("./gen/data-preparation/temp/data_temp.RData")

#Remove variables we don't need
df_cleaned <- df1[,c(1, 9, 18, 22, 32, 33, 40, 42, 61, 74)]


# Save cleaned data
save(df_cleaned,file="./gen/data-preparation/output/data_cleaned.RData")
