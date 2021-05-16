<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");
String username = request.getParameter("username");
String phone = request.getParameter("phone");

String user_edit_query = "UPDATE user_tbl SET userid = '%s', userpwd = '%s', username = '%s', phone = '%s' where userid = '%s'";
System.out.println(String.format(user_edit_query, userid, userpwd, username, phone, userid));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt = conn.createStatement();
		stmt.executeQuery(String.format(user_edit_query, userid, userpwd, username, phone, userid));
		System.out.println("연결에 성공했습니다.");
		conn.commit();
		conn.close();
		%>
		<script>
		alert("수정완료");
		location.href = "../user/user-mypage.jsp";
		</script><%
	} catch(Exception e){
		%>
		<script>
		alert("입력을 다시 확인해주세요");
		history.back();
		</script><%
		e.printStackTrace();
	}
%>