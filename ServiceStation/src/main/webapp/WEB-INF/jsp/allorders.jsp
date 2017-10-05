<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>All orders</title>
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
		<h2>Orders</h2>

		<div class="row">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>#</th>
						<th>Client</th>
						<th>Car</th>
						<th>Date</th>
						<th>Order Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orders}" var="order" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${order.carId.clientId.firstName}  ${order.carId.clientId.lastName}</td>
							<td>${order.carId.modelYearId.modelId.makeId.make}   
							${order.carId.modelYearId.modelId.model}  
							 ${order.carId.modelYearId.yearId.year}</td>
							<td>${order.date}</td>
							<td>${order.orderStatus}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<div></div>

</body>
</html>