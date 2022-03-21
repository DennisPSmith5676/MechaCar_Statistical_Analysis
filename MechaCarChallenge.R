library(dplyr)

### Deliverable 1 ########################################

# import a CSV file
MechaCar_mpg <- read.csv(file='./Data/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# perform linear regression using the lm() funtion
Mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg) #generate multiple linear regression model
Mecha_lm

# view using summary
summary(Mecha_lm)

# veiw R-squared
summary(Mecha_lm)$r.squared

### Deliverable 2 #######################################

# import a CSV file
Suspention_Coil <- read.csv(file='./Data/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# create a summary table for suspention coils
total_summary <- Suspention_Coil %>%
  summarize(Mean=mean(PSI), Meadian = median(PSI), Variance=var(PSI), Std_Dev=sd(PSI))
total_summary

# view by lots using groupby()
lot_summary <- Suspention_Coil %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Meadian = median(PSI), Variance=var(PSI), Std_Dev=sd(PSI))
lot_summary

### Deliverable 3 #######################################
# note level of significance is .05
#Ho: mu = 1500 Ha: mu<> 1500

t.test(Suspention_Coil$PSI, mu=1500)

# analysis - p-value (0.06) greater than 0.05 therefore we fail to reject Ho

# t.test by lots
#lot 1
t.test(subset(Suspention_Coil, Manufacturing_Lot=="Lot1")$PSI, mu=1500)

#lot 2
t.test(subset(Suspention_Coil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)

#lot 3
t.test(subset(Suspention_Coil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)
