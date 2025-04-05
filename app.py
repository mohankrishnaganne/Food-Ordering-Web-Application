from flask import Flask, render_template, redirect, url_for,request, flash
import sqlite3
from appUtils import validate_user,signup_user,get_restaurants

app = Flask(__name__)


# Route to redirect to index.html
@app.route('/')
def home():
    return redirect(url_for('index'))

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

@app.route('/index')
def index():
    return render_template('index.html')


@app.route('/signin', methods=['GET', 'POST'])
def signin():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        user = validate_user(email, password)

        if user:
            # flash(f"Welcome {user[1]}! Role: {user[4]}", 'success')
            return redirect(url_for('restaurants'))
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
            return redirect(url_for('signup'))

    return render_template('signup.html')

@app.route('/restaurants')
def restaurants():
    restaurants = get_restaurants()
    print(restaurants)
    return render_template('restaurants.html', restaurants=restaurants)

@app.route('/restaurant/<int:restaurant_id>/menu')
def show_menu(restaurant_id):
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    # Get restaurant name
    cursor.execute("SELECT name FROM Restaurants WHERE restaurantid = ?", (restaurant_id,))
    restaurant = cursor.fetchone()

    # Get menu items for the selected restaurant
    cursor.execute("""
        SELECT ItemName, description, price 
        FROM MenuItems 
        WHERE restaurantid = ?
    """, (restaurant_id,))
    menu_items = cursor.fetchall()
    conn.close()

    return render_template('menu.html', restaurant=restaurant, menu_items=menu_items)


if __name__ == '__main__':
    app.run(debug=True)