<%@page import="master_itm.com.UsersPojo"%>
<%@page import="master_itm.com.Video_like"%>
<%@page import="master_itm.com.Sql"%>
<%@page import="master_itm.com.CommentPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Sql s = new Sql();
    if (request.getParameter("btnLogin") != null) {
        if (s.checkUser(request.getParameter("email"), request.getParameter("password")) != null) {
            String full = s.checkUser(request.getParameter("email"), request.getParameter("password"));
            String a[] = full.split(",");
            session.setAttribute("user_id", a[0]);
            session.setAttribute("email", request.getParameter("email"));
            session.setAttribute("password", request.getParameter("password"));
            session.setAttribute("fullname", a[1]);
            session.setMaxInactiveInterval(1000);
            response.sendRedirect("home.jsp");

        } else {
            response.sendRedirect("login.jsp?info=wrong");
        }
    }

    if (request.getParameter("like") != null) {
        if (session.getAttribute("user_id") != null) {
            Video_like vl = new Video_like();
            vl.setLikes(1);
            vl.setUser_id(Integer.parseInt(session.getAttribute("user_id").toString()));
            vl.setVideo_id(Integer.parseInt(request.getParameter("v_id")));
            s.like(vl);
            response.sendRedirect("info.jsp?v_id=" + Integer.parseInt(request.getParameter("v_id").toString()));
        } else {
            response.sendRedirect("login.jsp");
        }
    }


    if (request.getParameter("comment_id") != null) {
        int id = Integer.parseInt(request.getParameter("comment_id"));

        s.deleteComment(id);
        response.sendRedirect("info.jsp?v_id=" + Integer.parseInt(request.getParameter("v_id")));
    }


    if (request.getParameter("unlike") != null) {
        if (session.getAttribute("user_id") != null) {
            Video_like vl = new Video_like();
            vl.setLikes(1);
            vl.setUser_id(Integer.parseInt(session.getAttribute("user_id").toString()));
            vl.setVideo_id(Integer.parseInt(request.getParameter("unlike").toString()));
            s.unlike(Integer.parseInt(request.getParameter("unlike").toString()), Integer.parseInt(session.getAttribute("user_id").toString()));
            response.sendRedirect("info.jsp?v_id=" + Integer.parseInt(request.getParameter("unlike").toString()));
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    if (request.getParameter("registr") != null) {
        if (!s.checkEmail(request.getParameter("email"))) {
            String tel = request.getParameter("code")+request.getParameter("tel");
            
            UsersPojo up = new UsersPojo();
            up.setFirstname(request.getParameter("name"));
            up.setLastname(request.getParameter("surname"));
            up.setMiddlename(request.getParameter("middlename"));
            up.setPhone_number(Integer.parseInt(tel));
            up.setAddress(request.getParameter("address"));
            up.setEmail(request.getParameter("email"));
            up.setPassword(request.getParameter("pass"));
            s.insertUser(up);
            response.sendRedirect("login.jsp?info=newUser");
        } else {
            response.sendRedirect("registration.jsp?info=email");
        }
    }




    if (request.getParameter("btn_yaz") != null) {
        if (session.getAttribute("email") == null && session.getAttribute("password") == null) {
            response.sendRedirect("login.jsp");
        } else {

            CommentPojo cp = new CommentPojo();
            cp.setComment(request.getParameter("comment"));
            cp.setVideo_id(Integer.parseInt(request.getParameter("v_id")));
            cp.setUser_id(Integer.parseInt(session.getAttribute("user_id").toString()));

            s.insertComment(cp);
            response.sendRedirect("info.jsp?v_id=" + request.getParameter("v_id"));
        }
    }
    if (request.getParameter("button") != null) {
        if(request.getParameter("button").equals("update")){
            UsersPojo pojo = new UsersPojo();
            pojo.setId(Integer.parseInt(session.getAttribute("user_id").toString()));
            pojo.setFirstname(request.getParameter("name"));
            pojo.setLastname(request.getParameter("surname"));
            pojo.setMiddlename(request.getParameter("middlename"));
            pojo.setEmail(request.getParameter("email"));
            pojo.setPhone_number(Integer.parseInt(request.getParameter("tel")));
            pojo.setAddress(request.getParameter("address"));
            pojo.setPassword(request.getParameter("pass"));
            s.updateUser(pojo);
            
        }
    }
    
    if (request.getParameter("v_id") != null) {
        int video_id = Integer.parseInt(request.getParameter("v_id"));
            s.view(video_id);
            response.sendRedirect("info.jsp?v_id="+video_id);
    }
    
    
    if(request.getParameter("logout")!=null){
    session.invalidate();
    response.sendRedirect("home.jsp");
    }
    
 if(request.getParameter("submit")!=null){
     
     s.deleteVideo(Integer.parseInt(request.getParameter("id")));
     response.sendRedirect("account.jsp");
     
   
 }
 
 
 
%>