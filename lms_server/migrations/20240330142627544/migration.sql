BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "category" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "category" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "desc" text NOT NULL,
    "userId" integer NOT NULL,
    "nbQuiz" integer NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "category_name_unique_idx" ON "category" USING btree ("name");

--
-- ACTION DROP TABLE
--
DROP TABLE "player" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "player" (
    "id" serial PRIMARY KEY,
    "userInfoId" integer NOT NULL,
    "password" text NOT NULL,
    "rank" json NOT NULL,
    "nbQuizDone" integer NOT NULL,
    "totalPoints" integer NOT NULL,
    "sound" boolean NOT NULL,
    "notification" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "player_info_id_unique_idx" ON "player" USING btree ("userInfoId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "rank" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "min" integer NOT NULL,
    "max" integer NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "rank_unique_idx" ON "rank" USING btree ("name", "min", "max");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "category"
    ADD CONSTRAINT "category_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "admin"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "player"
    ADD CONSTRAINT "player_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR lms
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('lms', '20240330142627544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240330142627544', "timestamp" = now();

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
