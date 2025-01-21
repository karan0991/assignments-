from nbformat import v4 as nbf

# Define your markdown and code questions
markdown_questions = [
   #copy question one by one 
"Explain the different types of data (qualitative and quantitative) and provide examples of each. Discuss nominal, ordinal, interval, and ratio scales",
" What are the measures of central tendency, and when should you use each? Discuss the mean, median,and mode with examples and situations where each is appropriate",
"Explain the concept of dispersion. How do variance and standard deviation measure the spread of data? ",
"What is a box plot, and what can it tell you about the distribution of data?",
"Discuss the role of random sampling in making inferences about populations.",
" Explain the concept of skewness and its types. How does skewness affect the interpretation of data?",
"What is the interquartile range (IQR), and how is it used to detect outliers?",
"Discuss the conditions under which the binomial distribution is used.",
"Explain the properties of the normal distribution and the empirical rule (68-95-99.7 rule).",
"Provide a real-life example of a Poisson process and calculate the probability for a specific event.",
"Explain what a random variable is and differentiate between discrete and continuous random variables.",
"Provide an example dataset, calculate both covariance and correlation, and interpret the results."

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
notebook_path = r"C:\Users\karan\Desktop\studyrelated things\assignments-\Basics_of_Statistics.ipynb" #change the file name as you desire 
with open(notebook_path, "w") as f:
    f.write(nbf.writes(notebook))

print("Notebook saved at:", notebook_path)
