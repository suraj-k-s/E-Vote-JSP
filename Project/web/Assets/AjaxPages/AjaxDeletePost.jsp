<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String delQry = "delete from tbl_campaign where campaign_id ='"+request.getParameter("id")+"'";
    con.executeCommand(delQry);
%>