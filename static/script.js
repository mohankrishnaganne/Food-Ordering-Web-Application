function validateLogin() {
    let email = document.getElementById("email").value;
    let password = document.getElementById("password").value;

    if (email === "" || password === "") {
        alert("Please enter both email and password.");
        return false;
    }

    // Simple validation (You can replace it with backend authentication)
    if (email === "test@food.com" && password === "password123") {
        alert("Login Successful!");
        return true;
    } else {
        alert("Invalid email or password.");
        return false;
    }
}


function validateSignup() {
    let fullName = document.getElementById("fullName").value;
    let email = document.getElementById("email").value;
    let password = document.getElementById("password").value;
    let role = document.getElementById("role").value;

    if (fullName === "" || email === "" || password === "" || role === "") {
        alert("All fields are required.");
        return false;
    }

    if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        return false;
    }

    alert("Sign-up successful!");
    return true;
}
