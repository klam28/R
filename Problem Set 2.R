data <- read.csv("/Users/kerrylam/Desktop/Problem Set 2/subprime.csv", header = TRUE)
data <- data.frame(data)
# Contains data of a sample of applicants for a loan 
# income, gender, and race indicated by income, woman, and black
# variable black has a value of 1 for African-American and 0 otherwise
# variable high.rate indicates whether the applicant recieved a subprimelone
# subprime loan - loan offered at high interest rates for people who have difficulty repaying the loan
# high.rate has a value of 1 when the applicant recieved a subprime loan and 0 otherwise
dim(data) # shape of data
#max(data$income)
#min(data$income)

names(data)
grep("black", colnames(data)) # Grab Index Number Given Column Name

# Subset Data For Race And High.Rate
x <- data[, c(5,4)]
names(x)

# Separate Data With The Following Conditions
a <- x[with(x, black == 1 & high.rate == 1), ]
b <- x[with(x, black == 1 & high.rate == 0), ]
c <- x[with(x, black == 0 & high.rate == 1), ]
d <- x[with(x, black == 0 & high.rate == 0), ]

# Data Checking ~ Count Observations Left After Separating Data
sprintf("Total Amount of Black Women With Subprime Loan: %i", nrow(a))
sprintf("Total Amount of Black Women Without Subprime Loan: %i", nrow(b))
sprintf("Total Amount of Non-Black Women With Subprime Loan: %i", nrow(c))
sprintf("Total Amount of Non-Black Women Without Subprime Loan: %i", nrow(d))

sprintf("Percentage of Black Women With Subprime Loan: %f", nrow(a)/nrow(data))
sprintf("Percentage of Black Women Without Subprime Loan: %f", nrow(b)/nrow(data))
sprintf("Percentage of Non-Black Women With Subprime Loan: %f", nrow(c)/nrow(data))
sprintf("Percentage of Non-Black Women Without Subprime Loan: %f", nrow(d)/nrow(data))

names(x)

# Table ~ Crosstabs(Tabulate) For Categorical Variables
tab_data <- table(x) 
tab_data

# Renaming Categories
# Row Indicator: Black
rownames(tab_data) <- c("Non-Black", "Black" ) # Attributing Row Names To Data
# Column Indicator: High.Rate
colnames(tab_data) <- c("Subprime Loan: No", "Subprime Loan: Yes") # Attributing Column Names To Data
tab_data

margin.table(tab_data, 1) # Row marginal frequencies
margin.table(tab_data, 2) # Column marginal frequencies

prop.table(tab_data) # Cell Percentages Of The Data
round(prop.table(tab_data), 2) # Rounding

chisq.test(tab_data)

# cat("\014") # Clears The Console Screen
