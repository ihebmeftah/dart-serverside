BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "admin" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "admin" (
    "id" serial PRIMARY KEY,
    "userInfoId" integer NOT NULL,
    "password" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "admin_info_id_unique_idx" ON "admin" USING btree ("userInfoId", "id");

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
    "password" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "player_info_id_unique_idx" ON "player" USING btree ("userInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "admin"
    ADD CONSTRAINT "admin_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
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
    VALUES ('lms', '20240329163637133', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240329163637133', "timestamp" = now();

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
