
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author neha
 */
public class RegisterServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
        String name=req.getParameter("reg_uname");
        String phone=req.getParameter("reg_phone");
        String pwd=req.getParameter("reg_pass");
        
        RegisterUserBean user=new RegisterUserBean();
        user.setName(name);
        user.setPhone(phone);
        user.setPass(pwd);
        req.setAttribute("user",user);
        RequestDispatcher dispatcher = req.getRequestDispatcher("address.jsp");
        dispatcher.forward(req, resp);
        
        //resp.setContentType("text/html");
        
        
        
    }
    
    
}
