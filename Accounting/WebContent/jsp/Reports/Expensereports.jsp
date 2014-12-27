<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Record Expense</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<%-- <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
              });
    </script>
    <script type="text/javascript">
	function backs() {
		window.history.back();
	}
</script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>	
	<script type="text/javascript">
                $(document).ready(function () {            	
                $('#dp1').datepicker({
                    format: "yyyy-mm-dd"
                });
                $('#dp2').datepicker({
                    format: "yyyy/mm/dd"
                });
                
                $( document).ready(function() {
                 	  $('#dp1').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
                 	    $(this).datepicker('hide');
                 	});
                 	});
                $( document).ready(function() {
               	  $('#dp2').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
               	    $(this).datepicker('hide');
               	});
               	});
            });
             	</script>
</head>	
<body style="overflow-x: hidden;"> 
<div id="wrapper">
 <%@include file="../header.jsp" %>
<div class="page-wrapper">							
<%@include file="innerHeader.jsp"%>	
<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-8">
								<ul class="breadcrumb">
									<li class="active"><small>Expense Reports</small>
								</ul>
							</div>
							<div class="col-md-3">
							<button name="back" class="btn btn-primary btn-large" onclick="backs()"><i class="fa fa-reply"></i> Back</button>	
        					 </div>
						</div>
					</div>
				</div>
			<br>
			<div class="col-md-12">
<div class="panel panel-default">
<div class="panel-body">
<div class="row">
<div class="col-md-12">	
   	   <div class="col-md-2">From Date</div> 
   	   <div class="col-md-2">
   	    	 <input type="text" name="frmDt" id="dp1" class="form-control">
   	    </div>
   	     <div class="col-md-2">To Date</div>
   	   <div class="col-md-2">	    	     
   	    	 <input type="text" name="toDt" id="dp2" class="form-control">
   	    </div>
   	    <div class="col-md-3">
   	    	 <a href="#"><img src="<c:url value="/resources/images/search.png" />" height="33" width="35"></img></a>
   	    <!--  </div>
   	    <div class="col-md-2 pull-right">
   	     -->	 <a href="#"><img src="<c:url value="/resources/images/PDF-icon.png" />" height="30" width="30"></img></a>
   	    	 <a href="#"><img src="<c:url value="/resources/images/excel-icon.png" />" height="33" width="35"></img></a>
   	    </div>
   </div>
</div>
</div>
</div></div>
			<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
		         <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Expense ID</th>
                                            <th>Paid From Account</th>
                                            <th>Expense Date</th>
                                             <th>Expense Type Account</th>
                                            <th>Total</th>
                                            <th>Description</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${expreports}" var="expList">
                                        <tr class="odd gradeX">
                                             <td>${expList.expid}</td>
                                            <td>${expList.paidfrm }</td>
                                            <td>${expList.expdate }</td>
                                            <td>${expList.exptype }</td>
                                            <td>${expList.total }</td> 
                                            <td>${expList.descrption }</td>          
                                        </tr>
                                       </c:forEach>
                                        </tbody>
                                </table>
                                </div>
                                </div>
                                </div>
                                </div>

</div>
</div>
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>

</body>
</html>