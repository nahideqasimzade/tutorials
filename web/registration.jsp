<%-- 
    Document   : registration
    Created on : 08.03.2014, 19:44:50
    Author     : user
--%>

<%@page import="master_itm.com.Sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% Sql s = new Sql(); %>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
                $(document).ready(function() {
        $("#rightname").hide();
                $("#wrongname").hide();
                $("#rightsurname").hide();
                $("#wrongsurname").hide();
                $("#rightmiddlename").hide();
                $("#wrongmiddlename").hide();
                $("#righttel").hide();
                $("#wrongtel").hide();
                $("#tel").attr("maxlength", 7);
                $("#rightmail").hide();
                $("#wrongmail").hide();
                $("#rightaddress").hide();
                $("#wrongaddress").hide();
                $("#wrongpass").hide();
                $("#low").hide();
                $("#medium").hide();
                $("#high").hide();
                $("#wrongrepass").hide();
                $("#rightrepass").hide();
                $("#registr").attr("disabled", true);
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
                var name, surname, middlename, tel, email, address, password, repassword = false;
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
                middlename=true;
                activateButton();
        } else if ($("#middlename").val().length < 1) {
        $("#rightmiddlename").hide(500);
                $("#wrongmiddlename").hide(500);
                middlename=false;
                activateButton();
        } else {

        $("#rightmiddlename").hide(500);
                $("#wrongmiddlename").show(500);
                middlename=false;
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
                tel=false;
                activateButton();
        } else {

        $("#righttel").hide(500);
                $("#wrongtel").show(500);
                tel=false;
                activateButton();
        }

        });
                $("#email").keyup(function() {
                if (mail.test($("#email").val())) {
        $("#rightmail").show(500);
                $("#wrongmail").hide(500);
                email=true;
                activateButton();
        } else if ($("#email").val().length < 1) {
        $("#rightmail").hide(500);
                $("#wrongmail").hide(500);
                email=false;
                activateButton();
        } else {

        $("#rightmail").hide(500);
                $("#wrongmail").show(500);
                email=false;
                activateButton();
        }  
        

        });
                $("#address").keyup(function() {
        if ($("#address").val().length > 4) {
        $("#rightaddress").show(500);
                $("#wrongaddress").hide(500);
                address=true;
                activateButton();
        } else if ($("#address").val().length < 4 && $("#address").val().length > 1) {
        $("#rightaddress").hide(500);
                $("#wrongaddress").show(500);
                address=false;
                activateButton();
        } else {
        $("#rightaddress").hide(500);
                $("#wrongaddress").hide(500);
                address=false;
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
                password=true;
                activateButton();
        }
        else if (MediumPass.test($("#pass").val()))
        {
        $("#low").hide();
                $("#medium").fadeIn(500);
                $("#high").hide();
                $("#wrongpass").hide();
                password=true;
                activateButton();
        }
        else if (WeakPass.test($("#pass").val()))
        {
        $("#low").fadeIn(500);
                $("#medium").hide();
                $("#high").hide();
                $("#wrongpass").hide();
                password=true;
                activateButton();
        }
        else if ($("#pass").val().length < 1)
        {
        $("#low").hide(10);
                $("#medium").hide(10);
                $("#high").hide(10);
                $("#wrongpass").hide(10);
                password=false;
                activateButton();
        } else {
        $("#low").hide();
                $("#medium").hide();
                $("#high").hide();
                $("#wrongpass").fadeIn(500);
                password=false;
                activateButton();
        }
        });
                $("#repass").on('keyup', function(e) {
        if ($("#repass").val() === $("#pass").val()){
        $("#rightrepass").fadeIn(500);
                $("#wrongrepass").hide();
                repassword=true;
                activateButton();
        }
        if ($("#repass").val() !== $("#pass").val()){
        $("#rightrepass").hide();
                $("#wrongrepass").fadeIn(500);
                repassword = false;
                activateButton();
        }if ($("#repass").val().length < 1){
        $("#rightrepass").hide();
                $("#wrongrepass").hide();
                repassword = false;
                activateButton();
        }

        });
                function activateButton(){
                if (name && surname && middlename && tel && email && address && password && repassword){
                    $("#registr").removeAttr("disabled");
                } else{
                    $("#registr").attr("disabled", true);
                }

                }
        });

    </script>
    <jsp:include page="general.jsp" /> 
    <div  style="margin-top: 100px">
        <div class="artical-commentbox" style="margin-left: 50px">
            <h1 style="border: 5px">Qeydiyyat</h1>
            <br/>
            <div class="table-form">
                <form  action="Control.jsp" method="post" name="post_comment">
                    <% if(request.getParameter("info")!=null){
    if(request.getParameter("info").equals("email")){ %>
                     <label style="color: red">Bu email artıq qeydiyatdan keçib!</label>
                     <% }} %>
                    <div>
                        <label>Adınız<span>*</span></label>
                        <table>
                            <tr>
                                <td>
                                    <input id="name" name="name" style="width: 400px;" type="text" value="" required/>
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

                                    <input id="surname" name="surname" style="width: 400px;" type="text" value="" required/>
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
                                    <input id="middlename" name="middlename" style="width: 400px;" type="text" value="" required/>
                                </td>
                                <td style="vertical-align: middle"><img src="images/right.png" id="rightmiddlename" /><img src="images/wrong.png" id="wrongmiddlename" /></td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <label>Telefon<span></span></label>
                        <table>
                            <tr>
                                <td style="vertical-align: middle">
                                    <select name="code">
                                        <option value="050">050</option>
                                        <option value="051">051</option>
                                        <option value="055">055</option>
                                        <option value="070">070</option>
                                        <option value="012">012</option>
                                    </select></td>
                                <td >

                                    <input  id="tel" name="tel" style="width: 353px;" type="text" value="" required/>
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
                                    <input name="email" id="email" style="width: 400px;" type="email" value="" required/>
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
                                    <textarea id="address" style="width: 410px;" name="address"> </textarea>
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
                                    <input id="pass" name="pass" style="width: 400px;" type="password" value="" required/>
                                </td>
                                <td style="vertical-align: middle"><img src="images/low.png" id="low" /><img src="images/medium.png" id="medium" /><img src="images/high.png" id="high" /><img src="images/wrong.png" id="wrongpass" /></td>
                            </tr>
                        </table>

                    </div>
                    <div>
                        <label>Şifrənin təkrarı<span>*</span></label>
                        <table>
                            <tr>
                                <td>
                                    <input id="repass" style="width: 400px;" type="password" value="" required/>
                                </td>
                                <td style="vertical-align: middle"><img src="images/right.png" id="rightrepass" /><img src="images/wrong.png" id="wrongrepass" /></td>
                            </tr>
                        </table>

                    </div>

                    <input type="submit" id="registr" name="registr" value="Qeydiyyat">
                </form>
            </div>
            <div class="clear"> </div>
        </div>	
    </div>
</html>
