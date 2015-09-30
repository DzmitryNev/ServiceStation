<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>New client</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

</head>
<body>
	<div>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Service Station</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="clients">Clients<span
								class="sr-only">(current)</span></a></li>
						<li><a href="#">Orders</a></li>
					</ul>
					<form:form method="post" commandName="find"
						class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" name="firstName" class="form-control"
								placeholder="First Name"> <input type="text"
								name="lastName" class="form-control" placeholder="Last Name">
						</div>
						<button type="submit" class="btn btn-default">Find</button>
					</form:form>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Link</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div class="container">
		<spring:url value="/orders/${carId}" var="urlOrders" />
		<form:form class="form-horizontal" method="post"
			modelAttribute="order" action="${urlOrder}">
		 	
				<%-- <div class="form-group">
					<form:label path="carId.carId">Car:</form:label>
					<form:label path="carId.carId">${car.carId}</form:label>
					<input name="carId" type="hidden" value="${car.carId}">
				</div>
			 --%>
			<spring:bind path="date">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="date">Date:</form:label>
					<form:input path="date" class="form-control"
						placeholder="yyyy-mm-dd" />
					<form:errors path="date" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="orderAmount">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="orderAmount">Order Amount:</form:label>
					<form:input path="orderAmount" class="form-control"
						placeholder="Order Amount" />
					<form:errors path="orderAmount" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="orderStatus">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label for="sel1">Order Status:</label>
					<form:select class="form-control" id="sel1" path="orderStatus">
						<form:option value="In Progress">In Progress</form:option>
						<form:option value="Completed">Completed</form:option>
						<form:option value="Canceled">Canceled</form:option>
					</form:select>
				</div>
			</spring:bind>
			<button type="submit" class="btn btn-default" data-dismiss="modal">Cancel</button>
			<button type="submit" class="btn btn-primary">Save</button>
		</form:form>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

</body>
</html>