<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="static/images/logo.jpg">
    <title>CTS Vehicle Insurance</title>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<-- display side1 -->
<section class="top-section side" id="side1">
        <div class="circle"></div>
        <header class="header">
            <a href="#">
                <img class="logo" src="static/images/logo.jpg ">
            </a>
            <ul>
                <li> <a href="#"> Home </a>
                </li>
                <li> <a href="#main-top-section"> Sign up </a>
                </li>
                <li> <a href="#main-top-section"> Sign in </a>
                </li>
            </ul>
        </header>
        <div class=" content ">
            <div class=" textBox ">
                <h2> Insurance ka Super Hero <br> It's <span> CTS Vehicle Insurance </span> </h2>
                <p> You could switch and save money on car insurance! Whether you're looking for cheap car insurance
                    rates, personalized
                    coverage, or great service, CTSVI has you covered for it all! </p>
                <a href="#main-top-section"> Get Started </a>
            </div>
            <div class=" imgBox ">
                <img src="static/images/bike1.png " class=" bike1 ">
            </div>
        </div>

        <ul class="sci">
            <li><a href="#"><i class="fa fa-youtube fa-lg"></i></a></li>
            <li><a href="#"><i class="fa fa-facebook fa-lg"></i></a></li>
            <li><a href="#"><i class="fa fa-instagram fa-lg"></i></a></li>
        </ul>


    </section>
    
    <-- display side2 -->
    <section class="top-section side" id="side2">
        <div class="circle"></div>
        <header class="header">
            <a href="#">
                <img class="logo" src="static/images/logo.jpg ">
            </a>
            <ul>
                <li> <a href="#"> Home </a>
                </li>
                <li> <a href="#main-top-section"> Sign up </a>
                </li>
                <li> <a href="#main-top-section"> Sign in </a>
                </li>
            </ul>
        </header>
        <div class=" content ">
            <div class=" textBox ">
                <h2> Insurance ka Super Hero <br> It's <span> CTS Vehicle Insurance </span> </h2>
                <p> You could switch and save money on car insurance! Whether you're looking for cheap car insurance
                    rates, personalized
                    coverage, or great service, CTSVI has you covered for it all! </p>
                <a href="#main-top-section"> Get Started </a>
            </div>
            <div class=" imgBox ">
                <img src="static/images/bike1.png " class=" bike1 ">
            </div>
        </div>

        <ul class="sci">
            <li><a href="#"><i class="fa fa-youtube fa-lg"></i></a></li>
            <li><a href="#"><i class="fa fa-facebook fa-lg"></i></a></li>
            <li><a href="#"><i class="fa fa-instagram fa-lg"></i></a></li>
        </ul>


    </section>
    
    
    <-- selection part -->
    <c:choose>
            <c:when test="${mode=='mode_home'}">
                <div class="top" id="main-top-section">
                    <div class="top-cont1">
                        <div class="upper">
                            <h2>
                            Welcome to CTS Vehicle Insurance
                            </h2>
                        </div>
                        <div class="userSelection">
                            <a class="btn btn-outline-secondary btn-block mb-4" href="customerregister">Customer</a>
                            <a class="btn btn-outline-secondary btn-block mb-4" href="adminlogin">Admin</a>
                            <a class="btn btn-outline-secondary btn-block mb-4" href="policyadminregister">Policy Admin</a>
                            <a class="btn btn-outline-secondary btn-block mb-4" href="fieldofficerregister">Field Officer</a>
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
        
        
        <script>
            const images = ["bike1.png", "bike2.png", "car1.png"];
            const color = ["#fe3131", "#ded537", "#7254e6"]
            const n = images.length;
            let i = 0;
            setInterval(function() {
                i = (i + 1)%n;
                imgSlider(images[i]);
            }, 3000);

            function imgSlider (anything) {
                let bikeArr = document.querySelectorAll('.bike1');
                bikeArr[0].src =  "static/images/"+anything;
                bikeArr[1].src =  "static/images/"+anything;
                changeCircleColor(color[i]);
            }

            function changeCircleColor ( color ) {
                const circleArr = document.querySelectorAll ('.circle');
                circleArr[0].style.background = color;
                circleArr[1].style.background = color;
            }

            let side1 = document.getElementById ('side1');
            let side2 = document.getElementById ('side2');
            window.addEventListener('scroll', function() {
                side1.style.left = -window.pageYOffset+"px";
                side2.style.left = window.pageYOffset+"px";
                

            });

        </script>
    
	
</body>
</html>