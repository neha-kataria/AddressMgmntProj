package add_mgmnt;


import add_mgmnt.RegisterUserBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
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
public class RegisterServlet extends HttpServlet{
    ServletContext ctx;
 UserBean l;
 
    @Override
    public void init() throws ServletException {
        //super.init(); //To change body of generated methods, choose Tools | Templates.
        ctx=this.getServletConfig().getServletContext(); 
        l=new UserBean();
      //  member=(ArrayList<RegisterUserBean>) ctx.getAttribute("userdetails");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
         //application scope context 
                List<RegisterUserBean>  member=new ArrayList<RegisterUserBean>();
            boolean entry_flag=true;    
         String msg="Registered successfuly";
         
         
        String name=req.getParameter("reg_uname").trim();
        String phone=req.getParameter("reg_phone").trim();
        String pwd=req.getParameter("reg_pass").trim();
        
      //      PrintWriter out=resp.getWriter();
           if(ctx.getAttribute("userdetails")!=null){
                l=(UserBean) ctx.getAttribute("userdetails");
                    // if(l!=null) {
          //  out.print("l not null");
    //   out.print(l.getUserList());
       member.addAll(l.getUserList());
    //   out.print(member);
        //out.print("Registered successfuly");
        
       // }
      //  else  out.print("l is null");
            }
            
        RegisterUserBean user=new RegisterUserBean();
      //validation checks
      HttpSession s=req.getSession();
      
            
      
      for(RegisterUserBean u:member){
          if(u.getName().equals(name)){
              entry_flag=false;
                    s.setAttribute("failed","user" );
              break;
          }
      }
   //     if(entry_flag==false) resp.sendRedirect("RegisterHere.jsp");
   // Pattern pattern = Pattern.compile("^[a-zA-Z_]+[0-9]*");
   // Matcher matcher=pattern.matcher(name);
    if(!name.matches("^[a-zA-Z_]+[0-9]*")){
        entry_flag=false;
              s.setAttribute("failed", "user");
    }
   
        
        if(phone.length()==10){
            if(phone.startsWith("9")||phone.startsWith("8")||phone.startsWith("7")){
             //entry_flag=true;   
            }
            else{
            entry_flag=false;
              s.setAttribute("failed", "phone");
            }
            
        } 
        else {
            entry_flag=false;
              s.setAttribute("failed", "phone");
        }
     
         if(entry_flag==false) {
             resp.sendRedirect("RegisterHere.jsp");
         }
         else{
        user.setName(name);
        user.setPhone(phone);
        user.setPass(pwd);
        user.setLogged(false);
        member.add(user);
    
        l.setUserList(member);
   
        ctx.setAttribute("userdetails", l);
        req.setAttribute("user",user);
    
       req.setAttribute("Success", msg);
       RequestDispatcher dispatcher = req.getRequestDispatcher("Welcome.jsp");
        dispatcher.forward(req, resp);
        
         }      //entry_flag=true
        
        
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
       resp.sendRedirect("Welcome.jsp");
    }
    
    
}
