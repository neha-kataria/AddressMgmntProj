/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package add_mgmnt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author neha
 */
public class ForgotPswdServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     //  Sreq.getParameter("forgot_name");
       String name=req.getParameter("forgot_uname");
        String phone=req.getParameter("forgot_phone");
        String pwd=req.getParameter("forgot_pass");
        boolean flag=false;
         List<RegisterUserBean>  member=new ArrayList<RegisterUserBean>();
         UserBean context_list= (UserBean) this.getServletConfig().getServletContext().getAttribute("userdetails");
         member=context_list.getUserList();
         for(RegisterUserBean ob:member){
             if(ob.getName().equals(name)){
                 if(ob.getPhone().equals(phone)){
                     ob.setPass(pwd);
                     int i=member.indexOf(ob);
                     member.set(i, ob);
                     flag=true;
                     
                 }
             }
         }
         if(flag==true){
             UserBean list=new UserBean();
             list.setUserList(member);
             this.getServletConfig().getServletContext().setAttribute("userdetails",list);
             req.setAttribute("Pswdchange", "success");
         }
         else{
             req.setAttribute("Pswdchange", "failed");
             
         }
         
       RequestDispatcher dispatcher = req.getRequestDispatcher("Welcome.jsp");
        dispatcher.forward(req, resp);
    }
    
    
}
