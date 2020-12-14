save "data/derived/WVS_derived_no_missing.dta", replace
generate ln_gdppc = ln(gdppc)
regress satisfaction ln_gdppc

* Output two filetypes
* .xlsx didnt work so I saved as .xls
outreg2 using "output/regression.txt", replace
outreg2 using "output/regression.xls", replace

scatter satisfaction ln_gdppc
graph save "output/satisfation_gdppc_scatter.gph", replace