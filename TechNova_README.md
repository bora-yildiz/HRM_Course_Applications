
# TechNova Recruitment Planning Activity - R Script

This R script simulates and evaluates candidates applying for a Junior Data Analyst position at TechNova. It scores candidates based on their technical and interpersonal skills, filters by relevant degree background, and visualizes the top 10 candidates.

## 📌 Features

- Simulates applicant data with fields including degree, experience, R skills, communication, and cultural fit
- Filters candidates with relevant degrees: Data Science, Statistics, and Computer Science
- Calculates a weighted total score:
  - R Skills: 40%
  - Communication: 30%
  - Cultural Fit: 30%
- Ranks and selects the top 10 candidates
- Visualizes the top candidates using a horizontal bar chart

## 🚀 How to Use
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

### 2. Run the Script

The script will:
- Generate a sample of 100 applicants
- Filter for relevant educational backgrounds
- Compute a total score
- Display and plot the top 10 candidates

### 3. Output

- A printed list of the top 10 candidates sorted by score
- A bar chart displaying the top candidates and their total scores

## 📈 Example Use Cases

- Recruitment planning and applicant scoring
- Simulation-based hiring exercises
- Teaching data-driven decision-making in HR

## 📬 Contact

For more information or collaboration, please reach out to the script author or HR analytics team at TechNova.
