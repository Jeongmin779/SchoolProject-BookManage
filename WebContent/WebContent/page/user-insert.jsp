<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
   	%>
<div class="input-container">
	<form action="../action/user-insert.jsp">
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="userid">
		  <label for="floatingInput">유저 아이디</label>
		</div>
	  	<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="userpwd">
		  <label for="floatingInput">유저 비밀번호</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="username" name="username" >
		  <label for="floatingPassword">유저 이름</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="phone" name="phone" >
		  <label for="floatingPassword">유저 전화번호</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="admin_ck" name="admin_ck" >
		  <label for="floatingPassword">관리자 여부</label>
		</div>
	    <button type="submit" class="btn btn-primary">유저 입력</button>
	  </div>
	</form>
</div>