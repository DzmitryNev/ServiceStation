<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Clients</title>
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
					<form:form method="get" action="clients"
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
	<h2>Clients</h2>
	
		<spring:url value="/clients/add" var="urlNewClient" />
		<button class="btn btn-primary" onclick="location.href='${urlNewClient}'">New
			client</button>
		<div class="row">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>#</th>
						<th>First name</th>
						<th>Last name</th>
						<th>Date of Birth</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${clients}" var="client" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${client.firstName}</td>
							<td>${client.lastName}</td>
							<td>${client.dateOfBirth}</td>
							<td><spring:url value="/cars/${client.clientId}"
									var="carsUrl" />
								<button class="btn btn-info"
									onclick="location.href='${carsUrl}'">View</button>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<div></div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

</body>
</html>