<%@page import="com.example.Skill_bridge.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
    User u = (User) session.getAttribute("u"); 
    if (u == null) {
        // Handle the case where the user object is not in the session (e.g., redirect to login)
        response.sendRedirect("/studentprofile");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Skill Bridge</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Marcellus&family=Outfit:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Slab:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Parkinsans:wght@300..800&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	margin: 0px;
	background: linear-gradient(to bottom, #C0FF5A, #00F5A0);
	box-sizing: border-box;
	height: 100%;
}

.container {
	display: flex;
	max-width: 1200px;
	flex: 1;
	margin: 80px;
	margin-bottom: 30px;
	background-color: #fff;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.sidebar {
	background-color: #f7f7f7;
	padding: 30px;
	width: 25%;
	text-align: center;
}

.sidebar img {
	border-radius: 50%;
	width: 100px;
	height: 100px;
}

.sidebar h2 {
	font-size: 20px;
	margin: 10px 0;
}

.sidebar p {
	font-size: 14px;
	color: #777;
}

.form-container {
	display: flex;
	padding: 30px;
	width: 75%;
}

.form-section {
	flex: 1;
	margin-right: 20px;
}

.form-section:last-child {
	margin-right: 0;
}

.form-section h2 {
	font-size: 18px;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-size: 14px;
	color: #555;
}

.form-group input, .form-group textarea, .form-group select {
	width: 100%;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 4px;
	outline: none;
}

.form-group input:focus, .form-group textarea:focus, .form-group select:focus
	{
	border-color: #6a1b9a;
}

.btn-save {
	display: inline-block;
	padding: 10px 20px;
	background-color: #6a1b9a;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
}

.btn-save:hover {
	background-color: #4a1073;
}

.footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	position: relative; /* or use 'fixed' if you want it always visible */
	bottom: 0;
	width: 100%;
}

.footer-content {
	max-width: 1200px;
	margin: auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
}

.footer-content nav a {
	color: #fff;
	text-decoration: none;
	margin: 0 10px;
}

.footer-content nav a:hover {
	text-decoration: underline;
}
/* Centered buttons */
.navbar-buttons {
	display: flex;
	gap: 20px;
}

.navbar-button {
	color: white;
	text-decoration: none;
	font-size: 16px;
	padding: 10px 20px;
	background-color: transparent;
	border: 1px solid transparent;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.navbar-button:hover {
	background-color: #555;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #333;
	padding: 10px 20px;
	position: fixed;
	margin-top: 0;
	width: 100%;
	z-index: 1000;
}

.logo h3 {
	font-size: 2rem;
	color: #f5f5f5;
	margin: 0 20px;
	text-align: center;
	font-family: "Marcellus", serif;
	font-optical-sizing: auto;
	font-weight: 700;
	font-style: normal;
}
.btn-danger {
	color: white;
	text-decoration: none;
	font-size: 16px;
	padding: 10px 20px;
	background-color: #333;
	border: 1px solid white;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	margin-right: 80px;
}

.btn-danger:hover {
	background-color: #555;
}
a.btn {
    color: white; /* Set the desired text color */
    text-decoration: none; /* Remove underline */
}

a.btn:visited {
    color: white; /* Prevent color change after clicking */
}
</style>
</head>
<body>
	<!-- Navbar -->
	<div>
		<nav class="navbar">
			<div class="logo">
				<h3>Skill Bridge</h3>
			</div>
			<div class="navbar-buttons">
				<a href="/homeprof" class="navbar-button">Home</a> <a
					href="/progress" class="navbar-button">Progress</a>
			</div>
			<form action="/logout" method="GET" class="btn btn-danger">
				<a href="logout" type="submit" class="btn">Logout</a>
			</form>
		</nav>
	</div>
	<div class="container">
		<div class="sidebar">
			<img src="https://via.placeholder.com/100" alt="Profile Picture">
			<h2>Edogaru</h2>
			<p>edogaru@mail.com.my</p>
		</div>
		<div class="form-container">
			<div class="form-section">
				<h2>Profile Settings</h2>
				<form>
					<div class="form-group">
						<label for="first-name">Name</label> <input type="text"
							id="first-name" placeholder="First name">
					</div>
					<div class="form-group">
						<label for="last-name">Surname</label> <input type="text"
							id="last-name" placeholder="Surname">
					</div>
					<div class="form-group">
						<label for="phone">Mobile Number</label> <input type="tel"
							id="phone" placeholder="Enter phone number">
					</div>
					<div class="form-group">
						<label for="address-line1">Address Line 1</label> <input
							type="text" id="address-line1" placeholder="Enter address line 1">
					</div>
					<div class="form-group">
						<label for="address-line2">Address Line 2</label> <input
							type="text" id="address-line2" placeholder="Enter address line 2">
					</div>
					<div class="form-group">
						<label for="postcode">Postcode</label> <input type="text"
							id="postcode" placeholder="Enter postcode">
					</div>
					<div class="form-group">
						<label for="state">State</label> <input type="text" id="state"
							placeholder="Enter state">
					</div>
					<div class="form-group">
						<label for="area">Area</label> <input type="text" id="area"
							placeholder="Enter area">
					</div>
					<div class="form-group">
						<label for="email">Email ID</label> <input type="email" id="email"
							placeholder="Enter email ID">
					</div>
					<div class="form-group">
						<label for="education">Education</label> <input type="text"
							id="education" placeholder="Education">
					</div>
					<div class="form-group">
						<label for="country">Country</label> <input type="text"
							id="country" placeholder="Country">
					</div>
					<div class="form-group">
						<label for="region">State/Region</label> <input type="text"
							id="region" placeholder="State/Region">
					</div>
					<button type="button" class="btn-save">Save Profile</button>
				</form>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="footer">
		<div class="footer-content">
			<p>&copy; 2024 Skill Bridge. All Rights Reserved.</p>
			<nav>
				<a href="/about">About Us</a> | <a href="/terms">Terms of
					Service</a> | <a href="/contact">Contact</a>
			</nav>
		</div>
	</footer>
</body>
</html>