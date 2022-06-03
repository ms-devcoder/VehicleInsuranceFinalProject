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
            <li><i class="fas fa-chart-pie"></i><a href="registrationrequests"> Registration Request </a></li>
            <li id="notification-btn"><i class="fas fa-bell" ></i> <a href="#" id="edit-drop-btn"> Notifications </a></li>
            <div class="drop-menu" id="edit-drop-menu">
                <a onclick="NP_fun()"> New Policy Request </a>
                <a  onclick="PAV_fun()">Policy After Validation </a>
                <a onclick="ApprPol_fun()"> Approved Policy </a>
                <a onclick="Rejec_fun()"> Rejected Policy </a>
            </div>
            <li ><i class="fas fa-scroll"></i><a href="#"> Reports </a></li>
            <li><i class="fas fa-info"></i><a onclick="help_fun()"> Help </a></li>
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
                <h4 id="admin-name">${admin.username}</h4>
                <img id="admin-image" src="../../static/images/profile-image.jpg"alt="">
            </div>
        </div>


        <!-- Registration Request Division starts -->
        <c:choose>
<c:when test="${mode=='mode_registrationsrequests'}">
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
                                <a href="/adminaccept-user?id=${user.id}&category=${user.category}"><button class="btn btn-success">Accept</button></a>
                            </td>

                            <td class="delete">
                                <a href="/admindelete-user?id=${user.id}&category=${user.category}"><button class="btn btn-danger">Deny</button></a>
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
                                <a href="/adminaccept-user?id=${user.id}&category=${user.category}"><button class="btn btn-success">Accept</button></a>
                            </td>

                            <td class="delete">
                                <a href="/admindelete-user?id=${user.id}&category=${user.category}"><button class="btn btn-danger">Deny</button></a>
                            </td>
                        </tr>

                       
                        </c:forEach>
                    </tbody>
                </table>
            </div>      
        </div>
        
