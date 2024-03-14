<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%
    String selQry = "select * from tbl_campaign order by campaign_date desc";
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {


%>

<div id="feed-post-1" class="card is-post">
    <div class="content-wrap">
        <div class="card-heading">
            <div class="user-block">
                <div class="image">
                    <img src="<%=rs.getString("candidate_photo")%>" alt="">
                </div>
                <div class="user-info">
                    <a href="#"><%=rs.getString("candidate_name")%></a>
                    <span class="time"><%=rs.getString("campaign_date")%></span>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="post-text">
                <p><%=rs.getString("campaign_details")%></p>
            </div>
            <div class="post-image">
                <%

                    if (!rs.getString("campaign_file").equals("")) {
                %>

                <img src="<%=rs.getString("campaign_file")%>" alt="">

                <%
                    }

                %>
            </div>
            <!-- Post footer -->
            <div class="card-footer">
                <!-- Followers avatars -->
                <div class="likers-group">
                    <%                        int m = 0;
                        String likesel = "select * from tbl_like where campaign_id='" + rs.getString("campaign_id") + "'";
                        ResultSet cvv = con.selectCommand(likesel);
                        while (cvv.next()) {
                            m++;
                    %>

                    <img src="<%
                        out.println(cvv.getString("student_photo"));
                         %>" >

                    <%                            if (m == 4) {
                                break;
                            }

                        }


                    %>

                </div>
                <!-- Followers text -->
                <div class="likers-text">
                    <p>
                        <%                           int n = 0;
                            String likesel1 = "select * from tbl_like where campaign_id='" + rs.getString("campaign_id") + "'";
                            ResultSet cvv1 = con.selectCommand(likesel1);
                            while (cvv1.next()) {
                                n++;

                                if (n == 1) {

                        %>

                        <a href="javascript:void(0)"><%=cvv1.getString("student_name")%></a>

                        <%

                        } else if (n == 2 || n == 3 || n == 4) {

                        %>

                        ,<a href="javascript:void(0)"><%=cvv1.getString("student_name")%></a>

                        <%
                                }

                            }


                        %>

                    </p>

                    <%                        String likeselco = "select count(like_id) as count from tbl_like where campaign_id='" + rs.getString("campaign_id") + "'";
                        ResultSet cvz = con.selectCommand(likeselco);
                        if (cvz.next()) {

                            int count = Integer.parseInt(cvz.getString("count"));
                            if (count > 4) {
                                count = count - 4;

                                out.println("<p>and " + count + " more liked this</p>");
                            } else if (count <= 4 && count >= 1) {
                                out.println("<p>liked this</p>");
                            }

                        }
                    %>
                </div>
                <!-- Post statistics -->
                <div class="social-count">
                    <div class="likes-count">
                        <%                            String zx1 = "select * from tbl_like where campaign_id='" + rs.getString("campaign_id") + "' and student_id='" + session.getAttribute("uid") + "'";
                            ResultSet zx = con.selectCommand(zx1);
                            if (zx.next()) {
                        %>
                        <img id="like" onclick="onLike(this)" src="../Assets/friendskit/assets/img/icons/feed/heart-r.svg" alt="<%=rs.getString("campaign_id")%>">
                        <%
                        } else {
                        %>
                        <img id="like" onclick="onLike(this)" src="../Assets/friendskit/assets/img/icons/feed/heart-b.svg" alt="<%=rs.getString("campaign_id")%>">

                        <%
                            }
                        %>

                        <span id="like-count">

                            <%
                                String likeselc = "select count(like_id) as count from tbl_like where campaign_id='" + rs.getString("campaign_id") + "'";
                                ResultSet cv = con.selectCommand(likeselc);
                                if (cv.next()) {
                                    if (!cv.getString("count").equals("0")) {
                                        out.println(cv.getString("count"));
                                    }
                                }
                            %>
                        </span>
                    </div>
                    <div class="comments-count" onclick="fclick(<%=rs.getString("campaign_id")%>)">
                        <img src="../Assets/friendskit/assets/img/icons/feed/message-circle.svg">
                        <span>
                            <%
                                String commentCount = "";
                                String selCo = "select count(comment_id) as ccount from tbl_comment where campaign_id='" + rs.getString("campaign_id") + "'";
                                ResultSet cc = con.selectCommand(selCo);
                                if (cc.next()) {
                                    commentCount = cc.getString("ccount");
                                    out.println(commentCount);
                                }
                            %>
                        </span>
                    </div>
                </div>
            </div>
            <!-- /Post footer -->
        </div>
        <!-- Post #1 Comments -->
        <div class="comments-wrap is-hidden" id="cid-<%=rs.getString("campaign_id")%>">
            <!-- Header -->
            <div class="comments-heading">
                <h4>Comments
                    <small>
                        <%out.println("(" + commentCount + ")");  %>
                    </small></h4>
                <div class="close-comments">
                    <i data-feather="x"></i>
                </div>
            </div>
            <!-- /Header -->

            <!-- Comments body -->
            <div class="comments-body has-slimscroll">
                <%
                    String selC = "select * from tbl_comment where campaign_id='" + rs.getString("campaign_id") + "'";
                    ResultSet ccc = con.selectCommand(selC);
                    while (ccc.next()) {


                %>
                <!-- Comment -->
                <div class="media is-comment">
                    <!-- User image -->
                    <div class="media-left">
                        <div class="image">
                            <img src="<%=ccc.getString("student_photo")%>" >
                        </div>
                    </div>
                    <!-- Content -->
                    <div class="media-content">
                        <a href="javascript:void(0)"><%=ccc.getString("student_name")%></a>
                        <span class="time"><%=ccc.getString("comment_date")%></span>
                        <p>
                            <%=ccc.getString("comment_content")%>
                        </p>

                    </div>
                </div>
                <!-- /Comment -->

                <%

                    }
                %>

            </div>
            <!-- /Comments body -->

            <!-- Comments footer -->
            <div class="card-footer">
                <div class="media post-comment has-emojis">
                    <!-- Comment Textarea -->
                    <div class="media-content">
                        <div class="field">
                            <p class="control">
                                <textarea id="content-<%=rs.getString("campaign_id")%>" class="textarea comment-textarea" rows="5" placeholder="Write a comment..."></textarea>
                            </p>
                        </div>
                        <!-- Additional actions -->
                        <div class="actions">
                            <div class="image is-32x32">
                                <img class="is-rounded" style="width: 32px; height:32px " src="<%=session.getAttribute("uphoto")%>" data-user-popover="0" alt="">
                            </div>
                            <div class="toolbar">
                                <a class="button is-solid primary-button raised" onclick="comment(<%=rs.getString("campaign_id")%>)">Post Comment</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Comments footer -->
        </div>
    </div>
</div>


<%

    }
%>