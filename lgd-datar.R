install.packages("psych")

library(psych)

# Step 1 : Understanding the Objective : Predict the Losses
# Step 2 - EDA
setwd("C:\\Users\\anup\\Desktop\\imarticus\\log\\Analytics Class\\Step in Analytics")
LGD<-read.csv("LGD_DATA.csv")
str(LGD)
dim(LGD)  
View(LGD)
names(LGD)

#Missing Value imputation
summary(LGD) # No Missing values
colSums(is.na(LGD))
describe(LGD)

#a remove unique column identifiers
#b identify variables that can be factors - No of vehicles, age, marital
#c for dependent variable no need outlier detection

LGD[,1]=NULL
names(LGD)

#Outlier Detection : PROCESS
boxplot(LGD[1:5])
boxplot(LGD[1:6]) # Outliers including Dependent
quantile(LGD$Losses.in.Thousands) # 2 sigma limits +
quantile(LGD$Losses.in.Thousands,probs=c(0.90,0.92,0.95,0.96,0.97,0.98,0.99)) # identifying the caps
qvalue<-quantile(LGD$Losses.in.Thousands,probs = 0.95)
LGD$Losses.in.Thousands=ifelse(LGD$Losses.in.Thousands>qvalue,qvalue,LGD$Losses.in.Thousands)
boxplot(LGD$Losses.in.Thousands)

# Scaling
boxplot(LGD[1:4])
#scaling is not required


# Step 3 : Variable selection
names(LGD)

# Dependent and Independent Variable

# AGE vs Losses : Correlation
corr.test(LGD$Losses.in.Thousands,LGD$Age) # Negative correlation - Significant

# Years of Exp vs Losses
corr.test(LGD$Losses.in.Thousands,LGD$Years.of.Experience) # Negative correlation - significant

# Number of vehicles vs Losses # Dropped

# Gender vs Losses - T-Test
t.test(LGD$Losses.in.Thousands~LGD$Gender) # Significant

# Married vs Losses - T-Test
t.test(LGD$Losses.in.Thousands~LGD$Married) # Significant

#CRISP-DM       

# Independent and Independent Variable - Multicolinearity

LGD$Age

# AGE vs Experience : Corr
corr.test(LGD$Age,LGD$Years.of.Experience)#go with any one of them based on the best correlation

# Gender vs Experience : T-Test
t.test(LGD$Years.of.Experience~LGD$Gender) #insignificant / no relation

# AGE vs Gender : T-Test
t.test(LGD$Age~LGD$Gender) #insignificant / no relation

# Gender vs Married: Chi Square
chisq.test(LGD$Married,LGD$Gender) #insignificant / no relation

# Age vs Married: T-Test
t.test(LGD$Age~LGD$Married) #insignificant / no relation

# Experience vs Married: T-Test
t.test(LGD$Years.of.Experience~LGD$Married) #insignificant / no relation

# Step 4 - Feature Engineering
# Bin - Ages as we are dropping experiencing
LGD$Age_Bins=cut(LGD$Age,breaks=c(15,24,42,61,71)) # () - exclusive [] - inclusive
names(LGD)

#split into train and test data
library(caTools)
split=sample.split(LGD$Losses.in.Thousands,0.8)
train=subset(LGD,split=TRUE)
test=subset(LGD,split=FALSE)

# Step 5 : Building Model
attach(train)
model.train = lm(Losses.in.Thousands~.-Age -Years.of.Experience -Number.of.Vehicles,train)
summary(model.train)      

#Interpretation of Qualitative variable. R internally creates a dummy variable      
# being a male the loss is going to increase x% than being a female
# All the variables are significant

# Interaction
model2=lm(Losses.in.Thousands~Age_Bins+Gender+Married+Age_Bins*Gender,train)
summary(model2)

model3=lm(Losses.in.Thousands~Age_Bins+Gender+Married+Age_Bins*Gender*Married,train)
summary(model3)

