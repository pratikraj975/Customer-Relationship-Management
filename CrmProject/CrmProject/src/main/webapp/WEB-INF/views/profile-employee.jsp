<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Welcome</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <jsp:include page="header-employee.jsp" />

        <div class="container mt-3">
            <h2> Hello : ${session_employee.getName()}</h2>
            <h4 class="text-secondary"> Email : ${session_employee.getEmail()}</h4>
            <h4 class="text-secondary"> Phone No. : ${session_employee.getPhoneno()}</h4>            
        </div>

    </body>
</html>
