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
<c:choose>
<c:when test="${mode=='mode_home'}">

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
                        <form action="validation.php" class="register-form" method="POST">
                            <div class="upper1">
                                Sign up
                            </div>
							<select name="mySelection" id="users" onchange="for_inputs()">
								<option value="" disabled selected>User Category</option>
								<option value ="Customer" >Customer</option>
								<option value ="Policy Admin">Policy Admin</option>
								<option value ="Field Officer">Field Officer</option>
							</select>
							<br/>
							
							<input type="text" class="input-icon" placeholder="User Id" name="Fname" id="fname"  style="margin-right: 13%;" required>
							<input type="password" class="input-icon" id="pass_log_id"  placeholder="&#xf023;    Password" name="password" required><br>
							<input type="text" name="fname" class="input-icon" placeholder="&#xf007;    First Name" style="margin-right:13%;"/>
							<input type="text" name="lname" class="input-icon" placeholder="&#xf007;    Last Name"/><br/>
							<input placeholder="Date of Birth" class="input-icon" class="textbox-n" type="text" onfocus="(this.type='date')" id="date" style="margin-right: 13%;"/>
							<label for="Gender"class="input-icon" style="margin-right: 1%;">Gender:</label>
							<input type="radio" name="gender" value="Male" id="male"style="margin-right: 1%;"/>Male
							<input type="radio" name="gender" value="Female" id="female" style="margin-left: 4%;margin-right: 1%;"/>Female
							<br>
                            <input type="tel" class="input-icon" id="phone" name="phone" placeholder="&#xf095;    123-45-678" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}"  style="margin-right: 13%;" required>
							<input type="text" class="input-icon" placeholder="Liscence Number" name="l_num" id="l_num" required>
							<input type="email"class="input-icon" placeholder="&#xf0e0;    Work email" name="email" style="width: 91%;margin-bottom: 4%;" required><br>
							
							<select id="designation" class="input-icon" style="margin-right: 10%;" required>
								<option value="" disabled selected>Designation</option>
								<option value="Junior Officer">Junior Officer</option>
								<option value="Officer">Officer</option>
								<option value="Senior Officer">Senior Officer</option>
								<option value="Manager">Manager</option>
								<option value="Divisional Manager">Divisional Manager</option>
							</select>
							<select id="role" class="input-icon" required>
								<option value="" disabled selected>Role</option>
								<option value="Processing Officer">Processing Officer</option>
								<option value="Internal Auditor">Internal Auditor</option>
								<option value="Marketing Representative">Marketing Representative</option>
								<option value="BG Verification officer">BG Verification officer</option>
							</select>
                            <input type="submit" name="submit" class="sub" value="Get started now">
                            <h4 class="message" style="margin-left: 2%;margin-top: 7%; color: gray;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Existing User? <span><a href="#" style="text-decoration: none;">Log in</a></span></h4>
                        </form>

                        <form action="logged.php" class="Login-form" method="POST" style="margin-top: 25%;">
                            <div class="upper2">
                                Log in
                            </div>
                            <input type="email" class="input-icon" placeholder="&#xf0e0;    Work email" name="email" style="width: 100%;" required>
                            <span toggle="#password-field" class="fa fa-fw fa-eye field_icon toggle-password"></span><br/>
                            <input type="password" id="pass_log_id" class="input-icon" placeholder="&#xf023;    Password" name="password" style="width: 100%;" required>
                            <label style="font-family:  'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                            </label>
                            <input type="submit" name="submit" class="sub" value="Log in">
                            <h4 class="message" style="margin-left: 2%;margin-top: 7%; color: gray;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Not Registered? <span><a href="#" style="text-decoration: none;">Register</a></span></h4>
                        </form>

                        
                    </div>
            </div>
            
        </div>
    </div>






	<!-- <div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome to Tecno-tab</h1>
					<h3>Subscribe my channel to support me</h3>
				</div>
			</div> -->
			</c:when>
			<c:when test="${mode=='mode_register'}">
	<div class="container text-center">
				<h3>New Registration</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Age </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="age"
								value="${user.age }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
					</div>
				</form>
			</div>
			</c:when>
			<c:when test="${mode=='show-users'}">
			<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>UserName</th>
								<th>First Name</th>
								<th>LastName</th>
								<th>Age</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users }">
								<tr>
									<td>${user.id}</td>
									<td>${user.username}</td>
									<td>${user.firstname}</td>
									<td>${user.lastname}</td>
									<td>${user.age}</td>
									<td><a href="/delete-user?id=${user.id }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-user?id=${user.id }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</c:when>
			<c:when test="${mode=='mode_update'}">
	<div class="container text-center">
				<h3>Update User</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Age </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="age"
								value="${user.age }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
			</c:when>
			<c:when test="${mode=='login-user'}">
	<div class="container text-center">
				<h3 >Login Here</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="loginuser">
					<c:if test="${not empty error }">
						<div class= "alert alert-danger">
							<c:out value="${error }"></c:out>
							</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Login" />
					</div>
				</form>
			</div>
			</c:when>
	</c:choose>
<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script>
		$("body").on('click', '.toggle-password', function() {
		 $(this).toggleClass("fa-eye fa-eye-slash");
		 var input = $("#pass_log_id");
		 if (input.attr("type") === "password") {
			 input.attr("type", "text");
		 } else {
			 input.attr("type", "password");
		 }
 
		 });
 
		 $('.message a').click(function(){
		 $('form').animate({height:"toggle",opacity:"toggle"},"slow");
		 });


		 
		function for_inputs(){
			if(document.getElementById('users').value=="Customer"){
				document.getElementById("designation").disabled = true;
				document.getElementById("role").disabled = true;
				document.getElementById("l_num").disabled = false;
			}
			else{
				document.getElementById("designation").disabled = false;
				document.getElementById("role").disabled = false;
				document.getElementById("l_num").disabled = true;
			}
		} 
	 </script>
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	
</body>
</html>