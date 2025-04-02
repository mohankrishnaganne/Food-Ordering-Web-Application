from flask import Flask, render_template, redirect, url_for
import sqlite3

app = Flask(__name__)

# Route to redirect to index.html
@app.route('/')
def home():
    return redirect(url_for('index'))

@app.route('/index')
def index():
    # Connect to the database
    conn = sqlite3.connect('database.db')  # Replace 'database.db' with your database file
    cursor = conn.cursor()

    # Fetch data from Users table
    cursor.execute("SELECT * FROM Users")
    users = cursor.fetchall()

    # Close the connection
    conn.close()

    # Render index.html and pass the data
    return render_template('index.html', users=users)

if __name__ == '__main__':
    app.run(debug=True)