<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>New client</title>
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
						<li class="active"><a href="/ServiceStation/clients">Clients<span
								class="sr-only">(current)</span></a></li>
						<li><a href="#">Orders</a></li>
					</ul>
					<form:form method="get" action="/ServiceStation/clients"
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
		<form class="form-horizontal" method="post"
			action="/ServiceStation/orders/${car.carId}">

			<div class="form-group">
				<label>Car:</label> <label>${car.modelYearId.yearId.year}</label> <label>${car.modelYearId.modelId.makeId.make}</label>
				<label>${car.modelYearId.modelId.model}</label>
			</div>
			<div class="form-group">
				<label>Date:</label> <input name="date" class="form-control" />
			</div>
			<div class="form-group">
				<label>Order Amount:</label> <input name="orderAmount"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="sel1">Order Status:</label> <select class="form-control"
					id="sel1" name="orderStatus">
					<option value="In Progress">In Progress</option>
					<option value="Completed">Completed</option>
					<option value="Canceled">Canceled</option>
				</select>
			</div>
			<button type="submit" class="btn btn-default" data-dismiss="modal">Cancel</button>
			<button type="submit" class="btn btn-primary">Save</button>
		</form>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

</body>
</html>