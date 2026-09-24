# ============================================================
# CPS1985_assignment.R
# DATA HANDLING AND BAR CHARTS
# Dataset: CPS1985
# ============================================================

# ------------------------------------------------------------
# INSTALL PACKAGES - RUN ONLY ONCE
# ------------------------------------------------------------

# install.packages("AER")
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("stargazer")
# install.packages("RColorBrewer")
# install.packages("viridis")


# ------------------------------------------------------------
# LOAD PACKAGES
# ------------------------------------------------------------

library(AER)
library(dplyr)
library(ggplot2)
library(stargazer)
library(RColorBrewer)
library(viridis)


# ------------------------------------------------------------
# LOAD DATA
# ------------------------------------------------------------

data("CPS1985")

# Q1
CPS1985
View(CPS1985)


# ------------------------------------------------------------
# PART A
# ------------------------------------------------------------

# Q2
class(CPS1985$wage)
class(CPS1985$age)
class(CPS1985$education)
class(CPS1985$gender)

# Q3
table(CPS1985$gender)
table(CPS1985$ethnicity)
table(CPS1985$occupation)

# Q4
length(unique(CPS1985$gender))
length(unique(CPS1985$ethnicity))
length(unique(CPS1985$occupation))


# ------------------------------------------------------------
# PART B
# ------------------------------------------------------------

# Q5
head(CPS1985)

# Q6
head(CPS1985, 3)

# Q7
tail(CPS1985, 8)

# Q8
summary(CPS1985$wage)

min(CPS1985$wage)
max(CPS1985$wage)
median(CPS1985$wage)

# Q9
stargazer(
  CPS1985[, c("wage", "age", "education")],
  type = "text"
)


# ------------------------------------------------------------
# PART C
# ------------------------------------------------------------

# Q10
data1 <- CPS1985 %>%
  select(wage, age, education, experience)

data1

# Q11
data2 <- CPS1985 %>%
  select(2:5)

data2

# Q12
data3 <- CPS1985 %>%
  select(1, 3, 5, 7)

data3

# Q13
data4 <- CPS1985 %>%
  select(-10)

data4

# Q14
data5 <- CPS1985 %>%
  select(-c(5, 6, 7))

data5


# ------------------------------------------------------------
# PART D
# ------------------------------------------------------------

# Q15
q15 <- CPS1985 %>%
  filter(wage > 10)

q15

# Q16
q16 <- CPS1985 %>%
  filter(age > 40)

q16

# Q17
q17 <- CPS1985 %>%
  filter(wage > 10 & education > 12)

q17

# Q18
q18 <- CPS1985 %>%
  filter(wage > 15 & education > 12)

q18

# Q19
education12 <- CPS1985 %>%
  filter(education > 12)

q19 <- education12 %>%
  filter(wage > 15)

q19

# Q20
male_workers <- CPS1985 %>%
  filter(gender == "male")

male_workers

# Q21
table(CPS1985$gender)

table(CPS1985$gender)["female"]


# ------------------------------------------------------------
# PART E
# ------------------------------------------------------------

# Q22
q22 <- CPS1985 %>%
  filter(
    wage > 15,
    education > 12,
    age < 40
  )

q22

nrow(q22)


# ------------------------------------------------------------
# PART 2
# BAR CHARTS
# ------------------------------------------------------------

# Q1
ggplot(CPS1985, aes(x = gender)) +
  geom_bar()

# Q2
ggplot(CPS1985, aes(x = ethnicity)) +
  geom_bar()

# Q3
ggplot(CPS1985, aes(x = occupation)) +
  geom_bar()

# Q4
CPS1985$gender <- as.factor(CPS1985$gender)

ggplot(CPS1985, aes(x = gender)) +
  geom_bar()


# ------------------------------------------------------------
# PART B
# ------------------------------------------------------------

# Q5
ggplot(CPS1985, aes(x = gender, fill = gender)) +
  geom_bar()

# Q6
ggplot(CPS1985, aes(x = ethnicity, fill = ethnicity)) +
  geom_bar()


# ------------------------------------------------------------
# PART C
# ------------------------------------------------------------

# Q7
ggplot(CPS1985, aes(x = gender, fill = gender)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set2")

# Q8
ggplot(CPS1985, aes(x = occupation, fill = occupation)) +
  geom_bar() +
  scale_fill_viridis_d()

# Q9
levels(CPS1985$ethnicity)

ggplot(CPS1985, aes(x = ethnicity, fill = ethnicity)) +
  geom_bar() +
  scale_fill_manual(
    values = c(
      "cauc" = "blue",
      "afam" = "red",
      "other" = "green"
    )
  )


# ------------------------------------------------------------
# PART D
# ------------------------------------------------------------

# Q10
ggplot(CPS1985, aes(x = gender, fill = gender)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set2") +
  theme(legend.position = "none")

# Q11
ggplot(CPS1985, aes(x = occupation, fill = occupation)) +
  geom_bar(width = 0.6) +
  scale_fill_brewer(palette = "Set1")

# Q12
ggplot(CPS1985, aes(x = ethnicity, fill = ethnicity)) +
  geom_bar(width = 0.6) +
  scale_fill_brewer(palette = "Pastel1")


# ------------------------------------------------------------
# PART E
# DIAMONDS
# ------------------------------------------------------------

data("diamonds")

# Q13
ggplot(diamonds, aes(x = cut)) +
  geom_bar()

# Q14
ggplot(diamonds, aes(x = cut, fill = cut)) +
  geom_bar()

# Q15
ggplot(diamonds, aes(x = cut, fill = cut)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set2") +
  theme(legend.position = "none")

# Q16
ggplot(diamonds, aes(x = cut, fill = cut)) +
  geom_bar(width = 0.6) +
  scale_fill_brewer(palette = "Set2") +
  theme(legend.position = "none")


# ------------------------------------------------------------
# PART F
# ------------------------------------------------------------

# Q17
ggplot(CPS1985, aes(x = gender, fill = gender)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Distribution of Workers by Gender",
    x = "Gender",
    y = "Number of Workers"
  ) +
  theme_minimal()

# Q18
ggplot(CPS1985, aes(x = ethnicity, fill = ethnicity)) +
  geom_bar() +
  scale_fill_viridis_d() +
  labs(
    title = "Distribution of Workers by Ethnicity",
    x = "Ethnicity",
    y = "Number of Workers"
  ) +
  theme_minimal()