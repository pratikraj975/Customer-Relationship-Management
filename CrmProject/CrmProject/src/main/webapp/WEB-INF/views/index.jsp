<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>CRM Project</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <jsp:include page="header-crm.jsp" />
        
        <div class="container-fluid">
            <div class="row main_page_banner">
                <div class="col-8" style="padding: 50px">
                    <span class="main_page_title"> CRM Application empowers a global network of over 250,000 businesses in 180 countries to convert more leads, engage with customers, and grow their revenue.</span>
                </div>
                <div class="col-4" style="padding: 50px">
                    <img src="images/crm-logo.png" height="250" />
                </div>
            </div>
        </div>
        
        <div class="container-fluid">
            <div class="container">
                <div class="row" style="padding-top: 50px">
                    <div class="col-6">
                        <h3>What does CRM do?</h3>
                        <ul>
                            <li>Actively tracks and manages customer information.</li>
                            <li>Connects your entire team from any device.</li>
                            <li>Intelligently captures customer emails.</li>
                            <li>Simplifies repetitive tasks so you can concentrate on leads.</li>
                            <li>Delivers instant insights and recommendations.</li>
                            <li>Extends and customises as your business grows.</li>
                        </ul>
                    </div>
                    <div class="col-6">
                        <h3>Why CRM matters?</h3>
                        <ul>
                            <li>CRM helps you ditch clunky processes and manual effort so you can get on with business.</li>
                            <li>You’ll find more leads, close more deals, keep more customers and grow your business.</li>
                            <li>One place to store all customer information means your conversations are always personal, relevant, and up to date.</li>
                            <li>Salesforce customers report 37% more sales revenue, 45% higher customer satisfaction, 43% better marketing ROI*.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
