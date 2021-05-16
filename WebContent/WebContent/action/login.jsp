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
	
	request.setCharacterEncoding("UTF-8");
	String id = (String)request.getParameter("userid");
	String pw = (String)request.getParameter("userpwd");
	System.out.println(id);
	System.out.println(pw);
	String dbPw = null;
	Integer admin_ck = null;
	try {
	    Class.forName("oracle.jdbc.OracleDriver");
	    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost/xe", "min", "1234");
	    Statement stmt = conn.createStatement();
	    String SQL = "select admin_ck, userpwd from user_tbl WHERE userid='"+ id +"'";
	    ResultSet rs = stmt.executeQuery(SQL);
	    while (rs.next()) {
	    	admin_ck =  rs.getInt(1);
            dbPw = rs.getString(2);
	    }

	    stmt.close();
	    conn.close();
	}
	catch (Exception e) {
	    e.printStackTrace();
	}

	if(pw.equals(dbPw)) {
		if(admin_ck == 1) {
			session.setAttribute("admin_id",id);
			PrintWriter script = response.getWriter();
			session.setMaxInactiveInterval(60*20);
    		script.println("<script>");
    		script.println("alert('로그인 성공');");
    		script.println("location.href='../admin/book-manage.jsp';");
    		script.println("</script>");
    		script.close();
    		return;
		} 
		else if(admin_ck == 0) {
			session.setAttribute("id",id);
			session.setMaxInactiveInterval(60*20);
			PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('로그인 성공했다람쥐');");
    		script.println("location.href='../user/mainpage.jsp';");
    		script.println("</script>");
    		script.close();
    		return;
		}

	} 
	
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 실패');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
%>

</body>
</html>