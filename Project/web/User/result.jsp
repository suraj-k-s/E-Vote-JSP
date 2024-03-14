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
       
    </head>
    <body>
        <div id="tab" align="center">
            <h1>Result</h1>
            <table>
                <tr>
                    <th>sl.no</th>
                    <th>Student</th>
                    <th>Count</th>
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
                    <td>
                        <%
                        String selC = "SELECT count(*) as co FROM `tbl_polling` WHERE candidate_id ='"+rsz.getString("candidate_id")+"' and polling_status=1";
                         ResultSet rszz = con.selectCommand(selC);
                    if (rszz.next()) {
                        out.println(rszz.getString("co"));
                    }
                    else
                    {
                        %>
                        0
                        <%
                    }
                        %>
                    </td>
                </tr>
                <%                        }
                %>
            </table>
        </div>
        <%@include file="Footer.jsp" %>

    </body>
</html>
