# BIOST 515/518: Homework 2

## Instructions

Submit your responses to the below questions as a single pdf file to Canvas. As in Homework 1, your
responses should have two sections:
1. “Responses”, where you respond to the questions, using figures and tables where appropriate.
2. “Code”, an appendix containing code used to run your analyses and support your responses.

You are welcome to use the homework submission template (Files →Homeworks →submission-template.Rmd)
to prepare your responses, but this is not mandatory.

Please note that credit will not be given for code and raw software output. Instead, you should use software
to run analyses and prepare tables, figures, and/or other summaries of results as appropriate.

Please thoughtfully organize your homework and answer in full sentences using professional, scientific writing.
Tables and numeric information should be appropriate for inclusion in a scientific report, with appropriate
rounding, and figures should be polished (e.g., with axes labelled and legends included). Please review the
Homework 1 Solutions for both content and style.

A key purpose of this homework (and all homeworks) is to work on Learning Goal #4: Prac-
tice explaining our models and their interpretations to both statistical and non-statistical au-
diences, so please use this opportunity to practice communicating clearly and justifying your
scientific and statistical work.

## Scientific Background
It is now widely believed that smoking tends to impair lung function. Much of the data to support this arises
from studies of pulmonary function in adults who are long-time smokers. A question then arises whether such
deleterious effects of smoking can be detected in children who smoke. To address this question, measures
of lung function were made in 654 children seen for a routine check up in a particular pediatric clinic. The
children participating in this study were asked whether they were current smokers.

A common measurement of lung function is the forced expiratory volume (FEV), which measures how much
air you can blow out of your lungs in a short period of time. A higher FEV is usually associated with better
respiratory function. It is well known that prolonged smoking diminishes FEV in adults, and those adults
with diminished FEV also tend to have decreased pulmonary function as measured by other clinical variables,
such as blood oxygen and carbon dioxide levels.

Data from the study is available under “Datasets” as fev.csv. Available data includes measurement of
age, height, sex, FEV, and whether each child smokes or not. Each row corresponds to a single clinic visit.
Missing data is denoted by NA. The first line of the file contains the variable names. The variables are coded
as follows:
* seqnbr: case number (the numbers 1 to 654)
* subjid: subject identification number (unique for each different child)
* age: subject age at time of measurement (years)
* fev: measured FEV (liters per second)
* height: subject height at time of measurement (inches)
* sex: subject sex (only “male” and “female” children participated in the study)
* smoke: smoking habits (“smoker” or “nonsmoker”)

## Questions
1. Make a scatterplot with FEV on the vertical axis and height on the horizontal axis. Describe the relationship that you see.
2. Perform a simple linear regression of FEV on height, and test the null hypothesis that there is no linear trend in the expected value of FEV as a function of height. In 2-3 sentences, summarize the results in language suitable for a scientific publication.
3. Do you believe that the relationship between height and average FEV is exactly linear? Does this compromise your interpretation and conclusions in Question 2?
4. Perform a simple linear regression with the logarithm (base e) of FEV as the response variable and height as the predictor variable. Interpret the fitted parameters of your model. Hint: If you get stuck on this question, you may find Week 3’s Discussion Section helpful.
5. Fit a simple linear regression model for FEV on height-above-45-inches. That is, calculate how many inches taller than 45" each participant is and use this as the predictor variable in your model. Interpret the fitted parameters of your model and comment on the differences between this model and the model
that you fit in Question 2.
6. Obtain (or calculate) the residuals from the models that you fit in Questions 2 and 4, and make a plot for each model showing the residuals against the heights. Which model do you think would give a better prediction of the FEV of a 48 inch tall child? Justify your answer.
7. Fit the following model for FEV:
$E[FEV_i|female_i]$ = β0 + β1 ×female_i
where femalei = 1 if participant i is female and femalei = 0 if participant i is male. Interpret the estimated parameters of your model.
8. Now fit the following model for FEV:
E[FEVi|malei] = β0 + β1 ×malei
where malei = 1 if participant i is male and malei = 0 if participant i is female. Interpret the estimated parameters of your model. Compare the fitted values under this model to the fitted values from the model that you fit in Question 7, and comment.
