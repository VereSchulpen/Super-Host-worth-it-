## Sub-builds
data/dataset1/venice1.csv: src/data-preparation/download_data.R
		R --vanilla < src/data-preparation/download_data.R

gen/data-preparation/input/venice1.csv: src/data-preparation/update_data.R data/dataset1/venice1.csv
		R --vanilla < src/data-preparation/update_data.R
		
gen/data-preparation/output/data_cleaned.Rdata: src/data-preparation/clean_data.R gen/data-preparation/input/venice1.csv
		R --vanilla < src/data-preparation/clean_data.R