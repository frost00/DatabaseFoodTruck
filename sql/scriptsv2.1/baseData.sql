-- Maramkhah, Shayon
-- drop.sql version 1.0.0
-- Drop script for Food Truck project
-- Demonstrates Spooling and comments and meta commands
-- Drops all tables
-- Spool returns to a file in the current directory

\o baseData.txt

\qecho -n 'Script run on ' `date`
\qecho -n 'Script run by ':USER' on server ': HOST' with db':DBNAME
\qecho ' '

\qecho -n 'Listing all tables and views'



\qecho 'Start script'

INSERT INTO territory(street,city,tstate,zipcode)
VALUES('177 Broad St','Stamford','CT','06901');
VALUES('980 5th Ave', 'New York','NY','10075');
VALUES('225 Prospect St','New Haven','CT','06511');
VALUES('Richmond Hill Ave', 'Stamford','CT','06902');



\qecho 'END OF SCRIPT'

-- Turning off spooling

\o