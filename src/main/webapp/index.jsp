<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="./style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
    <title>Espace etudiant</title>
</head>
<body>
<div class="header">
    <div class="inner-header flex">
        <div class="header-container">
        <% String message = (String)request.getAttribute("message"); %>

<% if(message != null) { %>
    <div class="alert alert-success" role="alert">
        <%= message %>
    </div>
<% } %>
            <h1>ISTIC STUDENT SPACE</h1>
            <h2>Student management system</h2><br>
            <div class="a1">
                <form action="login.jsp" method="get" style="display: inline;">
                    <button type="submit" class="button">
                        Log in now
                    </button>
                </form>
            </div>
            <div class="a">
                <form action="register.jsp" method="get" style="display: inline;">
                    <button type="submit" class="button">
                        Register now
                    </button>
                </form>
            </div>
        </div>
       
        <div class="image">
            <img src="https://espace-etudiant.vercel.app/assets/img.png" alt="">
        </div>
        
    </div>
</div>
</body>
</html>
