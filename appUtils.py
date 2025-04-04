from werkzeug.security import generate_password_hash, check_password_hash
import sqlite3


def get_db_connection():
    """Establish a connection to the SQLite database."""
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row  # Makes fetching results easier
    return conn

def validate_user(email, password):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Users WHERE Email = ?", (email,))
    user = cursor.fetchone()
    conn.close()
    if user and check_password_hash(user["PasswordHash"], password):  # Verify hash
        return user  # Return user data if password matches
    return None


def signup_user(full_name, email, password, role):
    """Insert a new user into the database and handle duplicates."""
    conn = get_db_connection()
    cursor = conn.cursor()

    hashed_password = generate_password_hash(password)  # Hash password before storing
    try:
        cursor.execute("INSERT INTO Users (FullName, Email, PasswordHash, Role) VALUES (?, ?, ?, ?)",
                           (full_name, email, hashed_password, role))
        conn.commit()
        return True
    except sqlite3.IntegrityError:  # Email already exists
        return False
    finally:
        conn.close()

