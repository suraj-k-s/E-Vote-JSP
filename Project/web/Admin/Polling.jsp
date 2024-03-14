<%-- 
    Document   : Semester
    Created on : 13 Mar, 2024, 4:09:33 AM
    Author     : suraj
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Semester</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <%    if (request.getParameter("id") != null) {
            String up = "update tbl_polling set polling_status=1 where polling_id  ='" + request.getParameter("id") + "'";
            if (con.executeCommand(up)) {
    %>
    <script>
        alert("Accepted")
        window.location = "Polling.jsp";
    </script>
    <%
            }
        }

        if (request.getParameter("rid") != null) {
            String up = "update tbl_polling set polling_status=2 where polling_id  ='" + request.getParameter("rid") + "'";
            if (con.executeCommand(up)) {
    %>
    <script>
        alert("Rejected")
        window.location = "Polling.jsp";
    </script>
    <%
            }
        }


    %>

    <body>
        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Student</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_polling c inner join tbl_student s on s.student_id=c.student_id";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("student_name")%></td>
                                                <td align="center">
                                                    <%
                                                        if (rs.getString("polling_status").equals("0")) {
                                                    %>
                                                    <a href="Polling.jsp?id=<%=rs.getString("polling_id")%>" class="status_btn">Accept</a>
                                                    <a href="Polling.jsp?rid=<%=rs.getString("polling_id")%>" class="status_btn">Reject</a>
                                                    <%
                                                    } else if (rs.getString("polling_status").equals("1")) {
                                                    %>
                                                    <a href="Polling.jsp?rid=<%=rs.getString("polling_id")%>" class="status_btn">Reject</a>
                                                    <%
                                                        }
                                                        else if (rs.getString("polling_status").equals("2")) {
                                                    %>
                                                    <a href="Polling.jsp?id=<%=rs.getString("polling_id")%>" class="status_btn">Accept</a>
                                                    <%
                                                        }
                                                    %>


                                                </td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
    <%@include file="Footer.jsp" %>
</html>

