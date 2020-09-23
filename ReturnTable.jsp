<%@page import="org.hibernate.criterion.MatchMode"%>
<%@page import="Database.Book"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="Database.MemberHasBook"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Database.NewHibernateUtil"%>
<%@page import="Database.NewHibernateUtil"%>
<%
    Session s = NewHibernateUtil.getSessionFactory().openSession();
    Criteria c = s.createCriteria(MemberHasBook.class);
    c.addOrder(Order.asc("dateReturn"));
    String code = request.getParameter("code");
    if (code.isEmpty()) {
        List<MemberHasBook> list = c.list();
        if (!list.isEmpty()) {
            for (MemberHasBook mhb : list) {
                if (mhb.getIsReurned() == false) {
                    String BC = mhb.getBook().getBookCode();
                    String BN = mhb.getBook().getName();
                    String MemberName = mhb.getMember().getFname() + " " + mhb.getMember().getLname();
                    String MemberNIC = mhb.getMember().getNic();
                    String MemberMobile = mhb.getMember().getMobile();
                    String ID = mhb.getDateIssue();
                    String RD = mhb.getDateReturn();

%>
<tr onclick="addReturnData('<%= mhb.getBook().getBookCode() %>','<%= mhb.getId() %>');" >
    <td ><%= BC%></td>
    <td ><%= BN%></td>
    <td ><%= MemberName%></td>
    <td ><%= MemberNIC%></td>
    <td ><%= MemberMobile%></td>
    <td ><%= ID%></td>
    <td ><%= RD%></td>

</tr>  
<%
            }
        }
    }
} else {
    Criteria c1 = s.createCriteria(Book.class);
    c1.add(Restrictions.like("bookCode", code, MatchMode.START));
    List<Book> bookresults = c1.list();
    if (!bookresults.isEmpty()) {

        c.add(Restrictions.in("book", bookresults));
        List<MemberHasBook> list = c.list();
        if (!list.isEmpty()) {
            for (MemberHasBook mhb : list) {
                if (mhb.getIsReurned() == false) {
                    String BC = mhb.getBook().getBookCode();
                    String BN = mhb.getBook().getName();
                    String MemberName = mhb.getMember().getFname() + " " + mhb.getMember().getLname();
                    String MemberNIC = mhb.getMember().getNic();
                    String MemberMobile = mhb.getMember().getMobile();
                    String ID = mhb.getDateIssue();
                    String RD = mhb.getDateReturn();

%>
<tr onclick="addReturnData('<%= mhb.getBook().getBookCode() %>','<%= mhb.getId()%>');">
    <td ><%= BC%></td>
    <td ><%= BN%></td>
    <td ><%= MemberName%></td>
    <td ><%= MemberNIC%></td>
    <td ><%= MemberMobile%></td>
    <td ><%= ID%></td>
    <td ><%= RD%></td>

</tr>  
<%
                    }
                }
            }
        }
    }
%>

