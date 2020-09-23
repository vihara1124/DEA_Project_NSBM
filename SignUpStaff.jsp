
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" integrity="sha256-9mbkOfVho3ZPXfM7W8sV2SndrGDuh7wuyLjtsWeTI1Q=" crossorigin="anonymous" />


        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js" integrity="sha256-t8GepnyPmw9t+foMh3mKNvcorqNHamSKtKRxxpUEgFI=" crossorigin="anonymous"></script>

    </head>
    <body>
        <jsp:include page="Nav.jsp"></jsp:include>
        <div class="ui grid">
            <div class="two wide column"></div>
            <div class="twelve wide column">
                <form class="ui form" action="signupstaff" method="POST" enctype="multipart/form-data">

                    <h1 class="ui center aligned header">Staff Sign Up
                        <div class="ui section divider"></div>
                    </h1>
                    <h4 class="ui dividing header">Personal Details</h4>
                    <div class="field">
                        <label>Name</label>
                        <div class="two fields">
                            <div class="field">
                                <input type="text" name="fn" placeholder="First Name">
                            </div>
                            <div class="field">
                                <input type="text" name="ln" placeholder="Last Name">
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label>NIC</label>

                        <div class="seven wide field">
                            <input type="text" name="nic" placeholder="NIC">
                        </div>


                    </div>
                    <div class="seven wide field">
                        <label>Gender</label>

                        <select class="ui dropdown" name="gender" >
                            <option class="option" value="" selected="">Select Your Gender</option>
                            <option class="option" value="male">Male</option>
                            <option class="option" value="female">Female</option>
                        </select>


                    </div>
                    <div class="seven wide field">
                        <label>Date Of Birth</label>
                        <input type="date" name="dob">
                    </div>
                    <h4 class="ui dividing header">Contact Details</h4>

                    <div class="seven wide field">
                        <label>Email</label>
                        <input type="email" name="email" placeholder="Email">
                    </div>

                    <div class="field">
                        <label>Mobile</label>

                        <div class="seven wide field">
                            <input type="text" name="mobile" placeholder="Mobile">
                        </div>


                    </div>
                    <div class="field">
                        <label>Password</label>
                        <div class="seven wide field">
                            <input type="password" name="pw" placeholder="Password">
                        </div>


                    </div>
                    <div class="field">
                        <div class="ui medium image">
                            <img id="rimg">
                        </div>
                        <input type="file" style="display: none;" name="image" id="img" onchange="setImage();">
                        <div class="ui hidden divider"></div>
                        <label class="ui blue button" for="img" style="width: 100px;"> Upload</label>
                    </div>
                    <div class="ui hidden divider"></div>

                    <button class="ui button" type="submit" tabindex="0">Sign Up</button>
                </form>

            </div>
            <div class="two wide column"></div>
        </div>
        <script>
            $('.ui.dropdown').dropdown();
             function setImage() {
                var Image = document.getElementById("img").files[0];
                var ImageTag=document.getElementById("rimg");
               var fileR = new FileReader();
               fileR.onload = function () {
                        ImageTag.src = fileR.result;

                    };
                    fileR.readAsDataURL(Image);


                
            }
        </script>
    </body>
</html>
