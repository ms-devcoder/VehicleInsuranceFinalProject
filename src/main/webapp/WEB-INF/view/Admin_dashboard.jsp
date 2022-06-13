<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="static/css/combined.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/05be7476bb.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
    <section id="menu">
        <div class="logo">
            <img src="../../static/../../static/images/logo.jpg"alt="">
            <h2>Vehicle Insurance</h2>
        </div>
        <div class="items">
             <li id="notification-btn"><i class="fas fa-bell" ></i> <a href="#" id="edit-drop-btn"> Notifications </a></li>
            <div class="drop-menu" id="edit-drop-menu">
                <a href="registrationrequests?username=${adminname}" > Registration Request </a>
                <a href="policyrequests?username=${adminname}"> New Policy Request </a>
                <a href="fo_to_adac?username=${adminname}" >Policy After Validation </a>
                <a href="po_to_adac?username=${adminname}" > Approved Policy </a>
                <a href="fo_to_adrej&po_to_adrej?username=${adminname}"> Rejected Policy </a>
            </div>
            <li ><i class="fas fa-scroll"></i><a href="reports?username=${adminname}"> Help Requests </a></li>
           
            <li data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fa fa-sign-out" aria-hidden="true"></i><a href="adminlogout?username=${adminname}">Logout</a></li>
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
                     <input type="text"placeholder="Search">
                 </div>
            </div>
            <div class="profile">
                <a class="nav-link" style="color: black;" href="adminuserprofile?username=${adminname}">${adminname} <span>
    <img id="admin-image" src="../../static/images/profile-image.jpg"alt=""></span></a>
            </div>
        </div>











     <c:choose>
<c:when test="${mode=='pr'}">
    
        <div id="reg_req_div">
            <h3 class="i-name">
              Registration Request
            </h3>
            <div class="board">
                <table width="100%">
                    <thead>
                        <tr>
                            <td>User Name</td>
                            <td>Designation</td>
                            <td>User Category</td>
                            <td></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${userse}">
                        <tr>
                            <td class="people">
                                <img src="../../static/images/2.jpg" alt="">
                                <div class="people-de">
                                    <h5>${user.username}</h5>
                                    <p>${user.email}</p>
                                </div>
                            </td>

                            <td class="people-des">
                                <h5>${user.designation}</h5>
                                <p>${user.role}</p>
                            </td>

                            <td class="user-category">
                                <p>${user.category}</p>
                            </td>

                            <td class="accept">
                                <a href="/adminaccept-user?id=${user.id}&category=${user.category}&username=${adminname}"><button class="btn btn-success">Accept</button></a>
                            </td>

                            <td class="delete">
                                <a href="/admindelete-user?id=${user.id}&category=${user.category}&username=${adminname}"><button class="btn btn-danger">Deny</button></a>
                            </td>
                        </tr>

                       
                        </c:forEach>
                        <c:forEach var="user" items="${users}">
                        <tr>
                            <td class="people">
                                <img src="../../static/images/2.jpg" alt="">
                                <div class="people-de">
                                    <h5>${user.username}</h5>
                                    <p>${user.email}</p>
                                </div>
                            </td>

                            <td class="people-des">
                                <h5>${user.designation}</h5>
                                <p>${user.role}</p>
                            </td>

                            <td class="user-category">
                                <p>${user.category}</p>
                            </td>

                            <td class="accept">
                                <a href="/adminaccept-user?id=${user.id}&category=${user.category}&username=${adminname}"><button class="btn btn-success">Accept</button></a>
                            </td>

                            <td class="delete">
                                <a href="/admindelete-user?id=${user.id}&category=${user.category}&username=${adminname}"><button class="btn btn-danger">Deny</button></a>
                            </td>
                        </tr>

                       
                        </c:forEach>
                    </tbody>
                </table>
            </div>      
        </div>
    

       </c:when> 

   
       
