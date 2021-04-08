<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
        <%
	request.setCharacterEncoding("UTF-8");
	
	String recently_book_list_query = "SELECT bookimg, author, bookname, bookid, publisher FROM (SELECT bookimg, author, bookname, bookid, publisher  from book_tbl order by bookid desc) where rownum <=5";
	System.out.println(recently_book_list_query);
	String popularity_book_list_query = "SELECT bookimg, author, bookname, bookid, publisher FROM book_tbl Where rownum <= 5 order by popularity desc";
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
	        <a href="user/loan-book.jsp?bookid=<%=rs1.getInt("bookid")%>">
				<button type="button" class="btn btn-outline-primary btn-sm">대여</button>
			</a>
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
	        <a href="user/loan-book.jsp?bookid=<%=rs2.getInt("bookid")%>">
				<button type="button" class="btn btn-outline-primary btn-sm">대여</button>
			</a>
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