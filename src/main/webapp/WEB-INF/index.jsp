<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="ISO-8859-1">
<title>Expenses</title>
</head>
<body>
	<h1>Save Travels</h1>
	<table>
		<thead>
			<tr>
				<th>Expense</th>
				<th>Vendor</th>
				<th>Amount</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="expense" items="${allExpenses}">
			<tr>
				<td><a href="/show/${expense.id}"><c:out value="${expense.expenseName}"></c:out></a></td>
				<td><c:out value="${expense.vendor}"></c:out></td>
				<td><c:out value="${expense.amount}"></c:out></td>
				<td><a href="/edit/${expense.id}">Edit</a></td>
				<td><%-- <a href="/delete/${expense.id}">Delete</a> --%>
				<form action="/delete/${expense.id}" method="POST">
					<input type="hidden" name="_method" value="delete"/>
					<input type="submit" value="Delete"/>
				</form>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<h2>Add an expense: </h2>
	<form:form action="/create" method="POST" modelAttribute="expense">
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
			<form:label path="description">Description: </form:label>
			<form:errors path="description"/>
			<form:textarea path="description"/>
		</div>
		<input type="submit" value="Create Expense"/>
	</form:form>
	
</body>
</html>