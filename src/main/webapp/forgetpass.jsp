<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forget Password</title>
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
/* Basic reset and styling */
body {
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
	background: linear-gradient(to bottom, #C0FF5A, #00F5A0);
}

.container {
	display: flex;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	width: 50%;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.header {
	position: fixed;
	top: 0;
	font-size: 5em;
	color: #333;
	margin: 20px;
	font-family: "Marcellus", serif;
	font-weight: 400;
	font-style: normal;
	text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.form-section {
	flex: 1;
	padding: 20px;
}

.form-section h2 {
	font-size: 2rem;
	color: #333;
	margin: 10px;
	text-align: center;
	font-family: "Parkinsans", sans-serif;
	font-optical-sizing: auto;
	font-weight: 700;
	font-style: normal;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	font-size: 14px;
	color: #555;
	margin-bottom: 5px;
}

.form-group input[type="email"], .form-group input[type="tel"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.role-options {
	display: flex;
	gap: 15px;
	margin-bottom: 15px;
}

.role-options label {
	font-size: 14px;
	color: #555;
}

.remember-forgot {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 14px;
	margin-bottom: 15px;
}

.remember-forgot input[type="checkbox"] {
	margin-right: 5px;
}

.submit-button {
	width: 100%;
	padding: 10px;
	background-color: #3366ff;
	color: #fff;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
}

.signup-link {
	text-align: center;
	margin-top: 10px;
	font-size: 14px;
	color: #3366ff;
}

.signup-link a {
	color: #3366ff;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="header">Skill Bridge</div>
	<div class="container">
		<div class="form-section">
			<h2>Reset Password</h2>
			<form action="otpverification" method="post">

				<div class="form-group">
					<label for="mob.">Mob. No.</label> <input type="tel" id="mob."
						name="mob." required>
				</div>

				<div class="form-group">
					<label for="email">Enter Email</label> <input type="email"
						id="email" name="email" required>
				</div>


				<!-- Submit button -->
				<button type="submit" class="submit-button">SUBMIT</button>
			</form>
		</div>
	</div>
</body>
</html>