# Load necessary libraries
library(dplyr)

# Sample Turkish first and last names
first_names <- c("Ahmet", "Mehmet", "Ayşe", "Fatma", "Ali", "Zeynep", "Hasan", "Elif", "Mustafa", "Emine")
last_names <- c("Yılmaz", "Kaya", "Demir", "Şahin", "Çelik", "Yıldız", "Aslan", "Aydın", "Doğan", "Koç")

# Generate 100 random Turkish names
set.seed(1234)
names <- paste(sample(first_names, 100, replace = TRUE),
               sample(last_names, 100, replace = TRUE))

# Simulate data
candidates <- data.frame(
  Name = names,
  Education = sample(1:5, 100, replace = TRUE),  # 1 = High School, 5 = PhD
  Experience = round(runif(100, 0, 10), 1),
  TestScore = round(runif(100, 50, 100), 1),
  InterviewScore = round(runif(100, 60, 100), 1)
)

# Normalize data
candidates_norm <- candidates %>%
  mutate(
    Education_norm = (Education - min(Education)) / (max(Education) - min(Education)),
    Experience_norm = (Experience - min(Experience)) / (max(Experience) - min(Experience)),
    TestScore_norm = (TestScore - min(TestScore)) / (max(TestScore) - min(TestScore)),
    InterviewScore_norm = (InterviewScore - min(InterviewScore)) / (max(InterviewScore) - min(InterviewScore))
  )

# Apply weights
weights <- c(Education = 0.20, Experience = 0.20, TestScore = 0.30, InterviewScore = 0.30)

candidates_scored <- candidates_norm %>%
  mutate(
    FinalScore = weights["Education"] * Education_norm +
      weights["Experience"] * Experience_norm +
      weights["TestScore"] * TestScore_norm +
      weights["InterviewScore"] * InterviewScore_norm
  ) %>%
  arrange(desc(FinalScore))


View(candidates_scored)


# Show top 5 candidates
top_candidates <- head(candidates_scored, 5)
print(top_candidates[, c("Name", "Education", "Experience", "TestScore", "InterviewScore", "FinalScore")])

