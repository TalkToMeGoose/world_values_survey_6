use "data/raw/mpd2020.dta", clear
drop pop
rename countrycode country_iso
rename country country_name
save "data/derived/mpd2020_derived.dta", replace