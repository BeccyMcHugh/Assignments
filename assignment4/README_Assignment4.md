# Instructions for Assignment 4 

## Back story

The database is set up to show available appointments for parents evening in a school. The teachers are the same ones from assignment 3. 
Parents are able to input their name, the teacher they want to see and the time they want to see them. 
The database is then updated and the code gives the parent the option to add another booking. 
Parents are also given the chance to delete a booking if they have made an error. 
As the parents book up the spaces, more of the slots appear as Not Available. 


## Setup

To use the code you firstly you need to import the database into MySQL. Copy the code and run it.
Secondly, you need to set up a config file. This holds your login details. It is already filled in but you need to enter your own password for MySQL.
When you have input your CONFIG details, you can run the db_utils.py


## Running the code

When the db_utils.py is up and running, you can run the app.py. 
*IMPORTANT* You must leave this running when you run the main.py.
With app.py running, you can run main.py and you need to follow the input instructions in the terminal. 
If you want to check if it works, go back to MySQL and refresh the SELECT * FROM bookings to see the changes that have been made.


