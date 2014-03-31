/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package master_itm.com;

/**
 *
 * @author user
 */
public class UsersPojo {
    private int id;
    private String firstname;
    private String lastname;
    private String middlename;
    private int phone_number;
    private String address;
    private String email;
    private String password;
    private String photo;
    private int visible;
   

    public UsersPojo() {
    }

    public UsersPojo(int id, String firstname, String lastname, String middlename, int phone_number, String address, String email, String password, String photo, int visible) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.middlename = middlename;
        this.phone_number = phone_number;
        this.address = address;
        this.email = email;
        this.password = password;
        this.photo = photo;
        this.visible = visible;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getMiddlename() {
        return middlename;
    }

    public void setMiddlename(String middlename) {
        this.middlename = middlename;
    }

    public int getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(int phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getVisible() {
        return visible;
    }

    public void setVisible(int visible) {
        this.visible = visible;
    }

    
}
