# Marginals on sociodemographic variables
# Replication Material for 'The Partisans in Our Heads' by Ahler and Sood, 2015

# Set directory
setwd(githubdir)
setwd("partisan_head/")

# Load libs

# Load data
guessp <- read.csv("data/mturk_guess.csv")

#  c("female", "gender", "state", "age", "educ", "race", "pid7", "pid3")

# Table 1
# -------------
# 5 NAs on age, gender, educ, 6 missing on race, pid, census
# NAs treated as ignorable

# Age
age <- table(guessp$age)/nrow(guessp)

# Female
gender <- table(guessp$gender)[2:3]/nrow(guessp)

# Race
# Empty string on race always means empty string on hispanic
table(guessp$race, guessp$hispanic, useNA = "always")

guesspr <- subset(guessp, race != "")

with(guesspr, mean(race == "White/Caucasian" & !hispanic))
with(guesspr, mean(race == "Black/African American" & !hispanic))
with(guesspr, mean(race == "Asian" | race == "Native Hawaiian or other Pacific Islander"))
with(guesspr, mean(race == "Native American or Alaska Native"))
with(guesspr, mean(hispanic))

# Education
educ <- table(guessp$educ)/nrow(guessp)

# PID
table(guessp$pid3, guessp$pid7, useNA = "always")
mean(guessp$pid7 < 4, na.rm = T)
mean(guessp$pid7 > 4, na.rm = T)
mean(guessp$pid7 == 4, na.rm = T)

# Census
guesspc <- subset(guessp, region != "")

mean(guesspc$region == "midwest", na.rm = T)
mean(guesspc$region == "northeast", na.rm = T)
mean(guesspc$region == "south", na.rm = T)
mean(guesspc$region == "west", na.rm = T)

# Table 2
# -----------------

tab <- with(subset(guessp, demrichr != ""), table(demrichr, pid3))
t(tab)/colSums(tab)

table(guessp$demrace[guessp$demrace!= "" & guessp$pid3 == "Democrat"])/nrow(guessp[guessp$demrace!= "" & guessp$pid3 == "Democrat",])

