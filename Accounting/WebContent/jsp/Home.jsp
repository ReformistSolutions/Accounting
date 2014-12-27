<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<head>
<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/home.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<%-- <script src="<c:url value="resources/assets/js/responsiveslides.js" />" type="text/javascript"></script>
 --%><script src="<c:url value="resources/assets/js/responsiveslides.min.js" />" type="text/javascript"></script>
<%-- <link href="<c:url value="resources/assets/responsiveslides.css" />" rel="stylesheet" type="text/css">
 --%>
 
 <style type="text/css">

.header-menu{
position:fixed;
margin-top:0;
top:0;
z-index:40000;
width:100%;
background:white;
/* background:url("../images/bg-sky.png") repeat-x #65b7f1 */;
}
.logo{
	float:left;
	margin-top: 0.2em;
}

.top-menu{
	text-align:right;
}
.top-menu ul{
	margin:0;
	padding:18px;
}
.top-menu li {
	text-transform:uppercase;
	display:inline-block;
}
.top-menu li a{
	color:black;
	text-decoration:none;
	display:block;
	padding:1.2em;
	font-family: 'Open Sans', sans-serif;
	font-weight:200;
	font-size:13px;
}
.top-menu li a:hover{
	color:#ED485C;
}
@media screen and (max-width:320px){
	.logo {
		width: 50%;
	}
	ul.links {
		padding: 0;
	}
	.nbs-flexisel-nav-right{
		right:-15px;
	}
	.nbs-flexisel-nav-left{
		left:-15px;
	}
	.logo {
		margin-top: 0.8em;
		width: 50%;
	}
	.top-menu li a {
		padding: 5px 0;
		font-size: 10px;
	}
	}
.rslides img {
  display: block;
  height: auto;
  float: left;
  width: 100%;
  border: 0;
  }
  
</style>
</head>

<body style="overflow-x: hidden;">

	<div class="header-menu">
		<div class="logo">
			<a href="#"><img src="resources/images/logo.png" class="img-responsive" alt=""></a>
		</div>
		<div class="top-menu">
			<span class="menu"> </span>
			<ul>
				<li><a href="#Services" class="scroll">Services</a></li>
				<li><a href="#Services" class="scroll">Product Features</a></li>
				<li><a href="#Services" class="scroll">Pricing & Documentation</a></li>
				<li><a href="#contact-us" class="scroll">Contact us</a></li>
				<li><a href="login.do" class="scroll">Login</a></li>
			</ul>
		</div>
	</div>
	<div class="rslides">
		<img src="resources/images/4.jpg" alt="">
	</div>
	 
</body>
</html>