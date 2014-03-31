/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package master_itm.com;

import java.sql.Date;

/**
 *
 * @author user
 */
public class CommentPojo {
   private int id;
   private String comment;
   private String insert_date;
   private int user_id;
   private int video_id;
   private int status;

    public CommentPojo() {
    }

    public CommentPojo(int id, String comment, String insert_date, int user_id, int video_id, int status) {
        this.id = id;
        this.comment = comment;
        this.insert_date = insert_date;
        this.user_id = user_id;
        this.video_id = video_id;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getInsert_date() {
        return insert_date;
    }

    public void setInsert_date(String insert_date) {
        this.insert_date = insert_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getVideo_id() {
        return video_id;
    }

    public void setVideo_id(int video_id) {
        this.video_id = video_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

         
}
