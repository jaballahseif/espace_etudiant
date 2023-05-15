<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<title>Add Teacher</title>
<style>
    body {
        font-family: Dungeon;
        background-color: #f2f2f2;
        margin: 0;
        padding: 20px;
    }

    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        width: 300px;
        margin: 0 auto;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    table {
        width: 100%;
        margin-bottom: 20px;
    }

    table td {
        padding: 10px;
        vertical-align: middle;
    }

    input[type="text"] {
        width: 100%;
        padding: 8px;
        border-radius: 3px;
        border: 1px solid #ccc;
    }

    input[type="submit"] {
         background-color:  #1e429f;
        color: white;
        padding: 8px 16px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 14px;
    }

    input[type="submit"]:hover {
        background-color:  #1e429f;
    }

    .form-row {
        margin-bottom: 10px;
    }

    .form-row label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }
</style>
</head>
<body>
    <h2>ajouter enseignant</h2>
    <% String message = (String)request.getAttribute("message"); %>

<% if(message != null) { %>
    <div class="alert alert-success" role="alert">
        <%= message %>
    </div>
<% } %>
    <form method="get" action="Servlet">
                <div class="form-floating mb-3">
                  <input name="fname" type="text" class="form-control" id="floatingInput" placeholder="first name">
                  <label for="floatingInput">First Name</label>
                </div>
                <div class="form-floating mb-3">
                  <input name="lname" type="text" class="form-control" id="floatingPassword" placeholder="last name">
                  <label for="floatingPassword">Last Name</label>
                </div>
                  <div class="form-floating mb-3">
                  <input name="email" type="email" class="form-control" id="floatingPassword" placeholder="email@example.com">
                  <label for="floatingPassword">Email</label>
                </div>
                    <div class="form-floating mb-3">
                  <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password">
                  <label for="floatingPassword">Password</label>
                </div>
                <div >
                <select class="form-select" name="role">
               <option value="enseignant" selected>Teacher</option>
               </select>
                
                </div>
                

    <br>

                <div class="d-grid">
                  <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2" name="action" value="addteacher" type="submit">AJOUTER</button>
                </div>
        
              </form>
</body>
</html>
