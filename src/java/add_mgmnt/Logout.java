package add_mgmnt;


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
        HttpSession session=req.getSession();
        RegisterUserBean ob=(RegisterUserBean) session.getAttribute("logged_user");
        ob.setLogged(false);
        ServletContext ctx= this.getServletConfig().getServletContext();
      //  UserBean all_users=(UserBean)req.getAttribute("userdetails");
        UserBean all_users= (UserBean)ctx.getAttribute("userdetails");
        int pos=all_users.getUserList().indexOf(ob);
        all_users.getUserList().set(pos, ob);
        session.invalidate();
        resp.sendRedirect("Welcome.jsp");
    }
    
    
}
