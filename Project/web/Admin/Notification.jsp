<%-- 
    Document   : Notification
    Created on : 13 Mar, 2024, 4:08:59 AM
    Author     : suraj
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <%        if (request.getParameter("btn_save") != null) {

            String insQry = "insert into tbl_notification(notification_title,notification_content,notification_datettime)values('" + request.getParameter("txt_content") + "','" + request.getParameter("txt_notification") + "','" + request.getParameter("txt_date") + "')";
            con.executeCommand(insQry);
            response.sendRedirect("Notification.jsp");

        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_notification where notification_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Notification.jsp");
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
                                <!--Form-->
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table Notification</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="txt_notification">Title</label>
                                                    <input required="" type="text" class="form-control" id="txt_notification" name="txt_notification">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_content">Content</label>
                                                    <textarea class="form-control" name="txt_content"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_date">Date</label>
                                                    <input required="" type="date" class="form-control" id="txt_date" name="txt_date">
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Title</td>
                                                <td align="center" scope="col">Content</td>
                                                <td align="center" scope="col">Date</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_notification";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("notification_title")%></td>
                                                <td align="center"><%=rs.getString("notification_content")%></td>
                                                <td align="center"><%=rs.getString("notification_datettime")%></td>
                                                <td align="center">
                                                    <a href="Notification.jsp?del=<%=rs.getString("notification_id")%>" class="status_btn">Delete</a> 
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
