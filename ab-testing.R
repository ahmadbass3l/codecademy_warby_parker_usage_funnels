# Install and load ggplot2
# install.packages("ggplot2")
library(ggplot2)

# Create a data frame with A/B testing results
ab_test_results <- data.frame(
  number_of_pairs = c('3 Pairs', '5 Pairs'),  # Example data
  purchase_count = c(379, 371),  # Example data
  percentage <- (ab_test_results$purchase_count / sum(ab_test_results$purchase_count)) * 100
)

# Plot the data with percentage labels
ggplot(ab_test_results, aes(x = factor(number_of_pairs), y = purchase_count)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  geom_text(aes(label = paste0(round(percentage, 2), "%")), vjust = -0.5) +
  labs(title = "A/B Testing Results",
       x = "Number of Pairs",
       y = "Purchase Count") +
  theme_minimal()
