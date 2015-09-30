<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Client</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">

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
						<li class="active"><a href="/ServiceStation/clients">Clients</a></li>
						<li><a href="#">Orders</a></li>
					</ul>
					<form:form method="get" action="find"
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
		<h2>Client</h2>
		<div class="row">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>First name</th>
						<th>Last name</th>
						<th>Date of Birth</th>
						<th>phone</th>
						<th>email</th>
						<th>address</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${client.firstName}</td>
						<td>${client.lastName}</td>
						<td>${client.dateOfBirth}</td>
						<td>${client.phone}</td>
						<td>${client.email}</td>
						<td>${client.address}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<h3>Cars</h3>
		<div>
			<spring:url value="/cars/${client.clientId}/add" var="urlNewCar" />
			<button class="btn btn-info" onclick="location.href='${urlNewCar}'">New
				car</button>
		</div>

		<div class="row">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>#</th>
						<th>Year</th>
						<th>Make</th>
						<th>Model</th>
						<th>VIN</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cars}" var="car" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${car.modelYearId.yearId.year}</td>
							<td>${car.modelYearId.modelId.makeId.make}</td>
							<td>${car.modelYearId.modelId.model}</td>
							<td>${car.vin}</td>
							<td><spring:url value="/orders/${car.carId}" var="carUrl" />
								<spring:url value="/cars/${car.carId}/delete" var="deleteUrl" />
								<spring:url value="/cars/${car.carId}/update" var="updateUrl" />

								<button class="btn btn-info" onclick="location.href='${carUrl}'">View
									order</button>
								<button class="btn btn-primary"
									onclick="location.href='${updateUrl}'">Edit</button>
								<form action="${deleteUrl}" method="post">
									<button type="submit" class="btn btn-danger">Delete</button>
								</form></td>

							<%-- <td><form action="${car.carId}" method="get">
									<input type="submit" class="btn btn-info btn-mini"
										value="View orders" />
								</form></td>
							<td><form action="${car.carId}" method="post">
									<input type="submit" class="btn btn-danger btn-mini"
										value="Edit" />
								</form></td>
							<td><form:form action="${car.carId}" method="get">
							<input type="hidden" name="_method" value="delete"> 
									<input type="submit" class="btn btn-danger btn-mini"
										value="Delete" />
								</form:form></td> --%>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

</body>
</html>