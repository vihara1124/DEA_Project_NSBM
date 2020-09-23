

<%@page import="org.hibernate.criterion.Order"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Database.MemberHasBook"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Database.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Return Book</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q=" crossorigin="anonymous" />


        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js" integrity="sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI=" crossorigin="anonymous"></script>

    </head>
    <body>
        <jsp:include page="Nav.jsp"></jsp:include>
        <div class="ui center aligned grid">

            <div class="fifteen wide column">
                <div class="ui hidden divider"></div>
                <h2 class="ui grey header">Return Book</h2>
                <div class="ui hidden divider"></div>
                <div class="ui segment">
                    <h4 class="ui header">Search By Book Code:</h4>
                    <div class="ui input focus">
                        <input type="text" placeholder="Enter Book Code" onkeyup="searchBook();" id="bc">
                    </div>

                </div>
                <table class="ui selectable celled table" >
                    <thead>
                        <tr><th>Book Code</th>
                            <th>Book Name</th>
                            <th>Member Name</th>
                            <th>Member NIC</th>
                            <th>Member Mobile</th>
                            <th>Issued Date</th>
                            <th>Return Date</th>
                        </tr></thead>
                    <tbody id="tbdy">
                        <jsp:include page="ReturnTable.jsp">
                            <jsp:param name="code" value=""></jsp:param>
                        </jsp:include>
                    </tbody>
                </table>
            </div>

        </div>
        
        <div class="ui center aligned grid">
            <div class="ten wide column">
                
                <div class="ui basic segment" id="cr">
<!--                    <div class="ui focus input">
                        <input type="text" id="sbid" disabled="">
                    </div>
                    <button class="ui button" onclick="ReturnComplete();">Return</button>-->
                </div>
            </div>
        </div>
        <script>
            function searchBook() {
                var code=document.getElementById("bc").value;
                 var req = new XMLHttpRequest();

                   req.onreadystatechange = function () {

                    if (req.readyState === 4) {
                        if (req.status === 200) {
                            var response = req.responseText;

                           document.getElementById("tbdy").innerHTML=response;
                        }
                    }

                };
                req.open("GET", "ReturnTable.jsp?code=" + code, true);
                req.send();
            }
            
            function addReturnData(code,id){
                
                document.getElementById("cr").innerHTML='';
                var h3=document.createElement('h3');
                h3.innerHTML=code;
                document.getElementById("cr").appendChild(h3);
                
                var button=document.createElement("button");
                var clearbutton=document.createElement("button");
                button.innerHTML="Return Book";
                button.setAttribute('class','ui yellow button');
                button.setAttribute('onclick','ReturnComplete("'+id+'");');
                clearbutton.innerHTML='Clear';
                clearbutton.setAttribute('class','ui basic red button');
                clearbutton.setAttribute('onclick','clearSegment();');
                
                document.getElementById("cr").appendChild(button);
                document.getElementById("cr").appendChild(clearbutton);
            }
            function ReturnComplete(code){
                  var req = new XMLHttpRequest();

                   req.onreadystatechange = function () {

                    if (req.readyState === 4) {
                        if (req.status === 200) {
                            var response = req.responseText;
                            if(response==='done'){
                                location.reload();
                            }
                           
                        }
                    }

                };
                req.open("GET", "returncomplete?code=" + code, true);
                req.send();
            }
            function clearSegment(){
              document.getElementById("cr").innerHTML='';
            }
        </script>
    </body>
</html>
