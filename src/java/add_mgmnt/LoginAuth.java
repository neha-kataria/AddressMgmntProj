/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package add_mgmnt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author neha
 */
public class LoginAuth extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
       PrintWriter out=resp.getWriter();
       //req.getSession()
     //   ArrayList<RegisterUserBean> ob=(ArrayList<RegisterUserBean>) this.getServletConfig().getServletContext().getAttribute("userdetails");
       UserBean ob=(UserBean) this.getServletConfig().getServletContext().getAttribute("userdetails");
        if(req.getParameter("log_uname").equals("admin"))
       {
           if(req.getParameter("log_pass").equals("123456")){
           //out.print("Welcome admin");
           
           resp.sendRedirect("AdminProfile.jsp");
           }
           else{
               req.setAttribute("Err_login", "Wrong Credentials");
               RequestDispatcher rd=req.getRequestDispatcher("Welcome.jsp");
               rd.forward(req, resp);
           }
       }
       else{
           String name=req.getParameter("log_uname");
           String pass=req.getParameter("log_pass");
         
          // out.print("welcome "+name+" & "+pass);
            int flag = 0;
            for(RegisterUserBean u:ob.getUserList())
            { 
               if(u.getName().equals(name))
               {
                   if(u.getPass().equals(pass))
                   { flag=1;
                       out.print("welcome "+req.getParameter("log_uname"));
                        req.setAttribute("log_phone",u.getPhone() );
                        u.setLogged(true);
              //        req.setAttribute("logged_user", u);
                       HttpSession session=req.getSession();  
                      session.setAttribute("logged_user", u);
                      resp.sendRedirect("UserProfile.jsp");
              //         RequestDispatcher rd=req.getRequestDispatcher("UserProfile.jsp");
                //       rd.forward(req, resp);
                   }
                  
               }
               
              
           }
            if(flag==0)
               {   req.setAttribute("Err_login", "Wrong Credentials");
               RequestDispatcher rd=req.getRequestDispatcher("Welcome.jsp");
               rd.forward(req, resp);
               }
         //  out.print("welcome "+req.getParameter("log_uname"));
           
       }
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
       resp.sendRedirect("Welcome.jsp");
    }
    
    
   
}
