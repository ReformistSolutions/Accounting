<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Accounting DashBoard</title>


<link href="<c:url value="resources/assets/plugins/bootstrap/css/bootstrap.css" /> "rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/css/main.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="res ources/assets/css/theme.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.css"/>"rel="stylesheet" type="text/css" />

<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" /> "type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"type="text/javascript"></script>

    

</head>
<body>

<div class="container">
<form:form action="Dashbord.spring" cssClass="form-inline" commandName="accountDashboard">
	<div class="row first-column">
	<div class="col-md-8"></div>
	<div class="col-md-4 pull right">
	<!-- <div class="page-header"> -->
		<div><label>Hello User</label></div>
		<div><label>Your last login was on</label>
		<button type="submit" class="btn btn-primary">Quickly take a tour</button>
		
		</div>
	<!-- </div> -->
	</div>
	</div><hr>
	<div class="row first-column">
	<div class="col-md-8">
	<div class="panel panel-default">
			<div class="panel-body">
				<div><label>Chart<label></div><hr>
				<div>
					<img alt="" src="../images1/line.jpg">
				</div>
			</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-body">
				<div>
							<ul class="nav nav-tabs" >
                                <li class="active"><a href="#tab1" data-toggle="tab"><i class="glyphicon glyphicon-tags"></i>  Sales</a></li>
                                <li><a href="#tab2" data-toggle="tab"><i class="glyphicon glyphicon-arrow-down "></i>  Receivables</a></li>
                                <li><a href="#tab3" data-toggle="tab"><i class="glyphicon glyphicon-arrow-up"></i>  Paybles</a></li>
                                <li><a href="#tab4" data-toggle="tab"><i class="glyphicon glyphicon-briefcase"></i>  Balances</a></li>
                            </ul>
                            <div class="tab-content">
                            		<div class="tab-pane fade in active" id="tab1">
                						<div class="col-md-12">
                    						<div class="panel panel-default">                       
                        						<div class="panel-body">
                        							<label><i class="glyphicon glyphicon-info-sign"></i>  Currently there are no records to show.</label>
                        						</div>
                        					</div>
                        				</div>
                        			</div>        
                        			<div class="tab-pane fade" id="tab2">
                						<div class="col-md-12">
                    						<div class="panel panel-default">                       
                        						<div class="panel-body">
                        							<ul class="nav nav-tabs">
                        								<li class="active"><a href="#recvtab11" data-toggle="tab"><i class="glyphicon glyphicon-euro"></i>  By Amount</a></li>
                               							<li><a href="#recvtab12" data-toggle="tab"><i class="glyphicon glyphicon-calendar"></i>  By Period</a></li>
                        							</ul>
                        							<div class="tab-content">
                        									<div class="tab-pane fade in active" id="recvtab11">
						                						<div class="col-md-12">
						                    						<div class="panel panel-default">                       
						                        						<div class="panel-body">
						                        							<label><i class="glyphicon glyphicon-info-sign"></i>  Currently there are no records to show.</label>
						                        						</div>
						                        					</div>
						                        				</div>
						                        			</div>
						                        			<div class="tab-pane fade" id="recvtab12">
						                						<div class="col-md-12">
						                    						<div class="panel panel-default">                       
						                        						<div class="panel-body">
						                        							<label><i class="glyphicon glyphicon-info-sign"></i>  Currently there are no records to show.</label>
						                        						</div>
						                        					</div>
						                        				</div>
						                        			</div>
                        							</div>
                        						</div>
                        					</div>
                        				</div>
                        			</div>              
                        			<div class="tab-pane fade" id="tab3">
                						<div class="col-md-12">
                    						<div class="panel panel-default">                       
                        						<div class="panel-body">
                        							<ul class="nav nav-tabs">
                        								<li class="active"><a href="#paytab1" data-toggle="tab"><i class="glyphicon glyphicon-euro"></i>  By Amount</a></li>
                               							<li><a href="#paytab2" data-toggle="tab"><i class="glyphicon glyphicon-calendar"></i>  By Period</a></li>
                        							</ul>
                        							<div class="tab-content">
                        									<div class="tab-pane fade in active" id="paytab1">
						                						<div class="col-md-12">
						                    						<div class="panel panel-default">                       
						                        						<div class="panel-body">
						                        							<label><i class="glyphicon glyphicon-info-sign"></i>  Currently there are no records to show.</label>
						                        						</div>
						                        					</div>
						                        				</div>
						                        			</div>
						                        			<div class="tab-pane fade" id="paytab2">
						                						<div class="col-md-12">
						                    						<div class="panel panel-default">                       
						                        						<div class="panel-body">
						                        							<label><i class="glyphicon glyphicon-info-sign"></i>  Currently there are no records to show.</label>
						                        						</div>
						                        					</div>
						                        				</div>
						                        			</div>
                        							</div>
                        						</div>
                        					</div>
                        				</div>
                        			</div> 
                        			<div class="tab-pane fade" id="tab4">
                						<div class="col-md-12">
                    						<div class="panel panel-default">                       
                        						<div class="panel-body">
                        							<div class="panel-heading">
                        								<div><label>Cash and Bank Balances</label><hr></div>                        								
	                        							<div>
	                        							<label><u>Account</u></label>
	                        							<label style="float: right;"><u>Balance</u></label>
	                        							</div>
	                        							<div>
	                        							<label>Cash in Hand</label>
	                        							<label style="float: right;">4387.75 Cr</label>	                        							</div>
	                        							<div>
	                        							<label style="float: right;">75 Cr</label>
	                        							</div>
	                        							<div>
	                        							<label>Bank Name 2</label>
	                        							<label style="float: right;">438 Cr</label>
	                        							</div>
                        							</div>
                        						</div>
                        					</div>
                        				</div>
                        			</div>    						
                            </div>
					</div>
			</div>
	</div>
	</div>		
	<div class="col-md-4 pull right">
	<div class="panel panel-default">
			<div class="panel-body">
				<div><label>Recent Activities</label></div><hr>
				<div>
				
					<label><i class="glyphicon glyphicon-pencil"></i>  You Updated withdraw for 1.0 into cash.</label>
				</div><hr>
				<div>
					<label><i class="glyphicon glyphicon-pencil"></i>  You Updated withdraw for 1.0 into cash.</label>
				</div><hr>
				<div>
					<label><i class="glyphicon glyphicon-pencil"></i>  You Updated withdraw for 1.0 into cash.</label>
				</div><hr>
				
			</div>
	</div>
	</div>	
	</div>
	
</form:form>	
</div>

</body>
</html>