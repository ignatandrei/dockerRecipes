create database tests;

\c tests;

;
create table IF NOT EXISTS test(
	"id" INTEGER NOT NULL,
	"name" VARCHAR(200) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Department" (
	"IDDepartment" SERIAL NOT NULL,
	"Name" VARCHAR(50) NOT NULL,
	PRIMARY KEY ("IDDepartment"),
CONSTRAINT "FKDep" FOREIGN KEY ("IDDepartment") REFERENCES "public"."Department" ("IDDepartment") ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "Employee" (
	"IDEmployee"  SERIAL NOT NULL,
	"Name" VARCHAR NOT NULL,
	"IDDepartment" INTEGER NOT NULL,
	PRIMARY KEY ("IDEmployee")
);

INSERT INTO "public"."Department" ("Name") VALUES ('IT');
INSERT INTO "public"."Department" ("Name") VALUES ('HR');
