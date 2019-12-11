<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
.content {
	margin: 20px auto;
	padding: 20px 10px 35px;
	display: flex;
	flex-direction: column;
	align-items: center;
}
table {
  border-collapse: collapse;
  margin: 10px auto 20px;
  background-color: #fff;
}

table, th, td {
  border: 1px solid black;
  padding: 5px;
  text-align:left;
}

select {
	font-size: 1em;
}

.btn {
	font-size: 0.9em;
	background-color: #a3ffbc;
	border: 1px solid #999;
	border-radius: 5px;
	color: black;
	text-decoration: none;
	padding: 5px 8px;
	cursor: pointer;
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
</style>
<title>Online Retail | Products</title>
</head>
<body>
	<h1>All Products in the '<%= request.getParameter("category") %>' Category</h1>
	<c:choose>
	<c:when test="${ not empty product_by_cat_list }">
	<table>
		<tr>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Add to Cart</th>
		</tr>
		<c:forEach var="product" items="${ product_by_cat_list }">
			<tr>
				<form method="POST" action="addproduct/${ product.name }">
				<td>${ product.name }</td>
				<td>${ product.price }</td>
				<td>
					<select name="p_qty" required>
						<option value="" selected disabled>Select Qty.</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</td>
				<td><input class="btn" type="submit" value="Add to Cart"></td>
				</form>
				
				
			</tr>
		</c:forEach>
	</table>
	</c:when>
	<c:otherwise>
		<h2>No Products in this Category :(</h2>
	</c:otherwise>
	</c:choose>
	<a class="btn2" href="/OnlineRetail">Home</a>
</body>
</html>