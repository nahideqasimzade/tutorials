<%-- 
    Document   : userVideoTable
    Created on : Mar 30, 2014, 3:15:44 PM
    Author     : user
--%>

<%@page import="master_itm.com.Sql"%>
<%@page import="master_itm.com.VideoPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <link rel="stylesheet" href="css/component.css" />
        <script>
               $("#remove").click(function (){
                $.ajax({
                    type: "post",
                    url: "Control.jsp",
                    data: {
                        submit: 'remove',
                        id: $("#v_id").val()
                        
                    },
                    success: function (msg){
                       
                        $("#cedvel").load('userVideoTable.jsp');
                    }
                    
                    
                });
                
            });
        </script>
        <style>
            div.scroll
{

height:400px;
overflow-y: scroll;
overflow-x: hidden;
}
        </style>
    </head>
    <body>
        <% Sql s = new Sql(); %>
        <div class="scroll">
        <table id="cedvel" class="table" width="100%" style="border: 2px solid #003300">
                <thead>
                <tr>
                    
                    <th width="175" align="center" style="text-align: center; font-size: 18px; border-right: 1px solid #003300">Ad</th>
                    <th width="175" align="center" style="text-align: center; font-size: 18px; border-right: 1px solid #003300">Baxış sayı</th>
                    <th width="175" align="center" style="text-align: center; font-size: 18px ;border-right: 1px solid #003300">Tipi</th>
                    <th width="175" align="center" style="text-align: center; font-size: 18px; border-right: 1px solid #003300">Yerləşdirilmə tarixi</th>
                    <th  align="center" style="text-align: center; font-size: 18px; border-right: 1px solid #003300">ƏMƏLİYYAT</th>
                </tr>
                </thead>
                <tbody >
                    <% for(VideoPojo p : s.userVideoList(Integer.parseInt(session.getAttribute("user_id").toString()))) {%>
                <tr>
                    <td style="text-align: center; border-right: 1px solid #003300"><a><span><%=p.getName()  %></span></a></td>
                    <td style="text-align: center; border-right: 1px solid #003300"><a><span><%=p.getView() %></span></a></td>
                    <td style="text-align: center; border-right: 1px solid #003300"><a><span><%=p.getSort() %></span></a></td>
                    <td style="text-align: center; border-right: 1px solid #003300"><a><span><%=p.getInsert_date() %></span></a></td>
                    
                    
                <input id="v_id" type="hidden"  value="<%=p.getId() %>"  />
                    <td width="175" align="center" style="text-align: center; border-right: 1px solid #003300"><a id="remove" href="#" style="color: #31bc86"><span>Sil</span></a></td>
                </tr>
                
                <% } %>
                
                
                </tbody>
            </table> 
        </div>
    </body>
</html>
