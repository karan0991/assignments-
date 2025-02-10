from nbformat import v4 as nbf

# Define your markdown and code questions
markdown_questions = [
   #copy question one by one
   "What is a parameter?",
"What is correlation?What does negative correlation mean?",
"Define Machine Learning. What are the main components in Machine Learning?",
"How does loss value help in determining whether the model is good or not?",
"What are continuous and categorical variables?",
"How do we handle categorical variables in Machine Learning? What are the common techniques?",
"What do you mean by training and testing a dataset?",
"What is sklearn.preprocessing?",
"What is a Test set?",
"How do we split data for model fitting (training and testing) in Python? How do you approach a Machine Learning problem?",
"Why do we have to perform EDA before fitting a model to the data?",
"What is correlation?",
"What does negative correlation mean?",
"How can you find correlation between variables in Python?",
"What is causation? Explain difference between correlation and causation with an example.",
"What is an Optimizer? What are different types of optimizers? Explain each with an example.",
"What is sklearn.linear_model ?",
"What does model.fit() do? What arguments must be given?",
"What does model.predict() do? What arguments must be given?",
"What are continuous and categorical variables?",
"What is feature scaling? How does it help in Machine Learning?",
"How do we perform scaling in Python?",
"What is sklearn.preprocessing?",
"How do we split data for model fitting (training and testing) in Python?",
"Explain data encoding?"
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
notebook_path = r"D:\k study\studyrelated things\assignments-\Feature_Engineering.ipynb" #change the file name as you desire 
with open(notebook_path, "w") as f:
    f.write(nbf.writes(notebook))

print("Notebook saved at:", notebook_path)
