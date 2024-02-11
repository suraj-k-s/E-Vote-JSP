<%-- 
    Document   : course.jsp
    Created on : 6 Feb, 2024, 11:29:06 AM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Course</title>
    </head>
       <% 
        if(request.getParameter("btn_save")!=null)
        {
            String course=request.getParameter("txt_course");
            String insQry="insert into tbl_course(course_name)values('"+course+"')";
            con.executeCommand(insQry);
        }
       
        if(request.getParameter("delid")!=null)
        {
            String id=request.getParameter("delid");
            String delqry="delete from tbl_course where course_id='"+id+"'";
            con.executeCommand(delqry);
        }
    %>
    <body>
        <form name="frmCourse" method="POST">
            <table border="1">
                <tr>
                    <td>Course name</td>
                    <td><input type="text" name="txt_course" placeholder="Enter course name" required=""/></td>
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
                <td>Course</td>
                <td>Action</td>
            </tr>
            <%
                int i=0;
                String selQry="select * from tbl_course";
                ResultSet rs=con.selectCommand(selQry);
                while(rs.next())
                {
                  i++;
                   %>
                   <tr>
                       <td><%=i%></td>
                       <td><%=rs.getString("course_name")%></td>
                       <td><a href="Course.jsp?delid=<%=rs.getString("course_id")%>">Delete</a></td>
                  </tr>
        <%
                }
        %>
            
        
    </body>
</html>
