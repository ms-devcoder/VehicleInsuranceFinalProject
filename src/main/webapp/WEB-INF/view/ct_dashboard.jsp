<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer_dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="static/css/combined.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/05be7476bb.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <section id="menu">
        <div class="logo">
            <img src="../../static/images/logo.jpg" alt="">
            <h2>Vehicle Insurance</h2>
        </div>
        <div class="items">
            <li><i class="fas fa-chart-pie"></i><a href="newpolicyrequest?username=${customername}"> New Insurance Policy </a></li>
            <li><i class="fas fa-chart-pie"></i><a href="renewpolicyrequest?username=${customername}"> Renewal </a></li>
           
            <li><i class="fas fa-info"></i><a href="customerhelp?username=${customername}"> Help </a></li>
            <li data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fa fa-sign-out" aria-hidden="true"></i><a
                    href="ctlogout?username=${customername}">Logout</a></li>
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
               <a class="nav-link" style="color: black;" href="userprofile?username=${customername}">${customername} <span>
    <img id="admin-image" src="../../static/images/profile-image.jpg"alt=""></span></a>
     
                
            </div>
        </div>

<c:choose>

        <c:when test ="${mode=='applypolicy'}">
        <div id="new_insurance">
            <h3 class="i-name">
                New Insurance Policies
            </h3>
             <c:if test="${not empty error }"> 
						<div class= "alert alert-danger">
							<c:out value="${error }"></c:out>
							</div>
					</c:if>
            <div class="board">
                <table width="100%">
                    <thead>
                        <tr>
                            <td>Insurance Policy Name</td>
                            <td>Details</td>
                            <td></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="people">
                                <div class="people-de">
                                    <h5>New Insurance Policy1</h5>
                                    
                                </div>
                            </td>


                            <td class="user-category">
                                <p>New Insurance policy1 details</p>
                            </td>

                            <td class="accept">
                                <a href="#"><button type="button" class="btn btn-success" data-toggle="modal"
                                        data-target="#applyModal"> Apply </button></a>
                            </td>

                            <td class="delete">
                                <a href="#"><button type="button" class="btn btn-secondary" data-toggle="modal"
                                        data-target="#insurance_feedback">${policystatus} </button></a>
                                        <a href="review?username=${customername}" style="color: brown; margin-left:8px; text-decoration: none;">Reviews</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

         
            <div class="modal fade" id="applyModal" tabindex="-1" aria-labelledby="applyModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form action="uploadfiles" name="uploadfiles" method="post" encType="multipart/form-data">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="logoutModalLabel">Upload Documents</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="board modal-body">
                                <table width="100%">
                                    <thead>
                                        <tr>
                                            <td>Requirements</td>
                                            <td>Add Documets</td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="people">
                                                <div class="people-de">
                                                    <h5>Registration Certificate${customername}</h5>
                                                </div>
                                            </td>

                                            <input type="hidden" name="name" value="${customername}" path="${userp.name}" />
                                            <td class="">
                                                <p><input class="btn btn-success" type="file"
                                                        id="registration-certificate" name="image" required />
                                                </p>
                                            </td>


                                       
                                    </tbody>
                                </table>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success" data-bs-dismiss="modal"
                                        >Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
           
         
            <div class="modal fade" id="insurance_feedback" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table width="100%">
                                <thead>
                                    <tr>
                                        <td>User Name</td>
                                        <td>Concern</td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="people">
                                            <img src="../../static/images/profile-image.jpg" alt="">
                                            <div class="people-de">
                                                <h5>Jhone123</h5>
                                                <p>john@example.com</p>
                                            </div>
                                        </td>



                                        <td class="concern">
                                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempore
                                                sapiente ratione maxime fugit exercitationem id debitis illo earum
                                                asperiores perferendis ullam nisi fugiat, ex odit incidunt, iusto,
                                                repellat eos velit?</p>
                                        </td>



                                    </tr>

                                    <tr>
                                        <td class="people">
                                            <img src="../../static/images/profile-image.jpg" alt="">
                                            <div class="people-de">
                                                <h5>Alan67</h5>
                                                <p>alan@example.com</p>
                                            </div>
                                        </td>



                                        <td class="concern">
                                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repellat,
                                                aliquid sit eos atque facilis voluptatum, rerum doloribus quam similique
                                                officiis laborum nulla numquam, veniam voluptatem reprehenderit dolor
                                                odit vitae iure./p>
                                        </td>




                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
</c:when>
<c:when test="${mode=='renewpolicy'}">
      
        <div id="renewal">
            <h3 class="i-name">
                Renewal of Taken Policy
            </h3>
            <div class="board">
                <table width="100%">
                    <thead>
                        <tr>
                            <td>Insurance Policy Name</td>
                            <td>Details</td>
                           
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="people">
                                <i class="fa fa-car" style="font-size:48px; margin-right: 5%;"></i>
                                <div class="people-de">
                                    <h5>New Insurance Policy1</h5>
                                   
                                </div>
                            </td>


                            <td class="user-category">
                                <p>New Insurance policy1 details</p>
                            </td>
                            
                            <td class="accept">
                                <a href="renewalreq?username=${customername}"><button type="button" class="btn btn-success" data-toggle="modal"
                                        data-target="#renew_modal">
                                        Renew
                                    </button></a>
                            </td>

                        </tr>

                    </tbody>
                </table>
            </div>


          

            <div class="modal fade" id="renew_modal" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                            </button>
                        </div>

                        <div class="modal-body">
                            <form action="">
                                <table width="100%">
                                    <thead>
                                        <tr>
                                            <td>Renewal Cost</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>


                                            <td class="user-category">
                                                $7
                                            </td>
                                    </tbody>
                                </table>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-success" data-dismiss="modal">Buy</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
           
        </div>
       </c:when>
       <c:when test="${mode=='status' }">

        <div id="my_policy" style="display: none;">
            <h3 class="i-name">
                My Requested Policy Status
            </h3>
            <div class="board">
                <table width="100%">
                    <thead>
                        <tr>
                            <td>Insurance Policy Name</td>
                            <td>Details</td>
                           
                            <td>Status</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="people">
                                <i class="fa fa-car" style="font-size:48px; margin-right: 5%;"></i>
                                <div class="people-de">
                                    <h5>New Insurance Policy</h5>
                                   
                                </div>
                            </td>


                            <td class="user-category">
                                <p><a href="#" style="text-decoration:none ;">New Insurance policy1 details</a></p>
                            </td>
                            
                            <td class="people-des">
                                <p><a href="#" style="text-decoration: none;">${policystatus}</a></p>
                            </td>

                        </tr>

                       
                    </tbody>
                </table>
            </div>
        </div>
      
