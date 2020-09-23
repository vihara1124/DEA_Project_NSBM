/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.NewHibernateUtil;
import Database.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
              String Email = req.getParameter("email");
        String Password = req.getParameter("password");
        
        Session session = NewHibernateUtil.getSessionFactory().openSession();

        Criteria c=session.createCriteria(Staff.class);
        c.add(Restrictions.eq("email", Email));
        c.add(Restrictions.eq("password", Password));
        
        Staff staff = (Staff) c.uniqueResult();
        
            if(staff !=null){
                  HttpSession s = req.getSession();
                  s.setAttribute("user", staff);
                  req.getRequestDispatcher("User.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            System.out.println("error");
        }
        
        
    }

  
}
