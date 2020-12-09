# Cs3200_project

Steps to generate our database in Beekeeper Studio:
1. download our project.sqlite.sql file to your computer 
2. Open the project.sqlite.sql file and copy all the code
3. In Beekeeper, chose SQLite as the connection Type. For the Database file connect to an empty .sqlite file.
4. After you connect to the empty file, in the first query paste all the code from the project.sqlite.sql file and click run
5. In the left corner , Tables and Views click refresh. All the tables and data are imported. You then  can run all our task queries. 


Youtube video of the annotated walk through which allows us to access the database.
https://youtu.be/fpbFxdmnMks


To get the database running on java:
1. create a new java project 
2. put the yatv.java file into the default package of the database
3. add sqlite-jdbc-3.8.11.2.jar onto the class path of this file
4. when you want to run a query, enter the path\to\something.sqlite file followed by the <task query number> and a <parameter> if there is one


Youtube video on Task Queries:


