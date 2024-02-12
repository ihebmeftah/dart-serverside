BEGIN;

--
-- ACTION ALTER TABLE
--
DROP INDEX "quiz_name_idx";
CREATE UNIQUE INDEX "quiz_name_idx" ON "quiz" USING btree ("name");

--
-- MIGRATION VERSION FOR quiz
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quiz', '20240212231415760-quiz-name-unique', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240212231415760-quiz-name-unique', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
