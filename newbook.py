from nbformat import v4 as nbf

# Define your markdown and code questions
markdown_questions = [
   #copy question one by one 
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
notebook_path = r"C:\Users\karan\Desktop\studyrelated things\assignments-\test_updated.ipynb" #change the file name as you desire 
with open(notebook_path, "w") as f:
    f.write(nbf.writes(notebook))

print("Notebook saved at:", notebook_path)
