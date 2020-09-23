/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.Book;
import Database.Member;
import Database.MemberHasBook;
import Database.NewHibernateUtil;
import Database.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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


@WebServlet(name = "BorrowBook", urlPatterns = {"/borrowBook"})
public class BorrowBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String BookCode = req.getParameter("BC");
        String MemberId = req.getParameter("MI");
        String DateIssue = req.getParameter("DI");
        String DateReturn = req.getParameter("DR");

        Session session = NewHibernateUtil.getSessionFactory().openSession();

        Criteria c1 = session.createCriteria(Book.class);
        c1.add(Restrictions.eq("bookCode", BookCode));
        Book Book = (Book) c1.uniqueResult();

        Criteria c2 = session.createCriteria(Member.class);
        c2.add(Restrictions.eq("nic", MemberId));
        Member member = (Member) c2.uniqueResult();

        Criteria c3 = session.createCriteria(MemberHasBook.class);
        c3.add(Restrictions.eq("book", Book));
        List<MemberHasBook> booklist = c3.list();

        HttpSession s = req.getSession();
        Staff staff = (Staff) s.getAttribute("user");

        if (staff != null) {
            if (!booklist.isEmpty()) {

                Set hs = new HashSet();
                for (MemberHasBook memberHasBook : booklist) {
                    hs.add(memberHasBook.getIsReurned());
                }

                if (hs.contains(true)) {

                    MemberHasBook mhb = new MemberHasBook();
                    mhb.setBook(Book);
                    mhb.setMember(member);
                    mhb.setDateIssue(DateIssue);
                    mhb.setDateReturn(DateReturn);
                    mhb.setStaff(staff);
                    mhb.setIsReurned(Boolean.FALSE);
                    session.save(mhb);

                    Transaction t = session.beginTransaction();
                    t.commit();

                    resp.getWriter().write("done");
                } else {

                    resp.getWriter().write("Cant");
                }
            }else{
                
                    MemberHasBook mhb = new MemberHasBook();
                    mhb.setBook(Book);
                    mhb.setMember(member);
                    mhb.setDateIssue(DateIssue);
                    mhb.setDateReturn(DateReturn);
                    mhb.setStaff(staff);
                    mhb.setIsReurned(Boolean.FALSE);
                    session.save(mhb);

                    Transaction t = session.beginTransaction();
                    t.commit();

                    resp.getWriter().write("done");
            }
        }

    }

}
