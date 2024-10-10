# Create a named list (dictionary)
question_answers <- list(
  q1 = 500,
  q2 = 475,
  q3 = 380,
  q4 = 361,
  q5 = 270
)

count_all_ditinct_users = 500

sprintf("Total distinct users: %d", count_all_ditinct_users)
sprintf("Answering Rate for Q1: %.2f%%", (question_answers$q1 / count_all_ditinct_users)*100)
sprintf("Answering Rate for Q2: %.2f%%", (question_answers$q2 / count_all_ditinct_users)*100)
sprintf("Answering Rate for Q3: %.2f%%", (question_answers$q3 / count_all_ditinct_users)*100)
sprintf("Answering Rate for Q4: %.2f%%", (question_answers$q4 / count_all_ditinct_users)*100)
sprintf("Answering Rate for Q5: %.2f%%", (question_answers$q5 / count_all_ditinct_users)*100)

#install.packages("tidyverse")

# Prepare data for plotting
data <- data.frame(
  Question = names(question_answers),
  AnsweringRate = unlist(question_answers) / count_all_ditinct_users * 100
)

# Plot the data
ggplot(data, aes(x = Question, y = AnsweringRate)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Answering Rate per Question", x = "Question", y = "Answering Rate (%)") +
  theme_minimal()