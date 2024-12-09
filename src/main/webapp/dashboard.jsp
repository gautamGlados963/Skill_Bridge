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
.front2 h2 {
	font-size: 2rem;
	color: #000000;
	margin-top: 80px;
	text-align: center;
	font-family: "Marcellus", serif;
	font-optical-sizing: auto;
	font-weight: 500;
	font-style: normal;
}

.front2 h3 {
	font-size: 3rem;
	color: #000000;
	margin: 0 20px;
	text-align: center;
	font-family: "Marcellus", serif;
	font-optical-sizing: auto;
	font-weight: 600;
	font-style: normal;
}

.footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	width: 100%;
	padding: 10px;
	bottom: 0;
	position: relative; /* Removes any positioning from previous styles */
	margin-top: auto;
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

/* Dropdown menu */
.dropdown {
	position: relative;
}

.dropdown-btn {
	color: white;
	background-color: transparent;
	border: none;
	font-size: 16px;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.dropdown-btn:hover {
	background-color: #555;
}

.dropdown-content {
	display: none;
	position: absolute;
	right: 0;
	background-color: #333;
	min-width: 160px;
	z-index: 1;
	border-radius: 5px;
	margin-top: 10px;
}

.dropdown-content a {
	color: white;
	text-decoration: none;
	padding: 12px 16px;
	display: block;
}

.dropdown-content a:hover {
	background-color: #555;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #333;
	padding: 10px 20px;
	position: fixed;
	margin-top: 0;
	margin-bottom: 20px;
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

.card {
	display: inline-block;
	width: 30%;
	margin: 10px;
	padding: 20px;
	text-align: center;
	border-radius: 8px;
	background: #0d70cb;
	color: white;
}

.card h2 {
	font-size: 2.5em;
	margin: 10px 0;
}

.card p {
	font-size: 1.2em;
}

.dashboard {
	width: 80%;
	display: flex;
	margin: 80px auto;
	padding: 20px;
	background: white;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
				<a href="/homeadmin" class="navbar-button">Home</a> <a
					href="/adminprofile" class="navbar-button">Profile</a>
			</div>
			<div class="dropdown">
				<button class="dropdown-btn">More</button>
				<div class="dropdown-content">
					<a href="/settings">Settings</a> <a href="/logout">Logout</a>
				</div>
			</div>
		</nav>
	</div>
	
	
	<div class="front2">
		<h2>Explore Your Stats</h2>
		<h3><%= u.getName() %>'s Dashboard
		</h3>
	</div>
	<div class="dashboard">
		<div class="card">
			<h2>${totalMentors}</h2>
			<p>Total Mentors</p>
		</div>
		<div class="card">
			<h2>${totalStudents}</h2>
			<p>Total Students</p>
		</div>
		<div class="card">
			<h2>${totalSessions}</h2>
			<p>Total Sessions Booked</p>
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