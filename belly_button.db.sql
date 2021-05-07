BEGIN TRANSACTION;
DROP TABLE IF EXISTS "otu_reference";
CREATE TABLE IF NOT EXISTS "otu_reference" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT,
	PRIMARY KEY("id")
);
DROP TABLE IF EXISTS "subjects";
CREATE TABLE IF NOT EXISTS "subjects" (
	"id"	INTEGER NOT NULL UNIQUE,
	"ethnicity"	TEXT,
	"gender"	TEXT,
	"age"	REAL,
	"location"	TEXT,
	"bbtype"	TEXT,
	"wfreq"	TEXT,
	"city"	TEXT,
	"state"	TEXT,
	PRIMARY KEY("id")
);
DROP TABLE IF EXISTS "test_data";
CREATE TABLE IF NOT EXISTS "test_data" (
	"subject_id"	INTEGER NOT NULL,
	"original_sequence"	INTEGER NOT NULL,
	"otu_id"	INTEGER NOT NULL,
	"amount"	INTEGER,
	PRIMARY KEY("subject_id","original_sequence"),
	FOREIGN KEY("subject_id") REFERENCES "subjects"("id")
);
DROP VIEW IF EXISTS "test_results_view";
CREATE VIEW test_results_view
as
select td.subject_id, td.original_sequence,
td.otu_id, 
o.name,
td.amount
FROM test_data td
join otu_reference o on o.id = td.otu_id
order by td.subject_id, td.amount desc;
COMMIT;

CREATE VIEW test_results_view
as
select td.subject_id, td.original_sequence,
td.otu_id, 
o.name,
td.amount
FROM test_data td
join otu_reference o on o.id = td.otu_id
order by td.subject_id, td.amount desc
