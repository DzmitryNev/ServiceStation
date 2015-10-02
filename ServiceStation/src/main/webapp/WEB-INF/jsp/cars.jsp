<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Client</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.6.1.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui-1.8.10.custom.min.js"/>"></script>

</head>
<body>
	<jsp:include page="header.jsp"/>	<div class="container">
		<div>
			<ul class="breadcrumb">
				<li><a href="/ServiceStation/clients">Clients</a></li>
				<li class="active">Client</li>
			</ul>
		</div>
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
			<button class="btn btn-primary"
				onclick="location.href='${urlNewCar}'">New car</button>
			<c:if test="${!empty message}">
				<div class="alert alert-dismissible alert-warning">
					<button type="button" class="close" data-dismiss="alert">x</button>
					<h2>Warning!</h2>
					<p>
						<c:out value="${message}" />
					</p>
				</div>
			</c:if>
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
							<td><form action="/ServiceStation/orders/${car.carId}"
									method="get">
									<input type="submit" class="btn btn-info btn-mini"
										value="View orders" />
								</form></td>
							<td><form action="/ServiceStation/cars/${car.carId}/update"
									method="post">
									<input type="submit" class="btn btn-primary btn-primary"
										value="Edit" />
								</form></td>
							<td><form
									action="/ServiceStation/cars/${client.clientId}/${car.carId}/delete"
									method="get">
								 <input type="submit" class="btn btn-danger btn-mini" value="Delete" />
								</form></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>

</body>
</html>