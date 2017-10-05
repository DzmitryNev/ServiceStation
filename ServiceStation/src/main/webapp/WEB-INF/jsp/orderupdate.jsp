<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Update order</title>
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
				<li class="active">Edit Order</li>
			</ul>
		</div>
		<form class="form-horizontal" method="post" action="/ServiceStation/orders/${car.carId}/${order.serviceOrderId}">

			<div class="form-group">
				<label class="control-label" for="client">Client</label> 
				<input class="form-control" id="client"
					value="${car.clientId.firstName}  ${car.clientId.lastName}" disabled="" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="car">Car</label> 
				<input class="form-control" id="car"
					value="${car.modelYearId.yearId.year}  ${car.modelYearId.modelId.makeId.make}   ${car.modelYearId.modelId.model}" disabled="" type="text">
			</div>

			<div class="form-group">
				<label class="control-label" for="date">Date</label> 
				<input class="form-control" id="date"
					value="${order.date}" disabled="" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="orderAmount">OrderAmount</label> 
				<input class="form-control" id="orderAmount"
					value="${order.orderAmount}" disabled="" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="sel">Order Status:</label> <select
					class="form-control" id="sel" name="orderStatus">
					<option value="In Progress" ${order.orderStatus == 'In Progress' ? 'selected' : ''}>In Progress</option>
					<option value="Completed" ${order.orderStatus == 'Completed' ? 'selected' : ''}>Completed</option>
					<option value="Canceled" ${order.orderStatus == 'Canceled' ? 'selected' : ''}>Canceled</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Save</button>
		</form>

	</div>
	
</body>
</html>