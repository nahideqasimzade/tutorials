<%-- 
    Document   : general
    Created on : 08.03.2014, 18:35:36
    Author     : user
--%>

<%@page import="master_itm.com.Sub_MenuPojo"%>
<%@page import="master_itm.com.Sql"%>
<%@page import="master_itm.com.MenuPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link href="player/css/video-js.css" rel="stylesheet" type="text/css"/>
        <script src="player/js/video.js"></script>
        <script>
            videojs.options.flash.swf = "video-js.swf";
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
    <!----webfonts---->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!----//webfonts---->
    <!-- Global CSS for the page and tiles -->
    <link rel="stylesheet" href="css/main.css">
    <!-- //Global CSS for the page and tiles -->
    <!---start-click-drop-down-menu----->
    <script src="js/jquery.min.js"></script>
    <!----start-dropdown--->
    <script type="text/javascript">
            var $ = jQuery.noConflict();
            $(function() {
                $('#activator').click(function() {
                    $('#box').animate({'top': '0px'}, 500);
                });
                $('#boxclose').click(function() {
                    $('#box').animate({'top': '-700px'}, 500);
                });
            });
            $(document).ready(function() {
                //Hide (Collapse) the toggle containers on load
                $(".toggle_container").hide();
                //Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
                $(".trigger").click(function() {
                    $(this).toggleClass("active").next().slideToggle("slow");
                    return false; //Prevent the browser jump to the link anchor
                });

            });
    </script>
    <style>
        .link:visited{
            color: #376f2a;
            font-weight: 600;
        }
        .link{
            color: #376f2a;
            font-weight: 600;
         }
         .link:hover{
            text-decoration:underline;
            color: #376f2a;
            font-weight: 600;
         }
         
    
        .link1:visited{
            color: #cc0000;
            font-weight: 600;
        }
        .link1{
            color: #cc0000;
            font-weight: 600;
         }
         .link1:hover{
            text-decoration:underline;
            color: #cc0000;
            font-weight: 600;
         }
         .SmallerPage{
            margin-left: auto;
            margin-right: auto;
            float: top;
            width: 985px; height: 100% !important; 

            transform:scale(0.88);
            -ms-transform-origin:0 0;
            -webkit-transform-origin:0 0;
            -moz-transform-origin:0 0;
            transform-origin:0 0;




        }



    </style>
    <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
	<link rel='stylesheet' type='text/css' href='styles.css' />
</head>
<body>
    <div class="header">
        <div class="wrap">
            <div class="logo">
                <a href="home.jsp"><img src="images/logo.png" title="pinbal" /></a>
            </div>
            <div class="nav-icon" style="float: top">
                <a href="#" class="right_bt" id="activator"><span> </span> </a>
            </div>
        </div>
        <div class="box"  id="box" >
                   					                         
              
            <div>
                            <div id='cssmenu' style="text-align: center"  >
                                <% Sql s=new Sql(); %>
                                <ul >
                                    <%for (MenuPojo mp : s.menuList()) {%>
                                    <li  class='has-sub'><a style="font-family: Times New Roman " href='<%=mp.getLink() %>'><span ><%=mp.getName() %></span></a>
                                        <ul style="font-family: Times New Roman ">
                                            <% for (Sub_MenuPojo p : s.sub_menuList(mp.getId())) {%>
                                            <li style="font-family: Times New Roman "><a style="font-family: Times New Roman " href='<%=p.getLink() %>'><span><%=p.getName() %></span></a></li>
                                            <%}%>
                                        </ul>
                                    </li>
                                        
                                  <%}%>
                                  <li><a    id="boxclose"> <span style="height: 20px"><img src="images/close2h.png" width="15" height="15"/></span></a></li>
                     
                                </ul>
                                
                                 
                        </div>
                               
                    
            </div>
        </div>  
                                  <div class="top-searchbar">
                                      <form action="search.jsp?">
                
                                          <input name="keyword" type="text" /><input type="submit" value="" />
                    
            </form>
            
        </div>
                           
                                  <% if(session.getAttribute("fullname")!=null) {%>
                                  <span style="float: right; margin-right: 10px; "><a class="link"  href="account.jsp"><%=session.getAttribute("fullname")%></a>&nbsp;<a  class="link1" name="logout"  href="Control.jsp?logout=out">Çıxış</a></span>  
             
                                  
                                  <% } %>
                                 
                                
    </div>
</body>
</html>
