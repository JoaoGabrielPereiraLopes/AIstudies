-- SQLite
.mode csv
.separator ;
.import /home/gabriel/codigos/python/estatistica/skitlearn/Kmeans/db/bank-full.csv bank

ALTER TABLE bank DROP COLUMN y;
PRAGMA table_info(bank);

CREATE TABLE bank_new (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    age INTEGER,
    "default" INTEGER,
    balance NUMERIC,
    housing INTEGER,
    loan INTEGER,
    day INTEGER,
    month INTEGER,
    duration NUMERIC,
    campaign NUMERIC,
    pdays NUMERIC,
    previous NUMERIC,
    married Integer,
    single Integer,
    divorced Integer,
    educationTertiary INTEGER,
    educationsecondary INTEGER,
    educationunknown INTEGER,
    educationprimary INTEGER,
    contactunknown INTEGER,
    contactcellular INTEGER,
    contacttelephone INTEGER,
    poutcomeunknown INTEGER,
    poutcomefailure INTEGER,
    poutcomeother INTEGER,
    poutcomesuccess INTEGER,
    jobmanagement INTEGER,
    jobtechnician INTEGER,
    jobentrepreneur INTEGER,
    jobbluecollar INTEGER,
    jobunknown INTEGER,
    jobretired INTEGER,
    jobadmin INTEGER,
    jobservices INTEGER,
    jobselfemployed INTEGER,
    jobunemployed INTEGER,
    jobhousemaid INTEGER,
    jobstudent INTEGER
);

INSERT INTO bank_new 
(age, "default", balance, housing, loan, day, month, duration,
campaign, pdays, previous,
single, married, divorced,
educationTertiary, educationsecondary, educationunknown, educationprimary,
contactunknown,contactcellular,contacttelephone,
poutcomeunknown,poutcomefailure,poutcomeother,poutcomesuccess,
jobmanagement,jobtechnician,jobentrepreneur,jobbluecollar,jobunknown,jobretired,jobadmin,jobservices,jobselfemployed,jobunemployed,jobhousemaid,jobstudent)
SELECT 
    CAST(age AS INTEGER),
    CASE
        WHEN "default" = 'yes' THEN 1
        WHEN "default" = 'no' THEN 0
        ELSE NULL
    END, 
    CAST(balance AS NUMERIC), 
    CASE
        WHEN housing = 'yes' THEN 1
        WHEN housing = 'no' THEN 0
        ELSE NULL
    END, 
    CASE
        WHEN loan = 'yes' THEN 1
        WHEN loan = 'no' THEN 0
        ELSE NULL
    END,
    CAST(day AS INTEGER), 
    CAST(month AS INTEGER), 
    CAST(duration AS NUMERIC), 
    CAST(campaign AS NUMERIC), 
    CAST(pdays AS NUMERIC), 
    CAST(previous AS NUMERIC), 
    CASE WHEN marital = 'single' THEN 1 ELSE 0 END,
    CASE WHEN marital = 'married' THEN 1 ELSE 0 END,
    CASE WHEN marital = 'divorced' THEN 1 ELSE 0 END,
    CASE WHEN education = 'tertiary' THEN 1 ELSE 0 END,
    CASE WHEN education = 'secondary' THEN 1 ELSE 0 END,
    CASE WHEN education = 'unknown' THEN 1 ELSE 0 END,
    CASE WHEN education = 'primary' THEN 1 ELSE 0 END,
    case when contact= 'unknown' THEN 1 ELSE 0 END,
    case when contact= 'cellular' THEN 1 ELSE 0 END,
    case when contact= 'telephone' THEN 1 ELSE 0 END,
    case when poutcome= 'unknown' THEN 1 ELSE 0 END,
    case when poutcome= 'failure' THEN 1 ELSE 0 END,
    case when poutcome= 'other' THEN 1 ELSE 0 END,
    case when poutcome= 'success' THEN 1 ELSE 0 END,
    case when job= 'management' THEN 1 ELSE 0 END,
    case when job= 'technician' THEN 1 ELSE 0 END,
    case when job= 'entrepreneur' THEN 1 ELSE 0 END,
    case when job= 'blue-collar' THEN 1 ELSE 0 END,
    case when job= 'unknown' THEN 1 ELSE 0 END,
    case when job= 'retired' THEN 1 ELSE 0 END,
    case when job= 'admin.' THEN 1 ELSE 0 END,
    case when job= 'services' THEN 1 ELSE 0 END,
    case when job= 'self-employed' THEN 1 ELSE 0 END,
    case when job= 'unemployed' THEN 1 ELSE 0 END,
    case when job= 'housemaid' THEN 1 ELSE 0 END,
    case when job= 'student' THEN 1 ELSE 0 END
FROM bank;


DROP TABLE bank_new;

SELECT DISTINCT job FROM bank;