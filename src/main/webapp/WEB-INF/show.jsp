<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Expense Details</title>
</head>
<body>
	<div>
		<h1>Expense Details</h1>
		<a href="/home">Back to Home</a>
	</div>
	<div>
		<p>Expense Name: <c:out value="${expense.expenseName}"></c:out></p>
		<p>Description: <c:out value="${expense.description}"></c:out></p>
		<p>Vendor: <c:out value="${expense.vendor}"></c:out></p>
		<p>Amount Spent: <c:out value="${expense.amount}"></c:out></p>
	</div>
</body>
</html>