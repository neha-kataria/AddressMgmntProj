/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package add_mgmnt;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.server.ObjID;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author neha
 */
public class AddressList extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession session=req.getSession();
        RegisterUserBean logged_user=(RegisterUserBean) session.getAttribute("logged_user");
      //  out.print(logged_user.getName());
        UserBean list=(UserBean) this.getServletConfig().getServletContext().getAttribute("userdetails");
         ArrayList<String> addr=new ArrayList<String>();
        
        if(req.getParameter("edited").equals("1")){
            String name=req.getParameter("edit_uname");
             String phone=req.getParameter("edit_phone");
              String pass=req.getParameter("edit_pass");
              for(int i=0;i<logged_user.getAddress().size();i++){
                  String adr_param="edit_address"+i;
                  String adr =req.getParameter(adr_param);
                  if(adr.length()==0)
                        logged_user.address.remove(i);  //removes the blannk field
                  else
                        logged_user.address.set(i, adr);            //sets the edited address at the required user position
                  //if(!(adr.length()==0))
                  //  addr.add(adr);
              }
              
        logged_user.setName(name);
        logged_user.setPass(pass);
        logged_user.setPhone(phone);
        
        
        
        }
        
        
        //works when add address button is clicked and new address is added
       
        int count=Integer.parseInt(req.getParameter("countRows"));  //
        System.out.println(count);
        for(int i=1;i<=count;i++){
            String s="address"+i;
            if(!req.getParameter(s).equals(""))         //if the field is non-empty then add it
                addr.add(req.getParameter(s));
            
            
        }
       
        
       
        
        
        if(!addr.isEmpty())         //if the new list of address is not empty then set it for the logged user
            logged_user.setAddress(addr);
        list.setMembers(logged_user);           // set the details of the logged user...inside the userbean list having all user details
        session.setAttribute("logged_user", logged_user);       // set the session attribute with the updated logged user details
       

// req.setAttribute("logged_user", logged_user);
     // RequestDispatcher rd=req.getRequestDispatcher("UserProfile.jsp");
      // rd.forward(req, resp);
                
      //  out.print(logged_user.getAddress());
        
      resp.sendRedirect("UserProfile.jsp");
        
     
      
    }
    
   /*
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
       HttpSession session=req.getSession();
       if(session!=null){
           session.invalidate();
       resp.sendRedirect("Welcome.jsp");
            }
    }
*/

    
}
