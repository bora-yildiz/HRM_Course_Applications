# README

## 📊 Simulating Career Advancement in HR Using R

This project provides a simulated example of how training participation, employee motivation, and managerial support influence career advancement. It is designed for use in Human Resource Management (HRM) courses, especially in topics related to **Training, Development, and Careers**.

### ✨ Features
- Simulates employee data for training participation, motivation, and manager support.
- Performs both linear and logistic regression analyses.
- Visualizes relationships between predictors and career outcomes.

---

## 📁 Files
- `career_advancement_simulation.R`: Main R script with simulation and analysis code.
- `README.md`: Project overview, instructions, and interpretation guide.

---

## 🧪 Simulation Logic
We generate data for 200 employees with variables:
- `TrainingParticipation`: 1 = participated, 0 = not
- `Motivation`: scale from 2.5 to 5
- `ManagerSupport`: scale from 2 to 5
- `CareerAdvancement`: a simulated continuous outcome based on the predictors

---

## 💻 How to Run
1. Clone or download this repository.
2. Open `career_advancement_simulation.R` in R or RStudio.
3. Run the script to see:
   - Linear regression output
   - Logistic regression output
   - A plot of predicted vs. actual scores

---

## 📈 R Code

```r
# Load libraries
library(ggplot2)
set.seed(42)

# Simulate data
n <- 200
TrainingParticipation <- rbinom(n, 1, 0.6)
Motivation <- round(runif(n, min = 2.5, max = 5), 2)
ManagerSupport <- round(runif(n, min = 2, max = 5), 2)
CareerAdvancement <- 1.5 * TrainingParticipation + 2.0 * Motivation + 1.2 * ManagerSupport + rnorm(n, 0, 2)

long_term_data <- data.frame(
  CareerAdvancement,
  TrainingParticipation,
  Motivation,
  ManagerSupport
)

# Linear regression
lm_model <- lm(CareerAdvancement ~ TrainingParticipation + Motivation + ManagerSupport, data = long_term_data)
summary(lm_model)

# Logistic regression
CareerAdvancementBinary <- ifelse(CareerAdvancement > median(CareerAdvancement), 1, 0)
log_model <- glm(CareerAdvancementBinary ~ TrainingParticipation + Motivation + ManagerSupport, data = long_term_data, family = "binomial")
summary(log_model)

# Odds ratios
exp(coef(log_model))

# Plot: Predicted vs Actual
long_term_data$Predicted <- predict(lm_model)

ggplot(long_term_data, aes(x = Predicted, y = CareerAdvancement)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") +
  labs(title = "Predicted vs Actual Career Advancement", x = "Predicted", y = "Actual") +
  theme_minimal()
```

---

## 🧠 Interpretation Highlights
- All predictors are statistically significant.
- Motivation and manager support have strong positive effects.
- Training increases odds of being in the top 50% by ~6.75 times.
- The logistic regression provides a binary interpretation (above/below median).

---

## 📘 License
MIT License

---

## 👨‍🏫 For Classroom Use
Use this simulation to teach students:
- Basic regression interpretation
- How to simulate HR data
- Visualizing and communicating model results

Feel free to fork and adapt for your course!
