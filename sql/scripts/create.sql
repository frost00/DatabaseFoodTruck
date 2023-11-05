-- Maramkhah, Shayon
-- Script.sql version 1.0.0
-- Create script for Food Truck project
-- Demonstrates Spooling and comments and meta commands

-- Spool returns to a file in the current directory

\o spoolsample.txt

\qecho -n 'Script run on'
\qecho -n 'Script run by ':USER' on server ': HOST' with db':DBNAME
\qecho ' '

\qecho -n 'Listing all tables and views'

\dp

CREATE TABLE IF NOT EXISTS customer(
    cname varchar(50),
    phone varchar(12),
    email TEXT NOT NULL,
    PRIMARY KEY(cname,phone)
);

CREATE TABLE IF NOT EXISTS cTruck(
    cID SERIAL NOT NULL,
    cleandate DATE NOT NULL,
    visor boolean NOT NULL,
    deck boolean NOT NULL,
    cookingcenter boolean NOT NULL,
    prepcenter boolean NOT NULL,
    PRIMARY KEY(cID, cleandate)
);

CREATE TABLE IF NOT EXISTS eTruck(
    eID SERIAL NOT NULL,
    energydate DATE NOT NULL,
    generator boolean NOT NULL,
    gasstove boolean NOT NULL,
    cID  SERIAL REFERENCES cTruck(cID) ON DELETE CASCADE,
    vent boolean REFERENCES cTruck(vent) ON DELETE CASCADE,
    visor boolean REFERENCES cTruck(visor) ON DELETE CASCADE,
    deck  boolean REFERENCES cTruck(deck) ON DELETE CASCADE,
    cookingcenter boolean REFERENCES cTruck(cookingcenter) ON DELETE CASCADE,
    prepcenter boolean REFERENCES cTruck(prepcenter) ON DELETE CASCADE,
    PRIMARY KEY(eID,energydate)
);

CREATE TABLE IF NOT EXISTS employee(
    empID SERIAL NOT NULL,
    ename varchar(100) NOT NULL,
    phone varchar(12) NOT NULL,
    email TEXT NOT NULL,
    cuisine varchar(100) NOT NULL,
    PRIMARY KEY(empID)
);

CREATE TABLE IF NOT EXISTS vendor(
    vID SERIAL NOT NULL,
    vdate DATE NOT NULL,
    grade varchar(1),
    vtype varchar(100) NOT NULL,
    vweight numeric(1,0) NOT NULL,
    vprice numeric(1,0) NOT NULL,
    vname varchar(100) NOT NULL,
    empID SERIAL REFERENCES employee(empID) ON DELETE CASCADE,
    ename  varchar(100) REFERENCES employee(ename) ON DELETE CASCADE,
    vphone varchar(12) NOT NULL,
    email  TEXT REFERENCES employee(email) ON DELETE CASCADE,
    cuisine VARCHAR(100) REFERENCES employee(cuisine) ON DELETE CASCADE,
    PRIMARY KEY(vID,vname)
);

\qecho 'END OF SCRIPT'

-- Turning off spooling

\o