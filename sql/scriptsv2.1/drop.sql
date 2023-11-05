-- Maramkhah, Shayon
-- drop.sql version 1.0.0
-- Drop script for Food Truck project
-- Demonstrates Spooling and comments and meta commands
-- Drops all tables
-- Spool returns to a file in the current directory

\o spoolDrop.txt

\qecho -n 'Script run on ' `date`
\qecho -n 'Script run by ':USER' on server ': HOST' with db':DBNAME
\qecho ' '

\qecho -n 'Listing all tables and views'



\qecho 'Start script'

DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS vcertificate CASCADE;
DROP TABLE IF EXISTS Truck CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS vendor CASCADE;
DROP TABLE IF EXISTS territory CASCADE;


\dp

\qecho 'END OF SCRIPT'

-- Turning off spooling

\o