##############################################################################
# generate_data.R
#
# Creates a synthetic dataset that mimics the structure of an undergraduate
# statistics lab exercise dataset (e.g. exam scores + a few covariates for a
# Mathematics / R Laboratory course). No real student data is used anywhere
# in this repository: all values below are randomly generated for
# demonstration purposes only.
##############################################################################

set.seed(42)

n <- 120

lab_data <- data.frame(
  student_id   = sprintf("S%03d", 1:n),
  cohort       = sample(c("2024/2025", "2025/2026"), n, replace = TRUE),
  hours_studied = round(rnorm(n, mean = 12, sd = 4), 1),
  attendance_pct = round(runif(n, 40, 100), 1),
  written_score = round(rnorm(n, mean = 24, sd = 5), 1),
  lab_score     = round(rnorm(n, mean = 26, sd = 4), 1)
)

# Deliberately inject a few realistic data-quality issues, so the cleaning
# step in the report has something genuine to do:
# - a few missing values
# - a couple of out-of-range / inconsistent scores (data entry errors)
lab_data$written_score[sample(1:n, 5)] <- NA
lab_data$attendance_pct[sample(1:n, 3)] <- NA
lab_data$written_score[sample(1:n, 2)] <- c(-3, 145) # impossible scores

dir.create("data", showWarnings = FALSE)
write.csv(lab_data, "data/lab_exercise_data.csv", row.names = FALSE)

cat("Synthetic dataset written to data/lab_exercise_data.csv\n")
