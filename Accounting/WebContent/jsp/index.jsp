<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">	
    <meta name="author" content="">
    <title>DashBoard</title>
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
    <link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
    <script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
    <%-- <script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
    <script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
   <script src="<c:url value="/resources/chart/Chart.js" />" ></script> 
  </head>
  <body style="overflow-x: hidden;">
  
    <div id="wrapper">
    	<%@ include file="header.jsp" %>
      <!-- Sidebar -->
      <div id="page-wrapper">
        <div class="row">         
            <div class="panel">

	<div class="row first-column">
	<div class="col-md-8">
	<div class="panel panel-default">
			<div class="panel-body">
				<div><label >Chart</label></div><hr>
				<div style="width: 100%">
					<canvas id="canvas" height="350" width="600"></canvas>
					<div style="float: right;">
						<br><canvas id="myCanvas" width="20" height="20" style="border:1px solid rgba(51,102,204,0.8);background-color:rgba(51,102,204,0.5)">
						</canvas> Completed
						<canvas id="myCanvas" width="20" height="20" style="border:1px solid  rgba(220,57,18,0.8);background-color:rgba(220,57,18,0.5)">
						</canvas> Incompleted						
					</div>
				</div>
				<%-- <div id="canvas-holder">
					<canvas id="chart-area" width="300" height="300"/>
				</div> --%>
			</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-body">
				<div>
							<ul class="nav nav-tabs" >
                                <li class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-tags"></i>  Sales</a></li>
                                <li><a href="#tab2" data-toggle="tab"><i class="fa fa-arrow-down"></i>  Receivables</a></li>
                                <li><a href="#tab3" data-toggle="tab"><i class="fa fa-arrow-up"></i>  Paybles</a></li>
                                <li><a href="#tab4" data-toggle="tab"><i class="fa fa-money"></i>  Balances</a></li>
                            </ul>
                            <div class="tab-content">
                            		<div class="tab-pane fade in active" id="tab1">
                						<div>
                    						<div class="panel panel-default">                       
                        						<div class="panel-body">
                        							<label ><i class="fa fa-info-circle"></i>  Currently there are no records to show.</label>
                        						</div>
                        					</div>
                        				</div>
                        			</div>        
                        			<div class="tab-pane fade" id="tab2">
                						<div >
                    						<div class="panel panel-default">                       
                        						<div class="panel-body">
                        							<ul class="nav nav-tabs">
                        								<li class="active"><a href="#recvtab11" data-toggle="tab"><i class="fa fa-money"></i>  By Amount</a></li>
                               							<li><a href="#recvtab12" data-toggle="tab"><i class="fa fa-calendar"></i>  By Period</a></li>
                        							</ul>
                        							<div class="tab-content">
                        									<div class="tab-pane fade in active" id="recvtab11">
						                						<div >
						                    						<div class="panel panel-default">                       
						                        						<div class="panel-body">
						                        							<label ><i class="fa fa-info-circle"></i>  Currently there are no records to show.</label>
						                        						</div>
						                        					</div>
						                        				</div>
						                        			</div>
						                        			<div class="tab-pane fade" id="recvtab12">
						                						<div>
						                    						<div class="panel panel-default">                       
						                        						<div class="panel-body">
						                        							<label ><i class="fa fa-info-circle"></i>  Currently there are no records to show.</label>
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
                						<div >
                    						<div class="panel panel-default">                       
                        						<div class="panel-body">
                        							<ul class="nav nav-tabs">
                        								<li class="active"><a href="#recvtab11" data-toggle="tab"><i class="fa fa-money"></i>  By Amount</a></li>
                               							<li><a href="#recvtab12" data-toggle="tab"><i class="fa fa-calendar"></i>  By Period</a></li>
                        							</ul>
                        							<div class="tab-content">
                        									<div class="tab-pane fade in active" id="paytab1">
						                						<div >
						                    						<div class="panel panel-default">                       
						                        						<div class="panel-body">
						                        						<%-- <c:forEach items="${custInvChart}" var="invChart">${invChart.customerName}</c:forEach> --%>
						                        							<label ><i class="fa fa-info-circle"></i>  Currently there are no records to show.</label>
						                        						</div>
						                        					</div>
						                        				</div>
						                        			</div>
						                        			<div class="tab-pane fade" id="paytab2">
						                						<div>
						                    						<div class="panel panel-default">                       
						                        						<div class="panel-body">
						                        							<label ><i class="fa fa-info-circle"></i>  Currently there are no records to show.</label>
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
                						<div >
                    						<div class="panel panel-default">                       
                        						<div class="panel-body">
                        							<div class="panel-heading">
                        								<div><label> Cash and Bank Balances</label><hr></div>                        								
	                        							<div>
	                        							<label ><u>Account</u></label>
	                        							<label Style="float: right;"><u>Balance</u></label>
	                        							</div>
	                        							<div>
	                        							<label >Cash in Hand</label>
	                        							<label Style="float: right;">4387.75 Cr</label>
	                        							</div>
	                        							<div>
	                        							<label >Bank Name 1</label>
	                        							<label Style="float: right;">75 Cr</label>
	                        							</div>
	                        							<div>
	                        							<label >Bank Name 2</label>
	                        							<label Style="float: right;">438 Cr</label>
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
				<div class="">
					<!-- <div class="page-header"> -->
						<div><label>Hello ${userName}</label></div>
						<div><label>Your last login was on</label>
						<!-- <button type="submit" class="btn btn-primary">Quickly take a tour</button> -->
						</div>
					<!-- </div> -->
				</div>
			</div>	
	</div>
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

	
<%-- </form:form>	 --%>
            
          </div>
        </div>
          <!-- /.row -->

          <!-- /.row -->

      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->
		
    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

    <!-- Page Specific Plugins -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
    <script src="resources/js/morris/chart-data-morris.js"></script>
    <script src="resources/js/tablesorter/jquery.tablesorter.js"></script>
    <script src="resources/js/tablesorter/tables.js"></script>

  </body>