</c:when>
</c:choose>
        <!-- Registration Request Div ends -->


        <!-- NP Request div starts -->


        <div id="NP_req_div" style="display: none;">
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
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/3.jpg" alt="">
                                  <div class="people-de">
                                      <h5>Jhone123</h5>
                                      <p>john@example.com</p>
                                  </div>
                              </td>
    
                              
    
                              <td class="user-category">
                                  <p>Third Party Policy</p>
                              </td>
    
                              <td class="accept">
                                <a href="#"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#NP_Pol_Modal">Send For Verification</button></a>
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
                                <p>Comprehensive Policy</p>
                            </td>
    
                            <td class="accept">
                              <a href="#"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#NP_Pol_Modal">Send For Verification</button></a>
                            </td>
    
            
                        </tr>
                      </tbody>
                </table>
            </div> 
  
            <!-- Modal -->
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


        <!-- Np Request ends -->

        <!-- Policy after validation div starts -->

        <div id="PAV_div" style="display: none;">
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
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/1.jpg" alt="">
                                  <div class="people-de">
                                      <h5>Jhone123</h5>
                                      <p>john@example.com</p>
                                  </div>
                              </td>
    
                              <td class="user-category">
                                  <p>Third Party Policy</p>
                              </td>
    
                              <td class="accept">
                                <a href="#"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#PAV_Modal">Send For Processing</button></a>
                              </td>

                          </tr>
    
                          <tr>
                            <td class="people">
                                <img src="../../static/images/2.jpg" alt="">
                                <div class="people-de">
                                    <h5>Alan67</h5>
                                    <p>alan@example.com</p>
                                </div>
                            </td>
    
    
                            <td class="user-category">
                                <p>Comprehensive Policy</p>
                            </td>
    
                            <td class="accept">
                              <a href="#"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#PAV_Modal">Send For Processing</button></a>
                            </td>
    
            
                        </tr>
                      </tbody>
                </table>
            </div>
            <!-- Modal -->
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


        <!-- Policy after validation div ends -->

        <!-- Approved Policy div starts -->

        <div id="ApprPol_div" style="display: none;">
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
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/profile-image.jpg" alt="">
                                  <div class="people-de">
                                      <h5>Jhone123</h5>
                                      <p>john@example.com</p>
                                  </div>
                              </td>

                              <td class="user-category">
                                  <p>Third Party Policy</p>
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
    
    
                            <td class="user-category">
                                <p>Comprehensive Policy</p>
                            </td>
    
            
                        </tr>
                      </tbody>
                </table>
            </div>            
        </div>

        <!-- Approved policy div end -->

        <!-- Rejected Policy div starts -->

        <div id="RejecPol_div" style="display: none;">
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
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/5.jpg" alt="">
                                  <div class="people-de">
                                      <h5>Jhone123</h5>
                                      <p>john@example.com</p>
                                  </div>
                              </td>
    
                              <td class="user-category">
                                  <p>Third Party Policy</p>
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
                                <p>Comprehensive Policy</p>
                            </td>
    
            
                        </tr>
                      </tbody>
                </table>
            </div>            
        </div>

        <!-- Rejected policy div end -->


        <!-- Help div starts -->

        <div id="help_div" style="display: none;">
            <h3 class="i-name">
                New Policy Requests
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
                          <tr>
                              <td class="people">
                                  <img src="../../static/images/profile-image.jpg" alt="">
                                  <div class="people-de">
                                      <h5>Jhone123</h5>
                                      <p>john@example.com</p>
                                  </div>
                              </td>
    
                              
    
                              <td class="concern">
                                  <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempore sapiente ratione maxime fugit exercitationem id debitis illo earum asperiores perferendis ullam nisi fugiat, ex odit incidunt, iusto, repellat eos velit?</p>
                              </td>
    
                              <td class="accept">
                                <a href="#"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#help_Modal">Reply</button></a>
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
                                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repellat, aliquid sit eos atque facilis voluptatum, rerum doloribus quam similique officiis laborum nulla numquam, veniam voluptatem reprehenderit dolor odit vitae iure./p>
                            </td>
    
                            <td class="accept">
                              <a href="#"><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#help_Modal">Reply</button></a>
                            </td>
    
            
                        </tr>
                      </tbody>
                </table>
            </div> 
  
            <!-- Modal -->
            <div class="modal fade" id="help_Modal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="messageModalLabel">List of Field Officer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="board modal-body">
                        <form>
                            <div class="mb-3">
                              <label for="message" class="form-label">Reply</label>
                              <textarea name="" class="form-control" id="message" cols="30" rows="10"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Send</button>
                          </form>
                    </div>
                    
                </div>
                </div>
            </div> 
        </div>

        <!-- Help div ends -->
    </section>
    
    <script>
        $('#notification-btn').click(function() {
            $('#edit-drop-menu').toggleClass("active");
        })

        $('#menu-btn').click(function() {
            $('#menu').toggleClass("active");
        })
        function reg_req_fun(){
            document.getElementById("reg_req_div").style.display="block";
            document.getElementById("NP_req_div").style.display="none";
            document.getElementById("PAV_div").style.display="none";
            document.getElementById("ApprPol_div").style.display="none";
            document.getElementById("RejecPol_div").style.display="none";
            document.getElementById("help_div").style.display="none";
        }
        function NP_fun(){
            document.getElementById("reg_req_div").style.display="none";
            document.getElementById("NP_req_div").style.display="block";
            document.getElementById("PAV_div").style.display="none";
            document.getElementById("ApprPol_div").style.display="none";
            document.getElementById("RejecPol_div").style.display="none";
            document.getElementById("help_div").style.display="none";
        }
        function PAV_fun(){
            document.getElementById("reg_req_div").style.display="none";
            document.getElementById("NP_req_div").style.display="none";
            document.getElementById("PAV_div").style.display="block";
            document.getElementById("ApprPol_div").style.display="none";
            document.getElementById("RejecPol_div").style.display="none";
            document.getElementById("help_div").style.display="none";
        }
        function ApprPol_fun(){
            document.getElementById("reg_req_div").style.display="none";
            document.getElementById("NP_req_div").style.display="none";
            document.getElementById("PAV_div").style.display="none";
            document.getElementById("ApprPol_div").style.display="block";
            document.getElementById("RejecPol_div").style.display="none";
            document.getElementById("help_div").style.display="none";
        }
        function Rejec_fun(){
            document.getElementById("reg_req_div").style.display="none";
            document.getElementById("NP_req_div").style.display="none";
            document.getElementById("PAV_div").style.display="none";
            document.getElementById("ApprPol_div").style.display="none";
            document.getElementById("RejecPol_div").style.display="block";
            document.getElementById("help_div").style.display="none";
        }
        function help_fun(){
            document.getElementById("reg_req_div").style.display="none";
            document.getElementById("NP_req_div").style.display="none";
            document.getElementById("PAV_div").style.display="none";
            document.getElementById("ApprPol_div").style.display="none";
            document.getElementById("RejecPol_div").style.display="none";
            document.getElementById("help_div").style.display="block";
        }
    </script>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>