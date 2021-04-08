<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String bookid = request.getParameter("bookid");
System.out.println(bookid);

String book_loan_query = "INSERT INTO ioan_request_tbl(id, bookid) VALUES('%s', '%s')";
System.out.println(String.format(book_loan_query, session.getAttribute("id"), bookid));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt = conn.createStatement();
		stmt.executeQuery(String.format(book_loan_query, session.getAttribute("id"), bookid));
		System.out.println("연결에 성공했습니다.");
		conn.commit();
		conn.close();
		%>
		<script>
		alert("대여요청되었습니다");
		history.back();
		</script><%
	} catch(Exception e){
		%>
		<script>
		alert("이미 대여요청중인 책입니다.");
		history.back();
		</script><%
		e.printStackTrace();
	}
%>