BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "category" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "desc" text NOT NULL,
    "userId" integer NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "category_name_unique_idx" ON "category" USING btree ("name");

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
-- MIGRATION VERSION FOR lms
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('lms', '20240317153108614', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240317153108614', "timestamp" = now();

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
