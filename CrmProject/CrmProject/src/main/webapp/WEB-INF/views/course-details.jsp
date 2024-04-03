<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Course Details</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <jsp:include page="header-admin.jsp" />

        <div class="container mt-3 bg-light course_details_div">
            <h4>Course Details</h4>
            <div class="row">
            	<div class="col-4">
            		<img src="${model_product.getCourseimage()}" alt="" height="100" />
            	</div>
            	<div class="col-8">
            		<p><strong> Course Name : <span class="text-primary"> ${model_product.getCoursename()} </span> </strong> </p>
            		<p><strong> Course Price : <del style="color: red">Rs. ${model_product.getOriginalprice()}</del> &nbsp;&nbsp; <span class="text-primary"> Rs. ${model_product.getDiscountedprice()} </span> </strong> </p>
            		<p><strong> Course Validity : <span class="text-primary"> ${model_product.getCoursevalidity()} </span> </strong> </p>
            		<p><strong> Course Syllabus : <span class="text-primary"> ${model_product.getSyllabus()} </span> </strong> </p>
            	</div>
            </div>
        </div>
        <br/> <br/>
        <div class="container mt-3 course_details_div">
            <h4>Trainer's Details</h4>
            <div class="row">
            	<div class="col-4">
            		<img src="${model_product.getTrainersimage()}" alt="" height="100" />
            	</div>
            	<div class="col-8">
            		<p><strong> Trainer's Name : <span class="text-primary"> ${model_product.getTrainersname()} </span> </strong> </p>
            		<p><strong> Trainer's Details : <span class="text-primary"> ${model_product.getTrainersdetails()} </span> </strong> </p>
            	</div>
            </div>
        </div>
        <br/> <br/>
        <div class="container mt-3 course_details_div">
            <h4>Important Instructions</h4>
            <div class="row">
            	<div class="col-8">
            		<p class="text-danger"><strong> ${model_product.getOtherdetails()} </strong> </p>
            	</div>
            </div>      
        </div>

    </body>
</html>
