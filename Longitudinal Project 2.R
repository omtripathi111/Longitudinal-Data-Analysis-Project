# ============================================================
# MSc Statistics - Placement Project 2
# Title: Longitudinal Analysis of Response Over Time
# Dataset: ChickWeight (built-in R dataset)
# Study Design: Repeated Measurements (Within-Subject Design)
# ============================================================

# OBJECTIVE:
# To examine how a response variable changes over time
# and whether response trajectories differ across groups,
# while accounting for repeated measurements on the same subject.

# ------------------------------------------------------------
# 1. Setup
# ------------------------------------------------------------

rm(list = ls())
set.seed(101)

library(ggplot2)
library(dplyr)

# ------------------------------------------------------------
# 2. Load Dataset
# ------------------------------------------------------------

data("ChickWeight")

# Basic structure checks
head(ChickWeight)
dim(ChickWeight)
str(ChickWeight)

# Variable meaning:
# weight -> response variable
# Time   -> visit / time point
# Chick  -> subject identifier
# Diet   -> group (treatment analogue)

# ------------------------------------------------------------
# 3. Missingness & Completeness Check
# ------------------------------------------------------------

# Count number of observations per subject
visit_counts <- ChickWeight %>%
  group_by(Chick) %>%
  summarise(Number_of_Visits = n())

# Distribution of visit counts
table(visit_counts$Number_of_Visits)

# Interpretation:
# This checks whether subjects have similar numbers of visits.
# When visit counts are reasonably consistent, repeated
# measures ANOVA is an appropriate first analysis.

# ------------------------------------------------------------
# 4. Descriptive Exploration
# ------------------------------------------------------------

# Summary by group and time
summary_by_group <- ChickWeight %>%
  group_by(Diet, Time) %>%
  summarise(
    Mean_Weight = mean(weight),
    SD_Weight = sd(weight),
    N = n(),
    .groups = "drop"
  )

head(summary_by_group)

# ------------------------------------------------------------
# 5. Visualization: Individual Trajectories
# ------------------------------------------------------------

ggplot(ChickWeight, aes(x = Time, y = weight, group = Chick, color = Diet)) +
  geom_line(alpha = 0.3) +
  stat_summary(
    aes(group = Diet),
    fun = mean,
    geom = "line",
    linewidth = 1.2
  ) +
  labs(
    title = "Response Trajectories Over Time by Group",
    x = "Time",
    y = "Response",
    caption = "Thin lines: individual subjects | Thick lines: group means"
  ) +
  theme_minimal()

# ------------------------------------------------------------
# 6. Repeated Measures ANOVA
# ------------------------------------------------------------

# The Error(Chick / Time) term accounts for the fact that
# repeated measurements are taken on the same subject over time.

rm_anova <- aov(
  weight ~ Diet * Time + Error(Chick / Time),
  data = ChickWeight
)

summary(rm_anova)

# ------------------------------------------------------------
# 7. Interpretation Guide (Conceptual)
# ------------------------------------------------------------

# Key components in the output:
#
# 1. Time effect:
#    - Indicates whether the response changes over time
#
# 2. Diet effect:
#    - Indicates overall differences between groups
#
# 3. Diet:Time interaction:
#    - Indicates whether response trajectories
#      differ across groups
#
# This repeated-measures framework explicitly accounts for
# within-subject correlation, which is essential in
# longitudinal data analysis.

# ------------------------------------------------------------
# 8. Notes on Limitations (For Interview Defense)
# ------------------------------------------------------------

# - Repeated measures ANOVA assumes reasonably complete data.
# - Visit counts here are fairly consistent across subjects.
# - With substantial dropout or unbalanced designs,
#   mixed-effects models would be a natural extension.
