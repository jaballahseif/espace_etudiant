<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
    .login {
  min-height: 100vh;
}

.bg-image {
  background-image: url('https://i.ibb.co/tJ2Sxf1/Screenshot-2023-05-11-185842.png');
  background-size: cover;
  background-position: center;
}
h3{
text-align:center;}

.login-heading {
  font-weight: 300;
}

.btn-login {
  font-size: 0.9rem;
  letter-spacing: 0.05rem;
  padding: 0.75rem 1rem;
}
div{
font-family : Dungeon;}
    
    </style>
   
</head>
<body>
<div class="container-fluid ps-md-0">
  <div class="row g-0">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">Register Now!</h3>

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
                <option selected>Choose option</option>
               <option value="admin">Admin</option>
               <option value="etudiant">Student</option>
               <option value="enseignant">Teacher</option>
               </select>
                
                </div>
                

    <br>

                <div class="d-grid">
                  <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2" name="action" value="add" type="submit">Sign up</button>
                </div>
        
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
