<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");
String username = request.getParameter("username");
String phone = request.getParameter("phone");
String admin_ck = request.getParameter("admin_ck");

String user_edit_query = "UPDATE user_tbl SET userid = '%s', userpwd = '%s', username = '%s', phone = '%s', admin_ck = '%s' where userid = '%s'";
System.out.println(String.format(user_edit_query, userid, userpwd, username, phone, admin_ck, userid));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt = conn.createStatement();
		stmt.executeQuery(String.format(user_edit_query, userid, userpwd, username, phone, admin_ck, userid));
		System.out.println("연결에 성공했습니다.");
		conn.commit();
		conn.close();
		response.sendRedirect("../admin/user-manage.jsp");
	} catch(Exception e){
		%>
		<script>
		alert("입력을 다시 확인해주세요");
		history.back();
		</script><%
		e.printStackTrace();
	}
%>