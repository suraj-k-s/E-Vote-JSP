<%-- 
    Document   : MyProfile.jsp
    Created on : 9 Feb, 2024, 2:18:33 PM
    Author     : USER
--%>


<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyProfile </title>
    </head>
    <body>
        <%
        String selqry="select* from tbl_student s inner join tbl_course c on c.course_id=s.course_id inner join tbl_semester s1 on s1.semester_id=s.semester_id where student_id='"+session.getAttribute("sid")+"' ";
         ResultSet s1 = con.selectCommand(selqry);       
         s1.next();
        %>
        <table border=2" align="center">
                <tr>
                <td colspan="2" align="center"><img src="../Assets/Files/<%=s1.getString("student_photo")%>" width="150" height="150"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=s1.getString("student_name") %></td>  
          </tr>
          <tr>
                <td>Contact</td>
                <td><%=s1.getString("student_contact") %></td>  
          </tr>
          <tr>
                <td>Gender</td>
                <td><%=s1.getString("student_gender") %></td>  
          </tr>
          <tr>
                <td>Address</td>
                <td><%=s1.getString("student_address") %></td>  
          </tr>
          <tr>
                <td>Admissionid</td>
                <td><%=s1.getString("student_admissionid") %></td>  
          </tr>
          <tr>
                <td>Course</td>
                <td><%=s1.getString("course_name") %></td>  
          </tr>
          <tr>
                <td>Semester</td>
                <td><%=s1.getString("semester_name") %></td>  
          </tr>
          <tr>
                <td>Photo</td>
                <td><%=s1.getString("student_photo") %></td>  
          </tr>
          <tr>
              <td colspan="2" align="center"><a href="EditProfile.jsp" value="">Edit Profile</a></td>
          </tr> 
    </body>
</html>
