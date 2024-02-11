<%-- 
    Document   : Place
    Created on : 14 Jan, 2024, 2:51:25 PM
    Author     : LENOVO
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
    </head>
    <%
        if(request.getParameter("btn_save")!=null)
        {
            String place=request.getParameter("txt_place");
            String id=request.getParameter("seldistrict");
            String insQry="insert into tbl_place(place_name,district_id)values('"+place+"','"+id+"')";
            con.executeCommand(insQry);
        }
        if(request.getParameter("pid")!=null)
        {
            String delQry="delete from tbl_place where place_id='"+request.getParameter("pid")+"'";
            con.executeCommand(delQry);
        }
    %>
    <body>
        <form method="POST">
            <table border="1">
                <tr>
                    <td>District</td>
                    <td> <select name="seldistrict" id="seldistrict">
                    <option value="">--select--</option>
                    <%
                       int i=0;
                       String selQry="select* from tbl_district";
                       ResultSet sr=con.selectCommand(selQry);
                       while(sr.next())
                       {
                          
                           %>
                           <option value="<%=sr.getString("district_id")%>">
                               <%=sr.getString("district_name")%>
                           </option>
                           <%
                       }
                    %>
                        </select></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input type="text" name="txt_place" placeholder="enter place" required=""/></td>
                </tr>
                <tr colspan="2" align="center">
                    <td >
                        <input type="submit" value="save" name="btn_save"/>
                        <input type="reset" value="Cancel" name="btn_cancel"/>
                    </td>
                </tr>
            </table>
        </form>
        <br><br>
        <table border="1">
            <tr>
                <td>Sl.no</td>
                <td>District</td>
                <td>Place</td>
                <td>Action</td>
            </tr>
             <%
                       int j=0;
                       String seQry="select* from tbl_place p inner join tbl_district d on d.district_id=p.district_id";
                       ResultSet rs=con.selectCommand(seQry);
                       while(rs.next())
                       {
                           j++;
                           %>
                           <tr>
                               <td><%=j%></td>
                               <td><%=rs.getString("district_name")%></td>
                               <td><%=rs.getString("place_name")%></td>
                               <td><a href="Place.jsp?pid=<%=rs.getString("place_id")%>">Delete</a></td>
                           </tr>
                           <%
                       }
                    %>
        </table>
    </body>
</html>
