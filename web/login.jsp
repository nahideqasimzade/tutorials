<%-- 
    Document   : login
    Created on : Mar 12, 2014, 5:34:48 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if (session.getAttribute("user_id") != null) {
                        response.sendRedirect("home.jsp");

}else{       %>
<html>

    <jsp:include page="general.jsp" /> 
     
    <div align="left" style="margin-top: 100px">

        
        <div class="artical-commentbox" style="margin-left: 50px">
          
            <h1 style="border: 5px">Login</h1>
            <br/>
              <% if(request.getParameter("info")!=null){
    if(request.getParameter("info").equals("newUser")){ %>
            <label style="color: green">Siz müvəffəqiyyətlə qeydiyatdan keçdiniz. Lütfən sayta daxil olun.</label>
            <% }
    else if(request.getParameter("info").equals("wrong")){ %>
        <label style="color: red">Daxil etdiyiniz email və ya şifrə səhvdir.</label>
    <% }} %>
            <div class="table-form">
               
                <form action="Control.jsp" method="post" name="post_comment">
                    
                    <div>
                        <label>Email<span>*</span></label>
                        <input name="email" type="email" value=" " required/>
                    </div>
                    <div>
                        <label>Şifrə<span>*</span></label>
                        <input name="password" type="password" value="" required/>
                    </div>

                    <input name="btnLogin" type="submit" value="submit">

                </form>


            </div>
            <div class="clear"> </div>
        </div>	


    </div>


</html>
<%  } %> 
