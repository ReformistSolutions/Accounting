<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee Details</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>"
	rel="stylesheet" type="text/css">
<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"
	type="text/javascript"></script>


<link rel="stylesheet"
	href="<c:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script>


<script src="<c:url value="../js/jsapi"/>"></script>
<script src="<c:url value="js/jquery, 1.3.2.js"/>"></script>
<script src="<c:url value="js/ui.datepicker.js"/>"></script>
<script src="<c:url value="js/calendar-config.js"/>"></script>
<link href="<c:url value="css/jquery-ui-sunny.css"/>" rel="stylesheet"
	type="text/css">


 <script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />" rel="stylesheet" type="text/css"/>	


<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
				$('#btnNext').click(function () {
            		
            	    $('#mytab a[href="#tab2"]').tab('show');
            	});
            	
                $('#dp1').datepicker({
                    format: "yyyy/mm/dd"
                });
                
            	
                $('#dp2').datepicker({
                    format: "yyyy/mm/dd"
                });
                
                $('#dp3').datepicker({
                    format: "yyyy/mm/dd"
                });
          
           
            });
            
            
            $( document ).ready(function() {
            	  $('#dp1').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
            
            
            $( document ).ready(function() {
          	  $('#dp2').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
          	    $(this).datepicker('hide');
          	});
          	});
            
            
            $( document ).ready(function() {
          	  $('#dp3').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
          	    $(this).datepicker('hide');
          	});
          	});
      
    </script>
<script>
function textAreaAdjust(o) {
    o.style.height = "1px";
    o.style.height = (25+o.scrollHeight)+"px";
}
</script>

<script>
	$(document).ready(function() {
		$('#dataTables-example1').dataTable();
		$('#dataTables-example2').dataTable();

	});
</script>
<script type="text/javascript">
$(document).ready(function(){
    $("select").change(function(){
        $( "select option:selected").each(function(){
            if($(this).attr("value")=="Bank"){
                $("#showBanksDetails").show(800);
            }
            if($(this).attr("value")=="Cash"){
                $("#showBanksDetails").hide(800);
            }
            if($(this).attr("value")=="0"){
                $("#showBanksDetails").hide(800);
            }
        });
    }).change();
});
</script>
<script>
function validateForm()
{
	
    if(document.frmAddEmployee.NameSal.value =="0")
    {
      alert(" please select salutation");
      document.frmAddEmployee.NameSal.focus();
      return false;
   
    }
    else if(document.frmAddEmployee.txtfname.value=="") 
    	{
    	alert("First Name Should not be empty");
    	 document.frmAddEmployee.txtfname.focus();
    	 return false;
    	}
    else if(document.frmAddEmployee.txtmname.value=="")
    	{
    		alert("Middle Name Should not be empty");
   			 document.frmAddEmployee.txtmname.focus();
   	 		return false;
    	}
    else if(document.frmAddEmployee.txtlname.value=="")
	{
		alert("Last Name Should not be empty");
			 document.frmAddEmployee.txtlname.focus();
	 		return false;
	}
    
     else if(document.frmAddEmployee.Gender.value=="0")
    {
      alert(" please select Gender");
      document.frmAddEmployee.Gender.focus();
      return false;
    }
     else if(document.frmAddEmployee.bloodgrp.value=="0")
    {
      alert(" please select blood group");
      document.frmAddEmployee.bloodgrp.focus();
      return false;
    }
     else if(document.frmAddEmployee.TxtContact.value=="")
    {
      alert(" Contact Should not be empty");
      document.frmAddEmployee.TxtContact.focus();
      return false;
    }
     else if(document.frmAddEmployee.birthdt.value=="")
    	 {
    	 	alert(" Birth Date field Should not be empty....");
		 	document.frmAddEmployee.birthdt.focus();
 			return false;
    	 }
    	 else if(document.frmAddEmployee.effectiveDate.value=="")
    	 {
    	 	alert(" Effective Date field Should not be empty....");
		 	document.frmAddEmployee.effectiveDate.focus();
 			return false;
    	 }
     else if(document.frmAddEmployee.TxtPA.value=="")
	 {
	 	alert("Present Address Should not be empty....");
	 	document.frmAddEmployee.TxtPA.focus();
			return false;
	 }
     else if(document.frmAddEmployee.TxtPermAdd.value=="")
	 {
	 	alert("Permanant Address Should not be empty....");
	 	document.frmAddEmployee.TxtPermAdd.focus();
			return false;
	 }
     else if(document.frmAddEmployee.TxtEmpId.value=="")
	 {
	 	alert("Employee ID Should not be empty....");
	 	document.frmAddEmployee.TxtEmpId.focus();
		return false;
	 }
     else if(document.frmAddEmployee.JDdt.value=="")
	 {
	 	alert("Joining Date field Should not be empty........");
	 	document.frmAddEmployee.JDdt.focus();
		return false;
	 }
     else if(document.frmAddEmployee.worktype.value=="0")
     {
         alert(" please select Work Type");
         document.frmAddEmployee.worktype.focus();
         return false;
       }
     else if(document.frmAddEmployee.PayType.value=="0")
     {
         alert(" please select Payment Type");
         document.frmAddEmployee.PayType.focus();
         return false;
       }
       else if(document.frmAddEmployee.dept.value=="0")
       {
           alert(" please select Department Type");
           document.frmAddEmployee.dept.focus();
           return false;
         }
       else if(document.frmAddEmployee.Designation.value=="0")
       {
           alert("  please select  Designation ...");
           document.frmAddEmployee.Designation.focus();
           return false;
         }
        
  }
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode;
   if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
      return false;
 return true;
}

