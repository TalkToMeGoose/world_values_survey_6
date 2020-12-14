* Before this .do can be run, the webscrape_to_csv.py must be ran
* in order to pull survey years from WVS website and save them
* as survey_year.csv

* run from root project folder, so that code is ran from code/
* and data is read from data/

* If this package is not installed, uncommet and run the following line once
* ssc install outreg2

do code/import_MPD_rename_vars_save.do
do code/merge_MPD_to_survey_year_data.do
do code/merge_gdp_by_survey_year_to_WVS_rename_reorder.do
do code/drop_missing_obs.do
do code/prepare_run_OLSreg_save_table_and_graph.do