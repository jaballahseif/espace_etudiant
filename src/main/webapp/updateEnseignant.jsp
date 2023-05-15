<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Enseignant</title>
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
    <h2>Modifier un étudiant</h2>
    <% String message = (String)request.getAttribute("message"); %>

<% if(message != null) { %>
    <div class="alert alert-success" role="alert">
        <%= message %>
    </div>
<% } %>
    <form method="get" action="Servlet">
        <table>
           <tr class="form-row">
                <td> Teacher ID:</td>
                <td> <input name="id" type="text" value="${requestScope.enseignant.idEnseignant}" readonly> </td>
            </tr>
            <tr class="form-row">
                <td> First Name :</td>
                <td> <input name="fname" type="text" value="${requestScope.enseignant.fname}"> </td>
            </tr>
            <tr class="form-row">
                <td> Last Name :</td>
                <td> <input name="lname" type="text" value="${requestScope.enseignant.lname}"> </td>
            </tr>
            <tr class="form-row">
                <td> Email :</td>
                <td> <input name="email" type="text" value="${requestScope.enseignant.email}"> </td>
            </tr>
            <tr>
                <td> </td>
                <td> <input name="action" value="Modifier" type="submit"> </td>
            </tr>
        </table>
    </form>
</body>
</html>
