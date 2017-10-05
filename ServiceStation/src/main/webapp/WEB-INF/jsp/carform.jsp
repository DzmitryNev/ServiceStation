<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>New car</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.6.1.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui-1.8.10.custom.min.js"/>"></script>
<c:url var="findMakesByYearURL" value="/cars/${client.clientId}/makes" />
<c:url var="findYearsURL" value="/cars/${client.clientId}/years" />
<c:url var="findModelsByYearAndMakeURL"
	value="/cars/${client.clientId}/models" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#year')
								.change(
										function() {
											$
													.getJSON(
															'${findMakesByYearURL}',
															{
																year : $(this)
																		.val(),
																ajax : 'true'
															},
															function(data) {

																var html = '<option value=""></option>';
																var len = data.length;
																for (var i = 0; i < len; i++) {
																	html += '<option value="' + data[i].makeId + '">'
																			+ data[i].make
																			+ '</option>';
																}
																html += '</option>';
																$('#make')
																		.html(
																				html);
																$("#make")
																		.removeAttr(
																				"disabled");
																
																$("#model")
																.attr("disabled", "disabled");
															});
										});
					});
</script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$.getJSON('${findYearsURL}', {
					ajax : 'true'
				}, function(data) {

					var html = '<option value=""></option>';
					var len = data.length;
					for (var i = 0; i < len; i++) {
						html += '<option value="' + data[i].yearId + '">'
								+ data[i].year + '</option>';
					}
					html += '</option>';
					$('#year').html(html);
					$("#model")
					.attr("disabled", "disabled");
				});
			});
</script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#make")
								.change(
										function() {
											$
													.getJSON(
															'${findModelsByYearAndMakeURL}',
															{
																year : $("#year")
																		.val(),
																make : $(this)
																		.val(),
																ajax : 'true'
															},
															function(data) {

																var html = '<option value=""></option>';
																var len = data.length;
																for (var i = 0; i < len; i++) {
																	html += '<option value="' + data[i].modelId + '">'
																			+ data[i].model
																			+ '</option>';
																}
																html += '</option>';
																$('#model')
																		.html(
																				html);
																$("#model")
																		.removeAttr(
																				"disabled");
															});
										});
					});
</script>

</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="container">
		<div>
			<ul class="breadcrumb">
				<li><a href="/ServiceStation/clients">Clients</a></li>
				<li><a href="/ServiceStation/cars/${client.clientId}">Client</a></li>
				<li class="active">New car</li>
			</ul>
		</div>
		<form class="form-horizontal" method="post"
			action="/ServiceStation/cars/${client.clientId}">
			<div class="form-group">
				<label class="control-label" for="client">Client</label> <input
					class="form-control" id="client"
					placeholder="${client.firstName}  ${client.lastName}"
					disabled="" type="text">
			</div>
			<div class="form-group">
				<label for="year" class="control-label">Year:</label> <select
					id="year" class="form-control" name="yearId"></select>

			</div>
			<div class="form-group">
				<label for="make" class="control-label">Make:</label> <select
					id="make" class="form-control" name="makeId" disabled="disabled"></select>

			</div>
			<div class="form-group">
				<label for="model" class="control-label">Model:</label> <select
					id="model" class="form-control" name="modelId"></select>

			</div>
			<div class="form-group">
				<label for="vin" class="control-label">VIN:</label> <input
					name="vin" class="form-control" />

			</div>
			<button type="submit" class="btn btn-primary btn-medium">Save</button>
		</form>
	</div>

</body>
</html>