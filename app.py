from flask import Flask, render_template, redirect, url_for,request, flash, session
import sqlite3
from appUtils import validate_user,signup_user,get_restaurants
from functools import wraps


app = Flask(__name__)
app.secret_key = 'MKJHDRTYUiuydfghjosy'  # For managing sessions securely

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'UserID' not in session:
            return redirect(url_for('signin'))
        return f(*args, **kwargs)
    return decorated_function

# Route to redirect to index.html
@app.route('/')
def home():
    return redirect(url_for('index'))


@app.route('/index')
@login_required
def index():
    return render_template('index.html')


@app.route('/signin', methods=['GET', 'POST'])
def signin():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        user = validate_user(email, password)

        if user:
            session['UserID'] = user[0]     # Assuming user[0] is UserID
            session['Role'] = user[4]       # Assuming user[4] is Role
            session['RestaurantID'] = None  # Initialize RestaurantID in session
            # If role is RestaurantOwner, check if they already have a restaurant
            if user[4] == 'RestaurantOwner':
                conn = sqlite3.connect('database.db')
                conn.row_factory = sqlite3.Row
                cursor = conn.cursor()

                cursor.execute("SELECT RestaurantID FROM Restaurants WHERE OwnerID = ?", (user[0],))
                restaurant = cursor.fetchone()
                conn.close()

                if restaurant:
                    session['RestaurantID'] = restaurant['RestaurantID']
                    return redirect(url_for('restaurant_details', restaurant_id=restaurant['RestaurantID']))
                else:
                    return redirect(url_for('add_restaurant'))

            return redirect(url_for('about'))

        else:
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
            flash("This email is already registered..please use different one", "error")
            return redirect(url_for('signup'))

    return render_template('signup.html')

@app.route('/restaurants')
@login_required
def restaurants():
    restaurants = get_restaurants()
    print(restaurants)
    return render_template('restaurants.html', restaurants=restaurants)

@app.route('/restaurant/<int:restaurant_id>/menu')
@login_required
def show_menu(restaurant_id):
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    # Get restaurant name
    cursor.execute("SELECT name FROM Restaurants WHERE restaurantid = ?", (restaurant_id,))
    restaurant = cursor.fetchone()

    # Get menu items for the selected restaurant
    cursor.execute("""
        SELECT * 
        FROM MenuItems 
        WHERE restaurantid = ?
    """, (restaurant_id,))
    menu_items = cursor.fetchall()
    conn.close()

    return render_template('menu.html', restaurant=restaurant, menu_items=menu_items)



# Route to handle cart operations



# Route to display the cart
@app.route('/cart')
@login_required
def cart():
    cart_items = session.get('cart', [])
    total_price = sum(item['price'] * item['quantity'] for item in cart_items)  # Calculate total price
    return render_template('cart.html', cart_items=cart_items, total_price=total_price)

# Route to add an item to the cart


@app.route('/add_to_cart/<int:menu_item_id>', methods=['POST'])
@login_required
def add_to_cart(menu_item_id):
    quantity = int(request.form['quantity'])  # Get the quantity from the form
    cart = session.get('cart', [])
    
    # Fetch item details from the database
    conn = sqlite3.connect('database.db')
    cursor = conn.cursor()
    cursor.execute("SELECT ItemName, Price, RestaurantID FROM MenuItems WHERE MenuItemID = ?", (menu_item_id,))
    menu_item = cursor.fetchone()
    conn.close()
    
    if menu_item:
        item = {
            'menu_item_id': menu_item_id,
            'name': menu_item[0],
            'price': menu_item[1],
            'quantity': quantity,
            'restaurant_id': menu_item[2]
        }
        
        # Check if item already exists in the cart
        item_found = False
        for cart_item in cart:
            if cart_item['menu_item_id'] == menu_item_id:
                cart_item['quantity'] += quantity  # Increase the quantity if item already exists
                item_found = True
                break
        
        if not item_found:
            cart.append(item)  # Add the item if not found
        
        session['cart'] = cart
        flash(f"{menu_item[0]} added to cart", 'success')
    else:
        flash("Item not found", 'error')
    
    return redirect(url_for('cart'))  # Redirect to the cart page

