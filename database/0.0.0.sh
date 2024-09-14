#! /bin/bash

DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="ts-react-express"
DB_USER="postgres"
DB_PASSWORD="postgres"

export PGPASSWORD="$DB_PASSWORD"

echo "DROP DATABASE IF EXISTS \"$DB_NAME\""
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -c "DROP DATABASE IF EXISTS \"$DB_NAME\";" -q

echo "CREATE DATABASE \"$DB_NAME\""
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -c "CREATE DATABASE \"$DB_NAME\";" -q

SQL_FILES=(
    "tables/groups.sql"
    "tables/memberships.sql"
    "tables/passwords.sql"
    "tables/permissions.sql"
    "tables/securables.sql"
    "tables/users.sql"
    "foreignkeys/memberships.sql"
    "foreignkeys/passwords.sql"
    "foreignkeys/permissions.sql"
    "data/securables.sql"
    "data/administrator.sql"
)

for SQL_FILE in "${SQL_FILES[@]}"; do
    echo "psql -f \"$SQL_FILE\""
    psql -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -U "$DB_USER" -f "$SQL_FILE" -q
    if [ $? -ne 0 ]; then
        echo "Failed to execute SQL script: $SQL_FILE"
        exit 1
    fi
done