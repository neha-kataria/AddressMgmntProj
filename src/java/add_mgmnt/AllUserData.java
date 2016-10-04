/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package add_mgmnt;

//listener interface implemented by the class to maintain the list of users wen application starts and stops or restarts

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author neha
 */
public class AllUserData implements ServletContextListener{
    ServletContext ctx=null;

    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Context object initialized in context init method");
  
        ctx=sce.getServletContext();        //get the application context
   	FileInputStream fis = null;
        try {
            UserBean userlist = null;
            
            // read object from file
       //    fis = new FileInputStream("/home/neha/Desktop/mybean.txt");
      if(new File("ListOfUsers.txt").exists()){
       fis = new FileInputStream("ListOfUsers.txt");
            ObjectInputStream ois = new ObjectInputStream(fis);
         
            userlist =  (UserBean) ois.readObject();        //read object from the file
            System.out.println(">>>>>>>>>>>>>>"+userlist.getUserList().size()); // gets the total number of users registered
            ois.close();
          
            ctx.setAttribute("userdetails", userlist);
            
      }
      else{
          ctx.setAttribute("userdetails", userlist);
      }
             
            
           
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AllUserData.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AllUserData.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AllUserData.class.getName()).log(Level.SEVERE, null, ex);
        }  catch (Exception ex) {
            Logger.getLogger(AllUserData.class.getName()).log(Level.SEVERE, null, ex);
        }  finally {
            try {
                if(fis!=null)
                fis.close();
            } catch (Exception ex) {
                Logger.getLogger(AllUserData.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }   
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
      
        System.out.println("*****************************");
        System.out.println("Context object destroyed in context destroyed method");
        ctx=sce.getServletContext();     //application context
        UserBean userlist= (UserBean) ctx.getAttribute("userdetails");        //application context retrieved and stored in userbean object
        System.out.println("*****************************");
        if(userlist!=null){
        FileOutputStream fos = null;
        try {
            
         //   fos = new FileOutputStream("/home/neha/Desktop/mybean.txt");
        //    System.out.println(">>>>>>"+new File(".").getAbsolutePath());
            fos = new FileOutputStream("ListOfUsers.txt");
             System.out.println(">>>>>>>>>>>>>>"+userlist.getUserList().size());        //printing number of records at end
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(userlist);      //write the list into file
            oos.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AllUserData.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AllUserData.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                fos.close();
            } catch (IOException ex) {
                Logger.getLogger(AllUserData.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    }
}
