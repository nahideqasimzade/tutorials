/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package master_itm.com;

/**
 *
 * @author user
 */
public class MenuPojo {

    private int id;
    private String name;
    private String link;
    private int status;

    public MenuPojo() {
    }

    public MenuPojo(int id, String name, String link, int status) {
        this.id = id;
        this.name = name;
        this.link = link;
        this.status = status;
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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
