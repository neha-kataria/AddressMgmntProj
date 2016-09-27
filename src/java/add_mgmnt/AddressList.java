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
        ArrayList<String> addr=new ArrayList<String>();
        int count=Integer.parseInt(req.getParameter("countRows"));
        for(int i=1;i<=count;i++){
            String s="address"+i;
            if(req.getParameter(s)!=null)
            addr.add(req.getParameter(s));
            
        }
        PrintWriter out=resp.getWriter();
     //   out.print(count);
        
       
        
        
        HttpSession session=req.getSession();
        RegisterUserBean logged_user=(RegisterUserBean) session.getAttribute("logged_user");
      //  out.print(logged_user.getName());
        UserBean list=(UserBean) this.getServletConfig().getServletContext().getAttribute("userdetails");
        list.setAddress(logged_user, addr);
        req.setAttribute("logged_user", logged_user);
        RequestDispatcher rd=req.getRequestDispatcher("UserProfile.jsp");
        rd.forward(req, resp);
      //  out.print(logged_user.getAddress());
      //  resp.sendRedirect("UserProfile.jsp");
      
    }
    
    
}
