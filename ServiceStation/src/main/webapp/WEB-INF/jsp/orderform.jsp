<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>New order</title>
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
				<li><a href="/ServiceStation/orders/${car.carId}">Orders</a></li>
				<li class="active">New order</li>
			</ul>
		</div>
		<form class="form-horizontal" method="post"
			action="/ServiceStation/orders/${car.carId}">

			<div class="form-group">
				<label class="control-label" for="client">Client</label> 
				<input class="form-control" id="client"
					placeholder="${car.clientId.firstName}  ${car.clientId.lastName}" disabled="" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="car">Car</label> 
				<input class="form-control" id="car"
					placeholder="${car.modelYearId.yearId.year}  ${car.modelYearId.modelId.makeId.make}   ${car.modelYearId.modelId.model}" disabled="" type="text">
			</div>

			<div class="form-group">
				<label class="control-label" for="date">Date:</label> <input
					id="date" class="form-control" name="date" class="form-control" />
					
			</div>
			<div class="form-group">
				<label class="control-label" for="orderAmount">Order Amount:</label>
				<input id="orderAmount" class="form-control" name="orderAmount"
					class="form-control" />
			</div>
			<div class="form-group">
				<label class="control-label" for="sel">Order Status:</label> <select
					class="form-control" id="sel" name="orderStatus">
					<option value="In Progress">In Progress</option>
					<option value="Completed">Completed</option>
					<option value="Canceled">Canceled</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Save</button>
		</form>

	</div>
	
</body>
</html>