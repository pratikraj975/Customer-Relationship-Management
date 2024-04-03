<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Welcome</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    </head>
    <body>
        <jsp:include page="header-employee.jsp" />

        <div class="container mt-3">
            <h2>Hello : ${session_employee.getName()}</h2>
            <p> Now you can handle the below functionalities...!! </p>            
        </div>
        
        <div class="container" style="padding: 20px; box-shadow: 0px 0px 0px 5px black;">
        	<h4> Number of courses sale on particular date </h4>
        	<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
        </div>
        
        <script>
			const xValues = [
				<c:forEach items="${model_count_course_sale}" var="row" varStatus="status">
					"${row[0]}"${not status.last ? ',' : ''}
				</c:forEach>
				];
			const yValues = [
				<c:forEach items="${model_count_course_sale}" var="row" varStatus="status">
					${row[1]}${not status.last ? ',' : ''}
				</c:forEach>
			];
			
			new Chart("myChart", {
			  type: "line",
			  data: {
			    labels: xValues,
			    datasets: [{
			      fill: false,
			      lineTension: 0,
			      backgroundColor: "rgba(0,0,255,1.0)",
			      borderColor: "rgba(0,0,255,0.1)",
			      data: yValues
			    }]
			  },
			  options: {
			    legend: {display: false},
			    scales: {
			      yAxes: [{ticks: {min: 0, max:10}}],
			    }
			  }
			});
		</script>
    </body>
</html>
