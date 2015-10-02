<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Clients</title>
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

</body>
</html>