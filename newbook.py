from nbformat import v4 as nbf

# Define your markdown and code questions
markdown_questions = [
   #copy question one by one
    "What is hypothesis testing in statistics",
    "What is the null hypothesis, and how does it differ from the alternative hypothesis",
    "What is the significance level in hypothesis testing, and why is it important",
    "What does a P-value represent in hypothesis testing",
    "How do you interpret the P-value in hypothesis testing",
    "What are Type 1 and Type 2 errors in hypothesis testing",
    "What is the difference between a one-tailed and a two-tailed test in hypothesis testing",
    "What is the Z-test, and when is it used in hypothesis testing",
    "How do you calculate the Z-score, and what does it represent in hypothesis testing",
    "What is the T-distribution, and when should it be used instead of the normal distribution",
    "What is the difference between a Z-test and a T-test",
    "What is the T-test, and how is it used in hypothesis testing",
    "What is the relationship between Z-test and T-test in hypothesis testing",
    "What is a confidence interval, and how is it used to interpret statistical results",
    "What is the margin of error, and how does it affect the confidence interval",
    "How is Bayes' Theorem used in statistics, and what is its significance",
    "What is the Chi-square distribution, and when is it used",
    "What is the Chi-square goodness of fit test, and how is it applied",
    "What is the F-distribution, and when is it used in hypothesis testing",
    "What is an ANOVA test, and what are its assumptions",
    "What are the different types of ANOVA tests",
    "What is the F-test, and how does it relate to hypothesis testing?"
]

code_questions = [
   #copy question one by one 
    "Write a Python program to perform a Z-test for comparing a sample mean to a known population mean and interpret the results",
    "Simulate random data to perform hypothesis testing and calculate the corresponding P-value using Python",
    "Implement a one-sample Z-test using Python to compare the sample mean with the population mean",
    "Perform a two-tailed Z-test using Python and visualize the decision region on a plot",
    "Create a Python function that calculates and visualizes Type 1 and Type 2 errors during hypothesis testing",
    "Write a Python program to perform an independent T-test and interpret the results",
    "Perform a paired sample T-test using Python and visualize the comparison results",
    "Simulate data and perform both Z-test and T-test, then compare the results using Python",
    "Write a Python function to calculate the confidence interval for a sample mean and explain its significance",
    "Write a Python program to calculate the margin of error for a given confidence level using sample data",
    "Implement a Bayesian inference method using Bayes' Theorem in Python and explain the process",
    "Perform a Chi-square test for independence between two categorical variables in Python",
    "Write a Python program to calculate the expected frequencies for a Chi-square test based on observed data",
    "Perform a goodness-of-fit test using Python to compare the observed data to an expected distribution",
    "Create a Python script to simulate and visualize the Chi-square distribution and discuss its characteristics",
    "Implement an F-test using Python to compare the variances of two random samples",
    "Write a Python program to perform an ANOVA test to compare means between multiple groups and interpret the results",
    "Perform a one-way ANOVA test using Python to compare the means of different groups and plot the results",
    "Write a Python function to check the assumptions (normality, independence, and equal variance) for ANOVA",
    "Perform a two-way ANOVA test using Python to study the interaction between two factors and visualize the results",
    "Write a Python program to visualize the F-distribution and discuss its use in hypothesis testing",
    "Perform a one-way ANOVA test in Python and visualize the results with boxplots to compare group means",
    "Simulate random data from a normal distribution, then perform hypothesis testing to evaluate the means",
    "Perform a hypothesis test for population variance using a Chi-square distribution and interpret the results",
    "Write a Python script to perform a Z-test for comparing proportions between two datasets or groups",
    "Implement an F-test for comparing the variances of two datasets, then interpret and visualize the results",
    "Perform a Chi-square test for goodness of fit with simulated data and analyze the results"
]

# Create a new Jupyter Notebook structure
notebook = nbf.new_notebook()

# Add each question as an individual Markdown cell
for i, question in enumerate(markdown_questions):
    notebook.cells.append(nbf.new_markdown_cell(f"Q{i+1} {question}"))

# Add each practical question as an individual Code cell
for i, question in enumerate(code_questions):
    notebook.cells.append(nbf.new_code_cell(f"# Q{i+1} {question}"))

# Save the notebook
notebook_path = r"C:\Users\karan\Desktop\studyrelated things\assignments-\Assignment_2.ipynb" #change the file name as you desire 
with open(notebook_path, "w") as f:
    f.write(nbf.writes(notebook))

print("Notebook saved at:", notebook_path)
