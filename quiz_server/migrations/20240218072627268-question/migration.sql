BEGIN;


--
-- MIGRATION VERSION FOR quiz
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quiz', '20240218072627268-question', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240218072627268-question', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
