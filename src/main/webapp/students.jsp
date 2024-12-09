<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mentors</title>
    <link href="https://fonts.googleapis.com/css2?family=Marcellus&family=Outfit:wght@300..900&display=swap" rel="stylesheet">
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

        .container {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #333;
            margin: 80px;
            margin-bottom: 40px;
        }

        .mentor-card {
            display: flex;
            align-items: center;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 20px;
            overflow: hidden;
        }

        .mentor-image {
            flex-shrink: 0;
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
            border: 3px solid #00F5A0;
        }

        .mentor-details {
            display: flex;
            flex-direction: column;
        }

        .mentor-name {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .mentor-specialty,
        .mentor-availability,
        .mentor-rate {
            font-size: 1rem;
            color: #555;
            margin-bottom: 5px;
        }

        .mentor-rate {
            font-weight: bold;
        }

        @media (max-width: 768px) {
            .mentor-card {
                flex-direction: column;
                align-items: flex-start;
            }

            .mentor-image {
                margin-bottom: 15px;
            }
        }
        .footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    position: relative; //* or use 'fixed' if you want it always visible */
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
                <a href="/homeprof" class="navbar-button">Home</a>
                <a href="/progress" class="navbar-button">Progress</a>
                <a href="/studentprofile" class="navbar-button">Profile</a>
            </div>
            <div class="dropdown">
                <button class="dropdown-btn">More</button>
                <div class="dropdown-content">
                    <a href="/settings">Settings</a>
                    <a href="/logout">Logout</a>
                </div>
            </div>
        </nav>
    </div>
    <div class="container">
        <h1>- Check Up With Your Students -</h1>

        <!-- Mentor 1 -->
        <div class="mentor-card">
            <img src="https://img.freepik.com/free-photo/smiling-mature-man-white-background_53876-112543.jpg" alt="Mentor 1" class="mentor-image">
            <div class="mentor-details">
                <div class="mentor-name">John Doe</div>
                <div class="mentor-specialty">Specialty: Data Science</div>
                <div class="mentor-availability">Availability: Mon-Fri, 9am-5pm</div>
                <div class="mentor-rate">Rate: $50/hour</div>
            </div>
        </div>

        <!-- Mentor 2 -->
        <div class="mentor-card">
            <img src="https://img.freepik.com/free-photo/portrait-smiling-young-woman_58466-12520.jpg" alt="Mentor 2" class="mentor-image">
            <div class="mentor-details">
                <div class="mentor-name">Jane Smith</div>
                <div class="mentor-specialty">Specialty: Web Development</div>
                <div class="mentor-availability">Availability: Sat-Sun, 10am-4pm</div>
                <div class="mentor-rate">Rate: $60/hour</div>
            </div>
        </div>

        <!-- Mentor 3 -->
        <div class="mentor-card">
            <img src="https://img.freepik.com/free-photo/handsome-man-isolated-white_1368-87859.jpg" alt="Mentor 3" class="mentor-image">
            <div class="mentor-details">
                <div class="mentor-name">Michael Lee</div>
                <div class="mentor-specialty">Specialty: AI & ML</div>
                <div class="mentor-availability">Availability: Flexible</div>
                <div class="mentor-rate">Rate: $75/hour</div>
            </div>
        </div>

        <!-- Mentor 4 -->
        <div class="mentor-card">
            <img src="https://img.freepik.com/free-photo/portrait-happy-young-asian-woman-standing-isolated_171337-16656.jpg" alt="Mentor 4" class="mentor-image">
            <div class="mentor-details">
                <div class="mentor-name">Emily Chen</div>
                <div class="mentor-specialty">Specialty: Digital Marketing</div>
                <div class="mentor-availability">Availability: Weekdays, 1pm-7pm</div>
                <div class="mentor-rate">Rate: $40/hour</div>
            </div>
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
