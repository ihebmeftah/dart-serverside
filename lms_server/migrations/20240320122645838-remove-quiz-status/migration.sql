BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "quiz" DROP COLUMN "status";

--
-- MIGRATION VERSION FOR lms
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('lms', '20240320122645838-remove-quiz-status', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240320122645838-remove-quiz-status', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240115074239642', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074239642', "timestamp" = now();


COMMIT;
