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
                  if(!adr.equals(""))
                  addr.add(i,adr);
              }
              logged_user.setName(name);
        logged_user.setPass(pass);
        logged_user.setPhone(phone);
        
        }
        
        
        
       
        int count=Integer.parseInt(req.getParameter("countRows"));
        for(int i=1;i<=count;i++){
            String s="address"+i;
            if(req.getParameter(s)!=null)
            addr.add(req.getParameter(s));
            
        }
        PrintWriter out=resp.getWriter();
      // out.print(count);
        
       
        
        
        
        logged_user.setAddress(addr);
        list.setMembers(logged_user);
        req.setAttribute("logged_user", logged_user);
       RequestDispatcher rd=req.getRequestDispatcher("UserProfile.jsp");
        rd.forward(req, resp);
                
      //  out.print(logged_user.getAddress());
      //  resp.sendRedirect("UserProfile.jsp");
        
      out.close();
      
    }
    
    
}
