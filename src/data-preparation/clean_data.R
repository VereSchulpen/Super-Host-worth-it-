######################
#### CLEAN DATA ######
######################

#Load dataset into R
df1 <- read.csv("./gen/data-preparation/input/venice1.csv")

#Remove variables we don't need
df_cleaned <- df1[,c(1, 9, 18, 22, 32, 33, 40, 42, 61, 74)]


# Save cleaned data
dir.create("./gen/data-preparation/output")
save(df_cleaned,file="./gen/data-preparation/output/data_cleaned.RData")

