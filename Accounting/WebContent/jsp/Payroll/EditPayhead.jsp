<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Payhead</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="http://cdn.oemdith.co.uk/morris-0.4.3.min.css"/>">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script>
<script type="text/javascript">
function backs()
{
	
window.history.back();
}
</script>
<script type="text/javascript">
function showAccountName()
{
		//alert("ok");
	document.getElementById("showAccName").innerHTML="";
	var txtPayheadType = document.getElementById("txtPayheadType").value;
	//alert("txtPayheadType="+txtPayheadType);
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
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
		  document.getElementById("showAccName").appendChild(innerDiv);
	    }
	  }
	xmlhttp.open("GET","retriveAccountName.do?paytype="+txtPayheadType,true);
	xmlhttp.send();	
}
</script>
<script type="text/javascript">
function enable()
{
	if(document.getElementById("radio1").checked)
	{
		document.getElementById("applicable_type").value = "S";
	}
	else if(document.getElementById("radio2").checked)
	{
		document.getElementById("applicable_type").value = "W";
	}
	else if(document.getElementById("radio3").checked)
	{		
		document.getElementById("applicable_type").value = "B";
	}
}
</script>
<script type="text/javascript">
function validateForm()
{
	 
	if (document.frnnewpayhead.applicable_type.value == "") 
	{
		alert("Payhead Applicable Should not be blank.");
		document.frnnewpayhead.applicable_type.focus();
		return false;
	} 
	else if (document.frnnewpayhead.txtPayId.value == "") 
	{
		alert("Payhead id should not be blank");
		document.frnnewpayhead.txtPayId.focus();
		return false;
	}
	else if (document.frnnewpayhead.txtPayheadName.value == "") 
	{
		alert("Payhead Name should not be blank");
		document.frnnewpayhead.txtPayheadName.focus();
		return false;
	}
	else if (document.frnnewpayhead.txtPayslipName.value == "") 
	{
		alert("Payslip name should not be blank");
		document.frnnewpayhead.txtPayslipName.focus();
		return false;
	}
	else if (document.frnnewpayhead.txtPayheadType.value == "0") 
	{
		alert("Payhead type should not be blank");
		document.frnnewpayhead.txtPayheadType.focus();
		return false;
	}
	else if (document.frnnewpayhead.getvalue.value == "") 
	{
		alert("Payhead select applicable");
		document.frnnewpayhead.getvalue.focus();
		return false;
	}
	else if (document.frnnewpayhead.getyesno.value == "") 
	{
		alert("Payhead select affect net salary");
		document.frnnewpayhead.getyesno.focus();
		return false;
	}
	}
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
		<%@include file="../header.jsp"%>
<div class="page-wrapper">
			<%@include file="innerHeader.jsp"%>
			<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;New<small>&nbsp;Payhead</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2"> 
			             	<a href="payrollSetting.do"> <button type="button" class="btn btn-primary " value="" data-toggle="tooltip" data-placement="left" title="Back"><i class="fa fa-reply"></i> Back</button></a>			   
			             	</div>
		             	</div>
		             	</div>
		</div>
		<br>

