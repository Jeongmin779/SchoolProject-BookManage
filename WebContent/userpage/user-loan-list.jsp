<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
        <%
	request.setCharacterEncoding("UTF-8");
	
	String recently_book_list_query = "SELECT book_tbl.bookimg as bookimg, book_tbl.author as author, book_tbl.bookname as bookname, book_tbl.bookid as bookid, book_tbl.publisher as publisher, loanid from book_tbl, loan_tbl where loan_tbl.bookid = book_tbl.bookid and loan_tbl.userid = '%s' and loan_tbl.returnday is null order by loan_tbl.loanid asc";
	System.out.println(session.getAttribute("id"));
	System.out.println(String.format(recently_book_list_query, session.getAttribute("id")));
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt1 = conn.createStatement();
		ResultSet rs1 = stmt1.executeQuery(String.format(recently_book_list_query, session.getAttribute("id")));
	%>
	<h2 class="mt-4 mb-3">대여 목록</h2>
	<% while (rs1.next()) {%>
  	<div class="card mb-3" style="width:100%;">
	  <div class="row g-0">
	    <div class="col-md-2">
	      <img src="../image/<%=rs1.getString("bookimg") %>.jpg" alt="image/<%=rs1.getString("bookimg") %>.jpg">
	    </div>
	    <div class="col-md-10">
	      <div class="card-body">
	        <h5 class="card-title"><%=rs1.getString("bookname") %></h5>
	        <div style="margin-bottom: 5px;">
		        <span class="card-text"><%=rs1.getString("author") %> 저</span>
		        <em class="divi">|</em>
		        <span class="card-text"><%=rs1.getString("publisher") %></span>
	        </div>
	        <button type="button" class="btn btn-outline-primary btn-sm" onclick="delete_check(<%=rs1.getString("bookid")%>)">반납요청</button>
	      </div>
	    </div>
	  </div>
	</div>
	 <% } %>
<%
conn.commit();
conn.close();
} catch(Exception e){
	e.printStackTrace();
	System.out.println(recently_book_list_query);
}
%>
<script>
	function delete_check(bookid){
		if(confirm("반납요청을 하시겠습니까?") == true){
			location.href="../action/return-request.jsp?bookid="+bookid;
		}
		else{
			return;
		}
	}
</script>