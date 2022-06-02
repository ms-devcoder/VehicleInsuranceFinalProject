<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/cupcake_icon.png">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css"
     integrity="undefined" crossorigin="anonymous">
     <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/login_style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	
		<!-- <div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/welcome" class="navbar-brand">Tecno-Tab</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/login">Login</a></li>
					<li><a href="/register">New Registration</a></li>
					<li><a href="/show-user">All Users</a></li>
				</ul>
			</div>
		</div>
	</div> -->

<div id="main-container">
        <div class="left">
            <div class="left-cont2">
                <div class="flex" >
                    
                    <i class="fa fa-youtube fa-lg"></i><i class="fa fa-facebook fa-lg" style="margin-left: 40px;"></i></i><i class="fa fa-instagram fa-lg" style="margin-left: 40px;"></i>
                    
                </div>
                <div class="flex">
                    &copy;<em id="date"></em>CTS Vehicle Insurance
                </div>
            </div>
        </div>

	
        <c:choose>
        <c:when test="${mode=='mode_customerregister'}">
        <div class="right">
            <div class="right-cont1">
                    <div class="form1">
                        <form action="customersave-user" class="register-form" method="POST">
                            <div class="upper1">
                                Sign up
                            </div>
							<br/>
							<input type="hidden" name="id" path="${user.id}" />
							<input type="text" class="input-icon" placeholder="User Id" name="username" path="${user.username}" id="fname"  style="margin-right: 13%;" required>
							<input type="text" class="input-icon" id="pass_log_id"  placeholder="&#xf023;    Password" name="password" path="${user.password}" required><br>
							<input type="text" name="firstname" path="${user.firstname}" class="input-icon" placeholder="&#xf007;    First Name" style="margin-right:13%;"/>
							<input type="text" name="lastname" path="${user.lastname}" class="input-icon" placeholder="&#xf007;    Last Name"/><br/>
							<input placeholder="Date of Birth" class="input-icon" class="textbox-n" type="text" name="dob" path="${user.dob}" onfocus="(this.type='date')" id="date" style="margin-right: 13%;"/>
							<label for="Gender"class="input-icon" style="margin-right: 1%;">Gender:</label>
							<input type="radio" name="gender" path="${user.gender}" value="male" id="male"style="margin-right: 1%;"/>Male
							<input type="radio" name="gender" path="${user.gender}" value="female"id="female" style="margin-left: 4%;margin-right: 1%;"/>Female
							<br>
              
                          

                            <input type="text" path="${user.mblnumber}" class="input-icon" id="phone" name="mblnumber" placeholder="&#xf095;    9876543210" pattern="[1-9]{1}[0-9]{9}"   style="margin-right: 13%;" required>


							<input type="text" path="${user.lnumber}"class="input-icon" placeholder="Liscence Number" name="lnumber" id="l_num" required>
							<input type="email" path="${user.email}"class="input-icon" placeholder="&#xf0e0;    Work email" name="email" style="width: 91%;margin-bottom: 4%;" required><br>
							
                            <input type="submit" name="submit" class="sub" value="Get started now">
                            <h4 class="message" style="margin-left: 2%;margin-top: 7%; color: gray;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Existing User? <span><a href="customerlogin" style="text-decoration: none;">Log in</a></span></h4>
                        </form>

            
        </div>
        </div>
    </div>
    </c:when>
    <c:when test="${mode=='mode_customerregistered'}">
		<div class="right">
            <div class="right-cont1">
                    <div class="form1">
                      

                       
                            <h1 style="text-decoration: none;">Your Customer Registration was succesfully Completed</h1>
                        
                    <h4 class="message" style="margin-left: 2%;margin-top: 7%; color: gray;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">If registerd? <span><a href="welcome" style="text-decoration: none;">Go to welcome page</a></span></h4>
                        

            
        </div>
        </div>
    </div>
</c:when>
<c:when test="${mode=='mode_customerlogin'}">
		<div class="right">
            <div class="right-cont1">
                    <div class="form1">
                      

                        <form action="customerloginuser"  method="POST" style="margin-top: 25%;">
                       
                            <div class="upper2">
                                Log in
                            </div>
                            
                             <c:if test="${not empty error }"> 
						<div class= "alert alert-danger">
							<c:out value="${error }"></c:out>
							</div>
					</c:if>
                            <input  type="text" class="input-icon" placeholder="&#xf0e0;    Work email" name="username" path="${user.username }"style="width: 100%;" required>
                            <i class="fa fa-eye" id="togglePassword"></i><br/>
                            <input type="password" id="id_password" class="input-icon" placeholder="&#xf023;    Password" name="password" path="${user.password}" style="width: 100%;" required>
                            <label style="font-family:  'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                            </label>
                            <input type="submit" name="submit" class="sub" value="Log in">
                            <h4 class="message" style="margin-left: 2%;margin-top: 7%; color: gray;
                         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Not Registered? <span><a href="welcome" style="text-decoration: none;">Register</a></span></h4>
                        </form>
                    
                        

            
        </div>
        </div>
    </div>
    </c:when>
</c:choose>


	<script>
		const togglePassword = document.querySelector('#togglePassword');
		const password = document.querySelector('#id_password');
		
		togglePassword.addEventListener('click', function (e) {
			const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
			password.setAttribute('type', type);
			this.classList.toggle('fa-eye-slash');
		});
 
		 $('.message a').click(function(){
		 $('form').animate({height:"toggle",opacity:"toggle"},"slow");
		 });


		
	 </script>
	
<!-- 	<script src="static/js/jquery-1.11.1.min.js"></script> -->
<!-- 	<script src="static/js/bootstrap.min.js"></script> -->
	
</body>
</html>