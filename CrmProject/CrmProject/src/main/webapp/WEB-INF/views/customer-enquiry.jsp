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
			$(document).ready(function() {
				$('#phonenoInput').keyup(function() {
					var phoneNumber = $(this).val();
					$.ajax({
						url:"/checkPhoneNumberAvailability",
						data:{phoneNumber : phoneNumber},
						success: function(response)
						{
							if(response === "exist")
							{
								$('#phonenoInput').addClass("is-invalid");
								
								$("#nameInput").prop('readonly', true);
								$("#interestedcourseInput").prop('disabled', true);
								$("#discussionInput").prop('readonly', true);
								$("#enquirytypeInput").prop('disabled', true);
								$("#statusInput").prop('disabled', true);
								$("#followupdateInput").prop('readonly', true);
								$("#calltoInput").prop('disabled', true);
								$("#addEnquiryBtnId").prop('disabled', true);
								
								$('#getHistoryBtn').show();
							}
							else
							{
								$('#phonenoInput').removeClass("is-invalid");
								
								$("#nameInput").prop('readonly', false);
								$("#interestedcourseInput").prop('disabled', false);
								$("#discussionInput").prop('readonly', false);
								$("#enquirytypeInput").prop('disabled', false);
								$("#statusInput").prop('disabled', false);
								$("#followupdateInput").prop('readonly', false);
								$("#calltoInput").prop('disabled', false);
								$("#addEnquiryBtnId").prop('disabled', false);
								
								$('#getHistoryBtn').hide();
							}
						}
					});
				});
			});
			
			function custEnquiryHistory()
			{
				var phoneNumber = $('#phonenoInput').val();
				if(phoneNumber !== '')
				{
					window.location.href="/custEnquiryHistoryPage?phno="+encodeURIComponent(phoneNumber);
				}
			}
			function handleOption()
			{
				var statusOption = document.getElementById('statusInput').value;
				if(statusOption === "1")
				{
					$('#followupdateInput').prop('readonly', false);
				}
				else
				{
					$('#followupdateInput').prop('readonly', true);
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
	
				<h4 style="text-align: center; padding-top: 40px"> Customer Enquiry Form </h4>
	
				<form:form action="custEnquiryForm" method="post" modelAttribute="modelCustEnquiryAttr">
					<div class="row form_div_design bg-light">
						<div class="col-5">
							<div class="mb-3">
								<label class="form-label">Phone No.</label>
								<form:input path="phoneno" cssClass="form-control" id="phonenoInput" /> <br/>
								<button type="button" id="getHistoryBtn" class="btn btn-success" style="display: none;" onclick="custEnquiryHistory()"> Get History </button>
								<form:errors path="phoneno" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Name</label>
								<form:input path="custEnquiry.name" id="nameInput" cssClass="form-control"  />
								<form:errors path="custEnquiry.name" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Interested Course</label>
								<form:select path="custEnquiry.interestedcourse" id="interestedcourseInput" cssClass="form-select">
									<form:option value="">Selected Course</form:option>
									<form:options items="${model_coursename_list}" />
								</form:select>
								<form:errors path="custEnquiry.interestedcourse" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label"> Discussion </label>
								<form:textarea path="custEnquiry.discussion" id="discussionInput" cssClass="form-control" />
								<form:errors path="custEnquiry.discussion" cssClass="error_message_design" />
							</div>
						</div>
						<div class="col-2"></div>
						<div class="col-5">
							<div class="mb-3">
								<label class="form-label">Enquiry Type</label>
								<form:select path="custEnquiry.enquirytype" id="enquirytypeInput" cssClass="form-select">
									<form:option value="">Select Enquiry Type</form:option>
									<form:option value="Call">Call</form:option>
									<form:option value="Mail">Mail</form:option>
									<form:option value="Website">Website</form:option>
									<form:option value="Social Networking">Social Networking</form:option>
								</form:select>
								<form:errors path="custEnquiry.enquirytype" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Status</label>
								<form:select path="custEnquiry.status" id="statusInput" cssClass="form-select" onchange="handleOption()" >
									<form:option value="">Select Status</form:option>
									<form:option value="1">Open (1)</form:option>
									<form:option value="2">Interested - Closed (2)</form:option>
									<form:option value="3">Not - Interested - Closed (3)</form:option>
									<form:option value="4">Purchased - Closed (4)</form:option>
								</form:select>
								<form:errors path="custEnquiry.status" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label">Follow Up Date</label>
								<form:input type="date" path="custFollowup.followupdate" id="followupdateInput" cssClass="form-control" />
								<form:errors path="custFollowup.followupdate" cssClass="error_message_design" />
							</div>
							<div class="mb-3">
								<label class="form-label"> Call To </label>
								<form:select path="custEnquiry.callto" id="calltoInput" cssClass="form-select">
									<form:option value="">Call To</form:option>
									<form:option value="Customer to Company">Customer to Company</form:option>
									<form:option value="Company to Customer">Company to Customer</form:option>
								</form:select>
								<form:errors path="custEnquiry.callto" cssClass="error_message_design" />
							</div>
							<input type="submit" value="Add Enquiry" id="addEnquiryBtnId" class="btn btn-primary" />
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</body>
</html>
