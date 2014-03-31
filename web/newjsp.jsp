<%-- 
    Document   : newjsp
    Created on : Mar 22, 2014, 3:25:12 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <table border="1">
            <tr>
                <td rowspan="4"><img src="user_photo/vuqar.jpg" width="110" height="180" style="border-radius: 10px;" /></td>
                <td><label>Adınız</label></td>
                <td><input id="name" style="width: 400px;" type="text" value="" required/></td>
                <td style="vertical-align: middle"><img src="images/right.png" id="rightname" /><img src="images/wrong.png" id="wrongname" /></td>
            </tr>
            <tr>
                <td><label>Soyadınız</label></td>
                <td>

                    <input id="surname" style="width: 400px;" type="text" value="" required/>
                </td>
                <td style="vertical-align: middle"><img src="images/right.png" id="rightsurname" /><img src="images/wrong.png" id="wrongsurname" /></td>
            </tr>
            <tr>
                <td><label>Ata adı</label></td>
                <td>
                    <input id="middlename" style="width: 400px;" type="text" value="" required/>
                </td>
                <td style="vertical-align: middle"><img src="images/right.png" id="rightmiddlename" /><img src="images/wrong.png" id="wrongmiddlename" /></td>
            </tr>
            <tr>
                <td>
                    <label>Mobil Telefon<span></span>&nbsp;&nbsp;&nbsp;</label>
                </td>
                <td style="vertical-align: middle"><select >
                        <option>050</option>
                        <option>051</option>
                        <option>055</option>
                        <option>070</option>
                        <option>012</option>
                    </select>
                    <input  id="tel" style="width: 353px;" type="text" value="" required/>
                </td>
                <td style="vertical-align: middle"><img src="images/right.png" id="righttel" /><img src="images/wrong.png" id="wrongtel" /></td>
            </tr>
        </table>
        <table width="678px" border="1">
            <tr>
                <td><label>Email</label></td>
                <td>
                    <input id="email" style="width: 400px;" type="email" value="" required/>
                </td>
                <td style="vertical-align: middle"><img src="images/right.png" id="rightmail" /><img src="images/wrong.png" id="wrongmail" /></td>
            </tr>
            <tr>
                <td><label>Ünvan</label></td>
                <td>
                    <textarea id="address" style="width: 410px;" name="address"> </textarea>
                </td>
                <td style="vertical-align: middle"><img src="images/right.png" id="rightaddress" /><img src="images/wrong.png" id="wrongaddress" /></td>
            </tr>
            <tr>
                <td><label>Şifrə</label></td>
                <td>
                    <input id="pass" style="width: 400px;" type="password" value="" required/>
                </td>
                <td style="vertical-align: middle"><img src="images/low.png" id="low" /><img src="images/medium.png" id="medium" /><img src="images/high.png" id="high" /><img src="images/wrong.png" id="wrongpass" /></td>
            </tr>
            
        </table>




    </body>
</html>
