
-- =========================================================
-- CSE 340 - Assignment 2
-- Task One: SQL Statements
-- File: assignment2.sql
-- =========================================================
-- This file contains SQL queries for:
-- 1. Inserting a new account
-- 2. Updating an account type
-- 3. Deleting an account
-- 4. Updating inventory description using REPLACE()
-- 5. Selecting inventory using INNER JOIN
-- 6. Updating image paths using REPLACE()
-- =========================================================


-- ---------------------------------------------------------
-- 1. Insert a new record into the account table
-- Note: account_id and account_type are handled automatically
-- ---------------------------------------------------------
INSERT INTO account (
  account_firstname,
  account_lastname,
  account_email,
  account_password
)
VALUES (
  'Tony',
  'Stark',
  'tony@starkent.com',
  'Iam1ronM@n'
);


-- ---------------------------------------------------------
-- 2. Modify Tony Stark's account type to "Admin"
-- ---------------------------------------------------------
UPDATE account
SET account_type = 'Admin'
WHERE account_email = 'tony@starkent.com';


-- ---------------------------------------------------------
-- 3. Delete the Tony Stark record from the database
-- ---------------------------------------------------------
DELETE FROM account
WHERE account_email = 'tony@starkent.com';


-- ---------------------------------------------------------
-- 4. Update GM Hummer description
-- Replace "small interiors" with "a huge interior"
-- IMPORTANT: Copy this query into the database rebuild file
-- ---------------------------------------------------------
UPDATE inventory
SET inv_description = REPLACE(
  inv_description,
  'small interiors',
  'a huge interior'
)
WHERE inv_make = 'GM'
AND inv_model = 'Hummer';


-- ---------------------------------------------------------
-- 5. INNER JOIN to retrieve Sport category inventory
-- Returns make, model, and classification name
-- ---------------------------------------------------------
SELECT
  i.inv_make,
  i.inv_model,
  c.classification_name
FROM inventory i
INNER JOIN classification c
  ON i.classification_id = c.classification_id
WHERE c.classification_name = 'Sport';


-- ---------------------------------------------------------
-- 6. Update image paths to include /vehicles
-- IMPORTANT: Copy this query into the database rebuild file
-- ---------------------------------------------------------
UPDATE inventory
SET
  inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
  inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');

