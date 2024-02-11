<%-- 
    Document   : position.jsp
    Created on : 6 Feb, 2024, 12:02:34 PM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Position</title>
    </head>
    <% 
        if(request.getParameter("btn_save")!=null)
        {
            String position=request.getParameter("txt_position");
            String insQry="insert into tbl_position(position_name)values('"+position+"')";
            con.executeCommand(insQry);
        }
       
        if(request.getParameter("delid")!=null)
        {
            String id=request.getParameter("delid");
            String delqry="delete from tbl_position where position_id='"+id+"'";
            con.executeCommand(delqry);
        }
    %>
    <body>
        <form name="frmPosition" method="POST">
            <table border="1">
                <tr>
                    <td>Position name</td>
                    <td><input type="text" name="txt_position" placeholder="Enter position" required=""/></td>
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
                <td>Position</td>
                <td>Action</td>
            </tr>
            <%
                int i=0;
                String selQry="select * from tbl_position";
                ResultSet rs=con.selectCommand(selQry);
                while(rs.next())
                {
                  i++;
                   %>
                   <tr>
                       <td><%=i%></td>
                       <td><%=rs.getString("position_name")%></td>
                       <td><a href="Position.jsp?delid=<%=rs.getString("position_id")%>">Delete</a></td>
                  </tr>
        <%
                }
        %>
            
    </body>
</html>
