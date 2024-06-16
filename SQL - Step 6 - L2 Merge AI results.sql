-- Step 1

-- Union_AI_results_f1
-- Rename the columns
ALTER TABLE "jobs_w_keywords_f1" RENAME COLUMN "result_value" TO "keywords";
ALTER TABLE "jobs_w_levels_f1" RENAME COLUMN "result_value" TO "level";
ALTER TABLE "jobs_w_fields_f1" RENAME COLUMN "result_value" TO "field";
ALTER TABLE "jobs_w_summary_f1" RENAME COLUMN "result_value" TO "summary";
ALTER TABLE "job_position_w_industry_f1" RENAME COLUMN "result_value" TO "industry";

-- Combining results using LEFT JOIN into a single table
CREATE OR REPLACE TABLE "all_jobs_f1" AS
SELECT 
k1.*,
l1."level",
f1."field",
s1."summary",
i1."industry"
FROM "jobs_w_keywords_f1" k1
LEFT JOIN "jobs_w_levels_f1" l1 on l1."id" = k1."id"
LEFT JOIN "jobs_w_fields_f1" f1 on f1."id" = k1."id"
LEFT JOIN "jobs_w_summary_f1" s1 on s1."id" = k1."id"
LEFT JOIN "job_position_w_industry_f1" i1 on i1."id" = k1."id"
;


-- Union_AI_results_f2
ALTER TABLE "jobs_w_keywords_f2" RENAME COLUMN "result_value" TO "keywords";
ALTER TABLE "jobs_w_levels_f2" RENAME COLUMN "result_value" TO "level";
ALTER TABLE "jobs_w_fields_f2" RENAME COLUMN "result_value" TO "field";
ALTER TABLE "jobs_w_summary_f2" RENAME COLUMN "result_value" TO "summary";
ALTER TABLE "job_position_w_industry_f2" RENAME COLUMN "result_value" TO "industry";

CREATE OR REPLACE TABLE "all_jobs_f2" AS
SELECT 
k2.*,
l2."level",
f2."field",
s2."summary",
i2."industry"
FROM "jobs_w_keywords_f2" k2
LEFT JOIN "jobs_w_levels_f2" l2 on l2."id" = k2."id"
LEFT JOIN "jobs_w_fields_f2" f2 on f2."id" = k2."id"
LEFT JOIN "jobs_w_summary_f2" s2 on s2."id" = k2."id"
LEFT JOIN "job_position_w_industry_f2" i2 on i2."id" = k2."id"
;


-- Union_AI_results_f3
ALTER TABLE "jobs_w_keywords_f3" RENAME COLUMN "result_value" TO "keywords";
ALTER TABLE "jobs_w_levels_f3" RENAME COLUMN "result_value" TO "level";
ALTER TABLE "jobs_w_fields_f3" RENAME COLUMN "result_value" TO "field";
ALTER TABLE "jobs_w_summary_f3" RENAME COLUMN "result_value" TO "summary";
ALTER TABLE "job_position_w_industry_f3" RENAME COLUMN "result_value" TO "industry";

CREATE OR REPLACE TABLE "all_jobs_f3" AS
SELECT 
k3.*,
l3."level",
f3."field",
s3."summary",
i3."industry"
FROM "jobs_w_keywords_f3" k3
LEFT JOIN "jobs_w_levels_f3" l3 on l3."id" = k3."id"
LEFT JOIN "jobs_w_fields_f3" f3 on f3."id" = k3."id"
LEFT JOIN "jobs_w_summary_f3" s3 on s3."id" = k3."id"
LEFT JOIN "job_position_w_industry_f3" i3 on i3."id" = k3."id"
;


-- Union_AI_results_f4
ALTER TABLE "jobs_w_keywords_f4" RENAME COLUMN "result_value" TO "keywords";
ALTER TABLE "jobs_w_levels_f4" RENAME COLUMN "result_value" TO "level";
ALTER TABLE "jobs_w_fields_f4" RENAME COLUMN "result_value" TO "field";
ALTER TABLE "jobs_w_summary_f4" RENAME COLUMN "result_value" TO "summary";
ALTER TABLE "job_position_w_industry_f4" RENAME COLUMN "result_value" TO "industry";

CREATE OR REPLACE TABLE "all_jobs_f4" AS
SELECT 
k4.*,
l4."level",
f4."field",
s4."summary",
i4."industry"
FROM "jobs_w_keywords_f4" k4
LEFT JOIN "jobs_w_levels_f4" l4 on l4."id" = k4."id"
LEFT JOIN "jobs_w_fields_f4" f4 on f4."id" = k4."id"
LEFT JOIN "jobs_w_summary_f4" s4 on s4."id" = k4."id"
LEFT JOIN "job_position_w_industry_f4" i4 on i4."id" = k4."id"
;


-- Union_AI_results_f5
ALTER TABLE "jobs_w_keywords_f5" RENAME COLUMN "result_value" TO "keywords";
ALTER TABLE "jobs_w_levels_f5" RENAME COLUMN "result_value" TO "level";
ALTER TABLE "jobs_w_fields_f5" RENAME COLUMN "result_value" TO "field";
ALTER TABLE "jobs_w_summary_f5" RENAME COLUMN "result_value" TO "summary";
ALTER TABLE "job_position_w_industry_f5" RENAME COLUMN "result_value" TO "industry";

