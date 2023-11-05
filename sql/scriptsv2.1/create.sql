-- Maramkhah, Shayon
-- Script.sql version 1.0.0
-- Create script for Food Truck project
-- Demonstrates Spooling and comments and meta commands

-- Spool returns to a file in the current directory

\o spoolCreate.txt

\qecho -n 'Script run on ' `date`
\qecho -n ' Script run by ':USER' on server ': HOST' with db ':DBNAME
\qecho ' '

\qecho -n 'Listing all tables and views'

\qecho 'Start script'

CREATE TABLE IF NOT EXISTS customer(
    cid SERIAL NOT NULL PRIMARY KEY,
    cname VARCHAR(100) UNIQUE NOT NULL,
    cphone VARCHAR(12) UNIQUE NOT NULL,
    cemail TEXT NOT NULL CHECK (cemail ~* '[A-Za-z0-9._%]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}')
);

CREATE TABLE IF NOT EXISTS employee(
    EID SERIAL NOT NULL UNIQUE PRIMARY KEY,
    ename VARCHAR(12) NOT NULL UNIQUE,
    empname VARCHAR(12) NOT NULL UNIQUE references customer(cname) ON DELETE CASCADE,
    ephone VARCHAR(12) NOT NULL UNIQUE references customer(cphone) ON DELETE CASCADE,
    specialty VARCHAR(100) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE CHECK (email ~* '[A-Za-z0-9._%]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'),
    CID SERIAL NOT NULL UNIQUE references customer(CID)
);

CREATE TABLE IF NOT EXISTS territory(
    terID SERIAL NOT NULL UNIQUE PRIMARY KEY,
    street VARCHAR(100) NOT NULL UNIQUE,
    city VARCHAR(100) NOT NULL UNIQUE,
    tstate VARCHAR(2) NOT NULL UNIQUE,
    zipcode VARCHAR(9) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS truck(
    TID SERIAL NOT NULL PRIMARY KEY,
    generator BOOLEAN NOT NULL,
    visor BOOLEAN NOT NULL,
    deck BOOLEAN NOT NULL,
    stove BOOLEAN NOT NULL,
    vent BOOLEAN NOT NULL,
    prepcenter BOOLEAN NOT NULL,
    EID SERIAL NOT NULL UNIQUE references employee(EID),
    ename VARCHAR(100) NOT NULL UNIQUE references employee(empname) ON DELETE CASCADE,
    ephone VARCHAR(12) NOT NULL UNIQUE references employee(ephone) ON DELETE CASCADE,
    specialty VARCHAR(100) NOT NULL UNIQUE references employee(specialty) ON DELETE CASCADE,
    email TEXT NOT NULL UNIQUE references employee(email) ON DELETE CASCADE,
    terID SERIAL NOT NULL UNIQUE references territory(terID) ON DELETE CASCADE,
    street VARCHAR(100) NOT NULL UNIQUE references territory(street) ON DELETE CASCADE,
    city VARCHAR(100) NOT NULL UNIQUE references territory(city) ON DELETE CASCADE,
    tstate VARCHAR(2) NOT NULL UNIQUE references territory(tstate) ON DELETE CASCADE,
    zipcode VARCHAR(9) NOT NULL UNIQUE references territory(zipcode) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS vcertificate(
    ID SERIAL NOT NULL UNIQUE PRIMARY KEY,
    review VARCHAR(100) NOT NULL UNIQUE,
    grade VARCHAR(1) NOT NULL UNIQUE CHECK(grade ~* '[A-Z]'),
    vdate DATE NOT NULL UNIQUE,
    vprice NUMERIC(1,0) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS vendor(
    vid SERIAL NOT NULL PRIMARY KEY,
    vname VARCHAR(100) NOT NULL,
    vphone VARCHAR(12) NOT NULL,
    vemail TEXT NOT NULL CHECK(vemail ~* '[A-Za-z0-9._%]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'),
    vtype VARCHAR(100) NOT NULL,
    vweight NUMERIC(1,0) NOT NULL,
    quantity NUMERIC(1,0) NOT NULL,
    ID SERIAL NOT NULL UNIQUE references vcertificate(ID) ON DELETE CASCADE,
    review VARCHAR(100) NOT NULL UNIQUE,
    grade VARCHAR(1) NOT NULL UNIQUE references vcertificate(grade) ON DELETE CASCADE CHECK(grade ~* '[A-D]'),
    vdate DATE NOT NULL UNIQUE references vcertificate(vdate) ON DELETE CASCADE,
    cprice NUMERIC(1,0) NOT NULL UNIQUE references vcertificate(vprice) ON DELETE CASCADE,
    email TEXT NOT NULL  UNIQUE references employee(email) CHECK (email ~* '[A-Za-z0-9._%]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}')
);


\dp

\qecho 'END OF SCRIPT'

-- Turning off spooling

\o