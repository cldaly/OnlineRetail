<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
<style type="text/css">
body {
	background-color: #fffbf0;
	font-family: 'Montserrat', sans-serif;
	align-items: center;
	text-align: center;
	margin: 0 auto;
}
h1 {
	font-size: 2.5em;
}
h2 {
	font-size: 1.75em;
}
.content {
	margin: 20px auto;
	padding: 20px 10px 35px;
}
.btn {
	font-size: 1em;
	background-color: #a3ffbc;
	border: 1px solid #999;
	border-radius: 5px;
	color: black;
	margin: 20px 10px;
	text-decoration: none;
	padding: 5px 10px;
}

.btn2 {
	font-size: 1em;
	background-color: #9ee8ff;
	border: 1px solid #999;
	border-radius: 5px;
	color: black;
	margin: 20px 10px;
	text-decoration: none;
	padding: 5px 10px;
}
select {
	font-size: 1em;
}
</style>
<title>Online Retail | Home</title>
</head>
<body>
	<h1>Online Retail Center</h1>
	
	<div class="content">
		<h2>Products Center</h2>
		<div>
			<a class="btn" href="add">Add New Product</a>
			<a class="btn2" href="view">View All Products</a>
		</div>
	</div>
	<div class="content">
		<h2>Your Cart</h2>
		<div>
			<form method="GET" action="search">
				<select name="category">
					<option value="Shoes">Shoes</option>
					<option value="Watches">Watches</option>
					<option value="Hats">Hats</option>
					<option value="Shirts">Shirts</option>
					<option value="Pants">Pants</option>
				</select>
				<input class="btn" type="submit" value="Search" />
			</form>
			<a class="btn2" href="viewCart">View Cart</a>
		</div>
	</div>
</body>
</html>