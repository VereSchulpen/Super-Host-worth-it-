# Copy output from data-preparation into input folder 
dir.create("./gen/paper/input/")
file.copy("./gen/data-preparation/output/data_cleaned.RData","./gen/paper/input/data_cleaned.RData")
