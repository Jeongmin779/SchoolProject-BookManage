<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	
	String user_list_query = "SELECT userid, userpwd, username, phone, admin_ck FROM USER_tbl";
	System.out.println(user_list_query);
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(user_list_query);
	%>
	<div class="rapper">
		<table class="table" style="overflow:auto;">
			<thead>
				<tr>
					<td>유저ID</td>
					<td>유저PWD</td>
					<td>이름</td>
					<td>핸드폰번호</td>
					<td>관리자여부</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
			</thead>
			<tbody>
				<%
				while (rs.next()) {
					int admin = rs.getInt("admin_ck");
					System.out.println(admin);
		        %>
		            <tr>
		                <td><%=rs.getString("userid") %></td>
		                <td><%=rs.getString("userpwd") %></td>
		                <td><%=rs.getString("username") %></td>
		                <td><%=rs.getString("phone") %></td>
		                <td><%if(admin == 1){
		                		%>관리자<%
		                	}else{
		                		%>일반유저<%
		                	}%>
		                </td>
		                <td>
		                	<a href="user-edit.jsp?userid=<%=rs.getString("userid")%>">
		                		<button type="button" class="btn btn-outline-primary btn-sm">수정</button>
		                	</a>
		                </td>
		                <td>
		                	<a href="../action/user-delete.jsp?userid=<%=rs.getString("userid")%>">
		                		<button type="button" class="btn btn-outline-primary btn-sm">삭제</button>
		                	</a>
		                </td>
		            </tr>
		        <%
			    }
				%>
			</tbody>
		</table>
	</div>
<%
conn.commit();
conn.close();
} catch(Exception e){
	e.printStackTrace();
}
%>