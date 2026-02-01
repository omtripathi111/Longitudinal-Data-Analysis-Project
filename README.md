# Project: Longitudinal Analysis of Treatment Response

## Overview
For this project, I wanted to analyze how different treatments (diets) affect growth trajectories over time. Since the data involves repeated measurements on the same subjects, I used a **Repeated Measures ANOVA** framework to handle the within-subject correlation.

---

## My Approach
1.  **Data Setup:** I used the `ChickWeight` dataset and renamed the columns to make the analysis more intuitive.
2.  **Completeness Check:** I checked the number of observations per subject. Most subjects had 12 visits, which makes the RM-ANOVA results more reliable.
3.  **Visualization:** I built a "Spaghetti Plot" using `ggplot2`. This allowed me to see the raw individual variability while overlaying the group means to see the overall trend.
4.  **Statistical Modeling:** I ran a two-way ANOVA with an Error term for `subject/time`. This was necessary to correctly partition the variance between subjects and within subjects.

---

## Findings from my Analysis
* **Time Effect:** As expected, time was highly significant ($p < 2e-16$), showing clear growth over the study period.
* **Diet Effect:** There was a significant difference between the diet groups ($p = 0.000482$).
* **The Key Result:** I found a significant **Diet × Time interaction** ($p = 0.00446$). This is the most important part of my analysis because it proves that the *rate* of growth depends on the diet group. Some diets clearly perform better than others over time.

---

## How to Run
```r
library(ggplot2)
library(dplyr)
source("longitudinal.R")