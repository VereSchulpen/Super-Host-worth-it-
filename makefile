# OVERALL BUILD RULES
all: download_data data_cleaned analysis plot
download_data: data/dataset1/venice1.csv
data_cleaned: gen/data-preparation/output/data_cleaned.Rdata
plot: gen/paper/output/barplot_IV.pdf gen/paper/output/boxplot.pdf gen/paper/output/combination_DV_and_IV.pdf
analysis: gen/analysis/output/model_results.RData

## Sub-builds
data/dataset1/venice1.csv: src/data-preparation/download_data.R
		R --vanilla < src/data-preparation/download_data.R

gen/data-preparation/output/data_cleaned.Rdata: src/data-preparation/clean_data.R
		R --vanilla < src/data-preparation/clean_data.R
		
gen/analysis/output/model_results.Rdata: src/analysis/update_input.R src/analysis/analysis.R
		R --vanilla < src/analysis/update_input.R
		R --vanilla < src/analysis/analysis.R
	
gen/paper/output/barplot_IV.pdf gen/paper/output/boxplot.pdf gen/paper/output/combination_DV_and_IV.pdf: src/paper/update_input.R src/paper/figure.R
		R --vanilla < src/paper/update_input.R
		R --vanilla < src/paper/figure.R
		