# Route to remove an item from the cart

@app.route('/remove_from_cart/<int:menu_item_id>')
@login_required
def remove_from_cart(menu_item_id):
    cart = session.get('cart', [])
    cart = [item for item in cart if item['menu_item_id'] != menu_item_id]  # Filter out the item
    session['cart'] = cart
    flash('Item removed from cart', 'success')
    return redirect(url_for('cart'))  # Redirect to the cart page

# Route to clear the cart
@app.route('/clear_cart')
@login_required
def clear_cart():
    session.pop('cart', None)  # Remove the cart from session
    flash('Cart cleared', 'success')
    return redirect(url_for('cart'))  # Redirect to the cart page

# Route to place an order
@app.route('/place_order', methods=['POST'])
@login_required
def place_order():
    if 'cart' not in session or not session['cart']:
        flash('Your cart is empty!', 'error')
        return redirect(url_for('cart'))

    cart = session['cart']
    user_id = session.get('UserID')  # Get UserID from session
    restaurant_id = cart[0]['restaurant_id']  # Get restaurant from first cart item
    total_price = sum(item['price'] * item['quantity'] for item in cart)
    
    # Step 1: Insert the order into the Orders table
    conn = sqlite3.connect('database.db')
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO Orders (UserID, RestaurantID, OrderStatus, TotalPrice) 
        VALUES (?, ?, ?, ?)
    """, (user_id, restaurant_id, 'Pending', total_price))
    conn.commit()
    
    # Get the last inserted OrderID
    order_id = cursor.lastrowid
    
    # Step 2: Insert the order details into the OrderDetails table
    for item in cart:
        cursor.execute("""
            INSERT INTO OrderDetails (OrderID, MenuItemID, Quantity, SubTotal)
            VALUES (?, ?, ?, ?)
        """, (order_id, item['menu_item_id'], item['quantity'], item['price'] * item['quantity']))
    
    conn.commit()
    conn.close()
    
    # Step 3: Clear the cart after placing the order
    session.pop('cart', None)
    return redirect(url_for('order_summary', order_id=order_id))


@app.route('/order_summary/<int:order_id>')
@login_required
def order_summary(order_id):
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    # Get order details
    cursor.execute("""
        SELECT o.OrderID, o.OrderDate, o.TotalPrice, r.Name AS RestaurantName
        FROM Orders o
        JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
        WHERE o.OrderID = ?
    """, (order_id,))
    order = cursor.fetchone()

    # Get ordered items
    cursor.execute("""
        SELECT m.ItemName, d.Quantity, d.SubTotal
        FROM OrderDetails d
        JOIN MenuItems m ON d.MenuItemID = m.MenuItemID
        WHERE d.OrderID = ?
    """, (order_id,))
    items = cursor.fetchall()

    conn.close()
    return render_template('order_summary.html', order=order, items=items)

@app.route('/my_orders')
@login_required
def my_orders():
    user_id = session.get('UserID')

    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    # Get all orders for the current user
    cursor.execute("""
        SELECT o.OrderID, o.OrderDate, o.OrderStatus, o.TotalPrice, r.Name AS RestaurantName
        FROM Orders o
        JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
        WHERE o.UserID = ?
        ORDER BY o.OrderDate DESC
    """, (user_id,))
    orders = cursor.fetchall()
    conn.close()

    return render_template('my_orders.html', orders=orders)

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/add_restaurant', methods=['GET', 'POST'])
@login_required
def add_restaurant():
    if session.get('Role') != 'RestaurantOwner':
        return redirect(url_for('dashboard'))

    if request.method == 'POST':
        name = request.form['name']
        address = request.form['address']
        phone = request.form['phone']
        hours = request.form['hours']
        owner_id = session['UserID']

        conn = sqlite3.connect('database.db')
        cursor = conn.cursor()

        # Step 1: Insert into Restaurants
        cursor.execute("""
            INSERT INTO Restaurants (OwnerID, Name, Address, PhoneNumber, OpeningHours)
            VALUES (?, ?, ?, ?, ?)
        """, (owner_id, name, address, phone, hours))
        conn.commit()

        # Step 2: Get the newly created restaurant ID
        restaurant_id = cursor.lastrowid

        # ✅ Store the RestaurantID in session
        session['RestaurantID'] = restaurant_id

        # Step 3: Insert a default review
        cursor.execute("""
            INSERT INTO Reviews (UserID, RestaurantID, Rating, Comment)
            VALUES (?, ?, ?, ?)
        """, (owner_id, restaurant_id, 5, 'Newly listed! Be the first to review.'))
        conn.commit()

        conn.close()

        # Optional: Redirect to restaurant details or menu management
        return redirect(url_for('restaurant_details', restaurant_id=restaurant_id))

    return render_template('add_restaurant.html')


@app.route('/restaurant/<int:restaurant_id>/manage_menu', methods=['GET'])
@login_required
def manage_menu(restaurant_id):
    role = session.get('Role')
    user_id = session.get('UserID')

    # Allow only admins or restaurant owners
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    # Check ownership (only if not admin)
    if role != 'Admin':
        cursor.execute("SELECT * FROM Restaurants WHERE RestaurantID=? AND OwnerID=?", (restaurant_id, user_id))
        if not cursor.fetchone():
            flash("Unauthorized access", "danger")
            return redirect(url_for('about'))

    cursor.execute("SELECT * FROM Restaurants WHERE RestaurantID=?", (restaurant_id,))
    restaurant = cursor.fetchone()

    cursor.execute("SELECT * FROM MenuItems WHERE RestaurantID=?", (restaurant_id,))
    menu_items = cursor.fetchall()
    conn.close()

    return render_template("menu_item_management.html", restaurant=restaurant, menu_items=menu_items)


@app.route('/restaurant/<int:restaurant_id>/add_menu_item', methods=['POST'])
@login_required
def add_menu_item(restaurant_id):
    item_name = request.form['item_name']
    description = request.form.get('description', '')
    price = float(request.form['price'])
    availability = request.form['availability']

    conn = sqlite3.connect('database.db')
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, AvailabilityStatus)
        VALUES (?, ?, ?, ?, ?)
    """, (restaurant_id, item_name, description, price, availability))
    conn.commit()
    conn.close()

    flash("Menu item added successfully!", "success")
    return redirect(url_for('manage_menu', restaurant_id=restaurant_id))


