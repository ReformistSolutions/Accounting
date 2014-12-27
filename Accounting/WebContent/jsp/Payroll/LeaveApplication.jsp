<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Leave Application</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
<%-- <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script> --%>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
<%-- <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script> --%>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script>
<script src="<c:url value="../js/jsapi"/>"></script>
<script src="<c:url value="js/jquery, 1.3.2.js"/>"></script>
<script src="<c:url value="js/ui.datepicker.js"/>"></script>
<script src="<c:url value="js/calendar-config.js"/>"></script>
<link href="<c:url value="css/jquery-ui-sunny.css"/>" rel="stylesheet" type="text/css">

<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                $('#dp1').datepicker({
                    format: "yyyy/mm/dd"
                });
                $('#dp2').datepicker({
                    format: "yyyy/mm/dd"
                });
                $('#dp3').datepicker({
                    format: "yyyy/mm/dd"
                });
                $('#dp4').datepicker({
                    format: "yyyy/mm/dd"
                });
                
                $( document ).ready(function() {
              	  $('#dp1').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
              	    $(this).datepicker('hide');
              	});
              	});
              $( document ).ready(function() {
              	  $('#dp2').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
              	    $(this).datepicker('hide');
              	});
              	});
              $( document ).ready(function() {
            	  $('#dp3').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
            $( document ).ready(function() {
            	  $('#dp4').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
            	});
            
</script>
<script type="text/javascript">
function NoDays()
{	
	 var dob1= document.getElementById("dp2").value;
	var dob2= document.getElementById("dp3").value;
	var date1 = new Date(dob1); 
	var date2 = new Date(dob2);
	var ONE_DAY = 1000 * 60 * 60 * 24;
	var d1 = date1.getTime();
	var d2 = date2.getTime();
	var diff = Math.abs(d1 - d2);
	var days =  Math.round(diff/ONE_DAY);
	//alert("days="+days); 
	document.getElementById("txtNoDays").value = days;	
}
</script>
<script type="text/javascript">
function showDetails()
{
	//alert("ok");
	var empid = document.getElementById("txtempId").value;
	//alert("empid="+empid);
	var xmlhttp;
	if (window.XMLHttpRequest)
	{
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
		  var index=0;
		  var address=xmlhttp.responseText;
		  for(var i=0;i<=address.length;i++)
		  {
		  	index=address.indexOf("^");	
		  }
		document.getElementById("txtempName").value=address.substring(0,index);
		document.getElementById("txtDesignation").value=address.substring(index+1,address.length);
	    }
	  }
	xmlhttp.open("GET","retriveEmpDetails.do?empId="+empid,true);
	xmlhttp.send();
}
</script>
<script type="text/javascript">
function showLeaves()
{
		//alert("ok");
		document.getElementById("showLeaves").innerHTML="";
		var empid = document.getElementById("txtempId").value;
		//alert("empid="+empid);
		var xmlhttp;
		if (window.XMLHttpRequest)
		{
			// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
			  var abc = xmlhttp.responseText ;
			  var innerDiv = document.createElement('div');
			  innerDiv.id="linkedDiv";
			  innerDiv.innerHTML = abc;
			  document.getElementById("showLeaves").appendChild(innerDiv);
			  //document.getElementById("showLeaves").value=xmlhttp.responseText;  /* totalleaves */
		    }
		  }
		xmlhttp.open("GET","retriveTotalLeaves.do?empId="+empid,true);
		xmlhttp.send();
}
</script>
<script type="text/javascript">
function backs()
{
	window.history.back();
}
</script>
<script type="text/javascript">
function validateForm()
{
	if (document.leaveApplication.txtempId.value == "") 
	{
		alert("Employee Id Should not be blank.");
		document.leaveApplication.txtempId.focus();
		return false;
	} 
	else if (document.leaveApplication.txtempName.value == "") 
	{
		alert("Employee Name should not be blank");
		document.leaveApplication.txtempName.focus();
		return false;
	}
	else if (document.leaveApplication.txtDesignation.value == "") 
	{
		alert("Designation should not be blank");
		document.leaveApplication.txtDesignation.focus();
		return false;
	}
	else if (document.leaveApplication.txtDateApplication.value == "") 
	{
		alert("Please Date of Application");
		document.leaveApplication.txtDateApplication.focus();
		return false;
	}
	else if (document.leaveApplication.txtLeavetype.value == "0") 
	{
		alert("Please Select Leave Type");
		document.leaveApplication.txtLeavetype.focus();
		return false;
	}
	
	else if (document.leaveApplication.txtfrmDate.value == "") 
	{
		alert("Please Select From Date");
		document.leaveApplication.txtfrmDate.focus();
		return false;
	}
	else if (document.leaveApplication.txttoDaate.value == "") 
	{
		alert("Please Select From Date");
		document.leaveApplication.txttoDaate.focus();
		return false;
	}
	else if (document.leaveApplication.txtReason.value == "") 
	{
		alert("Reason Should not be blank");
		document.leaveApplication.txtReason.focus();
		return false;
	}
	else if (document.leaveApplication.txtNoDays.value == "") 
	{
		alert("No of Days should not be blank");
		document.leaveApplication.txtNoDays.focus();
		return false;
	}
}
</script>
<script type="text/javascript">
function showSuggestion()
{
	var xmlhttp;
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	  {
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)	
	    {
			document.getElementById("txtempId").value = xmlhttp.responseText;
		}
	  }
	xmlhttp.open("GET","retriveEmpDetails.do",true);
	xmlhttp.send();
}
</script>
<!-- <script>
	$(document).ready(function() {
		 var nowTemp = new Date();
         var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

         $('#dp2').datepicker({
           onRender: function(date) {
             return date.valueOf() < now.valueOf() ? 'disabled' : '';
           }
         }).on('changeDate', function(ev) {
        	 $(this).datepicker('hide');           
         });
         $('#dp3').datepicker({
             onRender: function(date) {
               return date.valueOf() < now.valueOf() ? 'disabled' : '';
             }
           }).on('changeDate', function(ev) {
          	 $(this).datepicker('hide');           
           });
	});
