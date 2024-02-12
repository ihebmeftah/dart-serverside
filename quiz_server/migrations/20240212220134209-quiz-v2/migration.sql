BEGIN;


--
-- MIGRATION VERSION FOR quiz
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quiz', '20240212220134209-quiz-v2', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240212220134209-quiz-v2', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
