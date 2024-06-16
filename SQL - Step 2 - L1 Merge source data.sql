-- Step 1
-- Normalize Indeed jobs
CREATE OR REPLACE TABLE "indeed_normalized" AS
SELECT 
 "company",
 "description",
 "url",
 "id",
 "positionName",
FROM "dataset-items"
;

-- Normalize jobs.cz Jobs
CREATE OR REPLACE TABLE "jobs_cz_normalized" AS
SELECT 
 "company",
 "description",
 "url",
 "id",
 "name" as "positionName"
FROM "jobs_cz_w_extracted_descriptions"
; 

-- Normalize Linkedin jobs
CREATE OR REPLACE TABLE "linkedin_normalized" AS
SELECT 
 "companyName" as "company",
 "description",
 "jobUrl" as "url",
 "jobID" as "id",
 "title" as "positionName"
FROM "linkedin_jobs_extracted_id"
;


-- Step 2
-- Union ALL tables
CREATE TABLE "all_jobs_union" AS
SELECT *
FROM "indeed_normalized"
UNION 
SELECT *
FROM "jobs_cz_normalized"
UNION
SELECT *
FROM "linkedin_normalized"
;


-- Step 3
-- Creating a table all_jobs
CREATE OR REPLACE TABLE "all_jobs" AS
SELECT
    "company",
    "description",
    "url",
    "id",
    "positionName"
FROM "all_jobs_union"
WHERE 1=1
    AND "company" != '' 
    AND "positionName" != '' -- Removing items with empty values in the positionName and company columns
ORDER BY "company"
;
