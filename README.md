# Longitudinal Analysis of Response Trajectories

## 📌 Project Overview
This project examines how a response variable evolves over time across different treatment groups. Using a **Repeated Measurements** study design, I analyzed the `ChickWeight` dataset to determine if growth trajectories differ significantly between cohorts while accounting for within-subject correlation.

---

## 🛠 Statistical Methodology
1. **Data Completeness Check:** Verified the number of observations per subject to ensure suitability for ANOVA.
2. **Exploratory Data Analysis (EDA):** Generated "Spaghetti Plots" to visualize individual subject variability against group means.
3. **Repeated Measures ANOVA:** Implemented the `aov(Error(Subject/Time))` framework to partition variance between and within subjects.
4. **Interaction Analysis:** Evaluated the **Group × Time interaction** to identify differing rates of change.

---

## 💡 Key Findings
* **Time Effect:** There was a highly significant increase in response over time across all groups.
* **Group Differences:** Statistical evidence suggests that different diets result in varying growth magnitudes.
* **Interaction:** The significant interaction term indicates that the *rate of growth* is dependent on the treatment group.
* **Methodological Awareness:** While RM-ANOVA was used for this complete-case analysis, I am aware that **Linear Mixed-Effects Models (LMM)** would be the preferred extension for handling unbalanced or missing clinical data.

---

## 🚀 How to Run
```r
library(ggplot2)
library(dplyr)
# Load and run the script
source("longitudinal_analysis.R")