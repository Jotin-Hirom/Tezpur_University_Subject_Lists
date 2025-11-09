import json

# Open and load the JSON file
with open("subjectCode.json", "r") as file:
    data = json.load(file)

# Access the list of subjects
subjects = data["subjects"]

# Print all subject codes and names
# for subject in subjects:
#     print(f"{subject['code']} - {subject['course_name']}")

# Example: find course by code
course_to_find = "Artificial Intelligence"
result = next((s for s in subjects if s["course_name"] == course_to_find), None)

if result:
    print(f"Found: {result['code']}")
else:
    print("Course not found.")
