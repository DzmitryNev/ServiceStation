<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Order</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.6.1.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui-1.8.10.custom.min.js"/>"></script>

</head>
<body>
	<jsp:include page="header.jsp"/>
		<div class="container">
		<div>
		<ul class="breadcrumb">
			<li><a href="/ServiceStation/clients">Clients</a></li>
			<li><a href="/ServiceStation/cars/${car.clientId.clientId}">Client</a></li>
			<li class="active">Orders</li>
		</ul>
	</div>
		<h2>Car</h2>
		<div class="row">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>Year</th>
						<th>Make</th>
						<th>Model</th>
						<th>VIN</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${car.modelYearId.yearId.year}</td>
						<td>${car.modelYearId.modelId.makeId.make}</td>
						<td>${car.modelYearId.modelId.model}</td>
						<td>${car.vin}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<h3>Orders</h3>
		<div>
			<spring:url value="/orders/${car.carId}/add" var="urlNewOrder" />
			<button class="btn btn-primary"
				onclick="location.href='${urlNewOrder}'">New order</button>
		</div>

		<div class="row">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>#</th>
						<th>Date</th>
						<th>Order amount</th>
						<th>Order status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orders}" var="order" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${order.date}</td>
							<td>${order.orderAmount}</td>
							<td>${order.orderStatus}</td>
							<td>
							<td><form action="/ServiceStation/orders/${car.carId}/${order.serviceOrderId}/update"
									method="get">
									<input type="submit" class="btn btn-primary btn-primary"
										value="Edit" />
								</form></td>
							<td><form
									action="/ServiceStation/orders/${car.carId}/${order.serviceOrderId}/delete"
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