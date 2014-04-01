<%-- 
    Document   : registration
    Created on : 08.03.2014, 19:44:50
    Author     : user
--%>

<%@page import="master_itm.com.VideoPojo"%>
<%@page import="master_itm.com.UsersPojo"%>
<%@page import="master_itm.com.Sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% if (session.getAttribute("user_id") != null) {%>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.9.1.js"></script>

  <link rel="stylesheet" href="/resources/demos/style.css">
    <script type="text/javascript">
        $(document).ready(function() {
            $('#dialog').load('dialog.jsp');
            $("#cedvel").load('userVideoTable.jsp');
            $("#rightname").hide();
            $("#wrongname").hide();
            $("#rightsurname").hide();
            $("#wrongsurname").hide();
            $("#rightmiddlename").hide();
            $("#wrongmiddlename").hide();
            $("#righttel").hide();
            $("#wrongtel").hide();
            $("#wrongpass").hide();
            $("#tel").attr("maxlength", 9);
            $("#rightmail").hide();
            $("#wrongmail").hide();
            $("#rightaddress").hide();
            $("#wrongaddress").hide();
            $("#low").hide();
            $("#medium").hide();
            $("#high").hide();
            $("#wrongrepass").hide();
            $("#rightrepass").hide();
            $("#save").hide();

            $("#name").attr("disabled", true);
            $("#surname").attr("disabled", true);
            $("#middlename").attr("disabled", true);
            $("#tel").attr("disabled", true);
            $("#email").attr("disabled", true);
            $("#address").attr("disabled", true);
            $("#pass").attr("disabled", true);
            $("#operator").attr("disabled", true);
            var letter = /^[a-zA-Z]*$/;
            var number = /^[0-9]*$/;
            var mail = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,6}$/i;
            //Must contain 5 characters or more
            var WeakPass = /(?=.{5,}).*/;
//Must contain lower case letters and at least one digit.
            var MediumPass = /^(?=\S*?[a-z])(?=\S*?[0-9])\S{5,}$/;
//Must contain at least one upper case letter, one lower case letter and one digit.
            var StrongPass = /^(?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9])\S{5,}$/;
