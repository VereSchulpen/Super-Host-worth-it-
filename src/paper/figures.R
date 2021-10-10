#Load library
library(ggplot2)

#load data
load("./gen/paper/input/data_cleaned.RData")

#create directory
dir.create("./gen/paper/output")

# Boxplot of the Dependent variable: price_numeric
pdf("./gen/paper/output/boxplot_DV.pdf")
boxplot(df_cleaned$price_numeric)
dev.off()

# Barplot of the Indepedent variable: host_is_super_binary
pdf("./gen/paper/output/barplot_IV.pdf")
ggplot(df_cleaned, aes(host_is_superhost_binary)) + geom_bar(aes(y = (..count..)/sum(..count..)*100)) + ylab("percentage")
dev.off()


# combination of DV and IV in one boxplot
pdf("./gen/paper/output/combination_DV_and_IV.pdf")
ggplot(df_cleaned, aes(x=as.factor(host_is_superhost_binary), y=price_numeric)) + geom_boxplot()
dev.off()

