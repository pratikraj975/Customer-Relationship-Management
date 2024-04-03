<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Customer Enquiry</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<script type="text/javascript">
			function getSelectedDate()
			{
				var selectedDate = $("#datePickerId").val();
				
				$.ajax({
					type:"GET",
					url:"/customerFolloupPage",
					data:{selectedDate : selectedDate},
					success:function(data){
						//alert(data);
						var tableBody = $(data).find("tbody");
						$("#followupTable tbody").html(tableBody.html());
					},
					error:function(xhr, status, error){
						alert("Error : "+error);
					}
				});
			}
			
			function cusEnquiryHistory(phoneNumber)
			{
				if(phoneNumber !== '')
				{
					window.location.href="custEnquiryHistoryPage?phno="+encodeURIComponent(phoneNumber);
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
							<h3>Customer Follow Ups</h3>
							<p> Below are the details of customer's to be called </p>
							<p> OR you can choose any date :<input type="date" class="form-control" id="datePickerId" onchange="getSelectedDate()" /> </p>
							<br />
							<table id="followupTable" class="table table-light table-bordered table-striped">
				                <thead>
				                    <tr>
				                        <th>Sr. No.</th>
				                        <th>Phone No.</th>
				                        <th style="text-align: center;"> Get History </th>
				                    </tr>
				                </thead>
				                <tbody>
				                    <c:forEach var="followup" items="${model_followups}" varStatus="loop">
				                    	<tr>
				                    		<td> ${loop.index+1} </td>
				                    		<td> ${followup.phoneno} </td>
				                    		<td style="text-align: center;"> 
				                    			<button class="btn btn-success" onclick="cusEnquiryHistory('${followup.phoneno}')"> Get History </button>
				                    		</td>
				                    	</tr>
				                    </c:forEach>
				                </tbody>
				            </table>
						</div>
					</div>
					<div class="col-3"></div>
				</div>
			</div>
		</div>
	
	</body>
</html>
