* Assume its important to filter out observations
* with ANY missing values

use "data/derived/WVS_derived.dta", clear
misstable summarize

* for loop to drop missing variables
foreach X in satisfaction income_decile sex age {
	drop if `X' == .
}

misstable summarize
save "data/derived/WVS_derived_no_missing.dta", replace