</c:when>
<c:when test="${ mode=='help'}">
       <div id="help_div" >
            <h3 class="i-name">
                Help
            </h3>
          <a href="raiseticketct_to_ad?username=${customername}">  <button type="button" class="btn btn-success query-btn" data-bs-toggle="modal" data-bs-target="#messageModal">
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
                                <p>${reply}</p>
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
                        <form action="ticketfromct_to_ad">
                            <div class="mb-3">
                              <label for="message" class="form-label">Write Your Concern</label>
                              <textarea name="concern" class="form-control" id="message" cols="30" rows="10"></textarea>
                              <input type="hidden" name="username" value=${customername}>
                            </div>
                            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Send</button>
                          </form>
                    </div>
                    
                </div>
                </div>
            </div> 

        </div>
</c:when>
      <c:when test="${mode=='logout' }">
        <div  id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="logoutModalLabel">Logout</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="logout-section modal-body">

                            <h5>Are you sure you want to log out</h5>
                            <div>
                               <a href="customerstay?username=${customername}"> <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                                <a href="customerlogin"><button type="submit" class="btn btn-success" data-bs-dismiss="modal">Yes</button></a>
                            </div>
                        </div>
                    </div>
              
            </div>
        </div>
        </c:when>
        
   <c:when test="${mode=='review'}">
    
        <div id="reg_req_div">
            <h3 class="i-name">
              Customer Reviews
            </h3>
             <c:if test="${not empty sendreview }">
            <div class="board modal-body">
                        <form action="submitreview" method="post">
                            <div class="mb-3">
                              <label for="message" class="form-label">Give a feedback</label>
                              <textarea name="review" class="form-control" id="message" cols="30" rows="3"></textarea>
                              <input type="hidden" name="username" value=${customername}>
                            </div>
                            <button type="submit" class="btn btn-primary" >Send</button>
                          </form>
                    </div>
                    </c:if>
            <div class="board">
                <table width="100%">
                    <thead>
                        <tr>
                            <td>User Name</td>
                            <td>Review</td>
                            
                            <td></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="reviewer" items="${reviewers}">
                        <tr>
                            <td class="people">
                                <img src="../../static/images/2.jpg" alt="">
                                <div class="people-de">
                                    <h5>${reviewer.username}</h5>
                                   
                                </div>
                            </td>

                            <td class="people-des">
                                <h5>${reviewer.review}</h5>
                                
                            </td>

                           
                        </tr>

                       
                       </c:forEach>
                    </tbody>
                </table>
            </div>      
        </div>
    

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
        <a href="edit?username=${customername}"><button type="button" id="user_edit_btn" class="btn btn-primary">EDIT</button></a>
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
                <form action="savedetails">
                    <table class="table">
                        <tbody>
                          <tr>
                            <th scope="row">User Id:</th>
                            <td><input type="text" name="username" value="${user.username}" path="${user.username }" id="user_id"/></td>
                          </tr>
                          
                          <tr>
                            <th scope="row">firstname:</th>
                            <td><input type="text" id="phone" value="${user.firstname}" path="${user.firstname}" name="firstname" placeholder="firstname" ></td>
                          </tr>
                          <tr>
                            <th scope="row">lastname:</th>
                            <td><input type="text" id="phone" value="${user.lastname}" path="${user.lastname}" name="lastname" placeholder="lastname" ></td>
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
                            <input type="text" name="customername" value="${customername}"/>
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
    </section>


    <script>
        $('#notification-btn').click(function () {
            $('#edit-drop-menu').toggleClass("active");
        })
        $('#menu-btn').click(function () {
            $('#menu').toggleClass("active");
        })
        function new_p() {
            document.getElementById("new_insurance").style.display = "block";
            document.getElementById("renewal").style.display = "none";
            document.getElementById("my_policy").style.display = "none";
            document.getElementById("help_div").style.display = "none";
        }
        function renew_p() {
            document.getElementById("new_insurance").style.display = "none";
            document.getElementById("renewal").style.display = "block";
            document.getElementById("my_policy").style.display = "none";
            document.getElementById("help_div").style.display = "none";
        }
        function my_pol() {
            document.getElementById("new_insurance").style.display = "none";
            document.getElementById("renewal").style.display = "none";
            document.getElementById("my_policy").style.display = "block";
            document.getElementById("help_div").style.display = "none";
        }
        function help_fun() {
            document.getElementById("new_insurance").style.display = "none";
            document.getElementById("renewal").style.display = "none";
            document.getElementById("my_policy").style.display = "none";
            document.getElementById("help_div").style.display = "block";
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>

</html>