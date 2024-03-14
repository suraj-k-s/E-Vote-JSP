<%-- 
    Document   : Poll
    Created on : 14 Mar, 2024, 2:29:47 PM
    Author     : suraj
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poll</title>
        <%@include file="Header.jsp" %>
        <%
            
            String sel = "select * from tbl_polling where student_id='"+session.getAttribute("uid")+"'";
            ResultSet rz = con.selectCommand(sel);
            if(rz.next())
            {
                %>
                <script>
                    alert("Your Polling Alredy Registered");
                    window.location='HomePage.jsp';
                </script>
                <%
            }
            
            
            if(request.getParameter("poll")!=null)
            {
                String inQry = "insert into tbl_polling (polling_datetime,candidate_id,student_id)values(curdate(),'"+request.getParameter("poll")+"','"+session.getAttribute("uid")+"')";
                if(con.executeCommand(inQry))
                {
                    %>
                <script>
                    alert("Your Polling Registered");
                    window.location='HomePage.jsp';
                </script>
                <%
                }
            }
        %>
    </head>
    <body>
        <div id="tab" align="center">
            <h1>Candidates</h1>
            <table>
                <tr>
                    <th>sl.no</th>
                    <th>Student</th>
                    <th>Poll</th>
                </tr>
                <%
                    int i = 0;
                    String selQry1 = "select * from tbl_candidate c inner join tbl_student s on s.student_id=c.student_id where candidate_status=1";
                    ResultSet rsz = con.selectCommand(selQry1);
                    while (rsz.next()) {
                        i++;

                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rsz.getString("student_name")%></td>
                    <td><a href="Poll.jsp?poll=<%=rsz.getString("candidate_id")%>">Poll Now</a></td>

                </tr>
                <%                        }
                %>
            </table>
        </div>
        <%@include file="Footer.jsp" %>

    </body>
</html>
