<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>New car</title>
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
						<li class="active"><a href="ServiceStation/clients">Clients<span
								class="sr-only">(current)</span></a></li>
						<li><a href="#">Orders</a></li>
					</ul>
					<form:form method="post" commandName="find"
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
		<form:form class="form-horizontal" commandName="car" method="post">
			<spring:bind path="clientId.clientId">
				<div class="form-group ${status.error ? 'has-error' : ''}">

					 <form:input class="form-control" 
						path="clientId.clientId" type="hidden" value="${qwerty}"/>
				
					 <%-- 	<input type="hidden"name="clientId.clientId" value="${qwerty}"> --%>
					<form:errors path="clientId.clientId" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="modelYearId.yearId.yearId">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="modelYearId.yearId.yearId">Year:</form:label>
					<form:select path="modelYearId.yearId.yearId">
						<form:options items="${years}" itemValue="yearId" itemLabel="year" />
					</form:select>
					<form:errors path="modelYearId.yearId.yearId" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="modelYearId.modelId.makeId.makeId">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="modelYearId.modelId.makeId.makeId">Make:</form:label>
					<form:select path="modelYearId.modelId.makeId.makeId">
						<form:options items="${makes}" itemValue="makeId" itemLabel="make" />
					</form:select>
					<form:errors path="modelYearId.modelId.makeId.makeId"
						cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="modelYearId.modelId.modelId">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="modelYearId.modelId.modelId">Model:</form:label>
					<form:select path="modelYearId.modelId.modelId">
						<form:options items="${models}" itemValue="modelId"
							itemLabel="model" />
					</form:select>
					<form:errors path="modelYearId.modelId.modelId" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="vin">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:label path="vin">VIN:</form:label>
					<form:input path="vin" class="form-control" placeholder="vin" />
					<form:errors path="vin" cssclass="error"></form:errors>
				</div>
			</spring:bind>
			<button type="submit" class="btn btn-primary btn-medium">Submit</button>
		</form:form>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

</body>
</html>