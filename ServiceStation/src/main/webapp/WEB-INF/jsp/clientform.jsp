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
						<li class="active"><a href="/ServiceStation/clients">Clients<span
								class="sr-only">(current)</span></a></li>
						<li><a href="#">Orders</a></li>
					</ul>
					<form:form method="get" action="/ServiceStation/clients"
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
		<spring:url value="/clients" var="urlClients" />
		<form:form class="form-horizontal" method="post"
			modelAttribute="client" action="${urlClients}">
			<spring:bind path="firstName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="firstName">First Name:</form:label>
					<form:input path="firstName" class="form-control"
						placeholder="First Name" />
					<form:errors path="firstName" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="lastName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="lastName">Last Name:</form:label>
					<form:input path="lastName" class="form-control"
						placeholder="Last Name" />
					<form:errors path="lastName" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="dateOfBirth">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="dateOfBirth">Date of birth:</form:label>
					<form:input path="dateOfBirth" class="form-control"
						placeholder="Date of birth" />
					<form:errors path="dateOfBirth" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="address">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="address">Address:</form:label>
					<form:input path="address" class="form-control"
						placeholder="Address" />
					<form:errors path="address" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="phone">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="phone">Phone:</form:label>
					<form:input path="phone" class="form-control" placeholder="Phone" />
					<form:errors path="phone" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="email">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="email">Email:</form:label>
					<form:input path="email" class="form-control" placeholder="Email" />
					<form:errors path="email" cssclass="error"></form:errors>
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