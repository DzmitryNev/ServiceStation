<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>New client</title>
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
				<li class="active">New Client</li>
			</ul>
		</div>
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
			<button type="submit" class="btn btn-primary">Save</button>
		</form:form>
	</div>
</body>
</html>