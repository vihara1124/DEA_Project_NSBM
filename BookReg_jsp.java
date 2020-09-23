package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Database.Member;
import java.util.List;
import Database.BookCategory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Criteria;
import Database.Book;
import Database.NewHibernateUtil;
import org.hibernate.Session;
import java.util.Random;
import java.util.UUID;

public final class BookReg_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


                            String GenerateCode() {

                                Random rnd = new Random();
                                int number = rnd.nextInt(999999);

                                String code = "B-" + String.format("%06d", number);
                                return code;
                            }

                        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Book Registration</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css\" integrity=\"sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q=\" crossorigin=\"anonymous\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.5.1.js\" integrity=\"sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js\" integrity=\"sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI=\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Nav.jsp", out, false);
      out.write("\n");
      out.write("        <div class=\"ui grid\">\n");
      out.write("            <div class=\"two wide column\">\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"eight wide column\">\n");
      out.write("                <div class=\"ui hidden divider\"></div>\n");
      out.write("                <h2 class=\"ui grey header\">Register New Book</h2>\n");
      out.write("                <div class=\"ui hidden divider\"></div>\n");
      out.write("\n");
      out.write("                <form class=\"ui form\" action=\"regbook\" method=\"GET\">\n");
      out.write("                    <div class=\"field\">\n");
      out.write("                        <label >Book Code</label>\n");
      out.write("                        ");
      out.write("\n");
      out.write("                        ");

                        String code=GenerateCode();
                        Session s=NewHibernateUtil.getSessionFactory().openSession();
                        Criteria c=s.createCriteria(Book.class);       
                        c.add(Restrictions.eq("bookCode", code));
                        Book bookcodeavailable=(Book)c.uniqueResult();
   
                        if(bookcodeavailable!=null){
                            code=GenerateCode();
                        }else{
                            session.setAttribute("code", code);
                        
      out.write("\n");
      out.write("                        \n");
      out.write("                        <input type=\"text\" disabled=\"\" value=\"");
      out.print( code );
      out.write("\">\n");
      out.write("                        ");

                        }

                        
      out.write("\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"field\">\n");
      out.write("                        <label>Book Name</label>\n");
      out.write("                        <input type=\"text\" name=\"bookname\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"field\">\n");
      out.write("                        <label>Author</label>\n");
      out.write("                        <input type=\"text\" name=\"author\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"field\">\n");
      out.write("                        <label>Category</label>\n");
      out.write("                        <select class=\"ui dropdown\" name=\"category\">\n");
      out.write("                            <option value=\"\">Select Category</option>\n");
      out.write("                            ");

                                Criteria c1=s.createCriteria(BookCategory.class);
                                List<BookCategory> list=c1.list();
                                for (BookCategory l : list) {
                                        
      out.write("\n");
      out.write("                                        <option value=\"");
      out.print( l.getName() );
      out.write('"');
      out.write('>');
      out.print( l.getName() );
      out.write("</option>\n");
      out.write("                                        ");

                                    }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"field\">\n");
      out.write("                        <label>Select Member</label>\n");
      out.write("                        <select class=\"ui search dropdown\" name=\"member\">\n");
      out.write("                            <option value=\"\">Select Member</option>\n");
      out.write("                            ");

                                Criteria c2=s.createCriteria(Member.class);
                                List<Member> list2=c2.list();
                                for (Member l : list2) {
                                        
      out.write("\n");
      out.write("                                        <option value=\"");
      out.print( l.getNic() );
      out.write('"');
      out.write('>');
      out.print( l.getNic());
      out.write("</option>\n");
      out.write("                                        ");

                                    }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"ui hidden divider\"></div>\n");
      out.write("                    <button type=\"submit\" class=\"ui teal right floated button\">Save</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"four wide middle aligned column\">\n");
      out.write("                <div class=\"ui center aligned segment\">\n");
      out.write("                    <h3>Already Member?</h3>\n");
      out.write("                    <a href=\"SignUpMember.jsp\"> <button class=\"ui basic grey button\">Sign Up As Member</button></a> \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("            $('.ui.dropdown').dropdown();\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
