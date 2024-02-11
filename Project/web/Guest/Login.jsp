<%-- 
    Document   : Login
    Created on : 8 Feb, 2024, 12:12:58 PM
    Author     : USER
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Login</title>
    </head>
    <%

        if (request.getParameter("btn_login") != null) {
            String email = request.getParameter("txt_email");
            String password = request.getParameter("txt_password");

            String selStudent = "select * from tbl_student where student_email='" + email + "'and student_password='" + password + "'";
            ResultSet rsStudent = con.selectCommand(selStudent);

            String selAdmin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
            ResultSet rsAdmin = con.selectCommand(selAdmin);

            String selOfficer = "select * from tbl_electionofficer where officer_email='" + email + "' and officer_password='" + password + "'";
            ResultSet rsOfficer = con.selectCommand(selOfficer);

            if (rsStudent.next()) {
                session.setAttribute("sid", rsStudent.getString("student_id"));
                session.setAttribute("sname", rsStudent.getString("student_name"));
                response.sendRedirect("../Student/HomePage.jsp");
            } else if (rsAdmin.next()) {
                session.setAttribute("aid", rsAdmin.getString("admin_id"));
                session.setAttribute("aname", rsAdmin.getString("admin_name"));
                response.sendRedirect("../Admin/HomePage.jsp");
            } else if (rsOfficer.next()) {
                session.setAttribute("oid", rsOfficer.getString("officer_id"));
                session.setAttribute("oname", rsOfficer.getString("officer_name"));
                response.sendRedirect("../Officer/HomePage.jsp");
            } else {
    %>
    <script>
        alert('Invalid');
    </script>
    <%
            }

        }

    %>
    <body>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txt_email"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txt_password"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_login" value="Login"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>