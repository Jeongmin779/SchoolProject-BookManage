<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String bookid = request.getParameter("bookid");
String userid = request.getParameter("userid");

String user_delete_query = "DELETE FROM loan_request_tbl where id = '%s' and bookid = '%s'";
System.out.println(String.format(user_delete_query, userid, bookid));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt = conn.createStatement();
		stmt.executeQuery(String.format(user_delete_query, userid, bookid));
		System.out.println("연결에 성공했습니다.");
		conn.commit();
		conn.close();
		response.sendRedirect("../admin/book-loan-return.jsp");
	} catch(Exception e){
		%>
		<script>
		alert("입력을 다시 확인해주세요");
		history.back();
		</script><%
		e.printStackTrace();
	}
%>