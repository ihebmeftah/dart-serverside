BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "status" integer NOT NULL
);

-- Indexes
CREATE INDEX "quiz_name_idx" ON "quiz" USING btree ("name");


--
-- MIGRATION VERSION FOR quiz
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quiz', '20240212215940941-quiz', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240212215940941-quiz', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
