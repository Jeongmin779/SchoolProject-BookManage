<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	
    String userid = request.getParameter("userid");
    System.out.println(session.getAttribute("id"));
    
    String user_list_query = "SELECT userid, userpwd, username, phone, admin_ck FROM USER_tbl WHERE userid = '%s'";
	System.out.println(String.format(user_list_query, session.getAttribute("id")));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(String.format(user_list_query, session.getAttribute("id")));
		while (rs.next()) {
	%>
<div class="input-container">
	<form action="../action/user-self-edit.jsp">
		<div class="form-floating mb-3">
		  <input type="hidden" class="form-control" id="floatingInput" placeholder="name@example.com" name="userid" value="<%=session.getAttribute("id") %>">
		  <label for="floatingInput">책 번호</label>
		</div>
		<fieldset disabled>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="disabledTextInput" placeholder="name@example.com" value="<%=session.getAttribute("id") %>">
		  <label for="floatingInput">유저 아이디</label>
		</div>
		</fieldset>
	  <div class="form-floating mb-3">
		  <input type="password" class="form-control" id="floatingInput" placeholder="name@example.com" name="userpwd" value="<%=rs.getString("userpwd") %>">
		  <label for="floatingInput">유저 비밀번호</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="username" name="username" value="<%=rs.getString("username") %>">
		  <label for="floatingPassword">유저 이름</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="phone" name="phone" value="<%=rs.getString("phone") %>">
		  <label for="floatingPassword">유저 전화번호</label>
		</div>
		
	    <button type="submit" class="btn btn-primary">정보 수정</button>
	  </div>
	</form>
</div>
<%
		}
conn.commit();
conn.close();
} catch(Exception e){
	e.printStackTrace();
}
%>