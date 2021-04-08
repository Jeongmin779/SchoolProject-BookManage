<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("username");
String id = request.getParameter("userid");
String password = request.getParameter("userpw");
String con_pw = request.getParameter("con_pw");
String phone = request.getParameter("userphone");


String user_input_query = "INSERT INTO user_tbl(username, userid, userpwd, phone, admin_ck) VALUES('%s', '%s', '%s', '%s', '%d')";
System.out.println(String.format(user_input_query, name, id, password, phone, 0));

if(password.equals(con_pw)){
	if(password.length() >= 8){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
			Statement stmt = conn.createStatement();
			stmt.executeQuery(String.format(user_input_query, name, id, password, phone, 0));
			System.out.println("연결에 성공했습니다.");
			conn.commit();
			conn.close();
			%>
			<script>
			alert("회원가입하셨습니다. 로그인해주세요.");
			</script><%
		} catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("../userlogin.jsp");
	}
	else{
		%>
		<script>
		alert("비밀번호는 8자리 이상입니다.");
		history.back();
		</script><%
	}
}else{%>
	<script>
	alert("비밀번호 불일치!");
	history.back();
	</script><%
}

%>