/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package master_itm.com;

/**
 *
 * @author user
 */
public class VideoPojo {
    private int id;
    private String name;
    private String short_Article;
    private String article;
    private String link;
    private String cover;
    private int view;
    private int status;
    private String videos;
    private String sort;
    private String insert_date;
    private int user_id;

    public VideoPojo() {
    }

    public VideoPojo(int id, String name, String short_Article, String article, String link, String cover, int view, int status, String videos, String sort, String insert_date, int user_id) {
        this.id = id;
        this.name = name;
        this.short_Article = short_Article;
        this.article = article;
        this.link = link;
        this.cover = cover;
        this.view = view;
        this.status = status;
        this.videos = videos;
        this.sort = sort;
        this.insert_date = insert_date;
        this.user_id = user_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShort_Article() {
        return short_Article;
    }

    public void setShort_Article(String short_Article) {
        this.short_Article = short_Article;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getVideos() {
        return videos;
    }

    public void setVideos(String videos) {
        this.videos = videos;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
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

 
  
}
