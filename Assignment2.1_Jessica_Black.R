#This is your second exercise with real data. This time, instead of a bank of test 
#scores, we will use the 2014 American Community Survey. These data are maintained 
#by the US Census Bureau and are designed to show how communities are changing.

#Through asking questions of a sample of the population, it produces national 
# data on more than 35 categories of information, 
# such as education, income, housing, and employment.

#For this assignment, you will need to load and activate the ggplot2 package.
install.packages("ggplot2")
library(ggplot2)
# (I urge you to do the DataCamp exercise first!). For this deliverable, you should provide the following:

getwd()
setwd("/Users/jessicablack/Desktop/DSC/DSC520/R Projects/dsc520/data/acs-14-1yr-s0201.csv")

acs_survey <- read.csv("/Users/jessicablack/Desktop/DSC/DSC520/R Projects/dsc520/data/acs-14-1yr-s0201.csv")
head(acs_survey)
class(acs_survey)


# 1. What are the elements in your data (including the categories and data types)?
    # The Elements in this data are: Two ID numbers(ID & ID2), County & State (Geography),
    # Population Group Label, Races Reported, % that have a High School Degree, and % that
    # have a Bachelors Degree

# 2. Please provide the output from the following functions: str(); nrow(); ncol()
str(acs_survey)
#Output is:
    #'data.frame':	136 obs. of  8 variables:
# $ Id                    : Factor w/ 136 levels "0500000US01073",..: 1 2 3 4 5 6 7 8 9 10 ...
#$ Id2                   : int  1073 4013 4019 6001 6013 6019 6029 6037 6059 6065 ...
#$ Geography             : Factor w/ 136 levels "Alameda County, California",..: 56 70 98 1 20 43 62 68 92 106 ...
#$ PopGroupID            : int  1 1 1 1 1 1 1 1 1 1 ...
#$ POPGROUP.display.label: Factor w/ 1 level "Total population": 1 1 1 1 1 1 1 1 1 1 ...
#$ RacesReported         : int  660793 4087191 1004516 1610921 1111339 965974 874589 10116705 3145515 2329271 ...
#$ HSDegree              : num  89.1 86.8 88 86.9 88.8 73.6 74.5 77.5 84.6 80.6 ...
#$ BachDegree            : num  30.5 30.2 30.8 42.8 39.7 19.7 15.4 30.3 38 20.7 ...

nrow(acs_survey)
#Output is: [1] 136

ncol(acs_survey)
#Output is: [1] 8

#3. Create a Histogram of the HSDegree variable using the ggplot2 package.
    # a. Set a bin size for the Histogram.
    # b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.

acs_graph <- ggplot(acs_survey) + geom_histogram(aes(x=HSDegree, bins=30)) + ggtitle("High School Completion") +
     xlab("Percentage of population that has a High School Degree") + ylab("Count Per County")

acs_graph
# 4. Answer the following questions based on the Histogram produced:
    # a. Based on what you see in this histogram, is the data distribution unimodal?
        # Yes, it appears to peak just below 90%.
    # b. Is it approximately symmetrical?
        # No
    # c. Is it approximately bell-shaped?
        # Yes
    # d. Is it approximately normal?
        # Yes
    # e. If not normal, is the distribution skewed? If so, in which direction?
    #f . Include a normal curve to the Histogram that you plotted

acs_graph2 = acs_graph + stat_function(fun = dnorm, args = list(mean = mean(acs_survey$HSDegree,na.rm = TRUE),
                            sd = sd(acs_survey$HSDegree, na.rm = TRUE)), color="blue", size= 3)
acs_graph2  

qqplot_acs_survey <- qplot(sample = acs_survey$HSDegree, stat = "qq")

qqplot_acs_survey

# g. Explain whether a normal distribution can accurately be used as a model for this data.
#5. Create a Probability Plot of the HSDegree variable.
#6. Answer the following questions based on the Probability Plot:
    #a. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
    #Yes, the data points fall close to symmetrical & is not too flat or too curved. 

    #b. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
#7. Now that you have looked at this data visually for normality, you will now 
# quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.

install.packages("pastecs")
library(pastecs)
stat.desc(acs_survey$HSDegree, basic=FALSE, norm=TRUE)

#8. In several sentences provide an explanation of the result produced for skew, 
# kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?

#The skew given was -1.67, which means that the data is negatively skewed. Which essentially means that most of
# of the respondents have a high school diploma. The kurtosis given was 4.35, which means that it is leptokurtic. 
# The z-score of skew is -4.03 while the z-score of the kurtosis is 5.27. In both cases, the z-scores appear to be significant.
# However, since the sample size is so large, the plots & graphs produced should be use, rather than use the z-scores. 