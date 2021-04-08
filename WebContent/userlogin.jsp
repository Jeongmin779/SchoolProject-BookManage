<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/userlogin.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="sidenav">
         <div class="login-main-text">
            <h2>세명 e-book<br>로그인</h2>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form action="action/login.jsp">
                  <div class="form-group">
                     <label>ID</label>
                     <input type="text" class="form-control" placeholder="ID" name="userid">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" placeholder="Password" name="userpwd">
                  </div>
                  <button type="submit" class="btn btn-black">Login</button>
                  <button type="button" class="btn btn-secondary" onclick="location.href='signup.jsp'">Sign up</button>
               </form>
            </div>
         </div>
      </div>
</body>
</html>
<script type="text/javascript">
	
</script>