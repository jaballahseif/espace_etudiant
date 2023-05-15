<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<title>Note Page</title>
<style>
@media screen and (max-width:768px) {
    .card-title {
        font-size: 1.5rem
    }
}

body {
    background-color: #f1f1f1;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0
}
div{
font-family: Dungeon}

.t {
    background: repeating-linear-gradient(transparent 0, transparent 25%, #a7dcff 25%, #a7dcff 37.5%), linear-gradient(#24a5f9, #034792), linear-gradient(105deg, transparent 0, transparent 50%, #b4cad9 50%, #b4cad9 100%);
    background-blend-mode: multiply;
    height: 100vh;
    width: 100%
}
a:hover{
    cursor: pointer;

}

.btn {
    font-size: 1.2rem;
    font-weight: 700;
    border-radius: 25px;
    padding: 10px 30px;
    background-color: #00bfff;
    color: #fff;
    border: none;
    transition: all .3s ease-in-out
}
.card-box {
    position: relative;
    color: #fff;
    padding: 20px 10px 40px;
    margin: 20px 0px;
}
.card-box:hover {
    text-decoration: none;
    color: #f1f1f1;
}
.card-box:hover .icon i {
    font-size: 100px;
    transition: 1s;
    -webkit-transition: 1s;
}
.card-box .inner {
    padding: 5px 10px 0 10px;
}
.card-box h3 {
    font-size: 27px;
    font-weight: bold;
    margin: 0 0 8px 0;
    white-space: nowrap;
    padding: 0;
    text-align: left;
}
.card-box p {
    font-size: 15px;
}
.card-box .icon {
    position: absolute;
    top: auto;
    bottom: 5px;
    right: 5px;
    z-index: 0;
    font-size: 72px;
    color: rgba(0, 0, 0, 0.15);
}
.card-box .card-box-footer {
    position: absolute;
    left: 0px;
    bottom: 0px;
    text-align: center;
    padding: 3px 0;
    color: rgba(255, 255, 255, 0.8);
    background: rgba(0, 0, 0, 0.1);
    width: 100%;
    text-decoration: none;
}
.card-box:hover .card-box-footer {
    background: rgba(0, 0, 0, 0.3);
}
.bg-blue {
    background-color: #00c0ef  !important;
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
<div class="t">
<br>
<br>
<br><br>
<br>
<br><br>
<br>
     <% String message = (String)request.getAttribute("message"); %>

<% if(message != null) { %>
    <div class="alert alert-success" role="alert">
        <%= message %>
    </div>
<% } %>
<div class="container">
    <div class="row">
     <c:forEach var="etudiant" items="${requestScope.etudiant}">
    
        <div class="col-lg-3 col-sm-6">
            <div class="card-box bg-blue">
                <div class="inner">
                    <h3> ${etudiant.fname} ${etudiant.lname}</h3>
                    <p>${etudiant.idEtudiant}</p>
                </div>
                <div class="icon">
                    <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                </div>
                <a class="card-box-footer" href="Servlet?action=addNote&ID=${etudiant.idEtudiant}">Add Note<i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        </c:forEach>
        </div>
        
        </div>
        <div class="button">
         <a type="button" class="btn btn-primary" href="teacher.jsp">Go back</a>
         </div>

</div>
</body>
</html>
    