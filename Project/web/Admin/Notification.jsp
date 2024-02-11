<%-- 
    Document   : Notification.jsp
    Created on : 6 Feb, 2024, 8:47:26 PM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification </title>
    </head>
    <%
        if (request.getParameter("btn_save") != null) {
            String Notification_Title = request.getParameter("txt_title");
            String Notification_Content = request.getParameter("txt_content");
            String Notification_datetime = request.getParameter("txt_datetime");
            String insQry = "insert into tbl_notification(notification_title,notification_content,notification_datettime)values('" + Notification_Title + "','" + Notification_Content + "','" + Notification_datetime + "')";
            con.executeCommand(insQry);

        }
        if (request.getParameter("delid") != null) {
            String id = request.getParameter("delid");
            String delqry = "delete from tbl_notification where notification_id='" + id + "'";
            con.executeCommand(delqry);
        }
    %>
    <body>
        <form name="frmNotification" method="POST">
            <table border="1" align=""center">
                
                <tr>
                    <td>Title </td>
                    <td><input type="text" name="txt_title" </td>
                </tr>
                
                <tr>
                    <td>Content</td>
                    <td><textarea name="txt_content" id="txt_content" autocomplete="off" required></textarea></td>
                </tr>
                <tr>
                    <td>datetime</td>
                    <td><input type="date" name="txt_datetime"</td>
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
                <td>Notification </td>
                <td>Action</td>
            </tr>
            <%
                int i = 0;
                String selQry = "select * from tbl_notification";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("notification_title")%></td>
                <td><%=rs.getString("notification_content")%></td>
                <td><%=rs.getString("notification_datettime")%></td>
       
                  <td><a href="Notification.jsp?delid=<%=rs.getString("notification_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>

    </body>
</html>
