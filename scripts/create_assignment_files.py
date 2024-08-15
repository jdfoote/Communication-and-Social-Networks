import csv
import os

def generate_qmd(row):
    name, due_date, video_url, file_location = row
    
    qmd_content = f"""---
title: "{name}"
date: {due_date}
---

"""
    if video_url:
        qmd_content += f"""
## Video Explanation

{{{{< video {video_url} >}}}}

"""
    qmd_content += f"""

## Assignment File

[Download Assignment (right-click and save)]({file_location})

"""
    
    
    # Write the QMD file
    with open(f"./assignments/{name.lower().replace(' ', '_')}.qmd", 'w') as f:
        f.write(qmd_content)

# Read the CSV and generate QMD files
with open('./data/assignments.csv', 'r') as csvfile:
    reader = csv.reader(csvfile)
    next(reader)  # Skip header
    for row in reader:
        generate_qmd(row)

print("Assignment QMD files generated successfully!")