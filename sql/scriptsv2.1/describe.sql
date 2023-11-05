-- Maramkhah, Shayon
-- describe.sql version 1.0.0
-- Describe script for Food Truck project
-- Demonstrates Spooling and comments and meta commands
-- Describes all tables in detail
-- Spool returns to a file in the current directory

\o spoolDescribe.txt

\qecho -n 'Script run on ' `date`
\qecho -n 'Script run by ':USER' on server ': HOST' with db ':DBNAME
\qecho ' '

\qecho -n 'Listing all tables and views'

\dp

\qecho 'Start script'

\d customer
\d employee
\d vendor
\d truck
\d territory
\d vcertificate


\qecho 'END OF SCRIPT'

-- Turning off spooling

\o