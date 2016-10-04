package add_mgmnt;
// logout servlet to end the http session

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author neha
 */
public class Logout extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
        ServletContext ctx= this.getServletConfig().getServletContext();    //gets the application context object
        HttpSession session=req.getSession();         // get the active session
       RegisterUserBean ob=  (RegisterUserBean) session.getAttribute("logout_name");
     //   RegisterUserBean ob=(RegisterUserBean) session.getAttribute("logged_user"); //gets the logged user details
        UserBean all_users= (UserBean)ctx.getAttribute("userdetails");      //retrieves the list of all the registered users
        
     //   all_users.getUserList().
     
        ob.setLogged(false);    //sets the logged user logged out
        
     
    //    UserBean all_users= (UserBean)ctx.getAttribute("userdetails");      //retrieves the list of all the registered users
        
        int pos=all_users.getUserList().indexOf(ob);    //pos of the logged user in the registered user list
        all_users.getUserList().set(pos, ob);       //sets the modified object at its respective position
        session.invalidate();       //session invalidates
        resp.sendRedirect("Welcome.jsp");       //redirects to welcome page
    }
    
    
}
