/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package add_mgmnt;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author neha
 */
public class LoginAuth extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
       PrintWriter out=resp.getWriter();
       if(req.getParameter("log_uname").equals("admin"))
       {
           if(req.getParameter("log_pass").equals("123456")){
           out.print("Welcome admin");
           }
           else{
               req.setAttribute("Err_login", "Wrong Credentials");
               RequestDispatcher rd=req.getRequestDispatcher("Welcome.jsp");
               rd.forward(req, resp);
           }
       }
       else{
           out.print("welcome "+req.getParameter("log_uname"));
           
       }
    }
    
    
}
