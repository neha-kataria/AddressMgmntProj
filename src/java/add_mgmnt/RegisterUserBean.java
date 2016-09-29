package add_mgmnt;


import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author neha
 */
public class RegisterUserBean {
    String name,phone,pass;
    boolean logged;
    ArrayList<String> address=new ArrayList<String>();

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public boolean isLogged() {
        return logged;
    }

    public void setLogged(boolean logged) {
        this.logged = logged;
    }

    public String getPhone() {
        return phone;
    }

    public String getPass() {
        return pass;
    }

    public ArrayList<String> getAddress() {
        return address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setAddress(ArrayList<String> address) {
        //this.address = address;
        
        this.address.addAll(address);
    }
    
    
}
