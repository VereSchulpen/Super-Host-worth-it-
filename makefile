# OVERALL BUILD RULES
all: download_data data_cleaned analysis 
download_data: data/dataset1/venice1.csv
data_cleaned: gen/data-preparation/output/data_cleaned.Rdata
analysis: gen/analysis/output/model_results.RData

## Sub-builds
data/dataset1/venice1.csv: src/data-preparation/download_data.R
		R --vanilla < src/data-preparation/download_data.R

gen/data-preparation/output/data_cleaned.Rdata: src/data-preparation/clean_data.R
		R --vanilla < src/data-preparation/clean_data.R
		
gen/analysis/output/model_results.Rdata: src/analysis/update_input.R src/analysis/analysis.R
		R --vanilla < src/analysis/update_input.R
		R --vanilla < src/analysis/analysis.R
	
		