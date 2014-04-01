/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package master_itm.com;

import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class Sql {

    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private Connection conn = null;

    public void connected() {
        try {
            DriverManager.registerDriver(new Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tutorialproject?zeroDateTimeBehavior=convertToNull", "root", "");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void close() {
        try {
            pst.close();
            conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public String systemDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = new Date();
        String date = "";
        date = sdf.format(d);
        return date;
    }

    public List<MenuPojo> menuList() {
        try {
            List<MenuPojo> list = new ArrayList<MenuPojo>();
            connected();
            String sql = "Select * from menu where visible=0";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                MenuPojo mp = new MenuPojo();
                mp.setId(rs.getInt(1));
                mp.setName(rs.getString(2));
                mp.setLink(rs.getString(3));
                mp.setStatus(rs.getInt(4));
                list.add(mp);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            close();
        }

    }

    public List<Sub_MenuPojo> sub_menuList(int id) {
        try {
            List<Sub_MenuPojo> list = new ArrayList<Sub_MenuPojo>();
            connected();
            String sql = "Select * from sub_menu where m_id=" + id + " and visible=0";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                Sub_MenuPojo mp = new Sub_MenuPojo();
                mp.setId(rs.getInt(1));
                mp.setName(rs.getString(2));
                mp.setLink(rs.getString(3));
                mp.setM_id(rs.getInt(4));
                mp.setStatus(rs.getInt(5));
                list.add(mp);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            close();
        }

    }

    public List<VideoPojo> videoList() {
        List<VideoPojo> list = new ArrayList<VideoPojo>();
        try {
            connected();
            String sql = "Select * from video where visible=0 order by insert_date desc Limit 16 ";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                VideoPojo ip = new VideoPojo();
                ip.setId(rs.getInt(1));
                ip.setName(rs.getString(2));
                ip.setShort_Article(rs.getString(3));
                ip.setArticle(rs.getString(4));
                ip.setLink(rs.getString(5));
                ip.setCover(rs.getString(6));
                ip.setView(rs.getInt(7));
                ip.setStatus(rs.getInt(8));
                ip.setVideos(rs.getString(9));
                ip.setSort(rs.getString(10));
                list.add(ip);
            }
            return list;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            close();
        }
    }
    
    public List<VideoPojo> userVideoList(int user_id) {
        List<VideoPojo> list = new ArrayList<VideoPojo>();
        try {
            connected();
            String sql = "Select * from video where visible=0 and user_id="+user_id+" order by insert_date desc  ";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                VideoPojo ip = new VideoPojo();
                ip.setId(rs.getInt(1));
                ip.setName(rs.getString(2));
                ip.setShort_Article(rs.getString(3));
                ip.setArticle(rs.getString(4));
                ip.setLink(rs.getString(5));
                ip.setCover(rs.getString(6));
                ip.setView(rs.getInt(7));
                ip.setStatus(rs.getInt(8));
                ip.setVideos(rs.getString(9));
                ip.setSort(rs.getString(10));
                list.add(ip);
            }
            return list;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            close();
        }
    }

    public List<VideoPojo> find_video(int id) {
        List<VideoPojo> list = new ArrayList<VideoPojo>();
        try {
            connected();
            String sql = "Select * from video where id=" + id + " and visible=0 Limit 16";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                VideoPojo ip = new VideoPojo();
                ip.setId(rs.getInt(1));
                ip.setName(rs.getString(2));
                ip.setShort_Article(rs.getString(3));
                ip.setArticle(rs.getString(4));
                ip.setLink(rs.getString(5));
                ip.setCover(rs.getString(6));
                ip.setView(rs.getInt(7));
                ip.setStatus(rs.getInt(8));
                ip.setVideos(rs.getString(9));
                ip.setSort(rs.getString(10));
                ip.setInsert_date(rs.getString(11));
                list.add(ip);
            }
            return list;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            close();
        }
    }

    public List<CommentPojo> commntList() {
        List<CommentPojo> list = new ArrayList<CommentPojo>();
        try {
            connected();
            String sql = "Select * from comments where visible=0";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                CommentPojo cp = new CommentPojo();
                cp.setId(rs.getInt(1));
                cp.setComment(rs.getString(2));
                cp.setInsert_date(rs.getString(3));
                cp.setUser_id(rs.getInt(4));
                cp.setVideo_id(rs.getInt(5));
                cp.setStatus(rs.getInt(6));
                list.add(cp);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            close();
        }
    }

    public void insertComment(CommentPojo cp) {
        try {
            connected();
            String sql = "Insert into comments(id,comments,insert_date,user_id, video_id, visible) values(0,'" + cp.getComment() + "','" + systemDate() + "'," + cp.getUser_id() + "," + cp.getVideo_id() + ",0)";
            pst = conn.prepareStatement(sql);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

    }

    public String checkUser(String email, String password) {
        try {
            int a = 0;
            String full = "";
            String sql = "Select id, firstname, lastname from users where email='" + email + "' and pass='" + password + "' and visible=0 ";
            connected();
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                a = rs.getInt(1);
                full = a + "," + rs.getString(2) + " " + rs.getString(3);
                return full;
            } else {
                return null;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            close();
        }
    }

    public boolean checkLike(int u_id, int v_id) {

        try {
            connected();
            String sql = "Select * from video_like where user_id=" + u_id + " and video_id=" + v_id + " and visible=0 ";

            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                return true;

            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        } finally {
            close();
        }
    }

    public List<UserComment> userComment(int v_id) {
        try {
            List<UserComment> list = new ArrayList<UserComment>();
            connected();
            String sql = "Select  users.firstname, users.lastname, users.photo, comments.insert_date, comments.comments, comments.id, users.id from users join comments where users.id=comments.user_id and comments.video_id=" + v_id + " and comments.visible=0 order by comments.id asc, comments.insert_date asc";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                UserComment u = new UserComment();
                u.setFirstname(rs.getString(1));
                u.setLastname(rs.getString(2));
                u.setPhtoto(rs.getString(3));
                u.setInsert_date(rs.getString(4));
                u.setComment(rs.getString(5));
                u.setComment_id(rs.getInt(6));
                u.setUser_id(rs.getInt(7));
                list.add(u);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            close();
        }
    }

    public int comment(int id) {
        try {
            connected();
            int a = 0;
            String sql = "select count(id) from comments where video_id=" + id + " and visible=0";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
            return a;
        } catch (Exception e) {
            return 0;
        } finally {
            close();
        }
    }

    public void deleteComment(int id) {
        try {
            connected();
            String sql = "Update comments set visible=1 where id=" + id + "";
            pst = conn.prepareStatement(sql);
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            close();
        }
    }

    public void like(Video_like vl) {
        try {
            connected();
            String sql = "Insert into video_like values(0," + vl.getLikes() + "," + vl.getUser_id() + "," + vl.getVideo_id() + ",0)";
            pst = conn.prepareStatement(sql);
            pst.executeUpdate();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            close();
        }

    }

    public void unlike(int v_id, int u_id) {
        try {
            connected();
            String sql = "Update video_like set visible=1 where video_id=" + v_id + " and user_id=" + u_id + "";
            pst = conn.prepareStatement(sql);
            pst.executeUpdate();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            close();
        }

    }

    public int like_count(int id) {
        try {
            connected();
            int a = 0;
            String sql = "select count(id) from video_like where video_id=" + id + " and visible=0";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
            return a;
        } catch (Exception e) {
            return 0;
        } finally {
            close();
        }
    }

    public void insertUser(UsersPojo u) {
        try {
            connected();
            String sql = "Insert into users(id,firstname,lastname,middlename,phone_number,address,email,pass,photo, visible) values (0, '" + u.getFirstname() + "', '" + u.getLastname() + "', '" + u.getMiddlename() + "', " + u.getPhone_number() + ", '" + u.getAddress() + "', '" + u.getEmail() + "', '" + u.getPassword() + "','user_photo/avatar.gif' , 0)";
            pst = conn.prepareStatement(sql);
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            close();
        }
    }

    public boolean checkEmail(String email) {
         connected();
            boolean a=false;
            
        try {
           
            String sql = "Select * from users where email='" + email + "' and  visible=0 ";
            pst = conn.prepareStatement(sql);
            rs=pst.executeQuery();
            if(rs.next()){
                
            a=true;
            }
            return a;
        } catch (Exception e) {
           return false;
        }
        finally{
        close();
        }
    }
    
    public List<UsersPojo> acount(int id){
        List<UsersPojo> list=new ArrayList<UsersPojo>();
        try {
            connected();
            
            String sql="Select * from users where id="+id+" and visible=0";
            pst=conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
            UsersPojo ap=new UsersPojo();
            ap.setId(rs.getInt(1));
            ap.setFirstname(rs.getString(2));
            ap.setLastname(rs.getString(3));
            ap.setMiddlename(rs.getString(4));
            ap.setPhone_number(rs.getInt(5));
            ap.setAddress(rs.getString(6));
            ap.setEmail(rs.getString(7));
            ap.setPassword(rs.getString(8));
            ap.setPhoto(rs.getString(9));
            ap.setVisible(rs.getInt(10));
            list.add(ap);
            
            }return list;
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }finally{
        close();
        }
    }

    public void view(int id){
        try {
            connected();
            int view=0;
            String sql1="select views from video where id="+id;
            pst=conn.prepareStatement(sql1);
            rs = pst.executeQuery();
            if(rs.next()){
             view=rs.getInt(1)+1;
            }
            String sql="Update video set views="+view+"  where id=" + id + "";
            pst=conn.prepareStatement(sql);
            pst.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally{
        close();
        }
    }
    
   
    public void updateUser(UsersPojo up){
        try {
            connected();
            String sql="Update users set firstname='"+up.getFirstname()+"', lastname='"+up.getLastname()+"', middlename='"+up.getMiddlename()+"', phone_number="+up.getPhone_number()+", address='"+up.getAddress()+"', email='"+up.getEmail()+"', pass='"+up.getPassword()+"' where id= "+up.getId();
            pst=conn.prepareStatement(sql);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
        close();
        }
    }
    
    public List<VideoPojo> listTutorial(String sort){
        List<VideoPojo> list=new ArrayList<VideoPojo>();
        try {
            connected();
            String sql="Select * from video where sort='"+sort+"' and visible=0 Order by insert_date Desc";
            pst=conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
            VideoPojo vp=new VideoPojo();
            vp.setId(rs.getInt(1));
            vp.setName(rs.getString(2));
            vp.setShort_Article(rs.getString(3));
            vp.setArticle(rs.getString(4));
            vp.setLink(rs.getString(5));
            vp.setCover(rs.getString(6));
            vp.setView(rs.getInt(7));
            vp.setStatus(rs.getInt(8));
            vp.setVideos(rs.getString(9));
            vp.setSort(rs.getString(10));
            vp.setInsert_date(rs.getString(11));
            list.add(vp);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }finally{
        close();
        }
    
    }
    
     public void updateUserPhoto(UsersPojo p){
        try {
            connected();
            String sql = "Update users set photo='" + p.getPhoto()+ "' where id=" + p.getId() + " ";
            pst = conn.prepareStatement(sql);
            pst.executeUpdate();
        } catch (Exception e) {
            e.getMessage();
        } finally {
            close();
        }
    }
     
     public void  deleteVideo(int id){
         try {
             connected();
             String sql="Update video set visible=1 where id="+id+"";
             pst=conn.prepareStatement(sql);
             pst.executeUpdate();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }finally{
         close();
         }
     
     }
     
    
     
      public List<VideoPojo> search(String letter) {
        List<VideoPojo> list = new ArrayList<VideoPojo>();
        try {
            connected();
            String sql = "SELECT * FROM video WHERE sort LIKE '"+letter+"%' or title LIKE '"+letter+"%' or article LIKE '"+letter+"%' or insert_Date Like '"+letter+"%'";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                VideoPojo ip = new VideoPojo();
                ip.setId(rs.getInt(1));
                ip.setName(rs.getString(2));
                ip.setShort_Article(rs.getString(3));
                ip.setArticle(rs.getString(4));
                ip.setLink(rs.getString(5));
                ip.setCover(rs.getString(6));
                ip.setView(rs.getInt(7));
                ip.setStatus(rs.getInt(8));
                ip.setVideos(rs.getString(9));
                ip.setSort(rs.getString(10));
                ip.setInsert_date(rs.getString(11));
                list.add(ip);
            }
            return list;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            close();
        }
    }
     
    
    public static void main(String[] args) {
        Sql s = new Sql();

//        if(s.checkLike(1, 1)){
//            System.out.println("Unlike");
//        }else{
//            System.out.println("Like");
//        }
//        for(UserComment ss : s.userComment(5)){
//            System.out.println(ss.getUser_id());
//        }
//        
//        UsersPojo up=new UsersPojo();
//     
        for(VideoPojo p : s.videoList()){
            System.out.println(p.getName()+" "+p.getId());
        }
    }
}
