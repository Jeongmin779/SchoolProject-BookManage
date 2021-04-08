<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
    <%
        String search = request.getParameter("search");
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost/xe", "rbgk", "1234");
    
            Statement stmt = conn.createStatement();
            String SQL = "select * from book_table where book_name like '%"+search+"%'";
            ResultSet rs = stmt.executeQuery(SQL);
    
        %>
            <table>
            <%
            while (rs.next()) {
                %>  
                    <tr> 
                        <td><img src="../book-img/<%=rs.getString(1)%>.png" height="150px"></td>
                        <td>
                            <div><%=rs.getString(2) %></div> 
                               <div><%=rs.getString(3) %></div>
                               <div><%=rs.getString(4) %></div>
                               <div><%=rs.getString(5) %></div>
                               <div><button>찜하기</button></div>
                        </td>
                       </tr>
                   <%
            }
            %>
            </tbody>
        </table>
        <%
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        %>