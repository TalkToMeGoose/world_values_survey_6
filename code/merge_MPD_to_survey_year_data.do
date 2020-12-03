import delimited using "data/derived/survey_year.csv", varnames(1) bindquotes(strict) encoding("utf-8") clear
rename country country_name
merge m:1 country_name year using "data/derived/mpd2020_derived.dta", nogenerate keep(match)
save "data/derived/gdp_by_survey_year.dta", replace