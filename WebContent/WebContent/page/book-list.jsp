<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	
	String loan_query = "SELECT bookid, bookname, bookimg, author, publisher, TO_char(bookdate,'YYYY-MM-DD') as bdate FROM Book_tbl";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "min", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(loan_query);
	%>
	<div class="rapper">
		<table class="table" style="overflow:auto;">
			<thead>
				<tr>
					<td>책ID</td>
					<td>책이름</td>
					<td>책이미지이름</td>
					<td>저자</td>
					<td>출판사</td>
					<td>출판날짜</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
			</thead>
			<tbody>
				<%
				while (rs.next()) {
		        %>
		            <tr>
		                <td><%=rs.getInt("bookid") %></td>
		                <td><%=rs.getString("bookname") %></td>
		                <td><%=rs.getString("bookimg") %></td>
		                <td><%=rs.getString("author") %></td>
		                <td><%=rs.getString("publisher") %></td>
		                <td><%=rs.getString("bdate") %></td>
		                <td>
		                	<a href="book-edit.jsp?bid=<%=rs.getInt("bookid")%>">
		                		<button type="button" class="btn btn-outline-primary btn-sm">수정</button>
		                	</a>
		                </td>
		                <td>
		                	<a href="../action/book-delete.jsp?bid=<%=rs.getInt("bookid")%>">
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