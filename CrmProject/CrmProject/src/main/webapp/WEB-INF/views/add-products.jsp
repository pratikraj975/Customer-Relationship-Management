<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Add Products</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" type="text/css" href="css/style.css" />
	</head>
	<body>
		<jsp:include page="header-admin.jsp" />
	
		<div class="container-fluid" style="float: left;">
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
				
				<h4 style="text-align: center; padding-top: 40px;"> Add Course Details </h4>
				
				<form:form action="addCourseForm" method="post" enctype="multipart/form-data" modelAttribute="productAttr">
					<div class="row form_div_design bg-light">
						<div class="col-5">
							<div class="mb-3">
								<label class="form-label">Course Name</label>
								<form:input path="coursename" cssClass="form-control" />
								<form:errors path="coursename" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Course Syllabus</label>
								<form:textarea path="syllabus" cssClass="form-control" />
								<form:errors path="syllabus" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Course Original Price</label>
								<form:input path="originalprice" cssClass="form-control" />
								<form:errors path="originalprice" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Course Discounted Price</label>
								<form:input path="discountedprice" cssClass="form-control" />
								<form:errors path="discountedprice" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Course Validity</label>
								<form:input path="coursevalidity" cssClass="form-control" />
								<form:errors path="coursevalidity" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Course Image</label>
								<form:input type="file" path="courseimage" cssClass="form-control" />
								<form:errors path="courseimage" cssClass="error_message_design" />
							</div>
						</div>
						<div class="col-2"></div>
						<div class="col-5">
							<div class="mb-3">
								<label class="form-label">Trainer's Name</label>
								<form:input path="trainersname" cssClass="form-control" />
								<form:errors path="trainersname" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Trainer's Details</label>
								<form:textarea path="trainersdetails" cssClass="form-control" />
								<form:errors path="trainersdetails" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Trainer's Image</label>
								<form:input type="file" path="trainersimage" cssClass="form-control" />
								<form:errors path="trainersimage" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Other Details</label>
								<form:textarea path="otherdetails" cssClass="form-control" />
								<form:errors path="otherdetails" cssClass="error_message_design" />
							</div>
							<input type="submit" value="Add Course" class="btn btn-primary" />
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</body>
</html>
