<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Connection Test</title>
</head>
<body>
<%
Connection con = null;
ResultSet rs = null;
PreparedStatement psmt = null;

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "system";
	String pw = "1234";
	System.out.println("DB정상연결");
	try {
		con = DriverManager.getConnection(url,id,pw);
		System.out.println("DB계정일치");
		
	} catch (SQLException e) {
		System.out.println("DB계정불일치");
		e.printStackTrace();
	}
} catch (ClassNotFoundException e) {
	System.out.println("DB연결실패");
}
%>
</body>
</html>