###########################################################
#  1st Deliverable: Linear Regression to predict MPG
###########################################################

# Use the library() function to load the dplyr package.
library(dplyr)

# Import and read in the MechaCar_mpg.csv file as a dataframe.
library(tidyverse)
mecha_df <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors = F)
View(mecha_df)

# Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e., columns), and add the dataframe you created in Step 4 as the data parameter.
?lm()
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_df)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_df))

###########################################################
#  2nd Deliverable: Create Visualizations for the Trip Analysis
###########################################################

# Import and read in the Suspension_Coil.csv file as a table.
mecha_tbl = read.csv(file='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
View(mecha_tbl)

# Create a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <- mecha_tbl %>% summarize(Mean_Psi=mean(PSI), 
                                         Median_Psi=median(PSI),
                                         Var_Psi=var(PSI),
                                         Std_Psi=sd(PSI),
                                         .groups='keep')

View(total_summary)

#Create a lot_summary dataframe using group_by() and summarize() to group each
#manufacturing lot by the mean, median, variance, and std of the suspension coils PSI column

lot_summary <- mecha_tbl %>% group_by(Manufacturing_Lot) %>% summarize(Mean_Psi=mean(PSI),
                                                                       Median_PSi=median(PSI),
                                                                       Var_Psi=var(PSI),
                                                                       Std_PSi=sd(PSI),
                                                                       .groups= 'keep')
View(lot_summary)


###########################################################
#  3rd Deliverable: T-Tests on Suspension Coils
###########################################################

# Are PSI across *all* lots statistically different from the population mean of 1,500 pounds per sq inch?
# Use t.test()
?t.test()
t.test(mecha_tbl$PSI, mu=1500)

#Use subset()  to determine if PSI for each manufacturing lot is 
#statistically different from the population mean of 1,500 pounds per square inch.
?subset
mlot1 <- subset(mecha_tbl, Manufacturing_Lot =="Lot1")
mlot2 <- subset(mecha_tbl, Manufacturing_Lot =="Lot2")
mlot3 <- subset(mecha_tbl, Manufacturing_Lot =="Lot3")

t.test(mlot1$PSI, mu=1500)
t.test(mlot2$PSI, mu=1500)
t.test(mlot3$PSI, mu=1500)



