<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        String search = request.getParameter("search");
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost/xe", "min", "1234");
    
            Statement stmt = conn.createStatement();
            String SQL = "SELECT bookimg, author, bookname, bookid, publisher, IOANSTATE from book_tbl where bookname like '%"+search+"%'";
            System.out.println(SQL);
            ResultSet rs1 = stmt.executeQuery(SQL);
        %>
        <h2 class="mt-4 mb-3">책 목록</h2>
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
		        <%if(rs1.getString("IOANSTATE") == null){ %>
		        <button type="button" class="btn btn-outline-primary btn-sm" onclick="delete_check(<%=rs1.getString("bookid")%>)">대여요청</button>
		        <%}else{ %>
		        <button type="button" class="btn btn-outline-primary btn-sm" disabled>대여요청불가</button>
		        <%}%>
		      </div>
		    </div>
		  </div>
		</div>
	 <% } %>
        <%
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        %>
</body>
</html>