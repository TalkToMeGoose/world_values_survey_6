These codes are meant to overcome an obstacle.
In the World Values Survey (WVS) wave 6 we have ~80K observations on a questionaire.
Two of the variables are subjective well bein (SWB) and income decile.
I want to measure SWB as a function of GDP per capita. However, GDP per capita is not listed in the WVS.
For this I use the Maddison Project Database (MPD), giving GDP per cap (gdppc) for different years.

WVS surveys are by country. Each country is conducted in a different year. 
This year is NOT reported on the WVS document itself, but on the WVS website.

The goal:
1. Create python scraping program to pull the year-of-survey info from the WVS site
2. Create a usable csv with country year data
3. Merge the year-of-survey onto the observations in WVS data
4. Merge the gdppc (from MPD) onto the WVS, showing the gdppc for the year each survey was conducted
5. run regression on the new database
