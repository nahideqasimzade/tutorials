<%-- 
    Document   : test
    Created on : Mar 19, 2014, 10:35:57 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Dialog - Animation</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/south-street/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(document).ready( function() {
      
    $( "#dialog" ).dialog({
      autoOpen: true,
      modal: true,
      title: 'Əlavə Et',
      resizable: false,
      draggable: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
  $( "#dialog" ).dialog( "open" );
   $('#movie').show();
   $('#meqale').show();
  });
  
  </script>
  <style>
    
          
          .add{
            width: 100px; 
            height: 100px;
            
         }
         .add:hover{
            opacity:0.6;
filter:alpha(opacity=60); /* For IE8 and earlier */
             cursor: pointer;
         }
      
  </style>
</head>
<body>
 
    <div id="dialog" style="text-align: center">
    <li class="add" style="display: inline"><a  align="center"  ><img id="meqale" alt="Meqale" class="add"  src="images/article.png" style="display: none" /></a></li>
    <li class="add" style="display: inline; margin-left: 10px;"><a  align="center"  ><img id="movie"  class="add"  src="images/video.png" style="display: none"/></a></li>
                 
</div>
 

 
 
</body>
</html>