//Must contain at least one upper case letter, one lower case letter and one digit.
            var VryStrongPass = /^(?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9])(?=\S*?[^\w\*])\S{5,}$/;
            var name = true, surname = true, middlename = true, tel = true, email = true, address = true, password = true;
            $("#name").keyup(function() {
                if ($("#name").val().length > 3 && letter.test($("#name").val())) {
                    $("#rightname").show(500);
                    $("#wrongname").hide(500);
                    name = true;
                    activateButton();
                } else if ($("#name").val().length < 1) {
                    $("#rightname").hide(500);
                    $("#wrongname").hide(500);
                    name = false;
                    activateButton();
                } else {
                    name = false;
                    $("#rightname").hide(500);
                    $("#wrongname").show(500);
                    activateButton();
                }

            });
            $("#goacount").click(function() {
                $("#account").fadeIn(700);
                $("#videos").fadeOut(500);


            });
            $("#govideos").click(function() {

                $("#account").fadeOut(500);
                $("#videos").fadeIn(700);

            });

            $("#surname").keyup(function() {
                if ($("#surname").val().length > 3 && letter.test($("#surname").val())) {
                    $("#rightsurname").show(500);
                    $("#wrongsurname").hide(500);
                    surname = true;
                    activateButton();
                } else if ($("#surname").val().length < 1) {
                    $("#rightsurname").hide(500);
                    $("#wrongsurname").hide(500);
                    surname = false;
                    activateButton();
                } else {
                    surname = false;
                    $("#rightsurname").hide(500);
                    $("#wrongsurname").show(500);
                    activateButton();
                }

            });
            $("#middlename").keyup(function() {
                if ($("#middlename").val().length > 3 && letter.test($("#middlename").val())) {
                    $("#rightmiddlename").show(500);
                    $("#wrongmiddlename").hide(500);
                    middlename = true;
                    activateButton();
                } else if ($("#middlename").val().length < 1) {
                    $("#rightmiddlename").hide(500);
                    $("#wrongmiddlename").hide(500);
                    middlename = false;
                    activateButton();
                } else {

                    $("#rightmiddlename").hide(500);
                    $("#wrongmiddlename").show(500);
                    middlename = false;
                    activateButton();
                }

            });
            $("#tel").keyup(function() {
                if ($("#tel").val().length >= 7 && number.test($("#tel").val())) {
                    $("#righttel").show(500);
                    $("#wrongtel").hide(500);
                    tel = true;
                    activateButton();
                } else if ($("#tel").val().length < 1) {
                    $("#righttel").hide(500);
                    $("#wrongtel").hide(500);
                    tel = false;
                    activateButton();
                } else {

                    $("#righttel").hide(500);
                    $("#wrongtel").show(500);
                    tel = false;
                    activateButton();
                }

            });
            $("#email").keyup(function() {
                if (mail.test($("#email").val())) {
                    $("#rightmail").show(500);
                    $("#wrongmail").hide(500);
                    email = true;
                    activateButton();
                } else if ($("#email").val().length < 1) {
                    $("#rightmail").hide(500);
                    $("#wrongmail").hide(500);
                    email = false;
                    activateButton();
                } else {

                    $("#rightmail").hide(500);
                    $("#wrongmail").show(500);
                    email = false;
                    activateButton();
                }

            });
            $("#address").keyup(function() {
                if ($("#address").val().length > 4) {
                    $("#rightaddress").show(500);
                    $("#wrongaddress").hide(500);
                    address = true;
                    activateButton();
                } else if ($("#address").val().length < 4 && $("#address").val().length > 1) {
                    $("#rightaddress").hide(500);
                    $("#wrongaddress").show(500);
                    address = false;
                    activateButton();
                } else {
                    $("#rightaddress").hide(500);
                    $("#wrongaddress").hide(500);
                    address = false;
                    activateButton();
                }

            });
            $("#pass").on('keyup', function(e) {
                if (StrongPass.test($("#pass").val()))
                {
                    $("#low").hide();
                    $("#medium").hide();
                    $("#wrongpass").hide();
                    $("#high").fadeIn(500);
                    password = true;
                    activateButton();
                }
                else if (MediumPass.test($("#pass").val()))
                {
                    $("#low").hide();
                    $("#medium").fadeIn(500);
                    $("#high").hide();
                    $("#wrongpass").hide();
                    password = true;
                    activateButton();
                }
                else if (WeakPass.test($("#pass").val()))
                {
                    $("#low").fadeIn(500);
                    $("#medium").hide();
                    $("#high").hide();
                    $("#wrongpass").hide();
                    password = true;
                    activateButton();
                }
                else if ($("#pass").val().length < 1)
                {
                    $("#low").hide(10);
                    $("#medium").hide(10);
                    $("#high").hide(10);
                    $("#wrongpass").hide(10);
                    password = false;
                    activateButton();
                } else {
                    $("#low").hide();
                    $("#medium").hide();
                    $("#high").hide();
                    $("#wrongpass").fadeIn(500);
                    password = false;
                    activateButton();
                }
            });
            $("#repass").on('keyup', function(e) {
                if ($("#repass").val() === $("#pass").val()) {
                    $("#rightrepass").fadeIn(500);
                    $("#wrongrepass").hide();
                    repassword = true;
                    activateButton();
                }
                if ($("#repass").val() !== $("#pass").val()) {
                    $("#rightrepass").hide();
                    $("#wrongrepass").fadeIn(500);
                    repassword = false;
                    activateButton();
                }
                if ($("#repass").val().length < 1) {
                    $("#rightrepass").hide();
                    $("#wrongrepass").hide();
                    repassword = false;
                    activateButton();
                }

            });
            
            
            
            function activateButton() {
                if (name && surname && middlename && tel && email && address && password) {
                    $("#save").removeAttr("disabled");
                } else {
                    $("#save").attr("disabled", true);
                }

            }

            $("#change").click(function() {
                $("#save").show();
                $("#save").attr("disabled", false);

                $("#name").attr("disabled", false);
                $("#surname").attr("disabled", false);
                $("#middlename").attr("disabled", false);
                $("#tel").attr("disabled", false);
                $("#email").attr("disabled", false);
                $("#address").attr("disabled", false);
                $("#pass").attr("disabled", false);
                $("#operator").attr("disabled", false);
                activeButton();
            });
            
            

            $("#save").click(function() {
                $.ajax({
                    type: "post",
                    url: "Control.jsp", //this is my servlet
                    data: {
                        button: 'update',
                        name: $('#name').val(),
                        surname: $("#surname").val(),
                        middlename: $("#middlename").val(),
                        tel: $("#tel").val(),
                        address: $("#address").val(),
                        email: $("#email").val(),
                        pass: $("#pass").val()


                    },
                    success: function(msg) {
                        $("#name").attr("disabled", true);
                        $("#surname").attr("disabled", true);
                        $("#middlename").attr("disabled", true);
                        $("#tel").attr("disabled", true);
                        $("#email").attr("disabled", true);
                        $("#address").attr("disabled", true);
                        $("#pass").attr("disabled", true);
                        $("#operator").attr("disabled", true);
                        $("#rightname").hide();
                        $("#wrongname").hide();
                        $("#rightsurname").hide();
                        $("#wrongsurname").hide();
                        $("#rightmiddlename").hide();
                        $("#wrongmiddlename").hide();
                        $("#righttel").hide();
                        $("#wrongtel").hide();
                        $("#wrongpass").hide();
                        $("#tel").attr("maxlength", 7);
                        $("#rightmail").hide();
                        $("#wrongmail").hide();
                        $("#rightaddress").hide();
                        $("#wrongaddress").hide();
                        $("#low").hide();
                        $("#medium").hide();
                        $("#high").hide();
                        $("#wrongrepass").hide();
                        $("#rightrepass").hide();
                        $("#save").hide();
                        alert('melumatlar deyiwdirildi');
                    }
                });

            });

            $('#edit').mouseover(function() {
                $('#editimg').fadeIn(300);
            });
            $('#edit').mouseleave(function() {
                $('#editimg').fadeOut(200);
            });
            
             $('#edit1').mouseover(function() {
                $('#editimg1').fadeIn(300);
            });
            $('#edit1').mouseleave(function() {
                $('#editimg1').fadeOut(200);
            });
            
            
            
          
    $('#add').click(function() {
               $('#dialog').load('dialog.jsp');
               $('#dialog').show();
            });

        });

    </script>
 

 

    <style>
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

        .select{
            width: 30px; 
            height: 30px;
         }
         .select:hover{
            opacity:0.6;
filter:alpha(opacity=60); /* For IE8 and earlier */
             cursor: pointer;
         }


    </style>
    
   
    <jsp:include page="general.jsp" /> 

    <div class="SmallerPage" style="margin-top: 100px">

        <% Sql s = new Sql();%>
        
        <div style="display: inline" >
            <ul style="margin-left: 500px;">
                <li class="select" style="display: inline"><a  align="center"  id="goacount" ><img class="select"  src="images/account.png" /></a></li>
                <li class="select" style="display: inline"><a  align="center" id="govideos" ><img  class="select"  src="images/videos.png" /></a></li>
                 <li class="select" style="display: inline"><a  align="center" id="add" ><img  class="select"  src="images/add.png" /></a></li>
            </ul>
        </div>
        
        <div style="display:none" id="dialog">
            
        </div>
      
        
        <div id="account" class="artical-commentbox" style="margin-left: 50px">

            <h1 style="border: 5px">Hesabım</h1>
            <br/>
            <div class="table-form">

                <form>
                    <% int id = Integer.parseInt(session.getAttribute("user_id").toString());
                        for (UsersPojo a : s.acount(id)) {
                    %>
                    <div >

                        <div  id="edit" style="width: 150px ;position: relative; left: 0; top: 0;">
                            <img  style="border-radius: 10px;"  width="150" height="180" src="<%=a.getPhoto()%>" style="position: relative; top: 0; left: 0;"/>
                            <a id="editimg" href="user_photo.jsp" style="display: none"><img src="images/editimg.png" style="position: absolute; top: 1px; left: 122px;"/></a>
                        </div>


                    </div>
                    <div>
                        <label>Adınız<span>*</span></label>
                        <table>
                            <tr>
                                <td>
                                    <input id="name" name="name" style="width: 400px;" type="text" value="<%=a.getFirstname()%>" required/>
                                </td>
                                <td style="vertical-align: middle"><img src="images/right.png" id="rightname" /><img src="images/wrong.png" id="wrongname" /></td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <label>Soyadınız<span>*</span></label>
                        <table>
                            <tr>
                                <td>

                                    <input id="surname" name="surname" style="width: 400px;" type="text" value="<%=a.getLastname()%>" required/>
                                </td>
                                <td style="vertical-align: middle"><img src="images/right.png" id="rightsurname" /><img src="images/wrong.png" id="wrongsurname" /></td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <label>Atasının Adı<span>*</span></label>
                        <table>
                            <tr>
                                <td>
                                    <input id="middlename" name="middlename" style="width: 400px;" type="text" value="<%=a.getMiddlename()%>" required/>
                                </td>
                                <td style="vertical-align: middle"><img src="images/right.png" id="rightmiddlename" /><img src="images/wrong.png" id="wrongmiddlename" /></td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <label>Mobil Telefon<span></span></label>
                        <table>
                            <tr>

                                <td >

                                    <input  id="tel" name="tel" style="width: 400px;" type="text" value="<%=a.getPhone_number()%>" required/>
                                </td>
                                <td style="vertical-align: middle"><img src="images/right.png" id="righttel" /><img src="images/wrong.png" id="wrongtel" /></td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <label>Email<span>*</span></label>
                        <table>
                            <tr>
                                <td>
                                    <input id="email" name="email" style="width: 400px;" type="email" value="<%=a.getEmail()%>" required/>
                                </td>
                                <td style="vertical-align: middle"><img src="images/right.png" id="rightmail" /><img src="images/wrong.png" id="wrongmail" /></td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <label>Adress<span></span></label>
                        <table>
                            <tr>
                                <td>
                                    <textarea id="address" name="address" style="width: 410px;" > <%=a.getAddress()%></textarea>
                                </td>
                                <td style="vertical-align: middle"><img src="images/right.png" id="rightaddress" /><img src="images/wrong.png" id="wrongaddress" /></td>
                            </tr>
                        </table>

                    </div>
                    <div>
                        <label>Şifrə<span>*</span></label>
                        <table>
                            <tr>
                                <td>
                                    <input id="pass" name="pass" style="width: 400px;" type="password" value="<%=a.getPassword()%>" required/>
                                </td>
                                <td style="vertical-align: middle"><img src="images/low.png" id="low" /><img src="images/medium.png" id="medium" /><img src="images/high.png" id="high" /><img src="images/wrong.png" id="wrongpass" /></td>
                            </tr>
                        </table>

                    </div>
                    <%}%>


                </form>
                <table>
                    <tr><td>
                            <input type="submit" id="change" value="Dəyiş"> 
                        </td>
                        <td>
                            <input type="submit" name="save" id="save" value="Yadda Saxla">
                        </td></tr>
                </table>







            </div>
            <div class="clear"> </div>

        </div>	
        <div id="videos" class="artical-commentbox" style="margin-left: 50px; display: none">

            <h1 style="border: 5px">Videolarım</h1>
            <br/>
            <div class="table-form">

                <form>
                    <% 
                        for (UsersPojo a : s.acount(id)) {
                    %>
                    <div >

                      <div >

                        <div id="edit1" style="position: relative; left: 0; top: 0;">
                            <img  style="border-radius: 10px;"  width="150" height="180" src="<%=a.getPhoto()%>" style="position: relative; top: 0; left: 0;"/>
                            <a id="editimg1" href="user_photo.jsp" style="display: none"><img src="images/editimg.png" style="position: absolute; top: 1px; left: 122px;"/></a>
                        </div>


                    </div>
                   
                    <%}%>

                    <div>
                        <table id="cedvel" width="100%" >
               
            </table>  
                        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<script src="js/jquery.stickyheader.js"></script>
                    </div>
                </form>
                
                
            </div>
            <div class="clear"> </div>

        </div>	
    </div>

    <% } else {
            response.sendRedirect("login.jsp");

        }%>
</html>
