<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	
	String loan_request_query = "SELECT book_tbl.bookname, ioan_request_tbl.bookid as bookid, ioan_request_tbl.id as id from ioan_request_tbl, book_tbl, user_tbl where ioan_request_tbl.bookid = book_tbl.bookid and ioan_request_tbl.id = user_tbl.userid";
	String return_request_query = "SELECT book_tbl.bookname, return_request_tbl.bookid as bookid, return_request_tbl.id as id, ioan_tbl.ioanid from return_request_tbl, book_tbl, user_tbl , ioan_tbl where return_request_tbl.bookid = book_tbl.bookid and ioan_tbl.bookid = book_tbl.bookid and return_request_tbl.id = user_tbl.userid and ioan_tbl.returnday is null";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt1 = conn.createStatement();
		ResultSet rs1 = stmt1.executeQuery(loan_request_query);
		Statement stmt2 = conn.createStatement();
		ResultSet rs2 = stmt2.executeQuery(return_request_query);
	%>
	<h2>대여 요청</h2>
	<div class="rapper">
		<table class="table" style="overflow:auto;">
			<thead>
				<tr>
					<td>책ID</td>
					<td>책이름</td>
					<td>요청한유저</td>
					<td>요청수락</td>
					<td>요청삭제</td>
				</tr>
			</thead>
			<tbody>
				<%
				while (rs1.next()) {
		        %>
		            <tr>
		                <td><%=rs1.getInt("bookid") %></td>
		                <td><%=rs1.getString("bookname") %></td>
		                <td><%=rs1.getString("id") %></td>
		                <td>
		                	<a href="../action/ioan-accept.jsp?bookid=<%=rs1.getInt("bookid")%>&userid=<%=rs1.getString("id")%>">
		                		<button type="button" class="btn btn-outline-primary btn-sm">요청수락</button>
		                	</a>
		                </td>
		                <td>
		                	<a href="../action/ioan-delete.jsp?bookid=<%=rs1.getInt("bookid")%>&userid=<%=rs1.getString("id")%>">
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
	<h2>반납 요청</h2>
	<div class="rapper">
		<table class="table" style="overflow:auto;">
			<thead>
				<tr>
					<td>책ID</td>
					<td>책이름</td>
					<td>요청한유저</td>
					<td>요청수락</td>
					<td>요청삭제</td>
				</tr>
			</thead>
			<tbody>
				<%
				while (rs2.next()) {
		        %>
		            <tr>
		                <td><%=rs2.getInt("bookid") %></td>
		                <td><%=rs2.getString("bookname") %></td>
		                <td><%=rs2.getString("id") %></td>
		                <td>
		                	<a href="../action/return-accept.jsp?bookid=<%=rs2.getInt("bookid")%>&userid=<%=rs2.getString("id")%>&ioanid=<%=rs2.getString("ioanid")%>">
		                		<button type="button" class="btn btn-outline-primary btn-sm">요청수락</button>
		                	</a>
		                </td>
		                <td>
		                	<a href="../action/return-delete.jsp?bookid=<%=rs2.getInt("bookid")%>&userid=<%=rs2.getString("id")%>">
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