<form:form cssClass="form-horizontal" action="updatePayhead.do" name="frnnewpayhead" onsubmit="validateForm();" modelAttribute="editpayhead">
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-body">  
	
	<div class="form-group">
    <label class="col-md-3 control-label">Payhead Applicable to</label>
    <div class="col-md-4">
    	<c:if test="${apType == 'S'}">
    		<input id="radio1" type="radio" checked="checked" value="S" name="payhead" onclick="enable();"><label>&nbsp;Salary&nbsp;</label>
			<input id="radio2" type="radio" name="payhead" onclick="enable();"><label>&nbsp;Wages&nbsp;</label>
			<input id="radio3" type="radio" name="payhead" onclick="enable();"><label>&nbsp;Both&nbsp;</label>
			<form:hidden path="applicable_type" id="applicable_type" />
    	</c:if>
    	<c:if test="${apType == 'W'}">
    		<input id="radio1" type="radio" value="S" name="payhead" onclick="enable();"><label>&nbsp;Salary&nbsp;</label>
			<input id="radio2" type="radio" checked="checked" name="payhead" onclick="enable();"><label>&nbsp;Wages&nbsp;</label>
			<input id="radio3" type="radio" name="payhead" onclick="enable();"><label>&nbsp;Both&nbsp;</label>
			<form:hidden path="applicable_type" id="applicable_type" />    	
    	</c:if>
    	<c:if test="${apType == 'B'}">
    		<input id="radio1" type="radio" value="S" name="payhead" onclick="enable();"><label>&nbsp;Salary&nbsp;</label>
			<input id="radio2" type="radio" name="payhead" onclick="enable();"><label>&nbsp;Wages&nbsp;</label>
			<input id="radio3" type="radio" checked="checked" name="payhead" onclick="enable();"><label>&nbsp;Both&nbsp;</label>
			<form:hidden path="applicable_type" id="applicable_type" />
    	</c:if>
		
	</div>
  </div>
  
  <div class="form-group">
    <label class="col-md-3 control-label">Payhead Id</label>
    <div class="col-md-3">
      <form:input path="txtPayId" cssClass="form-control" readonly="true"/>
      <!-- <input type="text" name="txtPayId" class="form-control"> -->
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-3 control-label">Payhead Name</label>
    <div class="col-md-3">
      <form:input path="txtPayheadName" cssClass="form-control"></form:input>	
      <input type="hidden" name="prevPayheadName" value="${editpayhead.prevPayheadName}">
    </div>
  </div>
  <div class="form-group">
    <label class="col-md-3 control-label">Name appear in Payslip</label>
    <div class="col-md-3">
      <form:input cssClass="form-control" path="txtPayslipName"></form:input>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-md-3 control-label">Payhead Type</label>
    <div class="col-md-3">
      <select class="form-control" name="txtPayheadType" id="txtPayheadType" onchange="showAccountName();">
      	<c:if test="${ (editpayhead.txtPayheadType == 'Indirect Expenses') || (editpayhead.txtPayheadType == 'Direct Expenses') }">
      		<option value="${editpayhead.txtPayheadType}">Earning</option>
      	</c:if>
      	<c:if test="${editpayhead.txtPayheadType == 'Duties and Taxes'}">
      		<option value="${editpayhead.txtPayheadType}">Deduction</option>
      	</c:if>
      	<option>---Select---</option>       	
      	<option value="Indirect Expenses">Earning</option>
      	<option value="Duties and Taxes">Deduction</option>
      </select>
    </div> 
  </div>
    <div class="form-group">
    <label for="inputPassword3" class="col-md-3 control-label">Applicable</label>    
    <div class="col-md-4">
               <input name="radio" type='hidden' value="Yes"/>
               <div class="btn-group" data-toggle="buttons">
               <c:if test="${applicable == 'Mandatory'}">
               		<button type="button" class="btn btn-default " data-radio-name="radio1" value="Optional" id="check1" >Optional</button>
                  <button type="button" class="btn btn-default active" data-radio-name="radio1" value="Mandatory" id="check2">Mandatory</button>
               		<form:hidden path="getvalue" id="getvalue"/>	
               </c:if>
               <c:if test="${applicable == 'Optional'}">
               		<button type="button" class="btn btn-default active" data-radio-name="radio1" value="Optional" id="check1" >Optional</button>
                  <button type="button" class="btn btn-default " data-radio-name="radio1" value="Mandatory" id="check2">Mandatory</button>
                  <form:hidden path="getvalue" id="getvalue"/>
               </c:if>
               </div>
    </div> 
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-md-3 control-label">Affect net salary</label>    
    <div class="col-md-3">
               <!-- <input name="radio" type='hidden' value="Yes"/> -->
               <div class="btn-group" data-toggle="buttons">
               <c:if test="${affectedSal == 'Yes'}">
                  <button type="button" class="btn btn-default active" data-radio-name="radio2" name="btnYes" id="btnYes" value="Yes"><i class=icon-ok></i>Yes</button>
                  <button type="button" class="btn btn-default " data-radio-name="radio2" name="btnNo" id="btnNo" value="No"><i class="icon-white icon-remove"></i>No</button>
				  <form:hidden path="getyesno" id="getyesno" />
			   </c:if>
               <c:if test="${affectedSal == 'No'}">
                  <button type="button" class="btn btn-default " data-radio-name="radio2" name="btnYes" id="btnYes" value="Yes"><i class=icon-ok></i>Yes</button>
                  <button type="button" class="btn btn-default active" data-radio-name="radio2" name="btnNo" id="btnNo" value="No"><i class="icon-white icon-remove"></i>No</button>
				  <form:hidden path="getyesno" id="getyesno" />
               </c:if>
               </div>
    </div>
  </div>
      <script type="text/javascript">    	    		
    		$(document).ready(function() {
    	        $('#check1').click(function() {
    	            var opt = $(this).attr("value");
    	            $( "#getvalue" ).val( opt );
    	        });    	        
    	    });
    		$(document).ready(function() {
    	        $('#check2').click(function() {
    	            var mandt = $(this).attr("value");
    	            $( "#getvalue" ).val( mandt );
    	        });    	        
    	    });
    		$(document).ready(function() {
    	        $('#btnYes').click(function() {
    	            var mandt = $(this).attr("value");
    	            $( "#getyesno" ).val( mandt );
    	        });    	        
    	    });
    		$(document).ready(function() {
    	        $('#btnNo').click(function() {
    	            var mandt = $(this).attr("value");
    	            $( "#getyesno" ).val( mandt );
    	        });    	        
    	    });
    </script>
  <script type="text/javascript">
	$('.btn[data-radio-name]').click(function() {
	    $('.btn[data-radio-name="'+$(this).data('radioName')+'"]').removeClass('active');
	    $('input[name="'+$(this).data('radioName')+'"]').val(
	        $(this).text()
	    );
	});
	</script>
	<script type="text/javascript">
	$('.btn[data-radio-name]').click(function() {
	    $('.btn[data-radio-name="'+$(this).data('radioName')+'"]').removeClass('active');
	    $('input[name="'+$(this).data('radioName')+'"]').val(
	        $(this).text()
	    );
	});
	</script>
	<script type="text/javascript">
	$('.btn[data-radio-name]').click(function() {
	    $('.btn[data-radio-name="'+$(this).data('radioName')+'"]').removeClass('active');
	    $('input[name="'+$(this).data('radioName')+'"]').val(
	        $(this).text()
	    );
	});
	</script>
  <div class="form-group">
    <div class="col-md-offset-2 col-md-10">
      <button type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Update">Update</button>
      <button type="submit" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Cancel">Cancel</button>
    </div>
  </div>
  

</div>
</div>
</div>
</form:form>

</div>
</div>
</body>
</html>