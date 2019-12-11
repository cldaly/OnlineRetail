<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
</style>
<title>Online Retail | View Cart</title>
</head>
<body>
<h1>Your Cart</h1>
	
	<c:choose>
	<c:when test="${fn:length(cartlist) > 0}">
		<table>
		<tr>
			<th>Name</th>
			<th>Quantity</th>
			<th>Price</th>
		</tr>
		<c:set var="total" value="0"/>
		<c:forEach var="cart" items="${ cartlist }">
			<tr>
				<td>${ cart.p_name }</td>
				<td>${ cart.p_qty }</td>
				<td>${ cart.total_p_price }</td>
			</tr>
			<c:set var="total" value="${total + cart.total_p_price}" />
		</c:forEach>
		<tr>
			<td colspan="2">Cart Total</td>
			<td>${total }</td>
		</tr>
	</table>
	<a class="btn" href="placeOrder">Place Order</a>
	</c:when>
	<c:otherwise>
		<h2>Your Cart is Empty :(</h2>
	</c:otherwise>
	</c:choose>
	<a class="btn2" href="/OnlineRetail">Home</a>
	
</body>
</html>