function AllowCharacters(e)
{
var keycode;
if (window.event) keycode = window.event.keyCode;
else if (event) keycode = event.keyCode;
else if (e) keycode = e.which;
else return true;


if((keycode >= 65 && kecode <= 90) || (keycode >= 97 && keycode <= 122))
{
  return true;
}
else
{
 return false;
}

return false;   
}

/* function ValidateRadio(form){
ErrorText= "";
if ( ( form.userrole[0].checked == false ) && ( form.userrole[1].checked == false )&& form.userrole[2].checked==false 
	 && ( form.userrole[3].checked == false )&& form.userrole[4].checked==false )
{
// alert ( "Please choose any one user role" ); 
return false;
}
if (ErrorText= "") { form.submit()}
} */

</script>
 <script type="text/javascript">
 
 function backs()
 {
	 window.history.back();
 }
 </script>

<script src="<c:url value="../js/jquery-1.10.2.js"/>"></script>
<script src="<c:url value="../js/bootstrap.js"/>"></script>
<script type="text/javascript">
function onTotal(obj)
{
	var id= obj.slice(10);
	var payheadvalue = document.getElementById("txtpayhead"+id).value;
	var payheadType = document.getElementById("salaryBeans["+id+"].payheadtype").value;	
	var prevpayamt = document.getElementById("prevpayamt"+id).value ;
	var expayheadtotal = document.getElementById("payheadtotal").value;
	if(payheadType=='Duties and Taxes')
	{
		var crpayheadtotal = parseFloat(expayheadtotal) + parseFloat(prevpayamt);
		var finaltotal = parseFloat(crpayheadtotal) - parseFloat(payheadvalue);
		document.getElementById("payheadtotal").value = finaltotal.toFixed(2);
		document.getElementById("prevpayamt"+id).value = payheadvalue ;
	}
	else
	{
		var crpayheadtotal = parseFloat(expayheadtotal) - parseFloat(prevpayamt);
		var finaltotal = parseFloat(crpayheadtotal) + parseFloat(payheadvalue);
		document.getElementById("payheadtotal").value = finaltotal.toFixed(2);
		document.getElementById("prevpayamt"+id).value = payheadvalue ;
	}
	
}
</script>


</head>
<body style="overflow-x: hidden;">
	<div id="wrapper">
		<%@include file="../header.jsp"%>
