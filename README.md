# Mathematics and R Laboratory -- Data Cleaning, Aggregation & Visualisation

This repository contains a small, self-contained example of the R /
R Markdown workflow I use for the Mathematics and R Laboratory course
(SECS-S/06) I teach at the Department of Economics, University of Salento.

It demonstrates:

- **Data collection / generation** -- `generate_data.R` creates a
  synthetic dataset with the same structure as a typical lab exercise
  dataset (student scores and covariates). **No real student data is used
  anywhere in this repository.**
- **Quality control** -- checking for missing values and implausible
  entries (e.g. scores outside a valid range) before any analysis.
- **Cleaning** -- removing/flagging invalid records.
- **Aggregation** -- grouping and cross-checking summary statistics by
  cohort, mirroring how written and lab-based assessment results are
  aggregated for the examination committee.
- **Analysis** -- descriptive statistics and a simple linear regression.
- **Visualisation** -- histograms, boxplots and scatter plots with
  `ggplot2`.
- **Reproducibility** -- the full pipeline is written in R Markdown
  (`lab_report.Rmd`) and knits directly to PDF/HTML from the raw CSV, the
  same reproducible-document workflow used to prepare lab materials.

## Files

| File | Description |
|---|---|
| `generate_data.R` | Generates the synthetic dataset used in the report |
| `data/lab_exercise_data.csv` | Output of the script above (synthetic data) |
| `lab_report.Rmd` | Main R Markdown report: cleaning, aggregation, analysis, visualisation |

## How to reproduce

```r
# 1. Generate the synthetic dataset
source("generate_data.R")

# 2. Knit the report (requires the dplyr, ggplot2 and knitr packages)
rmarkdown::render("lab_report.Rmd")
```

## Note on data privacy

The dataset used here is entirely synthetic and generated with a fixed
random seed (see `generate_data.R`). It is structured to resemble real
lab-exercise data (scores, attendance, study hours) but contains no
information about real students, in line with data protection
requirements.
