<%-- 
    Document   : OfficerRegisteration.jsp
    Created on : 6 Feb, 2024, 2:07:33 PM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> OfficerRegisteration</title>
    </head>
    <body>
        <form enctype="multipart/form-data" method="post" action="../Assets/ActionPages/OfficerUploadAction.jsp">
            <table border="1">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txt_name" autocomplete="off" required=""/></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="number" name="txt_contact" pattern="[+0-9]{10,13}" autocomplete="off" required/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td> <input type="email" name="txt_email" id="txt_email" autocomplete="off" required/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td> <input type="password" name="txt_pass" id="txt_pass" autocomplete="off" required/></td>
                </tr>
                <tr>
                    <td>proof</td>
                    <td><input type="file" name="fileproof" id="fileproof" required=""/></td>    
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="filephoto" id="filephoto" required=""/></td>    
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txt_address" id="txt_address" autocomplete="off" required></textarea></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="gender" id="btnmale" value="male"/>Male
                        <input type="radio" name="gender" id="btnfemale" value="female"/>Female
                        <input type="radio" name="gender" id="btnothers" value="others"/>Others
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="seldistrict" id="seldistrict" onChange="getPlace(this.value)">
                            <option value="">--select--</option>
                            <%
                                String selQry = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>  
                            <option value="<%=rs.getString("district_id")%>">
                                <%=rs.getString("district_name")%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td> 
                    <td><select name="selplace" id="selplace" required="">
                            <option value="">--select--</option>
                        </select>

                    </td>           
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_save" value="save"/></td>
                </tr>
            </table>
        </form>
    </body>
    <script src="../Assets/JQ/jquery.js"></script>
    <script>
                        function getPlace(did)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                success: function(html) {
                                    $("#selplace").html(html);

                                }
                            });
                        }</script>
</html>


