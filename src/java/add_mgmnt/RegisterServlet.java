package add_mgmnt;


import add_mgmnt.RegisterUserBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
    ServletContext ctx;
 UserBean l;
 List<RegisterUserBean> member;
    @Override
    public void init() throws ServletException {
        //super.init(); //To change body of generated methods, choose Tools | Templates.
        l=new UserBean();
        member=new ArrayList<RegisterUserBean>();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
        ctx=this.getServletConfig().getServletContext();  //application scope context 
        String name=req.getParameter("reg_uname");
        String phone=req.getParameter("reg_phone");
        String pwd=req.getParameter("reg_pass");
        
//        PrintWriter out=resp.getWriter();
        //out.print("Registered successfuly");
        String msg="Registered successfuly";
        RegisterUserBean user=new RegisterUserBean();
      //  List<RegisterUserBean> member=new ArrayList<RegisterUserBean>();
        user.setName(name);
        user.setPhone(phone);
        user.setPass(pwd);
        user.setLogged(false);
        member.add(user);
       
        l.setUserList(member);

        ctx.setAttribute("userdetails", l);
        req.setAttribute("user",user);
     //   resp.set("Success", msg);
     req.setAttribute("Success", msg);
        RequestDispatcher dispatcher = req.getRequestDispatcher("Welcome.jsp");
        dispatcher.forward(req, resp);
        

        
        
        
    }
    
    
}
