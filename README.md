# Project: Longitudinal Analysis of Growth Trajectories

## 📌 Objective
The goal of this project is to analyze the effect of different diets on weight gain over time. This study utilizes a **Repeated Measurements Design**, which requires accounting for the correlation of data points within the same subject.

---

## 🛠 Statistical Methodology
1. **Data Inspection:** Used the `ChickWeight` dataset (578 observations). Renamed variables for clinical clarity: `weight`, `time`, `subject`, and `diet`.
2. **Completeness Check:** Performed a frequency analysis of visits per subject. While most subjects had 12 visits, the analysis was designed to be robust against minor imbalances.
3. **Exploratory Data Analysis (EDA):** Generated **Spaghetti Plots** to visualize individual subject trajectories against group-level mean growth curves.
4. **Primary Analysis:** Conducted a **Repeated Measures ANOVA** using the `Error(subject/time)` term to correctly partition:
   - **Between-Subject Variance:** Differences between individual subjects.
   - **Within-Subject Variance:** Changes over time for the same subject.

---

## 💡 Key Results & Interpretation
Based on the ANOVA output:
* **Time Effect:** Highly significant ($p < 2e-16$), confirming that weight increases over time as expected.
* **Diet Effect:** Significant ($p = 0.000482$), indicating that overall weight levels differ across diet groups.
* **Interaction Effect (Diet × Time):** **Significant ($p = 0.00446$)**. 
  - **Interpretation:** This is the most critical finding. It confirms that the *rate of growth* (the slope) is significantly different depending on the diet. Not all diets result in the same growth speed.



---

## 🚀 How to Run
1. Required libraries: `ggplot2`, `dplyr`.
2. Run the script:
   ```r
   source("longitudinal_analysis.R")