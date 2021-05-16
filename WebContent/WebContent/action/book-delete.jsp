<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String bid = request.getParameter("bid");

String book_delete_query = "DELETE FROM book_tbl where bookid = '%s'";
System.out.println(String.format(book_delete_query, bid));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt = conn.createStatement();
		stmt.executeQuery(String.format(book_delete_query, bid));
		System.out.println("연결에 성공했습니다.");
		conn.commit();
		conn.close();
		response.sendRedirect("../admin/book-manage.jsp");
	} catch(Exception e){
		%>
		<script>
		alert("입력을 다시 확인해주세요");
		history.back();
		</script><%
		e.printStackTrace();
	}
%>