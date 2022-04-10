cd "~/Dropbox/xperceive/PartisanComposition/data/study1"
use "study1_data", clear

tab demrichr
bys pid3: tab demrichr
tab demrelr
bys pid3: tab demrelr
tab demracer
bys pid3: tab demracer
tab demsexr
bys pid3: tab demsexr
tab demager
bys pid3: tab demager
tab demeducr
bys pid3: tab demeducr
tab demunionr
bys pid3: tab demunionr

tab reprichr
bys pid3: tab reprelr
tab reprelr
bys pid3: tab reprelr
tab repracer
bys pid3: tab repracer
tab repsexr
bys pid3: tab repsexr
tab repager
bys pid3: tab repager
tab repeducr
bys pid3: tab repeducr
tab repunionr
bys pid3: tab repunionr

