<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PolicyAdmin_dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="static/css/combined.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/05be7476bb.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>

<body>

    <body>
        <section id="menu">
            <div class="logo">
                <img src="../../static/images/logo.jpg" alt="">
                <h2>Vehicle Insurance</h2>
            </div>
            <div class="items">
                <li><i class="fas fa-chart-pie"></i><a href="ad_to_po?username=${policyadminname}"> My Assignments </a></li>
               
                <li href="help.html"><i class="fas fa-info"></i><a href="policyadminhelp?username=${policyadminname}"> Help </a></li>
                <li data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fa fa-sign-out" aria-hidden="true"></i><a href="pologout?username=${policyadminname }">Logout</a></li>
            </div>
        </section>

        <section id="interface">
            <div class="navigation">
                <div class="n1">
                    <div>
                        <i id="menu-btn" onclick="showMenu()" class="fas fa-bars"></i>
                    </div>
                    <div class="search">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search">
                    </div>
                </div>
                <div class="profile">
                    <a class="nav-link" style="color: black;" href="policyadminuserprofile?username=${policyadminname}">${policyadminname} <span>
    <img id="admin-image" src="../../static/images/profile-image.jpg"alt=""></span></a>
     
                </div>
            </div>

<c:choose>
<c:when test="${mode=='ad_to_po'}">
            <div id="my_ass_div">
            <h3 class="i-name">
                My Assignments
            </h3>
            <div class="board">
                <table width="100%">
                    <thead>
                        <tr>
                            <td>User Name</td>
                            <td>Policy Type</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="adpos" items="${adpo}">
                        <tr>
                            <td class="people">
                                <img src="../../static/images/3.jpg" alt="">
                                <div class="people-de">
                                    <h5>${adpos.username }</h5>
                                    <p>${adpos.email }</p>
                                </div>
                            </td>



                            <td class="user-category">
                                <p>Third Party Policy</p>
                            </td>

                            <td class="accept">
                                <a href="poassignmodel?username=${adpos.username}&policyadminname=${policyadminname}"><button class="btn btn-success" data-bs-toggle="modal"
                                        data-bs-target="#assignmentModal">Proceed</button></a>
                            </td>

                        </tr>
</c:forEach>
                       
                    </tbody>
                </table>
            </div>

      </c:when>
      <c:when test="${mode=='poassignmodel'}">
            <div  id="assignmentModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <form action="policyacceptance">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="assignmentModalLabel">policy Approval</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="board modal-body">

                                <table width="100%">
                                    <thead>
                                        <tr>
                                            <td>Fields</td>
                                            <td>Status</td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <tr>
                                            <td class="people">
                                                <div class="people-de">
                                                    <h5>Bike Proofs</h5>
                                                </div>
                                            </td>


                                            <td class="user-category">
                                                <a href="download?username=${username}">download</a><p>Open NewTab</p>
                                            </td>

                                            <td class="accept">
                                                <i class="fa fa-check verified" aria-hidden="true"></i>
                                            </td>


                                        </tr>
                                    
                                    
                                        <tr>
                                            <td class="people">
                                                <div class="people-de">
                                                    <h5>Bike Proofs&Acceptance</h5>
                                                </div>
                                            </td>


                                            <td class="user-category">
                                                <p>${condition }</p>
                                            </td>

                                            <td class="accept">
                                                <i class="fa fa-check verified" aria-hidden="true"></i>
                                            </td>

                                        </tr>

                                        <input  type="hidden" value="${username}" name="username" >
                                        <input  type="hidden" value="${policyadminname}" name="policyadminname" >
                                                        

                                        
                                    </tbody>
                                </table>

                            </div>
                            <div class="modal-footer">
                          <button type="submit" name="po_to_adac" value="true" class="btn btn-success" data-bs-dismiss="modal">Aprove</button>
                                <button type="submit" name="po_to_adac" value="false" class="btn btn-danger" data-bs-dismiss="modal">Reject</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </c:when>
        <c:when test="${mode=='logout'}">
            <div  id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="logoutModalLabel">Logout</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="logout-section modal-body">

                                <h5>Are you sure you want to log out</h5>
                                <div>
                               <a href="policystay?username=${policyadminname}"> <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                              <a href="policyadminlogin">  <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Yes</button></a>
                            </div>
                            </div>
                        </div>
                    
                </div>
            </div>

       </c:when>
       <c:when test="${mode=='help' }">
            <div id="help_div">
                <h3 class="i-name">
                    Help
                </h3>
              <a href="raiseticketpo_to_ad?username=${policyadminname}">  <button type="button" class="btn btn-success query-btn" data-bs-toggle="modal" data-bs-target="#messageModal">
                    Raise a Query
                  </button></a>
                <div class="board">
                    <table width="100%">
                        <thead>
                            <tr>
                                <td>Concern</td>
                                <td>Reply</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="people">
                                    <div class="people-de">
                                        <p>${concern }</p>
                                    </div>
                                </td>
    
    
    
                                <td class="message">
                                    <p>${reply }</p>
                                </td>
    
                            </tr>
    
                          
                        </tbody>
                    </table>
                </div>
    </c:when>
         <c:when test="${mode=='raiseticket' }">
                <div  id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="messageModalLabel">List of Field Officer</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="board modal-body">
                            <form action="ticketfrompo_to_ad">
                                <div class="mb-3">
                                  <label for="message" class="form-label">Write Your Concern</label>
                                  <textarea name="concern" class="form-control" id="message" cols="30" rows="10"></textarea>
                                   <input typr="hidden" name="username" value=${policyadminname}>
                                </div>
                                <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Send</button>
                              </form>
                        </div>
                        
                    </div>
                    </div>
                </div> 
            </div>
          
        </section>
         </c:when>
          <c:when test="${mode=='userprofile'}">
