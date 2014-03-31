/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package master_itm.com;

/**
 *
 * @author user
 */
public class UserComment {
   private String firstname;
   private String lastname;
   private String phtoto;
   private String insert_date;
   private String comment;
   private int comment_id;
   private int user_id;

    public UserComment() {
    }

    public UserComment(String firstname, String lastname, String phtoto, String insert_date, String comment, int comment_id, int user_id) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.phtoto = phtoto;
        this.insert_date = insert_date;
        this.comment = comment;
        this.comment_id = comment_id;
        this.user_id = user_id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhtoto() {
        return phtoto;
    }

    public void setPhtoto(String phtoto) {
        this.phtoto = phtoto;
    }

    public String getInsert_date() {
        return insert_date;
    }

    public void setInsert_date(String insert_date) {
        this.insert_date = insert_date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

   
    
}