@app.route('/restaurant/<int:restaurant_id>/remove_menu_item/<int:menu_item_id>', methods=['POST'])
@login_required
def remove_menu_item(restaurant_id, menu_item_id):
    conn = sqlite3.connect('database.db')
    cursor = conn.cursor()
    cursor.execute("DELETE FROM MenuItems WHERE MenuItemID = ? AND RestaurantID = ?", (menu_item_id, restaurant_id))
    conn.commit()
    conn.close()

    flash("Menu item removed.", "success")
    return redirect(url_for('manage_menu', restaurant_id=restaurant_id))

@app.route('/restaurant/<int:restaurant_id>/details')
@login_required
def restaurant_details(restaurant_id):
    user_id = session.get('UserID')
    role = session.get('Role')

    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    # Allow only if owner or admin
    if role != 'Admin':
        cursor.execute("SELECT * FROM Restaurants WHERE RestaurantID = ? AND OwnerID = ?", (restaurant_id, user_id))
    else:
        cursor.execute("SELECT * FROM Restaurants WHERE RestaurantID = ?", (restaurant_id,))
    restaurant = cursor.fetchone()

    if not restaurant:
        flash("Unauthorized or restaurant not found.", "danger")
        return redirect(url_for('about'))

    # Get additional info
    cursor.execute("SELECT COUNT(*) FROM MenuItems WHERE RestaurantID = ?", (restaurant_id,))
    menu_count = cursor.fetchone()[0]

    cursor.execute("SELECT ROUND(AVG(Rating), 1) FROM Reviews WHERE RestaurantID = ?", (restaurant_id,))
    avg_rating = cursor.fetchone()[0] or 0.0

    cursor.execute("SELECT Comment FROM Reviews WHERE RestaurantID = ? ORDER BY ReviewDate DESC LIMIT 1", (restaurant_id,))
    latest_review_row = cursor.fetchone()
    latest_review = latest_review_row['Comment'] if latest_review_row else "No reviews yet."

    conn.close()

    return render_template("restaurant_details.html", restaurant=restaurant, menu_count=menu_count, avg_rating=avg_rating, latest_review=latest_review)

