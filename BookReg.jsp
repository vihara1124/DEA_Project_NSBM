

<%@page import="Database.Member"%>
<%@page import="java.util.List"%>
<%@page import="Database.BookCategory"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Database.Book"%>
<%@page import="Database.NewHibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.UUID"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Registration</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q=" crossorigin="anonymous" />


        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js" integrity="sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI=" crossorigin="anonymous"></script>

    </head>
    <body>
        <jsp:include page="Nav.jsp"></jsp:include>
        <div class="ui grid">
            <div class="two wide column">

            </div>
            <div class="eight wide column">
                <div class="ui hidden divider"></div>
                <h2 class="ui grey header">Register New Book</h2>
                <div class="ui hidden divider"></div>

                <form class="ui form" action="regbook" method="GET">
                    <div class="field">
                        <label >Book Code</label>
                        <%!
                            String GenerateCode() {

                                Random rnd = new Random();
                                int number = rnd.nextInt(999999);

                                String code = "B-" + String.format("%06d", number);
                                return code;
                            }

                        %>
                        <%
                        String code=GenerateCode();
                        Session s=NewHibernateUtil.getSessionFactory().openSession();
                        Criteria c=s.createCriteria(Book.class);       
                        c.add(Restrictions.eq("bookCode", code));
                        Book bookcodeavailable=(Book)c.uniqueResult();
   
                        if(bookcodeavailable!=null){
                            code=GenerateCode();
                        }else{
                            session.setAttribute("code", code);
                        %>
                        
                        <input type="text" disabled="" value="<%= code %>">
                        <%
                        }

                        %>

                    </div>
                    <div class="field">
                        <label>Book Name</label>
                        <input type="text" name="bookname">
                    </div>
                    <div class="field">
                        <label>Author</label>
                        <input type="text" name="author">
                    </div>
                    <div class="field">
                        <label>Category</label>
                        <select class="ui dropdown" name="category">
                            <option value="">Select Category</option>
                            <%
                                Criteria c1=s.createCriteria(BookCategory.class);
                                List<BookCategory> list=c1.list();
                                for (BookCategory l : list) {
                                        %>
                                        <option value="<%= l.getName() %>"><%= l.getName() %></option>
                                        <%
                                    }
                            %>
                        </select>
                    </div>
                    <div class="field">
                        <label>Select Member</label>
                        <select class="ui search dropdown" name="member">
                            <option value="">Select Member</option>
                            <%
                                Criteria c2=s.createCriteria(Member.class);
                                List<Member> list2=c2.list();
                                for (Member l : list2) {
                                        %>
                                        <option value="<%= l.getNic() %>"><%= l.getNic()%></option>
                                        <%
                                    }
                            %>
                        </select>
                    </div>
                    <div class="ui hidden divider"></div>
                    <button type="submit" class="ui teal right floated button">Save</button>
                </form>
            </div>
            <div class="four wide middle aligned column">
                <div class="ui center aligned segment">
                    <h3>Already Member?</h3>
                    <a href="SignUpMember.jsp"> <button class="ui basic grey button">Sign Up As Member</button></a> 
                </div>
            </div>
        </div>
        <script>
            $('.ui.dropdown').dropdown();
        </script>
    </body>
</html>
