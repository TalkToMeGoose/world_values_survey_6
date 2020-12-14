use "data/raw/WV6_Data_stata_v20201117.dta", clear
keep B_COUNTRY_ALPHA V23 V239 V240 V242
rename (B_COUNTRY_ALPHA V23 V239 V240 V242) (country_iso satisfaction income_decile sex age)
merge m:1 country_iso using "data/derived/gdp_by_survey_year.dta", nogenerate keep(match)
order country_name country_iso gdppc satisfaction
order year, last
save "data/derived/WVS_derived.dta", replace