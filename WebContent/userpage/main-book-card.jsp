<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
        <%
	request.setCharacterEncoding("UTF-8");
	
	String recently_book_list_query = "SELECT bookimg, author, bookname, bookid, publisher, LOANSTATE FROM (SELECT bookimg, author, bookname, bookid, publisher, LOANSTATE from book_tbl order by bookid desc) where rownum <=5";
	System.out.println(recently_book_list_query);
	String popularity_book_list_query = "SELECT bookimg, author, bookname, bookid, publisher, LOANSTATE FROM (SELECT bookimg, author, bookname, bookid, publisher, LOANSTATE, popularity from book_tbl  order by popularity desc)  where rownum <=5";
	System.out.println(popularity_book_list_query);
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt1 = conn.createStatement();
		ResultSet rs1 = stmt1.executeQuery(recently_book_list_query);
		Statement stmt2 = conn.createStatement();
		ResultSet rs2 = stmt2.executeQuery(popularity_book_list_query);
	%>
	<h2 class="mt-4 mb-3">신간책목록</h2>
	<div class="row row-cols-1 row-cols-md-5 g-4">
	<% while (rs1.next()) {%>
	  <div class="col">
	    <div class="card h-300">
	      <img src="../image/<%=rs1.getString("bookimg") %>.jpg" class="card-img-top" alt="image/<%=rs1.getString("bookimg") %>.jpg">
	      <div class="card-body">
	        <h5 class="card-title"><%=rs1.getString("bookname") %></h5>
	        <div style="margin-bottom: 5px;">
		        <span class="card-text"><%=rs1.getString("author") %> 저</span>
		        <em class="divi">|</em>
		        <span class="card-text"><%=rs1.getString("publisher") %></span>
	        </div>
	        <%if(rs1.getString("LOANSTATE") == null){ %>
		        <button type="button" class="btn btn-outline-primary btn-sm" onclick="delete_check(<%=rs1.getString("bookid")%>)">대여요청</button>
		        <%}else{ %>
		        <button type="button" class="btn btn-outline-primary btn-sm" disabled>대여요청불가</button>
		        <%}%>
	      </div>
    	</div>
  	   </div>
  <% } %>
	</div>
		<h2 class="mt-4 mb-3">인기있는책목록</h2>
	<div class="row row-cols-1 row-cols-md-5 g-4">
	<% while (rs2.next()) {%>
	  <div class="col">
	    <div class="card h-100">
	      <img src="../image/<%=rs2.getString("bookimg") %>.jpg" class="card-img-top" alt="image/<%=rs2.getString("bookimg") %>.jpg">
	      <div class="card-body">
	        <h5 class="card-title"><%=rs2.getString("bookname") %></h5>
	        <div style="margin-bottom: 5px;">
		        <span class="card-text"><%=rs2.getString("author") %> 저</span>
		        <em class="divi">|</em>
		        <span class="card-text"><%=rs2.getString("publisher") %></span>
	        </div>
	        <%if(rs2.getString("LOANSTATE") == null){ %>
		        <button type="button" class="btn btn-outline-primary btn-sm" onclick="delete_check(<%=rs2.getString("bookid")%>)">대여요청</button>
		        <%}else{ %>
		        <button type="button" class="btn btn-outline-primary btn-sm" disabled>대여요청불가</button>
		        <%}%>
	      </div>
    	</div>
  	   </div>
  <% } %>
	</div>
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
		if(confirm("대여요청을 하시겠습니까?") == true){
			location.href="../action/loan-request.jsp?bookid="+bookid;
		}
		else{
			return;
		}
	}
</script>