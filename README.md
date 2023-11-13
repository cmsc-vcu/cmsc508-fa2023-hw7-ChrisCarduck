# CMSC508-fa2023-hw7-template

## Overview

This project involves the creation of a company-wide resume database to capture the collective skills and certifications of all employees in the company. The database allows for tracking skills, employees, and their roles within the organization.

## Table Schema

### Skills Table
- Columns: id, name, description, tag, url, time_commitment

### People Table
- Columns: id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined

### PeopleSkills Table
- Columns: id, skills_id, people_id, date_acquired

### Roles Table
- Columns: id, name, sort_priority

### PeopleRoles Table
- Columns: id, people_id, role_id, date_role_acquired

## Database Setup (hw7-ddl.sql)

The `hw7-ddl.sql` file in the [GitHub Repository](https://github.com/cmsc-vcu/cmsc508-fa2023-hw7-ChrisCarduck.git) provides instructions to:
- Drop and recreate all tables.
- Define primary keys and foreign keys.
- Populate the skills, people, peopleskills, roles, and peopleroles tables with sample data.

## HTML Report (hw7.qmd)

The `hw7.qmd` file, rendered as an HTML document, includes:
- Overview of the project and database.
- Crows-foot diagram of the entities.
- Listings of the people, roles, and skills tables.
- Sample queries providing insights into the data.

## Execution

1. Clone the repository: `git clone https://github.com/cmsc-vcu/cmsc508-fa2023-hw7-ChrisCarduck.git`
2. Set up the database using the `hw7-ddl.sql` file.
3. Execute the queries and explore the results using the `hw7.qmd` file.

## Dependencies

- Python
- Pandas
- SQLAlchemy
- Jupyter Notebook

## Reflection

Creating this database and associated reports was a challenging yet rewarding experience. The process of designing a database schema from the scaffold, considering the relationships between entities, and implementing it using SQL statements deepened my understanding of database management. The integration of Python within the Markdown document to execute SQL queries and display results was a novel approach, offering a practical bridge between theory and real-world implementation. Debugging potential errors in database connections and queries added a layer of realism to the project, emphasizing the importance of robust error handling. The Crows-foot diagram and HTML report provided a visual representation and clear output of the database structure and query results. Overall, this assignment highlighted the complexities of database design and implementation while reinforcing the importance of thorough testing and documentation.

## Contributors

- Chris Carduck

Feel free to explore the database and generate reports using the provided HTML document!
