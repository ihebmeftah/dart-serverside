BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "quiz" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "status" integer NOT NULL,
    "userId" integer NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "quiz_name_idx" ON "quiz" USING btree ("name");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" serial PRIMARY KEY,
    "userInfoId" integer NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "user" USING btree ("userInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "quiz"
    ADD CONSTRAINT "quiz_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR quiz
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quiz', '20240227093827424', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240227093827424', "timestamp" = now();

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
