<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8" import = "java.util.Calendar"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String bookid = request.getParameter("bookid");
String userid = request.getParameter("userid");
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int intmonth = cal.get(Calendar.MONTH);
String month = null;
int intdate = cal.get(Calendar.DATE);
String date = null;
if(intmonth <= 9){
	month = "0" + intmonth;
}else{
	month = Integer.toString(intmonth);
}if(intdate <= 9){
	date = "0" + intdate;
}else{
	date = Integer.toString(intdate);
}
String today = year + "-" + month + "-" + date;
System.out.println(today);

String ioan_insert_query = "INSERT INTO ioan_tbl(ioanid, userid, bookid, loanday) VALUES(ioan_id_seq.NEXTVAL, '%s', '%s', TO_DATE('%s','YYYY-MM-DD'))";
System.out.println(String.format(ioan_insert_query, userid, bookid, today));
String ioan_request_delete = "DELETE FROM ioan_request_tbl where id = '%s' and bookid = '%s'";
System.out.println(String.format(ioan_request_delete, userid, bookid));
String book_loan_status = "UPDATE book_tbl SET ioanstate = 'yes' where bookid = '%s'";
System.out.println(String.format(book_loan_status, bookid));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt = conn.createStatement();
		stmt.executeQuery(String.format(ioan_insert_query, userid, bookid, today));
		Statement stmt2 = conn.createStatement();
		stmt2.executeQuery(String.format(ioan_request_delete, userid, bookid));
		Statement stmt3 = conn.createStatement();
		stmt3.executeQuery(String.format(book_loan_status, bookid));
		System.out.println("연결에 성공했습니다.");
		conn.commit();
		conn.close();
		response.sendRedirect("../admin/book-ioan-return.jsp");
	} catch(Exception e){
		%>
		<script>
		alert("입력을 다시 확인해주세요");
		history.back();
		</script><%
		e.printStackTrace();
	}
%>