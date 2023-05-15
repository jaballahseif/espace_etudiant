<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
    <title>Liste des étudiants</title>
    <style>
    h1,th,td,div {
  text-align: center;
  font-family: Dungeon;
}
        table {
            width: 100%;
            border-collapse: collapse;
            background: radial-gradient(circle, rgba(255, 255, 255, 1) 0%, rgba(214, 229, 255, 1) 100%);
        }
        
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #f2f2f2;
        }
         .action-buttons {
            display: flex;
        }
        
        .action-buttons a {
            margin-right: 5px;
        }
        .button{
          display: flex;
            justify-content: center;
            align-items: center;
           
         padding: 20px;
        }
    </style>
</head>
<body>
    <h1>Liste des étudiants</h1>
    
    <table>
        <tr>
            <th>Prénom</th>
            <th>Nom</th>
            <th>Email</th>
        </tr>
        
        <c:forEach var="etudiant" items="${requestScope.etudiants}">
            <tr>
                <td>${etudiant.fname}</td>
                <td>${etudiant.lname}</td>
                <td>${etudiant.email}</td>
                  <td class="action-buttons">
                    <a href="Servlet?action=deleteEtudiant&subId=${etudiant.idEtudiant}">Supprimer</a>
                    <a href="Servlet?action=modifierEtudiant&subId=${etudiant.idEtudiant}">Modifier</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="button">
    <a type="button" class="btn btn-primary" href="Servlet?action=addstudent">Add student</a>
    <br>
     <a type="button" class="btn btn-primary" href="Servlet?action=readmin">Go back</a>
    </div>

</body>
</html>