<div class="page-wrapper">
			<%@include file="innerHeader.jsp"%>
			
				<input type="hidden" id="hide" name="hide1" value="0">
				<input type="hidden" name="hide2" value="Save">
				<br>
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-8">
								<ul class="breadcrumb">
									<li class="active"><small><i
											class="fa fa-2x fa-user"></i></small>&nbsp;New<small>&nbsp;Employee</small>
								</ul>
							</div>
							
							<div class="col-md-3">
							<a href="users.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>	
							<!-- <button name="back" class="btn btn-primary btn-large" onclick="backs();"><i class="fa fa-reply"></i> Back</button> -->	
        					 </div>
							
						</div>
					</div>
				</div>
				<form:form action="updateEmployee.do" modelAttribute="editEmployee"
				name="frmAddEmployee" onsubmit="return validateForm()">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<ul class="nav nav-tabs" id="mytab">
								<li class="active"><a href="#tab1" data-toggle="tab"><i
										class="icon-th-list "></i> Basic And Work Details</a></li>
								<li><a href="#tab2" data-toggle="tab"><i
										class="fa fa-money"></i> Salary Structure</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="tab1">
									<!-- <div class="col-lg-12"> -->

										<br>
										<div class="row">
											<div class="col-md-1">
												<label>Name*</label>
											</div>
											
											<div class="col-md-2">
												<div class="btn-group">
												 
													<form:select path="NameSal" cssClass="form-control">
													<OPTION>${editEmployee.nameSal }</OPTION>
														<option>Select Type</option>
														<option>Mr.</option>
														<option>Mrs.</option>
														<option>Ms.</option>
														<option>Mis.</option>
													</form:select>
													
												</div>
											</div>
											<div class="col-md-3">

												<form:input path="txtfname" cssClass="form-control" />
											</div>
											<div class="col-md-3">
												<form:input path="txtmname" cssClass="form-control" />
											</div>
											<div class="col-md-3">
												<form:input path="txtlname" cssClass="form-control" />
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-md-12">
											<div class="row">
											<div class="col-md-4">
												<label>Email : </label>
												<form:input path="TxtEmail" cssClass="form-control" onblur="validateEmail(this.value);"/>
											</div>
											<div class="col-md-4">
												<label>User Name : </label>
												<form:input path="TxtUserName" cssClass="form-control" />
											</div>
										</div>	
												<%-- <div class="row">
													<div class="col-md-3">
														<label>Email*</label>
													</div>
													<div class="col-md-6">
														<form:input path="TxtEmail" cssClass="form-control"
															onblur="validateEmail(this.value);" />
													</div>
												</div>
												<br> --%>
											</div>
											<%-- <div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>User&nbsp;Name*</label>
													</div>
													<div class="col-md-6">
														<form:input path="TxtUserName" cssClass="form-control" />
													</div>
												</div>
											</div> --%>
										</div>
										<div class="row">
											<div class="col-md-12">
											<div class="row">
													<div class="col-md-4">
														<label>User Role<font color="red">&nbsp;*</font> : </label>
													</div>
													<div class="col-md-12 radio">
														<form:checkbox path="userrole" onblur="ValidateRadio(this.form);" value="Sales"/>
														<label> Sales</label>
														<form:checkbox path="userrole"  value="Purchase"/>
														<label>Purchase</label>
														<form:checkbox path="userrole"  value="Inventory"/>
														<label> Inventory</label>
														<form:checkbox path="userrole"  value="Payroll"/>
														<label>Payroll</label>
														<form:checkbox path="userrole" value="Banking" />
														<label> Banking</label>
														<form:checkbox path="userrole" value="Accounting" />
														<label> Accounting</label>
													</div>
											</div>
											</div>
										</div>
										<br>
										<div class="panel panel-default">
											<div class="panel-heading">
					                            Basic Info
					                        </div>					                        
					                        <div class="panel-body">
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Gender<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<select name="Gender" class="form-control">
															<option>${editEmployee.gender }</option>
															<option value=0>Select Gender</option>
															<option>Male</option>
															<option>Female</option>
														</select>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Blood Group<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<form:select path="bloodgrp" cssClass="form-control">
															<option>${editEmployee.bloodgrp }</option>
															<option value=0>Select Group</option>
															<option>O+</option>
															<option>O-</option>
															<option>A+</option>
															<option>A-</option>
															<option>B+</option>
															<option>B-</option>
															<option>AB+</option>
															<option>AB-</option>
														</form:select>
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Contact No<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6"> 
					                        				<form:input path="TxtContact" cssClass="form-control" onkeypress="return isNumberKey(this)" maxlength="15"/>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Birth Date<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<input type="text" id="dp1" class="form-control" name="birthdt" value="${editEmployee.birthdt}">
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Permanent&nbsp;Address&nbsp;<font color="red">&nbsp;*</font>:</label>
					                        			</div>
					                        			<div class="col-md-6">	
					                        				<form:textarea path="TxtPermAdd" cssClass="form-control" onkeyup="textAreaAdjust(this)" cssStyle="overflow:hidden"></form:textarea>
					                        				<%-- <form:input path="TxtPermAdd" cssClass="form-control" onkeyup="textAreaAdjust(this)" style="overflow:hidden"/> --%>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Present&nbsp;Address&nbsp;<font color="red">&nbsp;*</font>:</label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<form:textarea path="TxtPA" cssClass="form-control" onkeyup="textAreaAdjust(this)" cssStyle="overflow:hidden"></form:textarea>
					                        				<%-- <form:input path="TxtPA" cssClass="form-control"/> --%>
					                        			</div>
					                        		</div>
					                        	</div>
					                        	<br>
					                        </div>					                    
					                   	</div>
					                    <br>
					                    <div class="panel panel-default">
					                        <div class="panel-heading">
					                            Work Details
					                        </div>
					                        <div class="panel-body">
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Employee ID<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<form:input path="TxtEmpId"  readonly="true" cssClass="form-control"/>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Joining Date<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<input type="text" id="dp2" value="${editEmployee.JDdt }" class="form-control" name="JDdt">
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Department<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6"> 
					                        				<select name="dept" class="form-control">
					                        					<option>${editEmployee.dept}</option>
																<option value=0>Select Department</option>
																<option>Production</option>
																<option>R&D</option>
															</select>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Designation<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<select name="Designation" class="form-control" onkeypress="return AllowCharacters(this);">
																<option>${editEmployee.designation}</option>
																<option value=0>Select Designation</option>
																<option>Developer</option>
																<option>Officer</option>
															</select>
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Work Type<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<select name="worktype" class="form-control">
																<option>${editEmployee.worktype}</option>
																<option value=0>Select Work Type</option>
																<option>Permanent</option>
																<option>Temparory</option>
															</select>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Payment Type<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<select name="PayType" class="form-control" >
																<option>${editEmployee.payType}</option>
																<option value="0">Select Payment</option>
																<option value="Bank">Bank</option>
																<option value="Cash">Cash</option>
															</select>
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Leave Date : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<input type="text" class="form-control" id="dp3" name="TxtLeavingdt">
					                        			</div>
					                        		</div>
					                        	</div>
					                        </div>
					                    </div>
					                        <br>
					                        <c:choose>
					                        	<c:when test="${bank == 'Bank'}">
					                        <div class="panel panel-default">
					                        <div class="panel-heading">
					                            Bank Details
					                        </div>
					                        <div class="panel-body">
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Bank Acc. No<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<form:input path="TxtBankNo" cssClass="form-control" onkeypress="return isNumberKey(this)"/>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Bank Name<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<form:input path="TxtBankName" cssClass="form-control"/>
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Bank Branch<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<form:input path="TxtBankBranch" cssClass="form-control"/>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>IFSC Code<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<form:input path="TxtIFSCCode" cssClass="form-control"/>
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        </div>
					                     </div>
					                        	</c:when>
					                        	<c:otherwise>
					                        		<div id="showBanksDetails" style="display: none;">
					                        <div class="panel panel-default">
					                        <div class="panel-heading">
					                            Bank Details
					                        </div>
					                        <div class="panel-body">
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Bank Acc. No<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<input name="TxtBankNo" class="form-control" onkeypress="return isNumberKey(this)"/>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Bank Name<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<input name="TxtBankName" class="form-control"/>
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Bank Branch<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<input name="TxtBankBranch" class="form-control"/>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>IFSC Code<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<input name="TxtIFSCCode" class="form-control"/>
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        </div>
					                     </div>
					                     </div>
					                        	</c:otherwise>
					                        </c:choose>
					                        
					                     <br>
					                      <div class="panel panel-default">
					                        <div class="panel-heading">
					                            Other Details
					                        </div>
					                        <div class="panel-body">
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Pan No : </label>
					                        			</div>
					                        			<div class="col-md-5">
					                        				<form:input path="TxtPAN" cssClass="form-control"/>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>PF Acc. No. : </label>
					                        			</div>
					                        			<div class="col-md-5">
					                        				<form:input path="TxtPFNo" cssClass="form-control"/>
					                        			</div>
					                        		</div>
					                        	</div>
					                        	<br>
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>ESI No : </label>
					                        			</div>
					                        			<div class="col-md-5">
					                        				<form:input path="TxtEsi" cssClass="form-control"/>
					                        			</div>
					                        		</div>					                        		
					                        	</div>
					                        </div>
					                      </div>
					                        <br>
										<!-- <div class="panel" style="background-color: #E9E9E9">
											<label>Work Details</label>
											<span
											style="font-family: 'Bookman Old Style', Courier, monospace; font-size: 20px;color: Red; font-style: normal; font-variant: normal; text-transform: none; color: #000000; text-decoration: blink">Work
											Details</span>
										</div> -->

										<%-- <div class="row">
											<div class="col-md-4">
												<div class="row">
													<div class="col-md-4">
														<label>Gender*</label>
													</div>
													<div class="col-md-8">
														<form:select path="Gender" cssClass="form-control">
														<OPTION>${editEmployee.gender }</OPTION>
															<option>Select Gender</option>
															<option>Male</option>
															<option>Female</option>
														</form:select>
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Blood&nbsp;Group*</label>
													</div>
													<div class="col-md-8">
															<form:select path="bloodgrp" cssClass="form-control">
															<OPTION>${editEmployee.bloodgrp }</OPTION>
															<option>Select Group</option>
															<option>A positive</option>
															<option>B positive</option>
														</form:select>
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Contact*</label>
													</div>
													<div class="col-md-8">
														<form:input path="TxtContact" cssClass="form-control"
															onkeypress="return isNumberKey(this)" maxlength="15" />
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Birth&nbsp;Date</label>
													</div>
													<div class="col-md-8">
														<input type="text" id="dp1"class="form-control" name="birthdt"  value="${editEmployee.birthdt}" >
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Present Address</label>
													</div>
													<div class="col-md-8">
														<form:input path="TxtPA" cssClass="form-control" />
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Permanent Address</label>
													</div>
													<div class="col-md-8">
														<form:input path="TxtPermAdd" cssClass="form-control" />
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-4">
													<div class="row">
														<div class="col-md-4">
															<label>Employee Id</label>
														</div>
														<div class="col-md-8">
															<form:input path="TxtEmpId" readonly="true" cssClass="form-control" />
														</div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-4">
															<label>Joinig date</label>
														</div>
														<div class="col-md-8">
															<input type="text" id="dp2"Class="form-control" name="JDdt"  value="${editEmployee.JDdt }">
														</div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-4">
															<label>Work&nbsp;type</label>
														</div>
														<div class="col-md-8">
															<form:select path="worktype" cssClass="form-control">
																<OPTION>${editEmployee.worktype }</OPTION>
																<option>Select Work Type</option>
																<option>permanent</option>
																<option>Temparory</option>
															</form:select>
														</div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-4">
															<label>Payment Type</label>
														</div>
														<div class="col-md-8">
																<form:select path="PayType" cssClass="form-control">
																<OPTION>${editEmployee.payType }</OPTION>
																<option>Select Payment</option>
																<option>Bank Transfer</option>
																<option>Cash</option>
															</form:select>
														</div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-4">
															<label>Department</label>
														</div>
														<div class="col-md-8">
															<form:select path="dept" cssClass="form-control">
																<OPTION>${editEmployee.dept}</OPTION>
																<option>Select Department</option>
																<option>Production</option>
																<option>RESERCH AND DEVELOPEMENT</option>
															</form:select>
														</div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-4">
															<label>Designation</label>
														</div>
														<div class="col-md-8">
															<form:select path="Designation" cssClass="form-control"
																onkeypress="return AllowCharacters(this);">
																<OPTION>${editEmployee.designation}</OPTION>
																<option>Select Designation</option>
																<option>Developer</option>
																<option>Officer</option>
															</form:select>
														</div>
													</div>
												</div>



												<div class="row">
													<div class="col-md-4">
														<div class="row">
															<div class="col-md-4">
																<label>PAN</label>
															</div>
															<div class="col-md-7">
																<form:input path="TxtPAN" cssClass="form-control"/>
															</div>
														</div>
														<br>
														<div class="row">
															<div class="col-md-4">
																<label>PF Acc. No</label>
															</div>
															<div class="col-md-7">
																<form:input path="TxtPFNo" cssClass="form-control" />
															</div>
														</div>
														<br>
														<div class="row">
															<div class="col-md-4">
																<label>Bank&nbsp;Acc No</label>
															</div>
															<div class="col-md-7">
																<form:input path="TxtBankNo" cssClass="form-control"
																	onkeypress="return isNumberKey(this)" />
															</div>
														</div>
														<br>
														<div class="row">
															<div class="col-md-4">
																<label>Bank Name</label>
															</div>
															<div class="col-md-7">
																<form:input path="TxtBankName" cssClass="form-control" />
															</div>
														</div>
														<br>
														<div class="row">
															<div class="col-md-4">
																<label>Bank&nbsp;Branch</label>
															</div>
															<div class="col-md-7">
																<form:input path="TxtBankBranch" cssClass="form-control" />
															</div>
														</div>
														<br>
														<div class="row">
															<div class="col-md-4">
																<label>IFSC Code</label>
															</div>
															<div class="col-md-7">
																<form:input path="TxtIFSCCode" cssClass="form-control" />
															</div>
														</div>
														<br>
														<div class="row">
															<div class="col-md-4">
																<label>Leaving&nbsp;Date</label>
															</div>
															<div class="col-md-7">
																<input type="text" id="dp3" class="form-control"
																	name="txtLeavingdt" value="${editEmployee.txtLeavingdt }">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div> --%>
										<div class="row">
											<div class="col-md-12">
												<div class="col-md-5"></div>

												<div class="col-md-1">
													<a href="#tab2" data-toggle="tab" id="btnNext" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Next">Next</a>
												</div>
												<!-- <div class="col-md-2">
													<input type="button" class="btn btn-primary" value="Cancel" data-toggle="tooltip" data-placement="top" title="Cancel">
												</div> -->
												<div>
													<div class="col-md-4"></div>
												</div>


											</div>
										</div>
									<!-- </div> -->
								<!-- </div> -->
								</div>
								<!-- BASIC AND WORK DETAILS END -->
								<!-- SALARY STRUCTURE START -->
								<div class="tab-pane fade" id="tab2">
									<!-- <div class="col-lg-12"> -->
										<!--     <div class="panel panel-default">  -->
										<div class="panel-body">
											<div class="row">
										<div class="col-md-6" style="float: right;">
											<div class="row">
													<div class="col-md-5">													
														<label>Effective Date<font color="red">&nbsp;*</font> : </label>
													</div>
													<div class="col-md-6">	
														<input type="text" name="effectiveDate" value="${editEmployee.effectiveDate }" readonly="readonly" class="form-control">
													</div>
											</div>
										</div>
										<div class="col-md-6" style="float: right;">
											<div class="row">
													<div class="col-md-5">													
														<label>Payroll Type<font color="red">&nbsp;*</font> : </label>
													</div>
													<div class="col-md-6">
														<c:if test="${editEmployee.payrollType == 'S'}">
														<input name="payrollType" id="payrollType" class="form-control" readonly="readonly" value="Salary">
														</c:if>
														<c:if test="${editEmployee.payrollType == 'W'}"> 
														<input name="payrollType" id="payrollType" class="form-control" readonly="readonly" value="Wages">
														</c:if>
													</div>
											</div>
										</div>										
									</div>
											<br>
											</div>
											<br>
											<div class="table-responsive">
												<table class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th>Pay Head</th>
															<th>Pay Head Type</th>
															<th>Amount*</th>

														</tr>
													</thead>
													<tbody><%int cnt=0; %>
													
													<c:forEach items="${editEmployee.salaryBeans}" var="salaryBeans">
													<tr>
															<td><input type="hidden" name="salaryBeans[<%=cnt%>].payheadname" value="${salaryBeans.payheadid}">${salaryBeans.payheadname}</td>
															<td><input type="hidden" name="salaryBeans[<%=cnt%>].payheadtype" value="${salaryBeans.payheadtype}">${salaryBeans.payheadtype}
															<input type="hidden" name="salaryBeans[<%=cnt%>].applicable_type" value="${salaryBeans.applicable_type}">
															</td>
															<td>	
																<input type="text" name="salaryBeans[<%=cnt%>].payamt" id="txtpayhead<%=cnt %>" class="form-control" value="${salaryBeans.payamt}" onblur="onTotal(this.id);" />
																<input type="hidden" name="prevamt" id="prevamt<%=cnt++%>" value="${salaryBeans.payamt}">  
															</td>
													</tr><%cnt++; %>	
														</c:forEach>
													<tr>
															<td><input type="hidden" id="payHedCnt" value="<%=cnt%>"></td>
															<td>Total</td>
															<td><input type="text" name="payheadtotal" id="payheadtotal" value="${editEmployee.totalSalary}" readonly="readonly" class="form-control"></td>
													</tr>
													</tbody>
												</table>
												<div class="row">												
													<input type="submit" name="btn" class="btn btn-primary" value="Update" data-toggle="tooltip" data-placement="top" title="Update">
													<input type="submit" name="btn" class="btn btn-primary" value="Cancel" data-toggle="tooltip" data-placement="top" title="Cancel">
												</div>
												<!-- <div class="row">
													<div class="col-md-12">
														<div class="row">
															<div class="col-md-5"></div>
															<div class="col-md-1">
																<input type="submit" value="Save" class="btn btn-primary">
																<input type="submit" name="btn" class="btn btn-primary"
																	value="Update">
															</div>
															<div class="col-md-1">
																<input type="button" value="Cancel"
																	class="btn btn-primary">
															</div>
															<div class="col-md-5"></div>


														</div>
													</div>
												</div> -->
											</div>
										<!-- </div> -->
									</div>
								
								</div>
								<!-- END DIPOSIT CASH -->
								<c:out value="${ TxtFname}"></c:out>
							</div>
						</div>
						</div>
						
							</form:form>
					</div>
				</div>
		
			<c:if test="${msg==1}">
			
				<h4 class="msg-succ">
				<script type="text/javascript">
				alert("Employee Details Updated Succesfully");
				</script>
				</h4>
				
			</c:if>
			<c:if test="${msg==0}">
				<h4 class="msg-error">
				<script type="text/javascript">
				alert("Employee Details Not Updated");
				</script>
				</h4>
			</c:if>
	
	<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>