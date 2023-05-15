<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<title>Teacher Page</title>
<style>
    @media screen and (max-width: 768px) {
        .card-title {
            font-size: 1.5rem;
        }
    }
    
 /* Additional CSS to center the cards and set the background color */
body {
    background-color: #f1f1f1;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.t {
    background: repeating-linear-gradient(transparent 0%, transparent 25%, #a7dcff 25%, #a7dcff 37.5%),
        linear-gradient(#24a5f9, #034792),
        linear-gradient(105deg, transparent 0%, transparent 50%, #b4cad9 50%, #b4cad9 100%);
    background-blend-mode: multiply;
    height: 100vh;
    width: 100%;
    
}

    .blog-card {
        display: flex;
        flex-direction: column;
        margin: 1rem auto;
        box-shadow: 0 3px 7px -1px rgba(0, 0, 0, 0.1);
        margin-bottom: 1.6%;
        background: #fff;
        line-height: 1.4;
        font-family: Dungeon;
        border-radius: 5px;
        overflow: hidden;
        z-index: 0;
    }
    
    .blog-card a {
        color: inherit;
    }
    
    .blog-card a:hover {
        color: white;
    }
    
    .blog-card:hover .photo {
        transform: scale(1.3) rotate(3deg);
    }
    
    .blog-card .meta {
        position: relative;
        z-index: 0;
        height: 200px;
    }
    
    .blog-card .photo {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-size: cover;
        background-position: right;
        transition: transform 0.2s;
    }
    
    .blog-card .details,
    .blog-card .details ul {
        margin: auto;
        padding: 0;
        list-style: none;
    }
    
    .blog-card .details {
        position: absolute;
        top: 0;
        bottom: 0;
        left: -100%;
        margin: auto;
        transition: left 0.2s;
        background: rgba(0, 0, 0, 0.6);
        color: #fff;
        padding: 10px;
        width: 100%;
        font-size: 0.9rem;
    }
    
    .blog-card .details a {
        -webkit-text-decoration: dotted underline;
        text-decoration: dotted underline;
    }
    
    .blog-card .details ul li {
        display: inline-block;
    }
    
    .blog-card .details .author:before {
        font-family: Dungeon;
        margin-right: 10px;
        content: "";
    }
    
    .blog-card .details .date:before {
        font-family: Dungeon;
        margin-right: 10px;
        content: "";
    }
    
.blog-card .details .tags ul:before {
    font-family: Dungeon;
    content: "";
    margin-right: 10px;
}

.blog-card .details .tags li {
    margin-right: 2px;
}

.blog-card .details .tags li:first-child {
    margin-left: -4px;
}

.blog-card .description {
    padding: 1rem;
    background: #fff;
    position: relative;
    z-index: 1;
}

.blog-card .description h1,
.blog-card .description h2 {
    font-family: Dungeon;
}

.blog-card .description h1 {
    line-height: 1;
    margin: 0;
    font-size: 1.7rem;
}

.blog-card .description h2 {
    font-size: 1rem;
    font-weight: 300;
    text-transform: uppercase;
    color: #a2a2a2;
    margin-top: 5px;
}

.blog-card .description .read-more {
    text-align: right;
}

.blog-card .description .read-more a {
    display: inline-block;
    position: relative;
}

.blog-card .description .read-more a:after {
    font-family: Dungeon;
    margin-left: -10px;
    opacity: 0;
    vertical-align: middle;
    transition: margin 0.3s, opacity 0.3s;
}

.blog-card .description .read-more a:hover:after {
    margin-left: 5px;
    opacity: 1;
}

.blog-card p {
    position: relative;
    margin: 1rem 0 0;
}

.blog-card p:first-of-type {
    margin-top: 1.25rem;
}

.blog-card p:first-of-type:before {
    content: "";
    position: absolute;
    height: 5px;
    background: #006eff;
    width: 35px;
    top: -0.75rem;
    border-radius: 3px;
}

.blog-card:hover .details {
    left: 0%;
}

@media (min-width: 640px) {
    .blog-card {
        flex-direction: row;
        max-width: 700px;
    }

    .blog-card .meta {
        flex-basis: 40%;
        height: auto;
    }

    .blog-card .description {
        flex-basis: 60%;
    }

    .blog-card .description:before {
        transform: skewX(-3deg);
        content: "";
        background: #fff;
        width: 30px;
        position: absolute;
        left: -10px;
        top: 0;
        bottom: 0;
        z-index: -1;
    }

    .blog-card.alt {
        flex-direction: row-reverse;
    }

    .blog-card.alt .description:before {
        left: inherit;
        right: -10px;
        transform: skew(3deg);
    }

    .blog-card.alt .details {
        padding-left: 25px;
    }
}

.btn {
    font-size: 1.2rem;
    font-weight: bold;
    border-radius: 25px;
    padding: 10px 30px;
    background-color: #00bfff;
    color: #fff;
    border: none;
    transition: all 0.3s ease-in-out;
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

    <div class="blog-card">
        <div class="meta">
            <div class="photo" style="background-image: url(./assets/img/notes.jpg)"></
                ></div>
        </div>
        <div class="description">
            <h1>Manage Notes</h1>
            <h2>note des examens/ds</h2>
            <p>here you can add  notes to your students </p>
            <p class="read-more">
                <a href="Servlet?action=listNote" class="btn btn-primary">Upload Notes</a>
            </p>
        </div>
    </div>
    <div class="blog-card alt">
        <div class="meta">
            <div class="photo" style="background-image: url(./assets/img/document.jpg)"></div>
        </div>
              <div class="description">
            <h1>Manage Documents</h1>
            <h2>cours/tds/exams</h2>
            <p>here you can upload documents</p>
            <p class="read-more">
                <a class="btn btn-primary">Upload Documents</a></p>
        </div>
    </div>
</div>
</body>
</html>
    