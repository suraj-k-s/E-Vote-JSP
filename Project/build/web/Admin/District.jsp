<%-- 
    Document   : District
    Created on : 13 Jan, 2024, 12:36:57 PM
    Author     : LENOVO
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <%
        if (request.getParameter("btn_save") != null) {
            String District = request.getParameter("txt_district");
            String insQry = "insert into tbl_district(district_name)values('" + District + "')";
            con.executeCommand(insQry);
        }
        if (request.getParameter("delid") != null) {
            String id = request.getParameter("delid");
            String delqry = "delete from tbl_district where district_id='" + id + "'";
            con.executeCommand(delqry);
        }
    %>
    <body>
        <form name="frmDistrict" method="POST">
            <table border="1" align=""center">
                   <tr>
                    <td>District name</td>
                    <td><input type="text" name="txt_district" </td>
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
                <td>District</td>
                <td>Action</td>
            </tr>
            <%
                int i = 0;
                String selQry = "select * from tbl_district";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><a href="District.jsp?delid=<%=rs.getString("district_id")%>">Delete</a></td>
            </tr>
            <%
                }
            %>

        </table>
    </body>
</html>
