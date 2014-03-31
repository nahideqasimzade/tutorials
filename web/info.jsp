<%-- 
    Document   : info
    Created on : 08.03.2014, 16:58:20
    Author     : user
--%>

<%@page import="master_itm.com.Video_like"%>
<%@page import="master_itm.com.CommentPojo"%>
<%@page import="master_itm.com.UserComment"%>
<%@page import="master_itm.com.VideoPojo"%>
<%@page import="master_itm.com.Sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="general.jsp" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {

         

            $("#unlike").click(function() {
                $.ajax({
                    type: "post",
                    url: "Control.jsp", //this is my servlet
                    data: {
                    },
                    success: function(msg) {
                        alert('');
                    }
                });

            });




        });
    </script>
    <style type="text/css">
        .vjs-default-skin { color: #3e3636; }
        .vjs-default-skin .vjs-play-progress,
        .vjs-default-skin .vjs-volume-level { background-color: #6e6e6e }
        .vjs-default-skin .vjs-control-bar,
        .vjs-default-skin .vjs-big-play-button { background: rgba(158,158,158,0.7) }
        .vjs-default-skin .vjs-slider { background: rgba(158,158,158,0.2333333333333333) }

        #delete{
            width: 16px;
            height: 16px;
            float: right;

            background-image: url('images/delete.png');
        }
        #delete:hover{
            background-color: #cccccc;
            border-radius: 5px;
        }
    </style>
    <div class="userinfo">
        <div class="user">
            <ul>
                <li><a href="#"><img src="images/user-pic.png" title="user-name" /><span>Ipsum</span></a></li>
            </ul>
        </div>
    </div>
    <div class="clear"> </div>
    <% Sql s = new Sql();%>
    <!---//End-header---->
    <!---start-content---->
    <div class="content">
        <div class="wrap">
            <div class="single-page">
                <div class="single-page-artical">
                    <div class="artical-content">
                        <% int id = Integer.parseInt(request.getParameter("v_id"));%>
                        <% for (VideoPojo vp : s.find_video(id)) {
                                String tarix[] = vp.getInsert_date().split("-");
                                String date = tarix[2] + "." + tarix[1] + "." + tarix[0];
                        %>



                       
                        <% if (vp.getVideos()!=null) {%>
                        <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="1153" height="607" 
                               poster="http://video-js.zencoder.com/oceans-clip.png"
                               data-setup="{}">
                            <source src="8mart.mp4" type='<%=vp.getVideos()%>' />
                        </video>
                        <%}%>
                        <h3><a href="#">

                                <%=vp.getName()%></a></h3>
                        <p><%=vp.getArticle()%></p> 

                    </div>
                    <div class="artical-links">
                        <ul>

                            <% if (session.getAttribute("user_id") != null) {
                                    if (s.checkLike(Integer.parseInt(session.getAttribute("user_id").toString()), id)) {%>
                            <li><img src="images/like.png" ><span><%=s.like_count(id)%><a id="unlike"  href="Control.jsp?unlike=<%=id%>">Unlike</a></span></li>
                                        <% } else {%>
                            <li><img src="images/unlike.png" ><span><%=s.like_count(id)%> <a id="like"  href="Control.jsp?like=<%=id%>">Like</a></span></li>
                                <% }
                            } else {%>

                            <li><a href="#"><img src="images/unlike.png" ><span><%=s.like_count(id)%> &nbsp; <a href="Control.jsp?like=<%=id%>">Like</a></span></a></li>                              
                                    <% }%>
                            <li><a href="#"><img src="images/blog-icon3.png" title="Comments"><span><%=s.comment(id)%> Comment</span></a></li>
                            <li><a href="#"><img src="images/date.png" title="Comments"><span><%=date%></span></a></li>

                        </ul>
                    </div>
                    <%}%>
                    <div class="share-artical">
                        <ul>
                            <li><a href="#"><img src="images/facebooks.png" title="facebook">Facebook</a></li>
                            <li><a href="#"><img src="images/twiter.png" title="Twitter">Twiiter</a></li>
                            <li><a href="#"><img src="images/google+.png" title="google+">Google+</a></li>
                            <li><a href="#"><img src="images/rss.png" title="rss">Rss</a></li>
                        </ul>
                    </div>
                    <div class="clear"> </div>
                </div>
                <!---start-comments-section--->
                <div class="comment-section">
                    <div class="grids_of_2">
                        <h2>Comments</h2>
                        <div class="grid1_of_2">
                            <% for (UserComment u : s.userComment(id)) {%>
                            <div class="grid_img">
                                <a href=""><img src="<%= u.getPhtoto()%>" width="55" height="75" style="border-radius: 5px;" alt=""></a>
                            </div>
                            <hr/>
                            <div class="grid_text">
                                <% if (session.getAttribute("user_id") != null) {
                                        if (u.getUser_id() == Integer.parseInt(session.getAttribute("user_id").toString())) {%>
                                <a href="Control.jsp?comment_id=<%=u.getComment_id()%>&v_id=<%=id%>"><div id="delete"></div></a>
                                    <% } else {
                           }
                       }%>   

                                <h4 class="style1 list"><a href="#"><%=u.getFirstname()%> <%=u.getLastname()%></a></h4>
                                <h3 class="style"><%=u.getInsert_date()%></h3>
                                <p class="para top"><%=u.getComment()%></p>

                            </div>
                            <div class="clear"></div>

                            <%}%>
                        </div>


                        <div class="artical-commentbox">

                            <div class="table-form">
                                <form action="Control.jsp?v_id=<%=request.getParameter("v_id")%>" method="post" name="post_comment">




                                    <textarea name="comment" style="width: 98.3%; height: 90px;" rows="4" cols="50" placeholder="Enter Your Comment..."> </textarea>	
                                    <input name="btn_yaz" style="float: right; width: 170px" type="submit" value="Yaz">
                                </form>


                            </div>
                            <div class="clear"> </div>
                        </div>			
                    </div>
                </div>
                <!---//End-comments-section--->
            </div>
        </div>
    </div>
    <!----start-footer--->
    <div class="footer"></div>
</html>
