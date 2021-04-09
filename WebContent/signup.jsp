<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/signup.css?ver=3">
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div class="sidenav">
         <div class="login-main-text">
            <h2>세명 e-book<br>회원가입</h2>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form action="action/signup.jsp" method="post">
                  <div class="form-group">
                     <label>ID</label>
                     <input type="text" class="form-control" placeholder="ID" name="userid">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" placeholder="Password" name="userpw">
                  </div>
                  <div class="form-group">
                     <label>Confirm Password</label>
                     <input type="password" class="form-control" placeholder="Confirm Password" name="con_pw">
                  </div>
                  <div class="form-group">
                     <label>Name</label>
                     <input type="text" class="form-control" placeholder="Name" name="username">
                  </div>
                  <div class="form-group">
                     <label>Phone</label>
                     <input type="text" class="form-control" placeholder="Phone" name="userphone">
                  </div>
                  <button type="submit" class="btn btn-black">Sign up</button>
                  <button type="button" class="btn btn-secondary" onclick="location.href='userlogin.jsp'">Login</button>
               </form>
            </div>
         </div>
      </div>
</body>
</html>
<script type="text/javascript">
	
</script>