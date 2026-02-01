library(ggplot2)
library(dplyr)
set.seed(101)

# 1. Loading built-in longitudinal data
data("ChickWeight")
df <- ChickWeight

# 2. Data Cleaning & Inspection
# Renaming for better context
names(df) <- c("weight", "time", "subject", "diet")
str(df)

# 3. Checking for data completeness (Visits per subject)
# Essential to verify before running Repeated Measures ANOVA
obs_check <- df %>% group_by(subject) %>% tally()
table(obs_check$n)

# 4. Visualizing individual trends vs Group means

ggplot(df, aes(x = time, y = weight, group = subject, color = diet)) +
  geom_line(alpha = 0.2) + 
  stat_summary(aes(group = diet), fun = mean, geom = "line", size = 1.2) +
  theme_minimal() +
  labs(title = "Growth Trajectories by Diet Group",
       x = "Time Points", y = "Weight Response")

# 5. Descriptive Stats: Mean response over time
group_summary <- df %>%
  group_by(diet, time) %>%
  summarise(mean_wt = mean(weight), sd_wt = sd(weight), .groups = "drop")
print(head(group_summary))

# 6. Primary Analysis: Repeated Measures ANOVA
# Using Error(subject/time) to handle within-subject correlation
growth_anova <- aov(weight ~ diet * time + Error(subject / time), data = df)
summary(growth_anova)

# 7. Interaction Check
# Focusing on diet:time to see if growth rates differ significantly