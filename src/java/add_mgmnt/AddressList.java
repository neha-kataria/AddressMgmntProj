/*
 * Create date :  
 * Modified Date
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
 * This class is intend to handle the multiple address list
 * @author neha
 */
public class AddressList extends HttpServlet{

    /**
     * 
     * 
     * @return List : 
     * @param req :
     * @param resp
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        HttpSession session=req.getSession();
        RegisterUserBean logged_user=(RegisterUserBean) session.getAttribute("logged_user");
      //  out.print(logged_user.getName());
        UserBean list=(UserBean) this.getServletConfig().getServletContext().getAttribute("userdetails");
         ArrayList<String> addr=new ArrayList<String>();
     
         
    //edit profile data code stored here     
        if(req.getParameter("edited").equals("1")){
            String name=req.getParameter("edit_uname").trim();
             String phone=req.getParameter("edit_phone").trim();
              String pass=req.getParameter("edit_pass").trim();
              for(int i=0;i<logged_user.getAddress().size();i++){
                  String adr_param="edit_address"+i;
                  String adr =req.getParameter(adr_param).trim();
                  if(!adr.equals(""))
                  {
                      addr.add(adr);    //non-blank or edited addresses added to a new list
                  }
            /*      if(adr.length()==0)
                        logged_user.address.set(i, "");            //remove(i);  //removes the blannk field
                  else
                        logged_user.address.set(i, adr);            //sets the edited address at the required user position
              */  
              }
          //    logged_user.address.remove("");
          if(name.length()!=0 && name.matches("^[a-zA-Z_]+[0-9]*"))
        logged_user.setName(name);
          if(pass.length()!=0)
        logged_user.setPass(pass);
        if(phone.length()==10 && (phone.startsWith("9")||phone.startsWith("8")||phone.startsWith("7")))
          logged_user.setPhone(phone);
        
        
        
        }
        else{
            addr.addAll(logged_user.getAddress());
        }
        
        //works when add address button is clicked and new address is added
       
        int count=Integer.parseInt(req.getParameter("countRows"));  //
     //   System.out.println(count);
     
        for(int i=1;i<=count;i++){
            String s="address"+i;
            if(!req.getParameter(s).trim().equals(""))         //if the field is non-empty then add it
                addr.add(req.getParameter(s).trim());
            
            
        }
       
        
    //   out.print(addr);
        
        
      //  if(!addr.isEmpty())         //if the new list of address is not empty then set it for the logged user
            logged_user.setAddress(addr);
        list.setMembers(logged_user);           // set the details of the logged user...inside the userbean list having all user details
        session.setAttribute("logged_user", logged_user);       // set the session attribute with the updated logged user details
       


        
      resp.sendRedirect("UserProfile.jsp");
        
     
      
    }
    
   /**
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
       HttpSession session=req.getSession();
       if(session!=null){
           session.invalidate();
       resp.sendRedirect("Welcome.jsp");
            }
    }*/


    
}
