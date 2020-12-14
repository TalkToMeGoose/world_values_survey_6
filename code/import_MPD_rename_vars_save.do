use "data/raw/mpd2020.dta", clear
drop pop
rename countrycode country_iso
rename country country_name

* Assume we want to transform 'double' type data to save space
* Assume we are okay with using "force" :)
recast long gdppc, force
save "data/derived/mpd2020_derived.dta", replace