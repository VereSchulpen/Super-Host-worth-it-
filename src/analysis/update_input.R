#####################
### UPDATE INPUT ####
#####################

# Copy output from data-preparation into input folder 
dir.create("./gen/analysis")
dir.create("./gen/analysis/input/")
file.copy("./gen/data-preparation/output/data_cleaned.RData","./gen/analysis/input/data_cleaned.RData")
