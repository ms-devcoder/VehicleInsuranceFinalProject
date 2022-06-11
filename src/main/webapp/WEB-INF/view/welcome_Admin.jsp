<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="static/images/logo.jpg">
    <title>Admin login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css"
     integrity="undefined" crossorigin="anonymous">
     <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/register_login.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
    <section class="top-section">
        <div class="circle-login"></div>
        <header class="header">
            <a href="#">
                <img class="logo" src="static/images/logo.jpg ">
            </a>
            <ul>
                <li> <a href="welcome"> Home </a>
                </li>
                <li> <a href="welcome"> Sign up </a>
                </li>
                <li> <a href="adminlogin"> Sign in </a>
                </li>
            </ul>
        </header>

        <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5 mt-5">
            <div class="row gx-lg-5 align-items-center">

                <div class=" content-login ">
                    <div class=" imgBox ">
                        <img src="static/images/bike1.png" class=" bike1 ">
                    </div>
                </div>

                <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                    <div class="card bg-glass mt-5">
                        <div class="card-body px-4 py-3 px-md-5 form1">
                            <c:choose>

                                <c:when test="${mode=='mode_adminrregister'}">
                                    <form action="adminsave-user" class="register-form" method="POST">
                                        <div>
                                            <h5 class="text fs-3"> Sign up </h5>
                                        </div>
                                        <input type="hidden" name="id" path="${user.id}" />
                                        <div class="alignment">
                                            <input type="text" class="input-icon" placeholder="User Id" name="username"
                                                path="${user.username}" id="fname" required>
                                            <input type="text" class="input-icon ms-2" id="pass_log_id"
                                                placeholder="&#xf023;    Password" name="password"
                                                path="${user.password}" required>
                                        </div>

                                        <div class="alignment">
                                            <input type="text" name="firstname" path="${user.firstname}"
                                                class="input-icon" placeholder="&#xf007;    First Name" />
                                            <input type="text" name="lastname" path="${user.lastname}"
                                                class="input-icon ms-2" placeholder="&#xf007;    Last Name" />
                                        </div>

                                        <div class="alignment">
                                            <input placeholder="Date of Birth" class="input-icon" class="textbox-n"
                                                type="text" name="dob" path="${user.dob}" onfocus="(this.type='date')"
                                                id="date" />
                                            <label for="Gender" class="input-icon ms-2">Gender:</label>
                                            <input type="radio" name="gender" path="${user.gender}" value="male"
                                                id="male" />Male
                                            <input type="radio" name="gender" path="${user.gender}" value="female"
                                                id="female" />Female
                                        </div>

                                        <div class="alignment">
                                            <input type="text" path="${user.mblnumber}" class="input-icon" id="phone"
                                                name="mblnumber" placeholder="&#xf095; Phone Number"
                                                pattern="[1-9]{1}[0-9]{9}" required>

                                            <input type="text" path="${user.lnumber}" class="input-icon ms-2"
                                                placeholder="Liscence Number" name="lnumber" id="l_num" required>
                                        </div>
                                        <input type="email" style="width: 100%;" path="${user.email}" class="input-icon"
                                            placeholder="&#xf0e0;    Work email" name="email" required>

                                        <input type="submit" name="submit" class="sub btn btn-success btn-block mb-2"
                                            value="Get started now">
                                        <p class="message">Existing User? <span><a href="admilogin"
                                                    style="text-decoration: none;">Log in</a></span></p>
                                    </form>
                                </c:when>

                                <c:when test="${mode=='mode_adminregistered'}">
                                    <h3>Your Admin Registration was succesfully Completed</h3>

                                    <p class="message">If registerd? <span><a style="text-decoration: none;"
                                                href="welcome">Go to welcome page</a></span></p>
                                </c:when>

                                <c:when test="${mode=='mode_adminlogin'}">
                                    <form action="adminloginuser" method="POST">

                                        <div>
                                            <h5 class="text fs-3"> Log in </h5>
                                        </div>

                                        <c:if test="${not empty error }">
                                            <div class="alert alert-danger">
                                                <c:out value="${error }"></c:out>
                                            </div>
                                        </c:if>

                                        <input type="text" class="input-icon" placeholder="&#xf0e0;    Work email"
                                            name="username" path="${user.username }" style="width: 100%;" required>
                                        <i class="fa fa-eye" onclick="showPassword()" id="togglePassword"></i><br />
                                        <input type="password" id="id_password" class="input-icon"
                                            placeholder="&#xf023;    Password" name="password" path="${user.password}"
                                            style="width: 100%;" required>

                                        <input type="submit" name="submit" class="sub btn btn-success mb-3"
                                            value="Log in">
                                         <p class="message">Forgot Password? <span><a href="adminforgotpassword1"
                        style="text-decoration: none;">Click Here</a></span></p>
                                    </form>
                                </c:when>
                                <c:when test="${mode=='forgotpassword'}">
    <form action="adminupdatepassword" method="POST">

        <div>
            <h5 class="text fs-3"> Password Recover </h5>
        </div>

        <c:if test="${not empty error }">
            <div class="alert alert-danger">
                <c:out value="${error }"></c:out>
            </div>
        </c:if>
         <c:if test="${not empty change }">
            <div class="alert alert-success" role="alert">
                <c:out value="${change }"></c:out>
            </div>
        </c:if>

        <div class="alignment">
            <input type="text" class="input-icon" placeholder="User Id" name="username"
                path="${user.username}" id="fname" required>
            <input type="text" class="input-icon ms-2" id="pass_log_id"
            placeholder="Enter Old password" name="password"
                path="${user.password}" required>
        </div>

        

        <input type="text" class="input-icon" placeholder="Enter New Password"
            name="newpassword"  style="width: 100%;" required>
        
        <input type="text" id="id_password" class="input-icon"
            placeholder="Re-enter New Password" name="newpassword2" 
            style="width: 100%;" required>

        <input type="submit" name="submit" class="sub btn btn-success mb-3"
            value="UpdatePassword">
        

        <p class="message">Existing User? <span><a href="adminlogin"
                        style="text-decoration: none;">Log in</a></span></p>
    </form>
</c:when>      

                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        // const togglePassword = document.querySelector('#togglePassword');
        // const password = document.querySelector('#id_password');

        // togglePassword.addEventListener('click', function (e) {
        //     const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        //     password.setAttribute('type', type);
        //     this.classList.toggle('fa-eye-slash');
        // });

        const showPassword = function () {
            const password = document.querySelector('#id_password');
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        }

        $('.message a').click(function () {
            $('form').animate({ height: "toggle", opacity: "toggle" }, "slow");
        });

        const images = ["bike1.png", "bike2.png", "car1.png"];
        const color = ["#fe3131", "#ded537", "#7254e6"]
        const n = images.length;
        let i = 0;
        setInterval(function () {
            i = (i + 1) % n;
            imgSlider(images[i]);
        }, 3000);

        function imgSlider(anything) {
            let bikeArr = document.querySelectorAll('.bike1');
            bikeArr[0].src = "static/images/" + anything;
            changeCircleColor(color[i]);
        }

        function changeCircleColor(color) {
            const circleArr = document.querySelectorAll('.circle-login');
            console.log(circleArr)
            circleArr[0].style.background = color;
        }

    </script>

<!-- 	<script src="static/js/jquery-1.11.1.min.js"></script> -->
<!-- 	<script src="static/js/bootstrap.min.js"></script> -->
	
</body>
</html>