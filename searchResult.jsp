<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="Database.MemberHasBook"%>
<%@page import="java.util.List"%>
<%@page import="Database.Book"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Database.BookCategory"%>
<%@page import="Database.BookCategory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Database.NewHibernateUtil"%>
<%@page import="Model.SearchBook"%>
<%@page import="com.google.gson.Gson"%>
<%
    try {
        String json = request.getParameter("json");

        Gson gson = new Gson();
        SearchBook SB = gson.fromJson(json, SearchBook.class);
        Session s = NewHibernateUtil.getSessionFactory().openSession();

        Criteria cbc = s.createCriteria(BookCategory.class);
        cbc.add(Restrictions.eq("name", SB.getCategory()));
        BookCategory bc = (BookCategory) cbc.uniqueResult();

        Criteria c = s.createCriteria(Book.class);
        c.add(Restrictions.disjunction()
                .add(Restrictions.like("name", SB.getName()))
                .add(Restrictions.like("author", SB.getAuthor()))
                .add(Restrictions.like("bookCategory", bc)));

        List<Book> list = c.list();

%>

<div class="ui center aligned grid">
    <div class="ten wide column">
        <table class="ui selectable celled table" >
            <thead>
                <tr><th>Book Code</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Category</th>
                    <th>Available</th>
                </tr></thead>
            <tbody>
                <%                    if (!list.isEmpty()) {
                        for (Book b : list) {
                %>
                <tr  onclick="addBook('<%= b.getBookCode()%>')">
                    <td data-label="BookCode" ><%= b.getBookCode()%></td>
                    <td data-label="BookName"><%= b.getName()%></td>
                    <td data-label="Author"><%= b.getAuthor()%></td>
                    <td data-label="Category"><%= b.getBookCategory().getName()%></td>
                    <%
                        Criteria c3 = s.createCriteria(MemberHasBook.class);
                        c3.add(Restrictions.eq("book", b));
                        List<MemberHasBook> booklist = c3.list();
                        Set hs = new HashSet();
                        for (MemberHasBook memberHasBook : booklist) {
                            hs.add(memberHasBook.getIsReurned());
                        }
                       
                        if (hs.contains(false)) {
                    %>

                    <td data-label="Available"><%= "Not Available"%> </td>
                    <%
                    } else {
                    %>

                    <td data-label="Available"><%= "Available"%> </td>

                    <%
                        }
                    %>
                </tr>  
                <%
                    }
                } else {
                %>

                <%
                    }
                %>


            </tbody>
        </table>
    </div>
</div>

<%            } catch (Exception e) {
        e.printStackTrace();
    }

%>