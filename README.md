# Experimental Design: Factors Affecting EV Charging Time
## Project Overview
This project applies Design of Experiments (DOE) and Analysis of Variance (ANOVA) to investigate factors affecting the time required to charge an electric vehicle to 80%.
The analysis focuses on the effects of charger type, wall voltage, and power-saving mode, as well as selected interactions between these factors.

## Objective
The main objective of this study is to identify whether charger type, wall voltage, and power-saving mode have statistically significant effects on charging time.

## Methodology
The analysis was conducted in R using the following statistical methods:
- Factorial ANOVA
- Interaction analysis
- Tukey's HSD test
- Normality assessment using Q-Q plots
- Levene's test for constant variance
- Residual analysis
- Standardized residual analysis for potential outliers
- Interaction means
- Interaction plots

## Variables
### Response Variable
- Time to 80% charging

### Factors
- Charger Type
- Wall Voltage
- Power-Saving Mode

## Statistical Analysis
A factorial ANOVA model was fitted to evaluate the effects of the experimental factors and their interactions on charging time.
Tukey's HSD test was then used to compare the levels of the charger type × voltage combinations.
Model assumptions were assessed using:
- Q-Q plots and normality testing
- Levene's test for homogeneity of variance
- Residual plots
- Standardized residuals

## Results
The analysis evaluates how charging time changes across different combinations of charger type, wall voltage, and power-saving mode.
The statistical results and diagnostic plots generated in R are used to assess the significance of the experimental factors and the adequacy of the fitted model.

## Tools
- R
- RStudio
- readxl
- olsrr
- car
- phia

## Project Structure
```text
experimental-design-project/
│
├── experimental-design-project.R
│
├── data/
│   └── Expermental design project.xlsx
│
└── README.md
