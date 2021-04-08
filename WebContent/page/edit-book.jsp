<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	
    String bid = request.getParameter("bid");
    System.out.println(bid);
    
	String loan_query = "SELECT bookid, bookname, author, publisher, TO_char(bookdate,'YYYY-MM-DD') as bdate FROM Book_tbl WHERE bookid = %s";
	System.out.println(String.format(loan_query, bid));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(String.format(loan_query, bid));
		while (rs.next()) {
	%>
<div class="input-container">
	<form action="../action/book-edit.jsp">
	<div class="form-floating mb-3">
		  <input type="hidden" class="form-control" id="floatingInput" placeholder="name@example.com" name="bid" value="<%=bid %>">
		  <label for="floatingInput">책 번호</label>
		</div>
	  <div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="bookname" value="<%=rs.getString("bookname") %>">
		  <label for="floatingInput">책 이름</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="Password" name="author" value="<%=rs.getString("author") %>">
		  <label for="floatingPassword">저자</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="Password" name="publisher" value="<%=rs.getString("publisher") %>">
		  <label for="floatingPassword">출판사</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="Password" name="bookimg">
		  <label for="floatingPassword">도서이미지이름</label>
		</div>
		<div class="form-floating mb-3">
			<input type="text" class="selector" placeholder="날짜를 선택하세요." name="date" value="<%=rs.getString("bdate") %>">
			<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
		</div>
	    <button type="submit" class="btn btn-primary">도서 입력</button>
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
<script type="text/javascript"> 
	$(function () { $('#datetimepicker1').datetimepicker({ format: 'L'});
	$('#datetimepicker2').datetimepicker({ format: 'L', useCurrent: false });
	$("#datetimepicker1").on("change.datetimepicker", function (e) { $('#datetimepicker2').datetimepicker('minDate', e.date); });
	$("#datetimepicker2").on("change.datetimepicker", function (e) { $('#datetimepicker1').datetimepicker('maxDate', e.date); }); }); 
	$(".selector").flatpickr({ 
		dateFormat: "Y-m-d"
		});
</script>