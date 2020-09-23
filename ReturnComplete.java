/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.Book;
import Database.MemberHasBook;
import Database.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


@WebServlet(name = "ReturnComplete", urlPatterns = {"/returncomplete"})
public class ReturnComplete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
        String mhbID = req.getParameter("code");
        Session session = NewHibernateUtil.getSessionFactory().openSession();
        
       
        Criteria c1 = session.createCriteria(MemberHasBook.class);
        c1.add(Restrictions.eq("id", Integer.parseInt(mhbID)));
        MemberHasBook mhb=(MemberHasBook) c1.uniqueResult();
        mhb.setIsReurned(Boolean.TRUE);
        session.update(mhb);
        session.beginTransaction().commit();
        resp.getWriter().write("done");
    }

  
}
