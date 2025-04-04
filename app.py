from flask import Flask, render_template, redirect, url_for,request, flash
import sqlite3
from appUtils import validate_user,signup_user

app = Flask(__name__)


# Route to redirect to index.html
@app.route('/')
def home():
    return redirect(url_for('index'))

@app.route('/index', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        user = validate_user(email, password)

        if user:
            # flash(f"Welcome {user[1]}! Role: {user[4]}", 'success')
            return render_template('dashboard.html', user=user)
        else:
            # flash("Invalid credentials. Please try again.", 'error')
            return redirect(url_for('signin'))

    return render_template('index.html')


@app.route('/signin', methods=['GET', 'POST'])
def signin():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        user = validate_user(email, password)

        if user:
            # flash(f"Welcome {user[1]}! Role: {user[4]}", 'success')
            return render_template('dashboard.html', user=user)
        else:
            # flash("Invalid credentials. Please try again.", 'error')
            return redirect(url_for('signin'))

    return render_template('signin.html')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        full_name = request.form['fullName']
        email = request.form['email']
        password = request.form['password']
        role = request.form['role']

        flag = signup_user(full_name, email, password, role)

        if(flag):
            return redirect(url_for('signin'))
        else:
            # flash("Email already registered. Try a different one.", 'error')
            return redirect(url_for('signup'))

    return render_template('signup.html')


if __name__ == '__main__':
    app.run(debug=True)