<c:when test="${mode=='pre' }">

        <div id="NP_req_div" >
            <h3 class="i-name">
                New Policy Requests
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
                      <c:forEach var="m" items="${mb}">
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/3.jpg" alt="">
                                  <div class="people-de">
                                      <h5>${m.username}</h5>
                                      <p>${m.email}</p>
                                  </div>
                              </td>
    
                              
    
                              <td class="user-category">
                                  <p>Third Party Policy</p>
                              </td>
    
                              <td class="accept">
                                <a href="/ad_to_fo?id=${m.id}&username=${adminname}"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#NP_Pol_Modal">Send For Verification</button></a>
                              </td>

                          </tr>
                          
                         </c:forEach>
                      </tbody>
                </table>
            </div> 



           
            <div class="modal fade" id="NP_Pol_Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="assignmentModalLabel">List of Field Officer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="board modal-body">
                        <table width="100%">
                            <thead>
                                 <tr>
                                      <td>User Name</td>
                                      <td>User Catogary</td>
                                      <td></td>
                                 </tr>
                            </thead>
                             <tbody>
                                 <tr>
                                     <td class="people">
                                         <img src="../../static/images/5.jpg" alt="">
                                         <div class="people-de">
                                             <h5>Jhone123</h5>
                                             <p>john@example.com</p>
                                         </div>
                                     </td>
       
           
                                     <td class="user-category">
                                         <p>Field Officer</p>
                                     </td>
           
                                     <td class="accept">
                                       <a href="#"><button class="btn btn-success" data-bs-dismiss="modal">Assign</button></a>
                                     </td>
       
                                 </tr>
           
                                 <tr>
                                   <td class="people">
                                       <img src="../../static/images/6.jpg" alt="">
                                       <div class="people-de">
                                           <h5>Alan67</h5>
                                           <p>alan@example.com</p>
                                       </div>
                                   </td>

           
                                   <td class="user-category">
                                       <p>Field Officer</p>
                                   </td>
           
                                   <td class="accept">
                                     <a href="#"><button class="btn btn-success" data-bs-dismiss="modal">Assign</button></a>
                                   </td>
           
                   
                               </tr>
                             </tbody>
                       </table>
                    </div>
                    
                </div>
                </div>
            </div>
        </div>


     </c:when>  
<c:when test="${mode=='vp'}">   

        <div id="PAV_div">
            <h3 class="i-name">
                Verified Policies
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
                      <c:forEach var="mbes" items="${mbe}">
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/1.jpg" alt="">
                                  <div class="people-de">
                                      <h5>${mbes.username }</h5>
                                      <p>${mbes.email }</p>
                                  </div>
                              </td>
    
                              <td class="user-category">
                                  <p>Third Party Policy</p>
                              </td>
    
                              <td class="accept">
                                <a href="ad_to_pol?id=${mbes.id}&username=${adminname}"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#PAV_Modal">Send For Processing</button></a>
                              </td>

                          </tr>
    
                         </c:forEach>
                      </tbody>
                </table>
            </div>
           
            <div class="modal fade" id="PAV_Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="assignmentModalLabel">List of Policy Admin</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="board modal-body">
                        <table width="100%">
                            <thead>
                                 <tr>
                                      <td>User Name</td>
                                      <td>User Catogary</td>
                                      <td></td>
                                 </tr>
                            </thead>
                             <tbody>
                                 <tr>
                                     <td class="people">
                                         <img src="../../static/images/3.jpg" alt="">
                                         <div class="people-de">
                                             <h5>Jhone123</h5>
                                             <p>john@example.com</p>
                                         </div>
                                     </td>
       
           
                                     <td class="user-category">
                                         <p>Policy Admin</p>
                                     </td>
           
                                     <td class="accept">
                                       <a href="#"><button class="btn btn-success" data-bs-dismiss="modal">Assign</button></a>
                                     </td>
       
                                 </tr>
           
                                 <tr>
                                   <td class="people">
                                       <img src="../../static/images/4.jpg" alt="">
                                       <div class="people-de">
                                           <h5>Alan67</h5>
                                           <p>alan@example.com</p>
                                       </div>
                                   </td>

           
                                   <td class="user-category">
                                       <p>Policy Admin</p>
                                   </td>
           
                                   <td class="accept">
                                     <a href="#"><button class="btn btn-success" data-bs-dismiss="modal">Assign</button></a>
                                   </td>
           
                   
                               </tr>
                             </tbody>
                       </table>
                    </div>
                    
                </div>
                </div>
            </div>           
        </div>

</c:when>

      
<c:when test="${mode=='ap'}">
       

        <div id="ApprPol_div">
            <h3 class="i-name">
                Approved Policies
            </h3>
            <div class="board">
                <table width="100%">
                     <thead>
                          <tr>
                               <td>User Name</td>
                               <td>Policy Type</td>
                          </tr>
                     </thead>
                      <tbody>
                      <c:forEach var="apusers" items="${mber}">
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/profile-image.jpg" alt="">
                                  <div class="people-de">
                                      <h5>${apusers.username}</h5>
                                      <p>${apusers.email}</p>
                                  </div>
                              </td>

                              <td class="user-category">
                                  <p>Third Party Policy</p>
                              </td>

                          </tr>
    
                         
                        </c:forEach>
                      </tbody>
                </table>
            </div>            
        </div>

      </c:when> 
