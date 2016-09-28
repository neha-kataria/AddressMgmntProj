/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package add_mgmnt;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author neha
 */
public class UserBean {
    List<RegisterUserBean> userList;
    
    UserBean(){
    userList=new ArrayList<RegisterUserBean>();    
    }

    public void setUserList(List<RegisterUserBean> userList) {
        this.userList = userList;
    }

    public List<RegisterUserBean> getUserList() {
        return userList;
    }
    
    public void setAddress(RegisterUserBean ob,ArrayList<String> addr){
        int i=userList.indexOf(ob);
        RegisterUserBean user=userList.get(i);
        user.setAddress(addr);
    }
    public void setMembers(RegisterUserBean ob){
        int i=userList.indexOf(ob);
       // RegisterUserBean user=userList.get(i);
        userList.set(i, ob);
    }
    
    
    
}
