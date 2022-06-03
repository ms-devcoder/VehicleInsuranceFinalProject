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

	
    
        
        <div class="right">
            <div class="right-cont1">
                    <div class="form1">
                        <form action="ammar1" class="register-form" method="POST">
                            <div class="upper1">
                                Sign up
                            </div>
							<br/>
							<input type="hidden" name="id" path="${user.id}" />
							<input type="text" class="input-icon" placeholder="User Id" name="userid" path="${user.userid}" id="fname"  style="margin-right: 13%;" required>
							<input type="text" class="input-icon" placeholder="User Id" name="name" path="${user.name}" id="fname"  style="margin-right: 13%;" required>
							
                            <input type="submit" name="submit" class="sub" value="Get started now">
                            <h4 class="message" style="margin-left: 2%;margin-top: 7%; color: gray;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Existing User? <span><a href="customerlogin" style="text-decoration: none;">Log in</a></span></h4>
                        </form>

            
        </div>
        </div>
    </div>
    


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