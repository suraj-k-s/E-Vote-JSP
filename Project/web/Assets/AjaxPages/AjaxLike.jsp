<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String Id = request.getParameter("id");
    String selQry = "select * from tbl_like where campaign_id  ='" + Id + "' and student_id ='" + session.getAttribute("uid") + "'";
    ResultSet rs = con.selectCommand(selQry);
    if (!rs.next()) {
        String insQry = "insert into tbl_like(campaign_id,student_id,student_name,student_photo)"
                + "values('" + Id + "','" + session.getAttribute("uid") + "','" + session.getAttribute("uname") + "','" + session.getAttribute("uphoto") + "')";

        if (con.executeCommand(insQry)) {
            String likesel = "select count(like_id) as count from tbl_like where campaign_id ='" + Id + "'";
            ResultSet cv = con.selectCommand(likesel);
            if (cv.next()) {
                out.println(cv.getString("count"));
                System.out.println(insQry);
            }

        } else {
            out.println("0");
            System.out.println(insQry);
        }
    }

%>