</script> -->
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
		<%@include file="../header.jsp"%>
<div class="page-wrapper">
<!-- <div class="container"> -->
			<%@include file="innerHeader.jsp"%>
			<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Leave<small>&nbsp;Application</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2"> 
			             	<a href="leaveDetails.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	<!-- <button name="back" class="btn btn-primary btn-large" onclick="backs()"><i class="fa fa-reply"></i> Back</button> -->			   
			             	
			             	</div>
		             	</div>
		             	</div>
		</div>
		<br>
		<c:if test="${message==0}">
		<div class="col-md-12">
		<div class="alert alert-danger" role="alert" id="failure">Opps..Your Leave Days exceed from Selected Leave.</div>
		</div>
		<script type="text/javascript">	
		  $('#failure').fadeOut(5000, function() 
		{
		  });
		</script>
		</c:if>
		<br>
			<form:form action="addLeaveApplication.do" onsubmit="return validateForm();" modelAttribute="leaveApplication" name="leaveApplication">
			<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body"> 
						<br>
													<div class="row">
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-6">
											<label>Employee Id : </label>
										</div>
										<div class="col-md-6">
											<select name="txtempId" id="txtempId" onchange="showDetails();showLeaves();" class="form-control">
												<option value="select">---Select---</option>
												<c:forEach items="${empid}" var="empid">
													<option value="${empid.empId}">${empid.empId}</option>
												</c:forEach>
											</select>
											<!-- <input type="text" name="txtempId" id="txtempId" onblur="showDetails();showLeaves();" class="form-control"  /> -->
										</div>
									</div>		 
								</div>
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-6">
											<label>Employee Name : </label>
										</div>				
										<div class="col-md-6">
											<form:input path="txtempName" id="txtempName" cssClass="form-control"/>
										</div> 
									</div>		 
								</div>					
							</div><br>
							<div class="row">
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-6">
											<label>Designation : </label>
										</div>
										<div class="col-md-6">
											<form:input path="txtDesignation" id="txtDesignation" cssClass="form-control" />
										</div>
									</div>		 
								</div>
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-6">
											<label>Remaining Leaves :</label>											
											<div id="showLeaves">
											</div>
											<!-- <button name="back" class="btn btn-primary btn-large"> View Leave Balance</button> -->
										</div>										
									</div>		 
								</div>					
							</div><br>
							<div class="row">
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-6">
											<label>Date of Application : </label>
										</div>				
										<div class="col-md-6">
											<input type="text" name="txtDateApplication" id="dp1" class="form-control" />
										</div>
									</div>		 
								</div>
								<div class="col-md-5">
									<div class="row">													
										<div class="col-md-5">
											<!-- <button name="back" class="btn btn-primary btn-large"> Apply for Leave</button> -->
										</div>
									</div>										 
								</div>
									<div class="col-md-5">
									<div class="row">
										<div class="col-md-6">
											<label>Leave Type : </label>
										</div>				
										<div class="col-md-6">
											<select name="txtLeavetype" class="form-control">
												<option>---Select---</option>
												<c:forEach items="${leaveList}" var="leaveList">
												<option value="${leaveList.leaveId}">${leaveList.leaveName}</option>
												</c:forEach>
											</select>
										</div>
									</div>		 
								</div>				
							</div><br>
							<br>
							<div class="row">
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-6">
											<label>From Date : </label>
										</div>				
										<div class="col-md-6">
											<input type="text" name="txtfrmDate" id="dp2" class="form-control"/>
										</div>
									</div>		 
								</div>
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-6">
											<label>To Date : </label>
										</div>				
										<div class="col-md-6">
											<input type="text" name="txttoDaate" id="dp3" class="form-control"/>
											<!-- <input type="button" onclick="NoDays();">   -->
										</div>
									</div>		 
								</div>					
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-3">
											<label>Reason : </label>
										</div>				
										<div class="col-md-6">	
											<textarea rows="3"  name="txtReason" onblur="NoDays();"  cols="20" class="form-control"></textarea>
									</div>		 
									</div>
								</div>												
							</div><br>
							<div class="row">
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-6">
											<label>No of Days : </label>
										</div>				
										<div class="col-md-6">
											<input type="text" name="txtNoDays" id="txtNoDays" class="form-control"/>
										</div>
									</div>		 
								</div>
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-6">
											<label>Approve Status : </label>
										</div>				
										<div class="col-md-6">
											<input type="text" name="txtApprovStatus" value="Pending" readonly="readonly" class="form-control"/>
										</div>
									</div>
								</div>					
							</div><br>
							<div class="form-group">
							    <div class="col-md-offset-2 col-md-10">
							      <button type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Save">Save</button>
							      <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Cancel">Cancel</button>
							    </div>
							  </div>
						</div>
					</div>
			</div>
			</form:form>
		</div>
		</div>
		 <script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>