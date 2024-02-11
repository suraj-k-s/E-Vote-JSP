<%-- 
    Document   : Semester.jsp
    Created on : 6 Feb, 2024, 11:58:53 AM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Semester</title>
    </head>
    <% 
        if(request.getParameter("btn_save")!=null)
        {
            String semester=request.getParameter("txt_semester");
            String insQry="insert into tbl_semester(semester_name)values('"+semester+"')";
            con.executeCommand(insQry);
        }
       
        if(request.getParameter("delid")!=null)
        {
            String id=request.getParameter("delid");
            String delqry="delete from tbl_semester where semester_id='"+id+"'";
            con.executeCommand(delqry);
        }
    %>
    <body>
       <form name="frmSemester" method="POST">
            <table border="1">
                <tr>
                    <td>Semester name</td>
                    <td><input type="text" name="txt_semester" placeholder="Enter semester name" required=""/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="Submit" value="save" name="btn_save"/>
                        <input type="Reset" value="cancel" name="btn_cancel"/>
                    </td>
                </tr>
            </table>
       </form>
        <br><br>
        <table border="1">
            <tr>
                <td>Sl.no</td>
                <td>Semester</td>
                <td>Action</td>
            </tr>
            <%
                int i=0;
                String selQry="select * from tbl_semester";
                ResultSet rs=con.selectCommand(selQry);
                while(rs.next())
                {
                  i++;
                   %>
                   <tr>
                       <td><%=i%></td>
                       <td><%=rs.getString("semester_name")%></td>
                       <td><a href="Semester.jsp?delid=<%=rs.getString("semester_id")%>">Delete</a></td>
                  </tr>
        <%
                }
        %>
            
            
    </body>
</html>
