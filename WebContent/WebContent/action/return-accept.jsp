<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8" import = "java.util.Calendar"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String bookid = request.getParameter("bookid");
String userid = request.getParameter("userid");
String loanid = request.getParameter("loanid");
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
int count = 0;
String return_insert_query = "UPDATE loan_TBL set returnday = TO_DATE('%s','YYYY-MM-DD') where loanid = '%s'";
System.out.println(String.format(return_insert_query, today, loanid));

String return_request_delete = "DELETE FROM return_request_tbl where id = '%s' and bookid = '%s'";
System.out.println(String.format(return_request_delete, userid, bookid));

String book_return_status = "UPDATE book_tbl SET loanstate = null where bookid = '%s'";
System.out.println(String.format(book_return_status, bookid));


String book_populary = "SELECT * from loan_tbl where bookid = '%s'";
System.out.println(String.format(book_populary, bookid));


String update_book_populary = "UPDATE BOOK_TBL set POPULARITY = '%d' where bookid = '%s'";
System.out.println(String.format(update_book_populary, count, bookid));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt4 = conn.createStatement();
		ResultSet rs1 = stmt4.executeQuery(String.format(book_populary, bookid));
		while (rs1.next()) {
			count++;
		}
		System.out.println(count);
		Statement stmt = conn.createStatement();
		stmt.executeQuery(String.format(return_insert_query, today, loanid));
		Statement stmt2 = conn.createStatement();
		stmt2.executeQuery(String.format(return_request_delete, userid, bookid));
		Statement stmt3 = conn.createStatement();
		stmt3.executeQuery(String.format(book_return_status, bookid));
		Statement stmt5 = conn.createStatement();
		stmt5.executeQuery(String.format(update_book_populary, count, bookid));
		System.out.println("연결에 성공했습니다.");
		conn.commit();
		conn.close();
		response.sendRedirect("../admin/book-loan-return.jsp");
	} catch(Exception e){
		%>
		<script>
		alert("입력을 다시 확인해주세요");
		</script><%
		e.printStackTrace();
	}
%>