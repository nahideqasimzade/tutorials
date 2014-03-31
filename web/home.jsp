<%-- 
    Document   : home
    Created on : 08.03.2014, 16:39:11
    Author     : user
--%>

<%@page import="master_itm.com.VideoPojo"%>
<%@page import="master_itm.com.Sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <jsp:include page="general.jsp" /> 
    <% Sql s = new Sql();%>
    <style>
        .linkhome{
            color: #999999;
            
        }
    </style>
    
    
    <div class="clear"> </div>
</div>
</div>
<!---//End-header---->
<!---start-content---->
<div class="content">
    <div class="wrap">
        <div id="main" role="main">
            <ul id="tiles">
                <!-- These are our grid blocks -->
                <% for (VideoPojo ip : s.videoList()) {%>
                <li>
                    
                    <a href="Control.jsp?v_id=<%=ip.getId() %>"> <img src="<%=ip.getCover() %>" width="282" height="210"></a>
                    <div class="post-info">

                        <div class="post-basic-info">

                            <h3><a href="Control.jsp?v_id=<%=ip.getId() %> "><%=ip.getName()%></a></h3>

                            <p><a href="Control.jsp?v_id=<%=ip.getId() %> " class="linkhome"><%=ip.getArticle().substring(0, 60) %>...</a></p>

                        </div>
                        <div style="font-weight: 500; font-size: 16px; color: #224f0a" class="post-info-rate-share">
                            <%=ip.getView() %> 
                            <div class="rateit">
                                <span>  </span>
                                
                                
                            </div>
                            <%=ip.getSort() %>
                            <div class="post-share">
                                
                                <span> </span>
                            </div>
                            <div class="clear"> </div>
                        </div>

                    </div>
                    
                </li>
<%}%>

                <!-- End of grid blocks -->
            </ul>
        </div>
    </div>
</div>
<!---//End-content---->
<!----wookmark-scripts---->
<script src="js/jquery.imagesloaded.js"></script>
<script src="js/jquery.wookmark.js"></script>
<script type="text/javascript">
                    (function($) {
                        var $tiles = $('#tiles'),
                                $handler = $('li', $tiles),
                                $main = $('#main'),
                                $window = $(window),
                                $document = $(document),
                                options = {
                            autoResize: true, // This will auto-update the layout when the browser window is resized.
                            container: $main, // Optional, used for some extra CSS styling
                            offset: 20, // Optional, the distance between grid items
                            itemWidth: 280 // Optional, the width of a grid item
                        };
                        /**
                         * Reinitializes the wookmark handler after all images have loaded
                         */
                        function applyLayout() {
                            $tiles.imagesLoaded(function() {
                                // Destroy the old handler
                                if ($handler.wookmarkInstance) {
                                    $handler.wookmarkInstance.clear();
                                }

                                // Create a new layout handler.
                                $handler = $('li', $tiles);
                                $handler.wookmark(options);
                            });
                        }
                        /**
                         * When scrolled all the way to the bottom, add more tiles
                         */
                        
                        

                        // Call the layout function for the first time
                        applyLayout();

                        // Capture scroll event.
                        
                    })(jQuery);
</script>
<!----//wookmark-scripts---->
<!----start-footer--->
<div class="footer"></div>
</html>
