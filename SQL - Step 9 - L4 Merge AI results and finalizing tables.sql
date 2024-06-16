-- Step 1
-- Creating a table named "skills_with_parent_category" by selecting data from the "skills_parent_category" table and casting certain columns to integers.

CREATE OR REPLACE TABLE "skills_with_parent_category" AS
SELECT "number" :: int AS "number" 
			,"skill"
      ,"frequencySkill" :: int AS "frequencySkill"
      ,"parent_category"
FROM "skills_parent_category"
;


-- Step 2
-- This code creates a table named "job_skill_parent_category" by joining data from the "job_skill" table and the "skills_with_parent_category" table based on the common "number" column, linking job skills with their respective parent categories.

CREATE OR REPLACE TABLE "job_skill_parent_category" AS
SELECT js."company", js."idJobOffer", js."number", swpc."skill", swpc."parent_category", swpc."frequencySkill"
FROM "job_skill" AS js
INNER JOIN "skills_with_parent_category" AS swpc
    ON js."number" = swpc."number"
;


-- Step 3
-- Creating a table named "skills_set" by aggregating job skills for each job offer into a comma-separated list, ensuring uniqueness, based on data from the "job_skill_parent_category" table.

CREATE OR REPLACE TABLE "skills_set" AS
SELECT "idJobOffer", LISTAGG(DISTINCT "skill", ',') WITHIN GROUP (ORDER BY "skill") AS "skills_set"
FROM "job_skill_parent_category"
GROUP BY "idJobOffer"
;


-- Step 4
-- Creating a table named "job_offer_final" by combining data from the "job_offer" table with the aggregated skills set from the "skills_set" table, filtering out rows where the skills set is 'Null'.

CREATE OR REPLACE TABLE "job_offer_final" AS
SELECT jo.*, ss."skills_set"
FROM "job_offer" jo
LEFT JOIN "skills_set" ss
    ON jo."idJobOffer" = ss."idJobOffer"
WHERE ss."skills_set" != 'Null'
;