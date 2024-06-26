# Load required libraries
library(dplyr) # For data manipulation
library(readr) # For reading CSV files

# Load data
student_info <- read_csv("C:/Users/bhatt/Downloads/studentInfo.csv")
assessments <- read_csv("C:/Users/bhatt/Downloads/assessments.csv")

# Check the structure of the data
str(student_info)
str(assessments)

# Explore the data
head(student_info)
head(assessments)

# Perform any necessary data preprocessing, exploration, and analysis here
# Train your machine learning model and evaluate its accuracy using the methods mentioned above
unique(student_info$final_result)
student_info$final_result <- ifelse(student_info$final_result == "Pass", 0, 1)
# Train your machine learning model
model <- glm(final_result ~ ., data = student_info, family = "binomial")
# Predict on the training data
predicted_probabilities <- predict(model, type = "response")

# Convert predicted probabilities to binary predictions (0 or 1)
predicted_classes <- ifelse(predicted_probabilities > 0.5, 1, 0)

# Calculate accuracy
accuracy <- mean(predicted_classes == student_info$final_result)
print(paste("Accuracy:", accuracy))
# Load the required library
library(ggplot2)

# Create a dataframe for plotting
plot_data <- data.frame(
  Metric = c("Accuracy"),
  Value = c(accuracy)
)

# Create the bar plot
ggplot(plot_data, aes(x = Metric, y = Value, fill = Metric)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = round(Value, 2)), vjust = -0.3, size = 3.5) +  # Add text labels
  labs(title = "Model Accuracy", y = "Accuracy", x = NULL) +  # Set plot labels
  theme_minimal()  # Set plot theme




