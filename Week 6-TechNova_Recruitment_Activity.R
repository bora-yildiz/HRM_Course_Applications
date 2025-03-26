
# TechNova Recruitment Planning Activity - R Script

# Load necessary packages
library(dplyr)
library(ggplot2)

# Simulate applicant data
set.seed(123)
n <- 100

applicants <- data.frame(
  ID = 1:n,
  Degree = sample(c("Data Science", "Statistics", "Computer Science", "Economics", "Other"), n, replace = TRUE),
  Experience = round(runif(n, 0, 5), 1),
  R_Skill = sample(1:5, n, replace = TRUE),
  Communication = sample(1:5, n, replace = TRUE),
  CulturalFit = sample(1:5, n, replace = TRUE)
)

# Filter for relevant degrees
relevant_degrees <- c("Data Science", "Statistics", "Computer Science")
filtered <- applicants %>%
  filter(Degree %in% relevant_degrees)

# Add total score
filtered <- filtered %>%
  mutate(TotalScore = R_Skill*0.4 + Communication*0.3 + CulturalFit*0.3)

# Top 10 candidates
top_candidates <- filtered %>%
  arrange(desc(TotalScore)) %>%
  head(10)

print(top_candidates)

# Visualize top candidates
ggplot(top_candidates, aes(x = reorder(factor(ID), TotalScore), y = TotalScore)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Top 10 Candidates for Junior Data Analyst Role", x = "Candidate ID", y = "Total Score")

