

<%@page import="Database.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q=" crossorigin="anonymous" />


        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js" integrity="sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI=" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="ui grid">
             <div class="column"></div>
            <div class="fourteen wide column">
                <div class="ui hidden divider"></div>
                <h1 class="ui grey dividing header">Staff Profile</h1>
            </div>
        </div>
       
        <div class="ui grid">
            <div class="column"></div>
            <div class="fourteen wide  column">
            <div class=" row">
                <h2 class="ui grey header">
            <%
            Staff user=(Staff)session.getAttribute("user");
            if(user!=null){
            %>
            <%= user.getFname()+" "+user.getLname() %>
            <%
            }
            %>
        </h2>
        <a href="logout"><button class="ui left floated red button">Log Out</button></a>
            </div>
       
        </div>
        </div>
         <div class="ui grid">
              <div class="column"></div>
              <div class="fourteen wide  column">
            <div class="ui hidden divider"></div>
                  
              <a href="BookReg.jsp"><button class="ui basic green button">Register New Book</button></a>
        <a href="SignUpMember.jsp"><button class="ui basic green button">Register New Member</button></a>
        <br/>
            <div class="ui hidden divider"></div>
        <a href="BorrowBook.jsp"><button class="ui basic orange button">Issue Book</button></a>
        <a href="ReturnBook.jsp"><button class="ui basic orange button">Return Book</button></a>
              </div>

            
        </div>
        
          </body>
</html>
