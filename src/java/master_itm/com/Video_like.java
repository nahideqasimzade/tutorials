/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package master_itm.com;

/**
 *
 * @author user
 */
public class Video_like {
    private int id;
    private int likes;
    private int user_id;
    private int video_id;

    public Video_like() {
    }

    public Video_like(int id, int likes, int user_id, int video_id) {
        this.id = id;
        this.likes = likes;
        this.user_id = user_id;
        this.video_id = video_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
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
    
}
