-- ============================================
--  Δημιουργία Βάσης Δεδομένων και Πινάκων
-- ============================================

-- Διαγραφή της βάσης αν υπάρχει (για clean start)
DROP DATABASE IF EXISTS companymanagement;

-- Δημιουργία Βάσης Δεδομένων
CREATE DATABASE companymanagement;

-- Χρήση της βάσης
USE companymanagement;

-- Δημιουργία πίνακα country
CREATE TABLE country (
    country_code INT PRIMARY KEY,
    name VARCHAR(150),
    capital VARCHAR(150)
);

-- Δημιουργία πίνακα company
CREATE TABLE company (
    name VARCHAR(60) PRIMARY KEY,
    address VARCHAR(100),
    city VARCHAR(80),
    country_code INT,
    numofemployees INT,
    birthdate DATE,
    FOREIGN KEY (country_code) REFERENCES country(country_code)
);

-- 1. Εισαγωγή 3 χωρών στον πίνακα country με την εντολή INSERT
INSERT INTO country (country_code, name, capital) VALUES (1, 'Ελλάδα', 'Αθήνα');
INSERT INTO country (country_code, name, capital) VALUES (2, 'Γερμανία', 'Βερολίνο');
INSERT INTO country (country_code, name, capital) VALUES (3, 'Γαλλία', 'Παρίσι');

-- 2. Μεταβολή του πεδίου city σε VARCHAR(150) με την εντολή ALTER
ALTER TABLE company MODIFY COLUMN city VARCHAR(150);

-- 3. Προσθήκη πεδίου numofoffices με την εντολή ALTER
ALTER TABLE company ADD COLUMN numofoffices INT;

-- 4. Εισαγωγή 3 εταιριών στον πίνακα company με την εντολή INSERT
INSERT INTO company (name, address, city, country_code, numofemployees, birthdate, numofoffices) 
VALUES ('TechCorp', 'Λ. Κηφισίας 123', 'Αθήνα', 1, 150, '2010-05-15', 5);

INSERT INTO company (name, address, city, country_code, numofemployees, birthdate, numofoffices) 
VALUES ('DataSystems', 'Μητροπόλεως 45', 'Θεσσαλονίκη', 1, 8, '2015-03-20', 2);

INSERT INTO company (name, address, city, country_code, numofemployees, birthdate, numofoffices) 
VALUES ('InnovateGmbH', 'Hauptstrasse 67', 'Μόναχο', 2, 200, '2005-11-10', 10);

-- 5. Διαγραφή της τελευταίας εταιρίας με την εντολή DELETE
DELETE FROM company WHERE name = 'InnovateGmbH';

-- ============================================
-- QUERIES - Εμφάνιση Αποτελεσμάτων
-- ============================================

-- 6. Εμφάνιση όλων των δεδομένων του πίνακα country με την εντολή SELECT
SELECT * FROM country;

-- 7. Εμφάνιση ονομάτων και διευθύνσεων εταιριών με >10 εργαζομένους με την εντολή SELECT
SELECT name, address 
FROM company 
WHERE numofemployees > 10;

-- 8. Εμφάνιση ονόματος εταιρίας και ονόματος χώρας με την εντολή SELECT
SELECT company.name AS company_name, country.name AS country_name
FROM company
INNER JOIN country ON company.country_code = country.country_code;

-- ============================================
-- ΕΠΙΠΛΕΟΝ QUERIES ΓΙΑ VERIFICATION
-- ============================================

-- Εμφάνιση όλων των εταιριών
SELECT * FROM company;

-- Εμφάνιση της δομής των πινάκων
DESCRIBE country;
DESCRIBE company;