<c:when test="${mode=='rjp'}">   

        <div id="RejecPol_div">
            <h3 class="i-name">
                Rejected Policies
            </h3>
            <div class="board">
                <table width="100%">
                     <thead>
                          <tr>
                               <td>User Name</td>
                               <td>Policy Type</td>
                          </tr>
                     </thead>
                      <tbody>
                      <c:forEach var="rej" items="${rejs}">
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/5.jpg" alt="">
                                  <div class="people-de">
                                      <h5>${rej.username }</h5>
                                      <p>${rej.email }</p>
                                  </div>
                              </td>
    
                              <td class="user-category">
                                  <p>Third Party Policy</p>
                              </td>

                          </tr>
    
                         
                        </c:forEach>
                      </tbody>
                </table>
            </div>            
        </div>

     </c:when>
<c:when test="${mode=='reports'}">
        <div id="help_div">
            <h3 class="i-name">
                Help Requests
            </h3>
            <div class="board">
                <table width="100%">
                     <thead>
                          <tr>
                               <td>User Name</td>
                               <td>Concern</td>
                               <td></td>
                          </tr>
                     </thead>
                      <tbody>
                      <c:forEach var="fieldhelp" items="${ fieldhelps}">
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/profile-image.jpg" alt="">
                                  <div class="people-de">
                                      <h5>${fieldhelp.username}   [${fieldhelp.category}]</h5>
                                      <p>${fieldhelp.email}</p>
                                  </div>
                              </td>
    
                              
    
                              <td class="concern">
                                  <p>${fieldhelp.concern }</p>
                              </td>
    
                              <td class="accept">
                                <a href="replies?username=${fieldhelp.username}&adminname=${adminname}&category=${fieldhelp.category}"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#help_Modal">Reply</button></a>
                              </td>

                          </tr>
    
                          </c:forEach>
                           <c:forEach var="policyhelp" items="${ policyhelps}">
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/profile-image.jpg" alt="">
                                  <div class="people-de">
                                      <h5>${policyhelp.username}   [${policyhelp.category}]</h5>
                                      <p>${policyhelp.email}</p>
                                  </div>
                              </td>
    
                              
    
                              <td class="concern">
                                  <p>${policyhelp.concern }</p>
                              </td>
    
                              <td class="accept">
                                <a href="replies?username=${policyhelp.username}&adminname=${adminname}&category=${policyhelp.category}"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#help_Modal">Reply</button></a>
                              </td>

                          </tr>
    
                          </c:forEach>
                           <c:forEach var="customerhelp" items="${ customerhelps}">
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/profile-image.jpg" alt="">
                                  <div class="people-de">
                                      <h5>${customerhelp.username}   [Customer]</h5>
                                      <p>${customerhelp.email}</p>
                                  </div>
                              </td>
    
                              
    
                              <td class="concern">
                                  <p>${customerhelp.concern }</p>
                              </td>
    
                              <td class="accept">
                                <a href="replies?username=${customerhelp.username}&adminname=${adminname}&category=customer"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#help_Modal">Reply</button></a>
                              </td>

                          </tr>
    
                          </c:forEach>
                      </tbody>
                </table>
            </div> 
  
          </c:when>
          <c:when test="${mode=='replies'}">
            <div  id="help_Modal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="messageModalLabel">concerns</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="board modal-body">
                        <form action="repling">
                            <div class="mb-3">
                              <label for="message" class="form-label">Reply</label>
                              <textarea name="reply" class="form-control" id="message" cols="30" rows="10"></textarea>
                              <input type="hidden" value="${username}" name="username">
                              <input type="hidden" value="${category}" name="category">
                              <input type="hidden" value="${adminname}" name="adminname">
                            </div>
                            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Send</button>
                          </form>
                    </div>
                    
                </div>
                </div>
            </div> 
        </div>
</c:when>
      <c:when test="${mode=='logout'}">
        <div id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel"
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
                       <a href="adminstay?username=${adminname}" > <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                      <a href="adminlogin" ><button type="submit" class="btn btn-success" data-bs-dismiss="modal">Yes</button></a>
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
                <h5 class="modal-title mt-3" id="exampleModalLabel">${user.username}</h5>
                <div id="user_details" >
                    <table class="table">
                        <tbody>
                          <tr>
                            <th scope="row">User Id</th>
                            <td>${user.username}</td>
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
        <a href="adminedit?username=${adminname}"><button type="button" id="user_edit_btn" class="btn btn-primary">EDIT</button></a>
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
                <form action="adminsavedetails">
                    <table class="table">
                        <tbody>
                          <tr>
                            <th scope="row">User Id:</th>
                            <td><input type="text" name="username" value="${user.username}" path="${user.username }" id="user_id"/></td>
                          </tr>
                          
                          
                            <th scope="row">Upload Profile pic:</th>
                            <td><input type="file" name="profile_pic" id="profile_pic"/></td>
                            <input type="text" name="adminname" value="${adminname}"/>
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
        $('#notification-btn').click(function() {
            $('#edit-drop-menu').toggleClass("active");
        })

        $('#menu-btn').click(function() {
            $('#menu').toggleClass("active");
        })
        
    </script>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>