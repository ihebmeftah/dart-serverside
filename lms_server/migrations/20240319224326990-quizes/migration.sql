BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "desc" text,
    "status" text NOT NULL,
    "categoryId" integer NOT NULL,
    "userId" integer NOT NULL,
    "points" integer NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "quiz_name_unique_idx" ON "quiz" USING btree ("name");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "quiz"
    ADD CONSTRAINT "quiz_fk_0"
    FOREIGN KEY("categoryId")
    REFERENCES "category"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "quiz"
    ADD CONSTRAINT "quiz_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "admin"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR lms
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('lms', '20240319224326990-quizes', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240319224326990-quizes', "timestamp" = now();

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
