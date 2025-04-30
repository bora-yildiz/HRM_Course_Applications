# 🎯 Candidate Selection Tool in Human Resource Management (HRM)

This repository demonstrates how to implement a **candidate selection process** in HRM using **R** and **Shiny**. It simulates a realistic hiring scenario and allows students to understand how data-driven decisions can support fair and objective selection.

---

## 📁 Contents

- `candidate_selection_base.R`: R script that simulates and ranks candidates using a weighted scoring model.
- `app.R` or `shiny_selection_app.R`: Interactive Shiny app where users can adjust weights for each evaluation criterion and see the top 5 ranked candidates.
- `README.md`: Project description and instructions.

---

## 📚 Case Scenario

A company is hiring a **Data Analyst**. Each applicant is evaluated based on:

- **Education Level** (1 to 5 scale, from High School to PhD)
- **Years of Experience** (0–10 years)
- **Technical Test Score** (0–100)
- **Interview Score** (0–100)

Each criterion has a weight:
- 🎓 Education: 20%
- 💼 Experience: 20%
- 🧪 Technical Test: 30%
- 💬 Interview: 30%

Top 5 candidates are selected based on a **weighted total score**.

---

🧠 Classroom Discussion Prompt
What non-quantifiable factors might also be important in the selection process?

For example:

Cultural fit

Motivation

Adaptability

Teamwork

Integrity

This helps students consider the limits of quantitative models and the value of qualitative HR judgment.
