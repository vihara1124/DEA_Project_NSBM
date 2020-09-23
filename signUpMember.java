/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.Member;
import Database.NewHibernateUtil;
import Database.Staff;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

@WebServlet(name = "signUpMember", urlPatterns = {"/signupmember"})
public class signUpMember extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyy");

            DiskFileItemFactory dfif = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(dfif);
            List<FileItem> list = sfu.parseRequest(req);

            Member member = new Member();
            for (FileItem fileItem : list) {
                if (fileItem.isFormField()) {

                    String fieldName = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if (fieldName.equals("fn")) {
                        member.setFname(value);
                    } else if (fieldName.equals("ln")) {
                        member.setLname(value);
                    } else if (fieldName.equals("nic")) {
                        member.setNic(value);
                    } else if (fieldName.equals("gender")) {
                        member.setGender(value);
                    } else if (fieldName.equals("email")) {
                        member.setEmail(value);
                    } else if (fieldName.equals("mobile")) {
                        member.setMobile(value);
                    }

                } else {
                    Session session = NewHibernateUtil.getSessionFactory().openSession();
                    String extension = fileItem.getContentType().split("/")[1];
                    if ((extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("jpeg") || extension.equalsIgnoreCase("png"))) {
                        String fileName = UUID.randomUUID().toString();
                        Criteria userCriteria = session.createCriteria(Member.class);
                        userCriteria.add(Restrictions.eq("image", fileName));
                        Member u = (Member) userCriteria.uniqueResult();

                             if (fileItem.getFieldName().equals("image")) {
                                if (u == null) {
                                    String path = req.getServletContext().getRealPath("") + "/images/member/" + fileName + "." + extension;
                                    File file = new File(path);
                                    fileItem.write(file);
                                    member.setImage(fileName);
                                }
                            }
                        
      
                    }
                }
            }
            SessionFactory sf = NewHibernateUtil.getSessionFactory();
            Session session = sf.openSession();

            //set date join
            Date date = new Date();
            member.setDateJoin(sdf.format(date));

            session.save(member);
            Transaction t = session.beginTransaction();
            t.commit();
            req.getRequestDispatcher("BookReg.jsp").forward(req, resp);
        } catch (FileUploadException ex) {
            Logger.getLogger(signUpMember.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(signUpMember.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
