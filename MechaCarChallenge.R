library(dplyr)
# impot a CSV file
MechaCar_mpg <- read.csv(file='./Data/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
Mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg) #generate multiple linear regression model
Mecha_lm
summary(Mecha_lm)
summary(Mecha_lm)$r.squared