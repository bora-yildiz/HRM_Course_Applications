# Load necessary packages
library(ggplot2)
set.seed(123)  # For reproducibility

# Simulate data
n_employees <- 100
pre_training <- rnorm(n_employees, mean = 65, sd = 10)
post_training <- pre_training + rnorm(n_employees, mean = 5, sd = 7)

# Create a data frame
training_data <- data.frame(
  EmployeeID = 1:n_employees,
  PreTrainingScore = pre_training,
  PostTrainingScore = post_training,
  Improvement = post_training - pre_training
)

training_data

# Paired t-test
t_test_result <- t.test(training_data$PostTrainingScore, training_data$PreTrainingScore, paired = TRUE)

# Print results
print(t_test_result)

# Plot the results
ggplot(training_data, aes(x = PreTrainingScore, y = PostTrainingScore)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Pre vs. Post Training Scores",
       x = "Pre-Training Performance",
       y = "Post-Training Performance") +
  theme_minimal()


# Plot the results
ggplot(training_data, aes(x = PreTrainingScore, y = PostTrainingScore)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Pre vs. Post Training Scores",
       x = "Pre-Training Performance",
       y = "Post-Training Performance") +
  theme_minimal()


# EXAMPLE 2

# Load libraries
library(ggplot2)
set.seed(42)  # For reproducibility

# Simulate dataset
n <- 200

# Training participation: binary (1 = participated, 0 = not)
TrainingParticipation <- rbinom(n, 1, 0.6)

# Motivation score: continuous, 1 to 5
Motivation <- round(runif(n, min = 2.5, max = 5), 2)

# Manager support score: continuous, 1 to 5
ManagerSupport <- round(runif(n, min = 2, max = 5), 2)

# Simulate Career Advancement (as a continuous outcome, like growth index or rating)
# Assumed effects: Training = +1.5, Motivation = +2, ManagerSupport = +1.2
# Add some random noise
CareerAdvancement <- 1.5 * TrainingParticipation + 
  2.0 * Motivation + 
  1.2 * ManagerSupport + 
  rnorm(n, mean = 0, sd = 2)

# Create data frame
long_term_data <- data.frame(
  CareerAdvancement,
  TrainingParticipation,
  Motivation,
  ManagerSupport
)


long_term_data

# Fit the linear model
model <- lm(CareerAdvancement ~ TrainingParticipation + Motivation + ManagerSupport, data = long_term_data)
summary(model)
predict(model)

# Predict values and plot
long_term_data$Predicted <- predict(model)

ggplot(long_term_data, aes(x = Predicted, y = CareerAdvancement)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") +
  labs(title = "Predicted vs Actual Career Advancement",
       x = "Predicted Career Advancement",
       y = "Actual Career Advancement") +
  theme_minimal()


CareerAdvancementBinary <- ifelse(CareerAdvancement > median(CareerAdvancement), 1, 0)
log_model <- glm(CareerAdvancementBinary ~ TrainingParticipation + Motivation + ManagerSupport, 
                 data = long_term_data, family = "binomial")
summary(log_model)





