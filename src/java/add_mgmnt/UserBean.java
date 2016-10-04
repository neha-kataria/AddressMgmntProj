/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package add_mgmnt;

// this class consists of the list of users as an arraylist


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author neha
 */
public class UserBean implements Serializable{
    List<RegisterUserBean> userList;
    
    UserBean(){
    userList=new ArrayList<RegisterUserBean>();    
    }

    public void setUserList(List<RegisterUserBean> userList) {      //set userList
        this.userList = userList;
    }

    public List<RegisterUserBean> getUserList() {               //returns the list of users
        return userList;
    }
    
    public void setAddress(RegisterUserBean ob,ArrayList<String> addr){     // set the address list of the passed object
        int i=userList.indexOf(ob);
        RegisterUserBean user=userList.get(i);
        user.setAddress(addr);
    }
    public void setMembers(RegisterUserBean ob){    //set the fields of the passed object...needed after edited profile
        int i=userList.indexOf(ob);
       // RegisterUserBean user=userList.get(i);
        userList.set(i, ob);
    }
    
    
    
}
