<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #333;
	padding: 10px 20px;
	position: fixed;
	margin-top: 0%;
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

.front h1 {
	font-size: 4rem;
	color: #000000;
	margin-left: 20px;
	margin-top: 10px;
	margin-bottom: 0;
	font-family: "Marcellus", serif;
	font-optical-sizing: auto;
	font-weight: 800;
	font-style: normal;
}
.front h3 {
	font-size: 1rem;
	color: #000000;
	margin-left: 25px;
	margin-top: 0;
	margin-bottom: 20px;
	font-family: "Marcellus", serif;
	font-optical-sizing: auto;
	font-weight: 800;
	font-style: normal;
}
.front2 h2{
    font-size: 2rem;
	color: #000000;
	margin: 0 20px;
	text-align: center;
	font-family: "Marcellus", serif;
	font-optical-sizing: auto;
	font-weight: 500;
	font-style: normal;
}

.front2 h3{
    font-size: 3rem;
	color: #000000;
	margin: 0 20px;
	text-align: center;
	font-family: "Marcellus", serif;
	font-optical-sizing: auto;
	font-weight: 600;
	font-style: normal;
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

.container{
    flex:1;
    margin-top: 4%;
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
    color: white;
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
                <a href="/adminprofile" class="navbar-button">Profile</a>
            </div>
            <form action="/logout" method="GET" class="btn btn-danger">
				<a href="logout" type="submit" class="btn">Logout</a>
			</form>
        </nav>
    </div>

    <!-- Main content -->
    <div class="container">
        <div>
            <div class="front">
                <h1>Welcome Admin!</h1>
            </div>
        </div>
        <div class="front2">
            <h2>Explore Your Stats</h2>
            <h3>-Logins for Today -</h3>
        </div>
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
                <a href="/about">About Us</a> |
                <a href="/terms">Terms of Service</a> |
                <a href="/contact">Contact</a>
            </nav>
        </div>
    </footer>
</body>
</html>