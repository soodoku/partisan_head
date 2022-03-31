# Subset Data for Relevant Variables for Replication
# 

# Set directory
setwd(githubdir)
setwd("partisan_head/")

# Load libs
library(readstata13)

# Load data
guessw <- read.dta13("data/study1_data.dta")

# Remove duplicates
#length(unique(guessw$workerid))
#dupes <- (guessw$workerid %in% guessw$workerid[duplicated(guessw$workerid)]) # n = 394
#guessw <- subset(guessw, !dupes)

table(is.na(guessw$demfirst), is.na(guessw$repfirst))

# Consolidate guesses
guessw$dem_rich   <- with(guessw, ifelse(is.na(demfirst), demrich1, demrich))
guessw$dem_rel    <- with(guessw, ifelse(is.na(demfirst), demrel1,  demrel))
guessw$dem_race   <- with(guessw, ifelse(is.na(demfirst), demrace1, demrace))
guessw$dem_sex    <- with(guessw, ifelse(is.na(demfirst), demsex1,  demsex))
guessw$dem_age    <- with(guessw, ifelse(is.na(demfirst), demage1,  demage))
guessw$dem_educ   <- with(guessw, ifelse(is.na(demfirst), demrich1, demrich))
guessw$dem_employ <- with(guessw, ifelse(is.na(demfirst), demrich1, demrich))
guessw$dem_union  <- with(guessw, ifelse(is.na(demfirst), demrich1, demrich))

# Guesses
dem_d1st <- c("demrich", "demrel", "demrace", "demsex", "demage", "demeduc", "dememploy", "demunion")
rep_d1st <- c("reprich", "reprel", "reprace", "repsex", "repage", "repeduc", "repemploy", "repunion")

rep_r1st <- c("reprich1", "reprel1", "reprace1", "repsex1", "repage1", "repeduc1", "repemploy1", "repunion1")
dem_r1st <- c("demrich1", "demrel1", "demrace1", "demsex1", "demage1", "demeduc1", "dememploy1", "demunion1")

# PID and sociodem
demo_pid <- c("female", "gender", "state", "age", "educ", "race", "hispanic", "region", "pid7", "pid3")

# Output smaller set
guessw_small <- guessw[ , c("uniqid", "demfirst", "repfirst", demo_pid, dem_d1st, rep_d1st, rep_r1st, dem_r1st)]
write.csv(guessw_small, "data/mturk_guess.csv", row.names = F)
