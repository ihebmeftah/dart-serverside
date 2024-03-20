BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "option" (
    "id" serial PRIMARY KEY,
    "text" text NOT NULL,
    "isCorrect" boolean NOT NULL,
    "question" integer NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "text_unique_idx" ON "option" USING btree ("text");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "question" (
    "id" serial PRIMARY KEY,
    "question" text NOT NULL,
    "additionalInformation" text NOT NULL,
    "quiz" integer NOT NULL,
    "points" integer NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "question_unique_idx" ON "question" USING btree ("question");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "option"
    ADD CONSTRAINT "option_fk_0"
    FOREIGN KEY("question")
    REFERENCES "question"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "question"
    ADD CONSTRAINT "question_fk_0"
    FOREIGN KEY("quiz")
    REFERENCES "quiz"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR lms
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('lms', '20240320111557677-question-option', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240320111557677-question-option', "timestamp" = now();

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
