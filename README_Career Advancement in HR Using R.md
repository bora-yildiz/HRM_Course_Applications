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

## 🧾 Case Study: Enhancing Career Growth at Innovatek Ltd.

### 🎯 Background
Innovatek Ltd., a rapidly growing mid-sized technology firm, is concerned about the uneven pace of career advancement among its employees. Despite offering a comprehensive training program, the HR department noticed that some employees advance quickly, while others stagnate—even when they’ve completed the same training.

### 📌 Problem
The HR Director wants to investigate what factors besides training might influence career advancement. Preliminary observations suggest that **employee motivation** and **managerial support** could play significant roles. The HR analytics team is tasked with validating this hypothesis using data simulation and statistical modeling.

### 📊 Objective
To simulate employee data and model the effect of:
- Participation in the company’s training program
- Individual motivation
- Managerial support

...on long-term **career advancement**, defined by metrics such as promotions, raises, or lateral moves within the company.

### 🧪 Simulation Setup
A dataset for 200 employees is created, including:
- `TrainingParticipation`: Whether the employee completed the training program (0 = no, 1 = yes)
- `Motivation`: A motivation score between 2.5 and 5.0
- `ManagerSupport`: A manager support score between 2.0 and 5.0
- `CareerAdvancement`: A continuous outcome combining these predictors plus random noise

A **logistic regression** is also used to model whether an employee is in the **top 50%** in terms of career advancement.

### 🧮 Model Summary (Key Findings)
- **TrainingParticipation** increases the odds of being in the top half of career advancement by ~6.75 times.
- **Motivation** has the strongest effect, increasing odds by ~12.76 times.
- **ManagerSupport** increases the odds by ~3.12 times.
- All predictors are statistically significant (p < 0.001).

### 🧠 HRM Implications
- **Training alone isn’t enough**—employee growth is influenced heavily by **internal drive** and **external support**.
- HR should consider building a culture of **managerial coaching** and **motivation tracking** in parallel with technical training programs.
- The organization may consider developing a **personalized development plan** based on an employee’s motivation and perceived support.

### 💼 Discussion Questions
1. If training is less effective without high motivation or support, how can HR intervene early?
2. How would you identify employees at risk of career stagnation?
3. What policies could support both formal training and informal development factors like support and engagement?

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
