# cs347hw4
Joseph Le
ut: jsl2449
cs: jslfwood

Asad Valliani
ut: arv596
cs:asadv988

NOTES:
Made logical model
Engineered the Relational model
Exported realOriginal.dll
Ran realOriginal.ddl through Parser.jar and Parser2.jar
Created realHw4fourth.ddl by hand (used org.ddl4 as a template) -- we should have created sim_emp view and sim_manager view based off of sim_person
Created ApEx

We came across errors when running the scripts on ApEx. Each of the scripts would duplicate tables or drop nonexistent tables. This resulted in many of our views and tables not showing up in our application. We believe our underlying problem is the Logical model in the data modeler

CAN:
Add projects into sim_project table
Add departments into sim_dept table
Add employees to sim_emp table (although the table should not exist)*?

Can not:
Create interactive report for person
Add people to sim_person table
Add Manager table is sub-table of sim_person table
Add Employees table is sub-table of sim_person table

*? - This sim_emp table exists because previous runnings of .ddl scripts created the table in the workspace