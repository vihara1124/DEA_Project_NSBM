

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Database.Member"%>
<%@page import="Database.Book"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Database.NewHibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Database.BookCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrow Book</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q=" crossorigin="anonymous" />


        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js" integrity="sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI=" crossorigin="anonymous"></script>

    </head>
    <body>
        <jsp:include page="Nav.jsp"></jsp:include>
        <div class="ui center aligned grid">
            <div class="ten wide column">
                <div class="ui hidden divider"></div>
                <h2 class="ui grey dividing header">Search By</h2>
                <h4>Book Name</h4>
                <select class="ui search dropdown" name="Name" id="BookName" onchange="searchBook();">
                    <option value="">Select Book Name</option>
                    <%
                        Date d=new Date();
                           SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
                        Session s = NewHibernateUtil.getSessionFactory().openSession();
                        Criteria c1 = s.createCriteria(Book.class);
                        List<Book> list = c1.list();
                        for (Book l : list) {
                    %>
                    <option value="<%= l.getName()%>"><%= l.getName()%></option>
                    <%
                        }
                    %>
                </select>
                <h4>Book Category</h4>
                <select class="ui search dropdown" name="Category" id="BookCategory" onchange="searchBook();">
                    <option value="">Select Category</option>
                    <%
                        Criteria c2 = s.createCriteria(BookCategory.class);
                        List<BookCategory> list2 = c2.list();
                        for (BookCategory l : list2) {
                    %>
                    <option value="<%= l.getName()%>"><%= l.getName()%></option>
                    <%
                        }
                    %>
                </select>
                <h4>Book Author</h4>
                <select class="ui search dropdown" name="Author" id="BookAuthor" onchange="searchBook();">
                    <option value="">Select Author</option>
                    <%
                        Criteria c3 = s.createCriteria(Book.class);
                        List<Book> list3 = c3.list();
                        for (Book l : list3) {
                    %>
                    <option value="<%= l.getAuthor()%>"><%= l.getAuthor()%></option>
                    <%
                        }
                    %>
                </select>
            </div>
        </div>
        <div class="ui section divider"></div>

        <div id="searchR">

        </div>

        <div class="ui section divider"></div>
        <div class="ui grid">
            <div class="three wide column">

            </div>
            <div class="ten wide column" >
                <div class="ui form">
                    <div class="field">
                        <label>Book Code </label>
                        <input type="text" id="bookCode" disabled="">
                    </div>
                    <div class="ui hidden divider"></div>
                    <div class="field">
                        <label>Select Member</label>
                        <select class="ui search dropdown" id="memberid" name="member">
                            <option value="">Select Member</option>
                            <%
                                Criteria c5 = s.createCriteria(Member.class);
                                List<Member> list5 = c5.list();
                                for (Member l : list5) {
                            %>
                            <option value="<%= l.getNic()%>"><%= l.getNic()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="ui hidden divider"></div>
                    <div class="field">
                        <label>Date Issue</label>
                        <input type="date" id="dateissue" >
                    </div>
                    <div class="ui hidden divider"></div>
                    <div class="field">
                        <label>Date Return</label>
                        <input type="date" id="datereturn">
                    </div>
                    <div class="ui hidden divider"></div>
                    <button class="ui right floated green button" onclick="borrowBook();">Issue Book</button>
                </div>
            </div>
            <div class="three wide column">

            </div>
        </div>
        <script>
            $('.ui.dropdown').dropdown();
          
            
            function searchBook() {

                var req = new XMLHttpRequest();

                var name = $('#BookName').val();
                var author = $('#BookAuthor').val();
                var category = $('#BookCategory').val();

                var j = {name: name, author: author, category: category};
                var json = JSON.stringify(j);


                req.onreadystatechange = function () {

                    if (req.readyState === 4) {
                        if (req.status === 200) {
                            var response = req.responseText;

                            document.getElementById("searchR").innerHTML = response;
                        }
                    }

                };
                req.open("GET", "searchResult.jsp?json=" + json, true);
                req.send();

            }
            function addBook(code) {
              $('#bookCode').val(code);
            }
            function borrowBook(){
               var BookCode=$('#bookCode').val();
               var MemberId=$('#memberid').val();
               var DateIssue=$('#dateissue').val();
               var DateReturn=$('#datereturn').val();
               
               var req = new XMLHttpRequest();
               req.onreadystatechange = function () {

                    if (req.readyState === 4) {
                        if (req.status === 200) {
                            var response = req.responseText;
                            
                            if(response==='done'){
                                location.reload();
                            }else if(response==="Cant"){
                                alert("Can't Issue This Book");
                            }
                            
                        }
                    }

                };
                req.open("GET", "borrowBook?BC=" +BookCode+"&MI="+MemberId+"&DI="+DateIssue+"&DR="+DateReturn , true);
                req.send();
            }
        </script>
    </body>
</html>
