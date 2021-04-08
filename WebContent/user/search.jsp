<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../css/nav-bar.css">
<link rel="stylesheet" type="text/css" href="../css/main-container.css">
<link rel="stylesheet" type="text/css" href="../css/book-manage.css">
<link rel="stylesheet" type="text/css" href="../css/user-booklist.css">
<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
</head>
<body>
	<%@ include file="../page/nav-bar.jsp" %>
	<div class="main-container">
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
        <h2 class="mt-4 mb-3">검색된 책 목록</h2>
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
	 </div>
        <%
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        %>
</body>
</html>
<script type="text/javascript" src="../js/nav.js?ver=1"></script> 