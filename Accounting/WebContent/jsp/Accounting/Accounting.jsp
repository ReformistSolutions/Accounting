<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Purchase</title>
 <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />

    <!-- Add custom CSS here -->
    <link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrapper">
		<!-- Sidebar -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Banking -Withdraw</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
            <li class="active"><a href="../index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a href="jsp/Sales/Sales.jsp"><i class="fa fa-tags"></i> Sales</a></li>
            <li><a href="jsp/Purchase/Purchase.jsp"><i class="fa fa-table"></i> Purchase</a></li>
            <li><a href="jsp/Inventory/Inventory.jsp"><i class="fa fa-edit"></i> Inventory</a></li>
            <li><a href="jsp/Payroll/Payroll.jsp"><i class="fa fa-inr"></i> Payroll</a></li>	
            <li><a href="jsp/Banking/Banking.jsp"><i class="fa fa-building-o"></i> Banking</a></li>
            <li><a href="jsp/Accounting/Accounting.jsp"><i class="fa fa-book"></i> Accounting</a></li>
            <li><a href="jsp/Item/Item.jsp"><i class="fa fa-desktop"></i> Items</a></li>
            <li><a href="jsp/Customer/customer.jsp"><i class="fa fa-wrench"></i> Customer</a></li>
            <li><a href="jsp/Reports/Reports.jp"><i class="fa fa-bar-chart-o"></i> Reports</a></li>
            
            
          </ul>

				<ul class="nav navbar-nav navbar-right navbar-user">
					<li class="dropdown messages-dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-envelope"></i> Messages <span class="badge">7</span>
							<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header">7 New Messages</li>
							<li class="message-preview"><a href="#"> <span
									class="avatar"><img src="http://placehold.it/50x50"></span>
									<span class="name">Makrand Kate</span> <span class="message">Hey
										there, I wanted to ask you something...</span> <span class="time"><i
										class="fa fa-clock-o"></i> 4:34 PM</span>
							</a></li>
							<li class="divider"></li>
							<li class="message-preview"><a href="#"> <span
									class="avatar"><img src="http://placehold.it/50x50"></span>
									<span class="name">Makrand Kate</span> <span class="message">Hey
										there, I wanted to ask you something...</span> <span class="time"><i
										class="fa fa-clock-o"></i> 4:34 PM</span>
							</a></li>
							<li class="divider"></li>
							<li class="message-preview"><a href="#"> <span
									class="avatar"><img src="http://placehold.it/50x50"></span>
									<span class="name">Makrand Kate</span> <span class="message">Hey
										there, I wanted to ask you something...</span> <span class="time"><i
										class="fa fa-clock-o"></i> 4:34 PM</span>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">View Inbox <span class="badge">7</span></a></li>
						</ul></li>
					<li class="dropdown alerts-dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-bell"></i> Alerts <span class="badge">3</span> <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Default <span
									class="label label-default">Default</span></a></li>
							<li><a href="#">Primary <span
									class="label label-primary">Primary</span></a></li>
							<li><a href="#">Success <span
									class="label label-success">Success</span></a></li>
							<li><a href="#">Info <span class="label label-info">Info</span></a></li>
							<li><a href="#">Warning <span
									class="label label-warning">Warning</span></a></li>
							<li><a href="#">Danger <span class="label label-danger">Danger</span></a></li>
							<li class="divider"></li>
							<li><a href="#">View All</a></li>
						</ul></li>
					<li class="dropdown user-dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-user"></i> Makrand Kate <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i> Inbox <span
									class="badge">7</span></a></li>
							<li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="fa fa-power-off"></i> Log Out</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
		<div id="page-wrapper">
			<div class="row first-column">
				<div class="col-md-10">
					<ol class="breadcrumb">
						<li class="active"><i class="fa fa-book"></i> Accounting</li>
					</ol>
				</div>
				<div class="col-md-2">
					<button type="button" class="btn btn-primary" value="+"><i class="fa fa-plus-square"></i>
						Add Auditor</button>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->
		<iframe src="Auditor.jsp" name="TargetFrm" id="TargetFrm" style="margin-left: 10px; border: none; width: 1170px; height: 800px;">
		</iframe>

	</div>
	<!-- /#wrapper -->
	<!-- JavaScript -->
	<script src="/resources/js/jquery-1.10.2.js"></script>
    <script src="/resources/js/bootstrap.js"></script>

</body>
</html>