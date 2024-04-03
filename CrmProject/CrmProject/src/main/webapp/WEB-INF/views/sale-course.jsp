<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Sale Course</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<script type="text/javascript">
			function getSelectedCourse()
			{
				var selectedcourse = document.getElementById('coursename').value;
				//alert(selectedcourse);
				
				if(selectedcourse !== "")
				{
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "/getCoursePrices?selectedcourse="+selectedcourse, true);
					xhr.onreadystatechange = function() {
						if(xhr.readyState === 4 && xhr.status === 200)
						{
							var response = JSON.parse(xhr.responseText);
							
							var product = response;
							
							var discountedprice = product.discountedprice;
							var originalprice = product.originalprice;
							
							document.getElementById("originalpriceid").textContent = originalprice;
							document.getElementById("discountedpriceid").textContent = discountedprice;
							
							$("#priceDivId").css("visibility", "visible");
						}
					};
					xhr.send();
				}
				else
				{
					$("#priceDivId").css("visibility", "hidden");
				}
			}
		</script>
	</head>
	<body>
		<jsp:include page="header-employee.jsp" />
	
		<div class="container-fluid">
			<div class="container">
	
				<c:if test="${not empty model_success}">
					<div class="row">
						<div class="alert alert-success alert-dismissible fade show"
							role="alert">
							${model_success}
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</div>
				</c:if>
	
				<c:if test="${not empty model_error}">
					<div class="row">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							${model_error}
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</div>
				</c:if>
	
				<div class="row">
					<div class="col-3"></div>
					<div class="col-6 d-flex justify-content-center">
						<div class="addemp_div_design bg-light">
							<h3>Sale Course</h3>
							<br />
							<form:form action="saleCourseForm" method="post" modelAttribute="modelSaleCourseAttr">
								<div class="mb-3">
									<label class="form-label">Customer Phone No.</label>
									<form:input path="custphoneno" cssClass="form-control" />
									<form:errors path="custphoneno" cssClass="error_message_design" />
								</div>
								<div class="mb-3">
									<label class="form-label">Interested Course</label>
									<form:select path="coursename" id="coursename" cssClass="form-select" onchange="getSelectedCourse()">
										<form:option value="">Selected Course</form:option>
										<form:options items="${model_coursename_list}" />
									</form:select>
									<form:errors path="coursename" cssClass="error_message_design" />
								</div>
								<div class="mb-3" id="priceDivId" style="visibility: hidden;">
									Price to Pay : <strong><del>Rs. <span id="originalpriceid" style="color:red"></span></del></strong> &nbsp;&nbsp; Rs. <span id="discountedpriceid" class="text-primary"></span>
								</div>
								<input type="submit" value="Sell Course" class="btn btn-primary" />
							</form:form>
						</div>
					</div>
					<div class="col-3"></div>
				</div>
			</div>
		</div>
	
	</body>
</html>
