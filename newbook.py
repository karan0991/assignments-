from nbformat import v4 as nbf

# Define your markdown and code questions
markdown_questions =  [
    #copy question one by one 
  "What is Simple Linear Regression?",
  "What are the key assumptions of Simple Linear Regression?",
  "What does the coefficient m represent in the equation Y=mX+c?",
  "What does the intercept c represent in the equation Y=mX+c?",
  "How do we calculate the slope m in Simple Linear Regression?",
  "What is the purpose of the least squares method in Simple Linear Regression?",
  "How is the coefficient of determination (R²) interpreted in Simple Linear Regression?",
  "What is Multiple Linear Regression?",
  "What is the main difference between Simple and Multiple Linear Regression?",
  "What are the key assumptions of Multiple Linear Regression?",
  "What is heteroscedasticity, and how does it affect the results of a Multiple Linear Regression model?",
  "How can you improve a Multiple Linear Regression model with high multicollinearity?",
  "What are some common techniques for transforming categorical variables for use in regression models?",
  "What is the role of interaction terms in Multiple Linear Regression?",
  "How can the interpretation of intercept differ between Simple and Multiple Linear Regression?",
  "What is the significance of the slope in regression analysis, and how does it affect predictions?",
  "How does the intercept in a regression model provide context for the relationship between variables?",
  "What are the limitations of using R² as a sole measure of model performance?",
  "How would you interpret a large standard error for a regression coefficient?",
  "How can heteroscedasticity be identified in residual plots, and why is it important to address it?",
  "What does it mean if a Multiple Linear Regression model has a high R² but low adjusted R²?",
  "Why is it important to scale variables in Multiple Linear Regression?",
  "What is polynomial regression?",
  "How does polynomial regression differ from linear regression?",
  "When is polynomial regression used?",
  "What is the general equation for polynomial regression?",
  "Can polynomial regression be applied to multiple variables?",
  "What are the limitations of polynomial regression?",
  "What methods can be used to evaluate model fit when selecting the degree of a polynomial?",
  "Why is visualization important in polynomial regression?",
  "How is polynomial regression implemented in Python?"
]
code_questions = [
   #copy question one by one 
    
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
notebook_path = r"D:\k study\datascience_genAI\assignments-\Regression.ipynb" #change the file name as you desire 
with open(notebook_path, "w") as f:
    f.write(nbf.writes(notebook))

print("Notebook saved at:", notebook_path)
