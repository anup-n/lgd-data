# lgd-data
Steps in Analytics
==================
	#1 Understanding the Objective
	===========================
	- Annual Appraisal/Performance
	- Loan : Deciding the eligibility for the loan
	- Factors affecting the Sales of the Product
	
	#2 Exploratory Data Analysis(EDA)
	=================================
	- Goal is to understand the Discrepancies in the data
		* Missing values
			- Run an univariate analysis 
			- Central Tendency : Representative values of the sample
			- Replacing the missing values with Mean. This process is called as Missing value imputation. Threshold is 5-7%          is acceptable for Imputation. 
			- If one value has more than the threshold, remove that column alone.
			- Discrete : Mean ; Continuous : Median ; Categorical : Mode
			- Predictive Modeling method to impute missing value
		* Junk Characters / Redundant - Univariate Analysis - NAs
		* Type Mismatch
		* Outliers - Extreme values that impact the Mean 
			- Presence of outlier can be due to the nature of the variable
			- Outlier Detection : Box Plot
				@ Floor : Q1 - 1.5 IQR
				@ Ceiling : Q3 - 1.5 IQR
			- Capping is the process of removing the outliers with Floors and Ceilings. Anything that is greater than Maximum         will be replaced with Ceiling and  below the minimum should be replaced with floor
			- Capping can be done with other methods when the nature of the variable is causing the outlier. Like a cluster          over Maximum. This should ideally keep in mind - not to disturb the nature of the variable. Use percentile
					
		* Normalization and Standardization - Scaling
			- Significant factors for Prediction
			- Nomalization and Standardization - bringing everything to the same scale
				@ Normalization : (x-min) / (max-min)
				@ Standardization : (x-mean) / (standard deviation)
		* Duplicate Records
		 
	#3 Variable Selection
	=====================
	- Selection of significant factors or variables
	- Bivariate Analysis
	- Remove all the unique Identifiers that have no impact on the prediction
	- Perception : Assumption or Hypothesis - Testing
	- Testing of Hypothesis or Testing of Significance
		* Assumptions - whenever there is an involvement of a quantitative variable, the data tends to Normal Distribution       and Standard Deviation are same. The data should be a bell curve
		* Draw a histogram for the variable
		* Normal Distribution : Has a peak or middle value; +/- 1 Std Dev - 63%; +/- 2 Std Dev - 95%; +/- 3 Std Dev -            99.7%; Rest are Outliers
		* Types of comparison : Qualitative vs Qualitative; Qualitative vs Quantitative; Quantitative vs Quantitative
			#Qualitative vs Qualitative : Chi Square Test
			#Qualitative vs Quantitative : T-Test or F-Test(Anova)
		* Starts with Hypothesis : Null H0 and Alternate H1
			- H0 : There is no relationship/difference between the two variables
			- H1 : There is relationship/difference between the two variables
		* Threshold or Level of Significance(LOS) should fall within 95% or 2 Sigma(5% significance)
		* Test Statistic: Quantifies the difference between two means
		
			
	#4 Feature Engineering
	======================
	- Constructing a new variable / creating a new variable
	- Based on the variables given creating a new variable
	
	#5 Model Building
	=================
	-  
	
	#6 Model Validation
	===================
	
	#7 Conclusion/Generalization/Prediction
	=======================================
	