</html>

${msg}

<!-- custInvChart-->
<script>
	

	var barChartData = {
		labels : ["<c:forEach items='${custInvChart}' var='invChart'>${invChart.customerName}","</c:forEach>"],
		datasets : [
			{
				fillColor : "rgba(51,102,204,0.5)",
				strokeColor : "rgba(51,102,204,0.8)",
				highlightFill: "rgba(51,102,204,0.75)",
				highlightStroke: "rgba(51,102,204,1)",
				data : ["<c:forEach items='${custInvChart}' var='invChart'>${invChart.completed}","</c:forEach>"]
			},
			{
				fillColor : "rgba(220,57,18,0.5)",
				strokeColor : "rgba(220,57,18,0.8)",
				highlightFill : "rgba(220,57,18,0.75)",
				highlightStroke : "rgba(220,57,18,1)",
				data : ["<c:forEach items='${custInvChart}' var='invChart'>${invChart.incompleted}","</c:forEach>"]
			}
		]

	}
	window.onload = function(){
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myBar = new Chart(ctx).Bar(barChartData, {
			responsive : true
		});
		var ctx = document.getElementById("chart-area").getContext("2d");
		window.myPie = new Chart(ctx).Pie(pieData);
	}

	</script>
	
	<script>

		var pieData = [
				{
					value: 300,
					color:"#F7464A",
					highlight: "#FF5A5E",
					label: "Red"
				},
				{
					value: 50,
					color: "#46BFBD",
					highlight: "#5AD3D1",
					label: "Green"
				},
				{
					value: 30,
					color: "#AD65D6",
					highlight: "#6A2D87",
					label: "Gray"
				},
				{
					value: 100,
					color: "#FDB45C",
					highlight: "#FFC870",
					label: "Yellow"
				},
				{
					value: 40,
					color: "#949FB1",
					highlight: "#A8B3C5",
					label: "Grey"
				},
				{
					value: 120,
					color: "#4D5360",
					highlight: "#616774",
					label: "Dark Grey"
				}

			];

			/* window.onload = function(){
				var ctx = document.getElementById("chart-area").getContext("2d");
				window.myPie = new Chart(ctx).Pie(pieData);
			}; */



	</script>