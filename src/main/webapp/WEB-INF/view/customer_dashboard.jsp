<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer_dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="static/css/combined.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/05be7476bb.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

    <section id="menu">
        <div class="logo">
            <img src="../../static/images/logo.jpg"alt="">
            <h2>Vehicle Insurance</h2>
        </div>
        <div class="items">
            <li><i class="fas fa-chart-pie"></i><a onclick="new_p()"> New Insurance Policy </a></li>
            <li><i class="fas fa-chart-pie"></i><a onclick="renew_p()"> Renewal </a></li>
            <li id="notification-btn"><i class="fas fa-bell" ></i> <a href="#" id="edit-drop-btn"> Notification </a></li>
            <div class="drop-menu" id="edit-drop-menu">
                <a onclick="my_pol()"> My Policy </a>
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
                <h4 id="admin-name" >"${customername}"</h4>
                <img id="admin-image" src="../../static/images/profile-image.jpg"alt="">
            </div>
        </div>


        <!-- New Insurance div starts -->


        <div id="new_insurance">
            <h3 class="i-name">
                New Insurance Policies
            </h3>
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
                                <i class="fa fa-car" style="font-size:48px; margin-right: 5%;"></i>
                                <div class="people-de">
                                    <h5>New Insurance Policy1</h5>
                                    <p>posted by: Name of Policy Admin</p>
                                </div>
                            </td>


                            <td class="user-category">
                                <p><a href="#" style="text-decoration:none ;">New Insurance policy1 details</a></p>
                            </td>
                            
                            <td class="accept">
                                <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#apply_modal">
                                    Appply
                                  </button></a>
                            </td>
                            
                            <td class="delete">
                                <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insurance_feedback">
                                    Feedback
                                  </button></a>
                            </td>
                        </tr>
                            
                        <tr>
                            <td class="people">
                                <i class="fa fa-car" style="font-size:48px; margin-right: 5%;"></i>
                                <div class="people-de">
                                    <h5>New Insurance Policy2</h5>
                                    <p>posted by: Name of Policy Admin</p>
                                </div>
                            </td>


                            <td class="user-category">
                                <p><a href="#" style="text-decoration:none ;">New Insurance policy2 details</a></p>
                            </td>

                            <td class="accept">
                                <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#apply_modal">
                                    Appply
                                  </button></a>
                            </td>

                            <td class="delete">
                                <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insurance_feedback">
                                    Feedback
                                  </button></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>   

            <!-- Apply modal starts -->
            <div class="modal fade" id="apply_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                    <td>Requirements</td>
                                    <td>Add Documets</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="people">
                                        <div class="people-de">
                                            <h5>Registration Certificate</h5>
                                        </div>
                                    </td>


                                    <td class="user-category">
                                        <p><input type="file" id="select_image" name="image" /></p>
                                    </td>


                                </tr>

                                <tr>
                                    <td class="people">
                                        <div class="people-de">
                                            <h5>Pic 1</h5>
                                        </div>
                                    </td>


                                    <td class="user-category">
                                        <p><input type="file" id="select_image" name="image" /></p>
                                    </td>


                                </tr>

                                <tr>
                                    <td class="people">
                                        <div class="people-de">
                                            <h5>Pic 2</h5>
                                        </div>
                                    </td>


                                    <td class="user-category">
                                        <p><input type="file" id="select_image" name="image" /></p>
                                    </td>


                                </tr>

                                <tr>
                                    <td class="people">
                                        <div class="people-de">
                                            <h5>pic 3</h5>
                                        </div>
                                    </td>


                                    <td class="user-category">
                                        <p><input type="file" id="select_image" name="image" /></p>
                                    </td>


                                </tr> 
                                <tr>
                                    <td class="people">
                                        <div class="people-de">
                                            <h5>Shell Letter</h5>
                                        </div>
                                    </td>


                                    <td class="user-category">
                                        <p><input type="file" id="select_image" name="image" /></p>
                                    </td>


                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Submit</button>
                    </div>
                  </div>
                </div>
              </div>
            <!-- Apply modal starts -->
            
              <!-- Insurance feedback model starts -->
              <div class="modal fade" id="insurance_feedback" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                         <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Tempore sapiente ratione maxime fugit exercitationem id debitis illo earum asperiores perferendis ullam nisi fugiat, ex odit incidunt, iusto, repellat eos velit?</p>
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
              <!-- Insurance feedback model ends -->
    </div>     
    
    <!-- New Insurance div ends-->


    <!-- Renewal Div starts -->
    <div id="renewal" style="display: none;">
        <h3 class="i-name">
            Renewal of Taken Policy 
        </h3>
        <div class="board">
            <table width="100%">
                <thead>
                    <tr>
                        <td>Insurance Policy Name</td>
                        <td>Details</td>
                        <td>Insurance Taken Day</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="people">
                            <i class="fa fa-car" style="font-size:48px; margin-right: 5%;"></i>
                            <div class="people-de">
                                <h5>New Insurance Policy1</h5>
                                <p>posted by: Name of Policy Admin</p>
                            </div>
                        </td>

                        
                        <td class="user-category">
                            <p><a href="#" style="text-decoration:none ;">New Insurance policy1 details</a></p>
                        </td>
                        <td class="user-category">
                            <p>Time 1</p>
                        </td>
                        <td class="accept">
                            <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#renew_modal">
                                Renew
                              </button></a>
                        </td>

                    </tr>

                    <tr>
                        <td class="people">
                            <i class="fa fa-car" style="font-size:48px; margin-right: 5%;"></i>
                            <div class="people-de">
                                <h5>New Insurance Policy2</h5>
                                <p>posted by: Name of Policy Admin</p>
                            </div>
                        </td>

                        
                        <td class="user-category">
                            <p><a href="#" style="text-decoration:none ;">New Insurance policy2 details</a></p>
                        </td>
                        <td class="user-category">
                            <p>Time 2</p>
                        </td>
                        <td class="accept">
                            <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#renew_modal">
                                Renew
                              </button></a>
                        </td>

                    </tr>
                </tbody>
            </table>
        </div>


        <!-- Renew modal starts -->


        <div class="modal fade" id="renew_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary">Submit</button>
                </div>
              </div>
            </div>
          </div>
           <!-- Renew modal ends -->
    </div>
     <!-- Renewal Div ends -->