<div  id="profie_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 35%;" role="document">
    <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">User Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        </div>
        <div class="modal-body">
            <div class="container text-center">
            <span>
    
                <img src="../../static/images/profile-image.jpg" id="photo" style="max-width: 150px;">
                <h5 class="modal-title mt-3" id="exampleModalLabel">Name of user</h5>
                <div id="user_details" >
                    <table class="table">
                        <tbody>
                          <tr>
                            <th scope="row">User Id</th>
                            <td>${user.username}</td>
                          </tr>
                           <tr>
                            <th scope="row">Firstname:</th>
                            <td>${user.firstname }</td>
                          </tr>
                          <tr>
                            <th scope="row">Lastname:</th>
                            <td>${user.lastname }</td>
                          </tr>
                          <tr>
                            <th scope="row">Dob:</th>
                            <td>${user.dob }</td>
                          </tr>
                          <tr>
                            <th scope="row">Email</th>
                            <td>${user.email}</td>
                          </tr>
                          <tr>
                            <th scope="row">contact:</th>
                            <td>${user.mblnumber }</td>
                          </tr>
                          
                         
                        </tbody>
                        
                    </table>
                    <div id="reset_pass_div" style="display:none;">
                        <form>
                            <table class="table">
                                <tbody>
                                  <tr>
                                    <td>Old password</td>
                                    <td><input type="text" name="old_pass" id="old_pass"/></td>
                                  </tr>
                                  <tr>
                                    <td>New password</td>
                                    <td><input type="password" name="new_pass" id="new_pass"/> </td>
                                  </tr>
                                  <tr>
                                    <td>Confirm new Password</td>
                                    <td><input type="password" id="cnf_pass" name="cnf_pass"></td>
                                  </tr>
                                </tbody>
                                
                            </table>
                            <button type="submit" class="btn btn-primary mt-3">Submit</button>
                        </form>
                    </div>
                </div>
                  </div>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="policyadminedit?username=${policyadminname}"><button type="button" id="user_edit_btn" class="btn btn-primary">EDIT</button></a>
        </div>
    </div>
    </div>
</div>
</c:when>
                <c:when test="${mode=='edit' }">
                <div  id="profie_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 35%;" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        </div>
                <div id="user_details_edit">
                <form action="policyadminsavedetails">
                    <table class="table">
                        <tbody>
                          <tr>
                            <th scope="row">User Id:</th>
                            <td><input type="text" name="username" value="${user.username}" path="${user.username }" id="user_id"/></td>
                          </tr>
                          
                          <tr>
                            <th scope="row">firstname:</th>
                            <td><input type="text" id="phone" value="${user.firstname}" path="${user.firstname}" name="firstname" placeholder="enter firstname" ></td>
                          </tr>
                          <tr>
                            <th scope="row">lastname:</th>
                            <td><input type="text" id="phone" value="${user.lastname}" path="${user.lastname}" name="lastname" placeholder="enter lastname" ></td>
                          </tr>
                           <tr>
                            <th scope="row">DoB:</th>
                            <td><input placeholder="Date of Birth" class="input-icon" class="textbox-n"
                                                type="text" name="dob" value="${user.dob }" path="${user.dob}" onfocus="(this.type='date')"
                                                id="date" /></td>
                          </tr>
                          <tr>
                            <th scope="row">Email:</th>
                            <td><input type="email" name="email" value="${user.email }" path="${user.email }" id="user_email"/> </td>
                          </tr>
                          <tr>
                            <th scope="row">contact:</th>
                            <td><input type="text" id="phone" value="${user.mblnumber}" path="${user.mblnumber}" name="mblnumber" placeholder="9876543210" pattern="[1-9]{1}[0-9]{9}"></td>
                          </tr>
                         
                          
                          <tr>
                            <th scope="row">Upload Profile pic:</th>
                            <td><input type="file" name="profile_pic" id="profile_pic"/></td>
                            <input type="text" name="policyadminname" value="${policyadminname}"/>
                          </tr>
                        </tbody>
                        
                    </table>
                    <div class="modal-footer">
                    <button type="submit" class="btn btn-primary mt-3">Submit</button>
                    </div>
                </div>
                </form>
                 </div>
    </div>
</div>
                </c:when>   
</c:choose>
        <script>
            $('#notification-btn').click(function () {
                $('#edit-drop-menu').toggleClass("active");
            })

            $('#menu-btn').click(function () {
                $('#menu').toggleClass("active");
            })
            function my_ass_div(){
                document.getElementById("my_ass_div").style.display="block";
                document.getElementById("help_div").style.display="none";
            }
            function help_fun(){
                document.getElementById("my_ass_div").style.display="none";
                document.getElementById("help_div").style.display="block";
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</body>

</html>