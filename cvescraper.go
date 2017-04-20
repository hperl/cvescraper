package main

import (
	"database/sql"
	"encoding/csv"
	"flag"
	"io"
	"log"
	"os"

	"github.com/lib/pq"
)

var InsertCveSql = `INSERT INTO cves
		(id, type, published, updated, score, gained_access_level, access, complexity, authentication, conf, integ, avail)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12);`

func createTable(db *sql.DB) error {
	_, err := db.Exec(
		`CREATE TABLE IF NOT EXISTS cves (
			id text primary key,
			type text,
			published date,
			updated date,
			score real,
			gained_access_level text,
			access text,
			complexity text,
			authentication text,
			conf text,
			integ text,
			avail text
		);
		CREATE UNIQUE INDEX cves_id_idx ON cves (id);
		`,
	)
	return err
}

func dropTable(db *sql.DB) error {
	_, err := db.Exec(`
		DROP TABLE IF EXISTS cves;
		DROP INDEX IF EXISTS cves_id_idx;
		`,
	)
	return err
}

func main() {
	var (
		record   []string
		dbname   = flag.String("dbname", "ghtest", "Database name")
		create   = flag.Bool("create", false, "Whether to create the `cves` table")
		recreate = flag.Bool("recreate", false, "Like create but drop first")
	)
	flag.Parse()

	// open db
	db, err := sql.Open(
		"postgres",
		os.Getenv("DB_URL")+*dbname,
	)
	if err != nil {
		panic(err)
	}

	// handle flags
	if *recreate {
		if err := dropTable(db); err != nil {
			panic(err)
		}
		*create = true
	}
	if *create {
		if err := createTable(db); err != nil {
			panic(err)
		}
	}

	file, err := os.Open("all_data.csv")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	for r := csv.NewReader(file); err == nil; record, err = r.Read() {
		if len(record) <= 14 {
			log.Printf("Incomplete record: %v\n", record)
			continue
		}
		if _, dbErr := db.Exec(InsertCveSql,
			record[1],
			record[4],
			record[5],
			record[6],
			record[7],
			record[8],
			record[9],
			record[10],
			record[11],
			record[12],
			record[13],
			record[14],
		); dbErr != nil {
			if pgErr, ok := dbErr.(*pq.Error); ok {
				if pgErr.Code.Class().Name() == "integrity_constraint_violation" {
					continue
				}
			}
			log.Fatalf("Error saving %v -- %v\n", record, dbErr)
		}

	}
	if err != io.EOF {
		panic(err)
	}

}
