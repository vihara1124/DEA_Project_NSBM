/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.Book;
import Database.BookCategory;
import Database.Member;
import Database.NewHibernateUtil;
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
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;


@WebServlet(name = "RegBook", urlPatterns = {"/regbook"})
public class RegBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        Session s = NewHibernateUtil.getSessionFactory().openSession();
        
        String BookName = req.getParameter("bookname");
        String Author=req.getParameter("author");
        String Category=req.getParameter("category");
        String MemberNIC=req.getParameter("member");
        
        Criteria c = s.createCriteria(Member.class);
        c.add(Restrictions.eq("nic",MemberNIC));
        Member member=(Member) c.uniqueResult();
        
        Criteria c1 = s.createCriteria(BookCategory.class);
        c1.add(Restrictions.eq("name",Category));
        BookCategory bookcategory=(BookCategory) c1.uniqueResult();
        
        
        HttpSession session = req.getSession();
        String code=(String) session.getAttribute("code");
        
        
        Book book=new Book();
        book.setBookCode(code);
        book.setName(BookName);
        book.setAuthor(Author);
        book.setMember(member);
        book.setBookCategory(bookcategory);
        book.setStatus(Boolean.TRUE);
        
        s.save(book);
        
        Transaction t = s.beginTransaction();
        t.commit();
        req.getRequestDispatcher("BookReg.jsp").forward(req, resp);
        
    }

  
}
