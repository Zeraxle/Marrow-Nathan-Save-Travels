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
<title>Edit Expense</title>
</head>
<body>
	<div>
		<h1>Edit Expense</h1>
		<a href="/home">Back to Home</a>
	</div>
	<div>
		<form:form action="/update/${expense.id}" method="post" modelAttribute="expense">
			
			<form:input type="hidden" path="id" value="${expense.id}"/>
			<input type="hidden" name="_method" value="put"/>
			<div>
				<form:label path="expenseName">Expense Name: </form:label>
				<form:errors path="expenseName"/>
				<form:input path="expenseName"/>
			</div>
			<div>
				<form:label path="vendor">Vendor: </form:label>
				<form:errors path="vendor"/>
				<form:input path="vendor"/>
			</div>
			<div>
				<form:label path="amount">Amount: </form:label>
				<form:errors path="amount"/>
				<form:input path="amount"/>
			</div>
			<div>
				<form:label path="description">Description</form:label>
				<form:errors path="description"/>
				<form:textarea path="description"/>
			</div>
			<input type="submit" value="update"/>
		</form:form>
	</div>
</body>
</html>