-- Step 1
-- This code creates a new table named "primary_table" by selecting distinct rows from the existing table "all_jobs_with_keywords_level_field_summary" and extracting keywords from a JSON array, while filtering out rows containing specific error indicators.

CREATE OR REPLACE TABLE "primary_table" AS
SELECT DISTINCT
    "company", 
    "description", 
    "url",
    "id" as "idJobOffer", 
    "positionName", 
    "level",
    "field",
    "summary",
    "industry",
    TRIM(LOWER(f.value::string)) AS "keyword",
    CURRENT_DATE as "loadedDate"
FROM "all_jobs_with_keywords_level_field_summary",
    LATERAL FLATTEN(INPUT => TRY_PARSE_JSON("keywords")) f
WHERE "keywords" NOT ILIKE '%openaierror%' 
;


-- Step 2
-- Creating a table named "job_offer" by selecting distinct job offers from the "primary_table" and ordering them by company and idJobOffer

CREATE OR REPLACE TABLE "job_offer" AS
SELECT DISTINCT
 "idJobOffer",
 "company", 
 "positionName",
 "field",
 "level",
 "summary",
 "industry",
 "description", 
 "url",
 "loadedDate"
FROM "primary_table"
ORDER BY "company", "idJobOffer"
;


-- Step 3
-- This code creates a table named "skills" by counting the frequency of each keyword extracted from the "primary_table" and filtering out keywords with a frequency of less than 2.

CREATE OR REPLACE TABLE "skills" AS
SELECT 
    ROW_NUMBER() OVER (ORDER BY SUM(1) DESC) AS "number",
    "keyword" AS "skill",
    SUM(1) AS "frequencySkill"
FROM "primary_table"
GROUP BY "skill"
HAVING "frequencySkill" > 1
;


-- Step 4
-- Creating a junction table "job_skill"

CREATE OR REPLACE TABLE "job_skill" AS
SELECT 
    pt."company", 
    pt."idJobOffer", 
    s."number",
    pt."keyword"
FROM "primary_table" pt
INNER JOIN "skills" s
    ON pt."keyword" = s."skill"
;
