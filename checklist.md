# Project Checklist


## Deliverables

- [ ] Provide a zip file containing the database schema, the application code, and the final report. 
- [ ] Provide a note with your submission that contains a link to your project video. 
- [ ] The file should be named groupname_project.zip, where groupame is your group's name containing the last names of the group members. 

### MySQL Database Schema and database programming objects  (maximum: 25 Points)

Provide a self-contained dump file of your database. This file should contain all necessary DDL and DML for creating your database.  Please include tuples within your database so the system can be easily evaluated. (For example it should contain the create commands for the objects within your database: tables, indexes, constraints etc. It should also contain a dump of the data as well as the user-defined functions, procedures and triggers). The schema should contain the following:

- [ ] SQL: There should be at-least 7 necessary tables in your SQL schema. All tables should be normalized  to 3rd normal form. There should not be any unnecessary redundancy in your tables. (1-6 Points) 
- [ ] Tables should have a primary key and if applicable foreign keys representing relationships in your class diagram. (1- 5 Points)
- [ ] Project is modular and uses server side user defined functions, procedures, triggers, events. Front end code does not contain excessive SQL code. (1-6 points) 
- [ ] Provide integrity constraints such as action to be performed for foreign keys  ON DELETE, ON UPDATE clauses within the foreign keys in the tables. Also provide additional constraints on fields that are not part of the key (1-3 Points)
- [ ] Error handling (1-5 points)

##### Dump submission is complete (5 points)
- BONUS POINTS: Complicated schema – user data pull requires multi-joins, or many tables (> 10 ) due to the complexity of the data domain (1-5 points)
- BONUS POINTS:  Identifying fields for secondary indexes. ( 1-5 points) Succinctly justify your index choice within code comments.  
- BONUS POINTS: Difficult process for data extraction (1-5 points) (Total bonus points that can be allotted for the project is 5  points)
  
### Database Application (maximum 40 points)

You must have connectivity from your front end to your database in order to receive any points for this task.   The host languages supported are the latest versions are Java, Python, javascript and R. Approval of any other language must be given in feedback from the project proposal.

 Please be sure to include all CRUD operations (create, read, update, delete), in particular the operations that have not been demonstrated during your project presentation. If the amount of application code is excessive, you may limit the code to the functions that interact with the database and just provide a sample of the user interaction code. However, you must get this approved by the staff before final submission.

- [ ] A user should be able to create new tuples in the database. More points allotted for different types of entities created.                                     (1-5 Points)
- [ ] A user should be able to delete data tuples from the database. More points allotted for different tables  supported for the delete operations.                             (1-5 Points)
 - [ ] A user should be able to read data from the database. More points allotted for different tables  read.                                                                                   (1-5 Points)
- [ ] A user should be able to update tuples  in the database. More points allotted for more tables providing the update operation.                                                             (1- 5 Points)
- [ ] Functionality provided by the project is a complete solution for the chosen data domain Completeness of operations provided to the user.            ( 1-4 Points)
- [ ] Modularization of code use of functions in the front end code as well as use of SQL user defined procedures, functions, triggers, and events )         (1-3 points)
- [ ] Error handling system (testing of arguments, user input, SQL error catch/try mechanism               (1-5 points)
- [ ] Submitted project is complete. No missing files (1-4 points)
- [ ] Easy to use front end applications. Prompts are easy to interpret, good feedback on input. (1-3 points)

##### Bonus
- Bonus: 3 to 5  interesting queries that can be used for analysis or visualization of the data (at the detailed level or summary data) (1-5 points)
- BONUS POINTS:  additional front end functionality such as website (1-5 points)
- BONUS POINTS: overly complicated translations from user operations  to database operation)      (1-5 points)


### Project Final Report (maximum 10 points)

Please use your project proposal report as a starting point to create your project’s final report. Provide a single document that contains the following sections:

- [ ] Provide a README section for creating and running the project. I need complete specifications for building your project on my computer. Specify all libraries, software, etc. needed to run the application. Specify expected installation directories. If you use a specific technology for the project, the technology’s download page must be listed.
- [ ] Provide the Technical Specifications for the project.
- [ ] Provide the current conceptual design as a UML for the project .
- [ ] Provide a logical design for the submitted database schema (Reverse Engineer your final schema in the MySQL workbench). If you are submitting a Mongo database, please provide a description of your collections.
- [ ] Provide the final user flow of the system. List the commands or methods the user performs to interact with the system.
- [ ] Provide a “Lessons Learned” section that contains report sections for the following:
- [ ] Technical expertise gained
- [ ] Insights, time management insights, data domain insights etc.
- [ ] Realized or contemplated alternative design / approaches to the project
- [ ] Document any code not working in this section
- [ ] Provide a “Future work” section containing:
- [ ] Planned uses of the database
- [ ] Potential areas for added functionality. No future uses or work can be documented if justification is provided.
- [ ] The final report file should be named lastname_final_report.pdf, where lastname is your last name. Remember, this is a writing exercise. Please take the time to write a cohesive report on your semester’s project.

##### A Project video or a presentation (maximum 15 points)

4.a Project presentation

Please provide a verbal 5-7 minute description of your project. 

- It should contain a brief description of the project’s schema, its architecture, and its user functionality and utility.  
- You can provide a visual representation such as a PowerPoint slide that describes your system and schema but this is not required. 
- You should provide a demonstration of the front end for at least two of the CRUD operations. 

To demonstrate a CRUD operation:

1. Use a well-known database client such as a graphical user interface (like MySQL workbench or MongoDB compass)  to display the data in the database. Highlight the record to be updated, deleted, or read. If creating a new record, display the table in order, highlighting that the record does not exist.

2. Perform the CRUD operation using your front end.

3. Show the change in the database using the same database client (like MySQL workbench or MongoDB compass) , highlighting the change to the data in the database.  

4.b Project video

Like the demonstration the video should be at most 5-7 minutes in length and contain all of the content described for the presentation. The demonstration must follow the process described for the presentation in order to receive credit. Without verification of the operation, no points will be granted.

 