<!-- My Policy Request starts  -->

    <div id="my_policy" style="display: none;">
        <h3 class="i-name">
            My Requested Policies Status 
        </h3>
        <div class="board">
            <table width="100%">
                <thead>
                    <tr>
                        <td>Insurance Policy Name</td>
                        <td>Details</td>
                        <td>Insurance Taken Day</td>
                        <td>Status</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="people">
                            <i class="fa fa-car" style="font-size:48px; margin-right: 5%;"></i>
                            <div class="people-de">
                                <h5>New Insurance Policy1</h5>
                                <p>posted by: Name of Policy Admin</p>
                            </div>
                        </td>

                        
                        <td class="user-category">
                            <p><a href="#" style="text-decoration:none ;">New Insurance policy1 details</a></p>
                        </td>
                        <td class="user-category">
                            <p>Time 1</p>
                        </td>
                        <td class="people-des">
                            <p><a href="#" style="text-decoration: none;">Requested</a></p>
                        </td>

                    </tr>

                    <tr>
                        <td class="people">
                            <i class="fa fa-car" style="font-size:48px; margin-right: 5%;"></i>
                            <div class="people-de">
                                <h5>New Insurance Policy2</h5>
                                <p>posted by: Name of Policy Admin</p>
                            </div>
                        </td>

                        
                        <td class="user-category">
                            <p><a href="#" style="text-decoration:none ;">New Insurance policy2 details</a></p>
                        </td>
                        <td class="user-category">
                            <p>Time 2</p>
                        </td>
                        
                        <td class="people-des">
                            <p><a href="#" style="text-decoration: none;">Requested</a></p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
<!-- My Policy Request ends  -->



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
        function new_p(){
            document.getElementById("new_insurance").style.display="block";
            document.getElementById("renewal").style.display="none";
            document.getElementById("my_policy").style.display="none";
            document.getElementById("help_div").style.display="none";
        }
        function renew_p(){
            document.getElementById("new_insurance").style.display="none";
            document.getElementById("renewal").style.display="block";
            document.getElementById("my_policy").style.display="none";
            document.getElementById("help_div").style.display="none";
        }
        function my_pol(){
            document.getElementById("new_insurance").style.display="none";
            document.getElementById("renewal").style.display="none";
            document.getElementById("my_policy").style.display="block";
            document.getElementById("help_div").style.display="none";
        }
        function help_fun(){
            document.getElementById("new_insurance").style.display="none";
            document.getElementById("renewal").style.display="none";
            document.getElementById("my_policy").style.display="none";
            document.getElementById("help_div").style.display="block";
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