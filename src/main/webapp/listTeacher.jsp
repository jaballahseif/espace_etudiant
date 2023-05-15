<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Liste des enseignants</title>
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
    <h1>Liste des enseignanats</h1>

    
    <table>
        <tr>
            <th>Prénom</th>
            <th>Nom</th>
            <th>Email</th>
        </tr>
        
        <c:forEach var="enseignant" items="${requestScope.enseignants}">
            <tr>
                <td>${enseignant.fname}</td>
                <td>${enseignant.lname}</td>
                <td>${enseignant.email}</td>
                  <td class="action-buttons">
                    <a href="Servlet?action=deleteEnseignant&subId=${enseignant.idEnseignant}">Supprimer</a>
                    <a href="Servlet?action=modifierEnseignant&subId=${enseignant.idEnseignant}">Modifier</a>
                </td>
            </tr>
        </c:forEach>
    </table>
      <div class="button">
    <a type="button" class="btn btn-primary" href="Servlet?action=AddTeacher">Add Teacher</a>
    <br>
       <a type="button" class="btn btn-primary" href="Servlet?action=readmin">Go back</a>
    </div>
 
 
 
</body>
</html>
