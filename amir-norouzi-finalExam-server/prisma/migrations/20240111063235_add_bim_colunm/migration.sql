/*
  Warnings:

  - Added the required column `bmi` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullname" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "gender" TEXT NOT NULL,
    "height" INTEGER NOT NULL,
    "weight" INTEGER NOT NULL,
    "time" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ip" TEXT NOT NULL,
    "bmi" REAL NOT NULL
);
INSERT INTO "new_Users" ("age", "fullname", "gender", "height", "id", "ip", "time", "weight") SELECT "age", "fullname", "gender", "height", "id", "ip", "time", "weight" FROM "Users";
DROP TABLE "Users";
ALTER TABLE "new_Users" RENAME TO "Users";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
