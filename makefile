# OVERALL BUILD RULES
all: download_data data_cleaned 
download_data: data/dataset1/venice1.csv
data_cleaned: gen/data-preparation/output/data_cleaned.Rdata

## Sub-builds
data/dataset1/venice1.csv: download_data.R
		R --vanilla < src/data-preparation/download_data.R

gen/data-preparation/output/data_cleaned.Rdata: venice1.csv
		R --vanilla < src/data-preparation/clean_data.R