@app.route('/restaurant/<int:restaurant_id>/manage_orders')
@login_required
def manage_orders(restaurant_id):
    user_id = session.get('UserID')
    role = session.get('Role')

    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    # Verify access: Admins can see all, owners only their own restaurant
    if role != 'Admin':
        cursor.execute("SELECT * FROM Restaurants WHERE RestaurantID = ? AND OwnerID = ?", (restaurant_id, user_id))
        if not cursor.fetchone():
            flash("Unauthorized access to manage orders.", "danger")
            return redirect(url_for('about'))

    # Get restaurant name
    cursor.execute("SELECT Name FROM Restaurants WHERE RestaurantID = ?", (restaurant_id,))
    restaurant_row = cursor.fetchone()
    if not restaurant_row:
        flash("Restaurant not found.", "danger")
        return redirect(url_for('about'))

    restaurant_name = restaurant_row['Name']

    # Get all orders for this restaurant
    cursor.execute("""
        SELECT o.OrderID, o.UserID, o.OrderStatus, o.OrderDate, o.TotalPrice, u.FullName as CustomerName
        FROM Orders o
        JOIN Users u ON o.UserID = u.UserID
        WHERE o.RestaurantID = ?
        ORDER BY o.OrderDate DESC
    """, (restaurant_id,))
    order_rows = cursor.fetchall()

    # Build order list with their items
    orders = []
    for order in order_rows:
        cursor.execute("""
            SELECT m.ItemName, d.Quantity, d.SubTotal
            FROM OrderDetails d
            JOIN MenuItems m ON d.MenuItemID = m.MenuItemID
            WHERE d.OrderID = ?
        """, (order['OrderID'],))
        items = cursor.fetchall()

        orders.append({
            'OrderID': order['OrderID'],
            'CustomerName': order['CustomerName'],
            'OrderDate': order['OrderDate'],
            'OrderStatus': order['OrderStatus'],
            'TotalPrice': order['TotalPrice'],
            'Items': items
        })

    conn.close()
    return render_template('manage_orders.html', restaurant_name=restaurant_name, orders=orders)


@app.route('/update_order_status/<int:order_id>', methods=['POST'])
@login_required
def update_order_status(order_id):
    current_status = request.form['current_status']
    next_status = 'Preparing' if current_status == 'Pending' else 'Delivered'

    conn = sqlite3.connect('database.db')
    cursor = conn.cursor()
    cursor.execute("UPDATE Orders SET OrderStatus = ? WHERE OrderID = ?", (next_status, order_id))
    conn.commit()
    conn.close()

    flash(f"Order #{order_id} updated to {next_status}.", "success")
    return redirect(request.referrer or url_for('about'))


@app.route('/logout')
@login_required
def logout():
    session.clear()
    return redirect(url_for('signin'))


if __name__ == '__main__':
    app.run(debug=True)