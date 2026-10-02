# Indian Crime Management & Analytics Database – SQL Project

## 📌 Project Overview

The **Indian Crime Management & Analytics Database** is a MySQL-based relational database project designed to store, manage, and analyze crime-related information.

The database contains interconnected data related to states, districts, police departments, police stations, officers, crime types, criminals, victims, cases, arrests, weapons, evidence, witnesses, courts, judges, hearings, verdicts, vehicles, stolen property, and complaints.

The project also includes an **Entity Relationship (ER) Diagram** created to represent the structure and relationships between the tables.

---

## 🎯 Project Objectives

- Manage state and district information.
- Maintain police department and police station details.
- Store police officer information.
- Manage different crime types and categories.
- Maintain criminal and victim records.
- Track FIR/case information and case status.
- Record arrests and arresting officers.
- Store weapon and evidence details related to cases.
- Maintain witness information and reliability status.
- Manage courts, judges, hearings, and verdicts.
- Track vehicles and stolen property associated with cases.
- Record complaints received by police stations.
- Practice SQL queries for crime data analysis.

---

## 🗂️ Database Structure

The project contains **20 interconnected tables**:

| # | Table | Purpose |
|---|---|---|
| 1 | `states` | Stores state information |
| 2 | `districts` | Stores district information linked to states |
| 3 | `departments` | Stores police department information |
| 4 | `police_stations` | Stores police station details and staff strength |
| 5 | `officers` | Stores police officer information and station assignment |
| 6 | `crime_types` | Stores crime names, categories, and severity |
| 7 | `criminals` | Stores criminal details and prior convictions |
| 8 | `victims` | Stores victim details |
| 9 | `cases` | Stores FIR/case information and case status |
| 10 | `arrests` | Stores arrest details and related officers/criminals |
| 11 | `weapons` | Stores weapons recovered in cases |
| 12 | `evidence` | Stores evidence collected and analysis status |
| 13 | `witnesses` | Stores witness details and reliability status |
| 14 | `courts` | Stores court information |
| 15 | `judges` | Stores judge information and court assignment |
| 16 | `hearings` | Stores case hearing details |
| 17 | `verdicts` | Stores verdict type, sentence, and verdict date |
| 18 | `vehicles` | Stores vehicle details associated with cases |
| 19 | `stolen_property` | Stores stolen property and estimated value |
| 20 | `complaints` | Stores complaints received by police stations |

---

## 🔗 Key Relationships

The database uses **Primary Keys (PK)** and **Foreign Keys (FK)** to connect related tables and maintain relational integrity.

Some important relationships include:

- `states` → `districts`
- `districts` → `police_stations`
- `police_stations` → `officers`
- `police_stations` → `cases`
- `crime_types` → `cases`
- `officers` → `cases`
- `victims` → `cases`
- `cases` → `arrests`
- `criminals` → `arrests`
- `officers` → `arrests`
- `cases` → `weapons`
- `cases` → `evidence`
- `cases` → `witnesses`
- `districts` → `courts`
- `courts` → `judges`
- `cases` → `hearings`
- `courts` → `hearings`
- `judges` → `hearings`
- `hearings` → `verdicts`
- `cases` → `vehicles`
- `cases` → `stolen_property`
- `police_stations` → `complaints`
- `victims` → `complaints`

These relationships allow crime, investigation, evidence, arrest, and court-related information to be analyzed together.

---

## 🧩 ER Diagram

The ER diagram represents the database tables and their relationships.

![Indian Crime ER Diagram](ER_Diagram.png)

> **Note:** Keep `ER_Diagram.png` in the same folder as `README.md` in your GitHub repository so that the diagram is displayed directly in the README.

---

## 🛠️ Technologies Used

- **Database:** MySQL
- **Query Language:** SQL
- **ER Diagram:** dbdiagram.io
- **Version Control:** Git & GitHub

---

## 📊 Dataset

The project includes a large sample dataset covering different parts of the crime-management workflow.

The data includes records related to:

- States and districts
- Police departments and police stations
- Police officers
- Crime types and categories
- Criminals and victims
- FIR/case records
- Arrests
- Weapons
- Evidence
- Witnesses
- Courts and judges
- Hearings and verdicts
- Vehicles
- Stolen property
- Complaints

The dataset is suitable for practicing SQL filtering, aggregation, grouping, joins, subqueries, and analytical functions.

---

## 💡 SQL Concepts Practiced

This project demonstrates the following SQL concepts:

- `CREATE DATABASE`
- `CREATE TABLE`
- Primary Keys
- Foreign Keys
- `INSERT`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `HAVING`
- Aggregate functions
  - `COUNT()`
  - `SUM()`
  - `AVG()`
  - `MIN()`
  - `MAX()`
- `INNER JOIN`
- Multiple-table joins
- Subqueries
- `NOT IN`
- Date-based filtering
- Filtering using aggregate results
- `RANK()`
- `DENSE_RANK()`
- Window functions

---

## 🔍 Example Business Questions

Some questions that can be analyzed using this database:

1. What are the different crime categories recorded in the database?
2. Which police stations have higher staff strength?
3. What is the distribution of cases by crime category?
4. Which criminals have higher numbers of prior convictions?
5. Which cases have witnesses or evidence recorded?
6. What is the status of arrests and bail?
7. What types of weapons are associated with cases?
8. What is the status of stolen property recovery?
9. How are cases distributed across different police stations?
10. What are the different hearing and verdict statuses?
11. Which courts and judges are associated with cases?
12. What types of complaints are recorded by police stations?

---

## 📁 Project Files

```text
Indian-Crime-Management-SQL-Project/
│
├── README.md
├── Indian_Crime_Tables.sql
├── Indian_Crime_Insert.sql
├── Indian_Crime_Query.sql
└── ER_Diagram.png
```

### File Description

| File | Description |
|---|---|
| `Indian_Crime_Tables.sql` | Contains database and table creation statements |
| `Indian_Crime_Insert.sql` | Contains sample data insertion statements |
| `Indian_Crime_Query.sql` | Contains 46 analytical SQL queries |
| `ER_Diagram.png` | Entity Relationship Diagram of the database |
| `README.md` | Project documentation |

---

## 🚀 How to Run the Project

### 1. Create the Database

Open **MySQL Workbench** or another MySQL-compatible SQL environment.

Create the database and select it:

```sql
CREATE DATABASE indian_crime_management;
USE indian_crime_management;
```

### 2. Create the Tables

Run the table creation SQL file:

```text
Indian_Crime_Tables.sql
```

### 3. Insert the Data

After creating all required tables, run:

```text
Indian_Crime_Insert.sql
```

### 4. Run the Analytical Queries

Finally, execute:

```text
Indian_Crime_Query.sql
```

to perform different crime-data analysis tasks.

---

## 📌 Key Learning Outcomes

Through this project, I practiced:

- Designing a relational database with multiple connected tables.
- Creating relationships using Primary Keys and Foreign Keys.
- Working with large sample datasets.
- Writing multi-table SQL JOIN queries.
- Using aggregate functions for analysis.
- Applying `GROUP BY` and `HAVING`.
- Writing subqueries for analytical questions.
- Working with date-based data.
- Using window functions such as `RANK()` and `DENSE_RANK()`.
- Converting a real-world crime-management scenario into a structured SQL database.

---

## 👩‍💻 Author

**Ranjani**

SQL / Data Analytics Project
