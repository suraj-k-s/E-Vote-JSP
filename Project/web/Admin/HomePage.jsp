<%-- 
    Document   : HomePage
    Created on : May 5, 2021, 2:13:50 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <body>
        <section class="main_content dashboard_part">
            <!-- menu  -->
           
            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="single_element">
                                <div class="quick_activity">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="quick_activity_wrap">
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/admin/img/icon/Student.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter">
                                                            <%
                                                            String csel = "select count(*) as c from tbl_student where student_status='1'";
                                                            ResultSet cc = con.selectCommand(csel);
                                                            if(cc.next())
                                                            {
                                                                out.println(cc.getString("c"));
                                                            }
                                                            %>
                                                            </span> </h3>
                                                        <p>Students</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Students</h3>
                                    </div>
                                </div>
                                <div class="staf_list_wrapper sraf_active owl-carousel">
                                    
                                    
                                    <%
                                    String cQry = "select * from tbl_student c inner join tbl_place p on p.place_id=c.place_id ORDER BY RAND()";
                                    ResultSet crs = con.selectCommand(cQry);
                                    while(crs.next())
                                    {
                                    
                                    %>
                                    
                                    
                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="<%=crs.getString("student_photo")%>" alt="">
                                        </div>
                                        <h4><%=crs.getString("student_name")%></h4>
                                        <p><%=crs.getString("place_name")%></p>
                                    </div>
                                    
                                    
                                    
                                   <%
                                   
                                    }
                                   %>
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
