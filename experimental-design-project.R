library(readxl)

project = read_excel('data/Expermental design project.xlsx')
View(project)
str(project)

charger_type = as.factor(project$ChargerType)
voltage = as.factor(project$WallVoltage)
power_save = as.factor(project$PowerSave)

FEmodel = aov(project$`Time To_80%` ~ charger_type * voltage * power_save)
summary(FEmodel)
qf(0.95,1,32)

# Create a factor representing each combination of A and B
AB = interaction(charger_type, voltage)

# ANOVA on the combination
model_AB = aov(project$`Time To_80%` ~ AB + power_save)
summary(model_AB)

# Tukey comparisons between all A × B combinations
tukey_AB = TukeyHSD(model_AB, "AB")
tukey_AB
plot(tukey_AB)

boxplot(
  project$`Time To_80%` ~ AB + power_save,
  main = "Box Plot",
  xlab = "The interaction between A and B",
  ylab = "Time",
  col = 4
)

# Test for normality
qqnorm(FEmodel$residuals, pch = 20)
qqline(FEmodel$residuals)

library(olsrr)
ols_test_normality(FEmodel$residuals)

# Test for constant variance
library(car)
project$group <- interaction(
  project$ChargerType,
  project$WallVoltage,
  project$PowerSave
)

leveneTest(`Time To_80%` ~ group, data = project)

# Residual plot for constant variance, model adequacy, and outliers
plot(FEmodel, which = 1)

# Check for outliers
res = rstandard(FEmodel)
plot(res, main = "Standardized Residuals")
abline(h = c(-3,3), col = "red")

# Interaction means (only for significant effects)
library(phia)
linear_model = m = lm(
  project$`Time To_80%` ~ charger_type * voltage * power_save
)

interactionMeans(linear_model)

interaction.plot(
  x.factor = project$WallVoltage,
  trace.factor = project$ChargerType,
  response = project$`Time To_80%`,
  col = c("red","blue"),
  lwd = 2,
  ylab = "Mean Time to 80%",
  xlab = "Voltage",
  trace.label = "Charger Type"
)