CREATE OR REPLACE TABLE "all_jobs_f5" AS
SELECT 
k5.*,
l5."level",
f5."field",
s5."summary",
i5."industry"
FROM "jobs_w_keywords_f5" k5
LEFT JOIN "jobs_w_levels_f5" l5 on l5."id" = k5."id"
LEFT JOIN "jobs_w_fields_f5" f5 on f5."id" = k5."id"
LEFT JOIN "jobs_w_summary_f5" s5 on s5."id" = k5."id"
LEFT JOIN "job_position_w_industry_f5" i5 on i5."id" = k5."id"
;


-- Union_AI_results_f6
ALTER TABLE "jobs_w_keywords_f6" RENAME COLUMN "result_value" TO "keywords";
ALTER TABLE "jobs_w_levels_f6" RENAME COLUMN "result_value" TO "level";
ALTER TABLE "jobs_w_fields_f6" RENAME COLUMN "result_value" TO "field";
ALTER TABLE "jobs_w_summary_f6" RENAME COLUMN "result_value" TO "summary";
ALTER TABLE "job_position_w_industry_f6" RENAME COLUMN "result_value" TO "industry";

CREATE OR REPLACE TABLE "all_jobs_f6" AS 
SELECT
k6.*,
l6."level",
f6."field",
s6."summary",
i6."industry"
FROM "jobs_w_keywords_f6" k6
LEFT JOIN "jobs_w_levels_f6" l6 on l6."id" = k6."id"
LEFT JOIN "jobs_w_fields_f6" f6 on f6."id" = k6."id"
LEFT JOIN "jobs_w_summary_f6" s6 on s6."id" = k6."id"
LEFT JOIN "job_position_w_industry_f6" i6 on i6."id" = k6."id"
;


-- Union_AI_results_f7
ALTER TABLE "jobs_w_keywords_f7" RENAME COLUMN "result_value" TO "keywords";
ALTER TABLE "jobs_w_levels_f7" RENAME COLUMN "result_value" TO "level";
ALTER TABLE "jobs_w_fields_f7" RENAME COLUMN "result_value" TO "field";
ALTER TABLE "jobs_w_summary_f7" RENAME COLUMN "result_value" TO "summary";
ALTER TABLE "job_position_w_industry_f7" RENAME COLUMN "result_value" TO "industry";

CREATE OR REPLACE TABLE "all_jobs_f7" AS
SELECT 
k7.*,
l7."level",
f7."field",
s7."summary",
i7."industry"
FROM "jobs_w_keywords_f7" k7
LEFT JOIN "jobs_w_levels_f7" l7 on l7."id" = k7."id"
LEFT JOIN "jobs_w_fields_f7" f7 on f7."id" = k7."id"
LEFT JOIN "jobs_w_summary_f7" s7 on s7."id" = k7."id"
LEFT JOIN "job_position_w_industry_f7" i7 on i7."id" = k7."id"
;



-- Step 2
-- Combining results from seven different tables in the one.

CREATE TABLE "all_jobs_with_klfs" AS
SELECT *
FROM "all_jobs_f1"
UNION 
SELECT *
FROM "all_jobs_f2"
UNION
SELECT *
FROM "all_jobs_f3"
UNION
SELECT *
FROM "all_jobs_f4"
UNION
SELECT *
FROM "all_jobs_f5"
UNION
SELECT *
FROM "all_jobs_f6"
UNION
SELECT *
FROM "all_jobs_f7"
;



-- Step 3
-- Selecting unique rows from the table based on the combination of "company" and "positionName" columns
CREATE OR REPLACE TABLE "all_jobs_with_klfs_cleaned" AS
SELECT
    "company",
    "description",
    "url",
    "id",
    "positionName",
    "keywords",
    "level",
    "field",
    "summary",
    "industry"
FROM (SELECT
        "company",
        "description",
        "url",
        "id",
        "positionName",
      	"keywords",
      	"level",
      	"field",
      	"summary",
        "industry",
        ROW_NUMBER() OVER (PARTITION BY "company", "positionName" ORDER BY "id") as rnum
    FROM "all_jobs_with_klfs")
WHERE rnum = 1
ORDER BY "company"
;



-- Step 4
CREATE OR REPLACE TABLE "all_jobs_with_keywords_level_field_summary" AS
SELECT 
    "company"
    ,"description"
    ,"url"
    ,"id"
    ,"positionName"
    ,"keywords"
    ,
    CASE
        WHEN "level" ILIKE '%senior%' THEN 'Senior'
        WHEN "level" ILIKE '%junior%' THEN 'Junior'
        ELSE 'Middle'
    END as "level" --Providing standardizing classifications of level column
    ,
    CASE
        WHEN "field" ILIKE '%development%' THEN 'Development & Design'
        WHEN "field" ILIKE '%data%' THEN 'Data Analysis & Engineering'
        WHEN "field" ILIKE '%it%' THEN 'IT Business & Transformation'
        WHEN "field" ILIKE '%testing%' THEN 'Testing & Quality'
        WHEN "field" ILIKE '%cyber%' THEN 'Cyber Security'
        ELSE 'Null'
    END as "field" --Providing standardizing classifications of field column
    ,"summary"
    ,
    CASE
        WHEN "industry" ILIKE '%non%' THEN 'nonIT'
        ELSE 'IT'
    END as "industry" --Providing standardizing classifications of industry column
FROM "all_jobs_with_klfs_cleaned"
;
