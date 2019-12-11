<%@ page import="org.apache.commons.codec.binary.Base64, sun.misc.BASE64Encoder" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

img {
	max-width: 100px;
	height: auto;
}
</style>
<title>Online Retail | View Products</title>
</head>
<body>
<h1>All Products</h1>
<div class="content">
	<c:choose>
	<c:when test="${ not empty productlist }">
	<table>
		<tr>
			<th>Name</th>
			<th>Price</th>
			<th>Category</th>
			<th>Image</th>
		</tr>
		<c:forEach var="product" items="${ productlist }">
			<tr>
				<td>${ product.name }</td>
				<td>${ product.price }</td>
				<td>${ product.category }</td>
				<c:set var="i" value="${ product.image }"></c:set>
				<%! String image; %>
				<% 
				byte[] b = (byte[]) pageContext.getAttribute("i"); 
				BASE64Encoder base64Encoder = new BASE64Encoder();
				StringBuilder imageString = new StringBuilder();
				imageString.append("data:image/png;base64,");
				imageString.append(base64Encoder.encode(b));
				image = imageString.toString();
				System.out.println(image);
				%>
				<td><img alt="${ product.name }" src="<%= image %>"></td>
			</tr>
		</c:forEach>
	</table>
	</c:when>
	<c:otherwise>
		<h3>No Products Have Been Added :(</h3>
	</c:otherwise>
	</c:choose>
	<a class="btn2" href="/OnlineRetail">Back</a>
</div>
</body>
</html>