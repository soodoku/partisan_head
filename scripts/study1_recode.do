cd "~/Dropbox/xperceive/PartisanComposition/data/study1"
insheet using "PartyExemplarsRecode.csv", clear names
drop if allowed == 0
drop if duplicate == 1
for var dem*r: replace X = "" if X == "NA"
for var rep*r: replace X = "" if X == "NA"

for var *educr: replace X = proper(X)
for var *unionr: replace X = proper(X)

save study1_data.dta, replace
