import sqlite3

# Create and connect to a database file
conn = sqlite3.connect("database.db")

# Create a cursor object
cursor = conn.cursor()
# You can now execute SQL commands like CREATE TABLE, INSERT, etc.
