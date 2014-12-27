<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee</title>		
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />" rel="stylesheet" type="text/css"/>	
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
    /* else if(document.frmAddEmployee.txtmname.value=="")
    	{
    		alert("Middle Name Should not be empty");
   			 document.frmAddEmployee.txtmname.focus();
   	 		return false;
    	} */
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
       else if(document.frmAddEmployee.effectiveDate.value=="")
  	 {
  	 	alert(" Effective Date field Should not be empty....");
		 	document.frmAddEmployee.effectiveDate.focus();
			return false;
  	 }
       else if(document.frmAddEmployee.payrollType.value=="0")
  	 {
  	 	alert("Please Select Salary Type....");
		 	document.frmAddEmployee.payrollType.focus();
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
            // When the document is ready
            $(document).ready(function () {
            	
            	$(".tab1").addClass('active');
            	
            	$('#btnNext').click(function () 
            	{
            		$(".tab1").removeClass("active");
           			$(".tab2").addClass('active');           			
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
                
                $('#dp5').datepicker({
                    format: "yyyy/mm/dd"
                   	//$('#dp5').datePicker().val(new Date().asString()).trigger('change');
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
            $( document ).ready(function() {
            	  $('#dp5').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
    </script>
<script>
	$(document).ready(function() {
		 var nowTemp = new Date();
         var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

         $('#dpd1').datepicker({
           onRender: function(date) {
             return date.valueOf() < now.valueOf() ? 'disabled' : '';
           }
         }).on('changeDate', function(ev) {
        	 $(this).datepicker('hide');           
         });         
	});
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

<script type="text/javascript">
function payheads()
{
	document.getElementById("showPayheads").innerHTML="";
	var type = document.getElementById("payrollType").value;
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
		  document.getElementById("showPayheads").appendChild(innerDiv);
	    }
	  }
	xmlhttp.open("GET","retrivePayheads.do?type="+type,true);
	xmlhttp.send();	
}
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
    
    $("#showdept").click(function(){
        $("#showDepartment").show(800);
      });
    $("#saveDept").click(function(){
        $("#showDepartment").hide();
      });
      $("#deptCancel").click(function(){
          $("#showDepartment").hide(800);
        });
      $("#desig").click(function(){
        $("#showDesignation").show(800);
      });
      $("#saveDesig").click(function(){
          $("#showDesignation").hide();
        });
      $("#desigCancel").click(function(){
          $("#showDesignation").hide(800);
        });
});
</script>
 <script type="text/javascript">
var prevAdd = "";
function same(s)
{	
	var add=document.frmAddEmployee.TxtPA.value;
	if(s.checked)
		{
		  prevAdd = document.frmAddEmployee.TxtPermAdd.value;	
		  document.frmAddEmployee.TxtPermAdd.value=add;
		}
	else
	{
	  document.frmAddEmployee.TxtPermAdd.value= prevAdd;
	}
}
</script>
<script type="text/javascript">
var checkflag = "false";
function check(field) {
  if (checkflag == "false") {
    for (i = 0; i < field.length; i++) {
      field[i].checked = true;
    }
    checkflag = "true";
    return "Uncheck All";
  } else {
    for (i = 0; i < field.length; i++) {
      field[i].checked = false;
    }
    checkflag = "false";
    return "Check All";
  }
}
</script>
<script type="text/javascript">
function addDepartment()
{
	var deptName = document.getElementById("txtDeptName").value;
	var deptDesc = document.getElementById("txtDeptDesc").value;
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
	    document.getElementById("txtDeptName").value="";
	    document.getElementById("txtDeptDesc").value="";
	    document.getElementById("showDept").innerHTML=xmlhttp.responseText;
	    }
	  }
	xmlhttp.open("GET","addDepartment.do?deptName="+deptName+"&deptDesc="+deptDesc+"",true);
	xmlhttp.send();
}

function addDesignation()
{
	var desigName = document.getElementById("txtDesigName").value;
	var desigDesc = document.getElementById("txtDesigDesc").value;
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
		  document.getElementById("txtDesigName").value="";
		  document.getElementById("txtDesigDesc").value="";
		  document.getElementById("showDesigtn").innerHTML=xmlhttp.responseText;
	    }
	  }
	xmlhttp.open("GET","addDesignation.do?desigName="+desigName+"&desigDesc="+desigDesc+"",true);
	xmlhttp.send();
}
function showUserName() 
{
	var userName = document.getElementById("TxtUserName").value;
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
		  document.getElementById("showUN").innerHTML=xmlhttp.responseText;
	    }
	  }
	xmlhttp.open("GET","retriveUserName.do?userName="+userName+"",true);
	xmlhttp.send();
}
</script>

<script>
function textAreaAdjust(o) {
    o.style.height = "1px";
    o.style.height = (25+o.scrollHeight)+"px";
}
</script>

</head>
<body style="overflow-x: hidden;">
	<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="page-wrapper">
			<%@include file="innerHeader.jsp"%>
			<%-- <form:form action="addEmployee.do" commandName="newEmployee" name="frmAddEmployee" onsubmit="return validateForm()"> --%>
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
							<!-- <button name="back" class="btn btn-primary btn-large" onclick="backs();"><i class="fa fa-reply"></i> Back</button> -->
							<a href="users.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Back"> Back</a>	
        					 </div>
							
						</div>
					</div>
				</div>
				<br>
					<c:if test="${count==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">User Name Already Exits...!</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					  {
					  });
					</script>
					</c:if>
				<br>
				<form:form action="addEmployee.do" commandName="newEmployee" name="frmAddEmployee" onsubmit="return validateForm()">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<ul class="nav nav-tabs" id="mytab">
								<li class="tab1">
									<a href="#tab1" data-toggle="tab"><i class="icon-th-list "></i> Basic And Work Details</a>
								</li>
								<li class="tab2">
									<a href="#tab2" data-toggle="tab"><i class="fa fa-money"></i> Salary Structure</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="tab1">
									<!-- <div class="col-md-12"> -->

										<br>
										<div class="row">										
											<div class="col-md-1"> 
												<label>Name<font color="red">&nbsp;*</font></label>
											</div>
											<div class="col-md-2">
												<div class="btn-group">
													<form:select path="NameSal" cssClass="form-control">
														<option value=0>Select Type</option>
														<option>Mr.</option>
														<option>Mrs.</option>
														<option>Ms.</option>
														<option>Mis.</option>
													</form:select>
												</div>
											</div>
											<div class="col-md-3">
												<form:input path="txtfname" cssClass="form-control" placeholder="First name"/>
											</div>
											<div class="col-md-3">
												<form:input path="txtmname" cssClass="form-control" placeholder="Middle name"/>
											</div>
											<div class="col-md-3">
												<form:input path="txtlname" cssClass="form-control" placeholder="Last name"/>
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
												<form:input path="TxtUserName" id="TxtUserName" onblur="showUserName();" cssClass="form-control" />
													<div id="showUN">
													<%-- <c:if test="${UN==0}">
														<div id="retriveUserName"> <font color="red">Please...Enter Different UserName..!</font> </div>
													</c:if>	
													<c:if test="${UN==1}">
														<div id="retriveUserName"> <font color="green">UserName is Valid..!</font> </div>
													</c:if> --%>	
													</div>
											</div>
										</div>									
											<%-- <div class="row">
													<div class="col-md-3">
														<label>Email : </label>
													</div>
													<div class="col-md-6">
														<form:input path="TxtEmail" cssClass="form-control" onblur="validateEmail(this.value);"/>
													</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="row">
													<div class="col-md-4">
														<label>User Name : </label>
													</div>
													<div class="col-md-6">
														<form:input path="TxtUserName" cssClass="form-control" />
													</div>
												</div>--%>
										</div> 
									</div><br>
										<div class="row">
											<div class="col-md-12">
											<div class="row">
													<div class="col-md-4">
														<label>User Role : </label>
													</div>
													<div class="col-md-12 radio">
														<input type="checkbox" name="Check_All" value="All" onClick="this.value=check(this.form.userrole)"/>
														<label> All</label><br>
														<input type="checkbox" name="userrole" onblur="ValidateRadio(this.form);" value="Sales"/>
														<label> Sales</label>
														<input type="checkbox" name="userrole"  value="Purchase"/>
														<label>Purchase</label>
														<input type="checkbox" name="userrole"  value="Inventory"/>
														<label> Inventory</label>
														<input type="checkbox" name="userrole"  value="Payroll"/>
														<label>Payroll</label>
														<input type="checkbox" name="userrole" value="Banking" />
														<label> Banking</label>
														<input type="checkbox" name="userrole" value="Accounting" />
														<label> Accounting</label>
														<input type="checkbox" name="userrole" value="Reports" />
														<label> Reports</label>
														
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
					                        				<input name="TxtContact" class="form-control" onkeypress="return isNumberKey(this)" maxlength="15"/>
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Birth Date<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<input type="text" id="dp1" class="form-control" name="birthdt"  >
					                        			</div>
					                        			
					                        		</div>
					                        	</div><br>
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-10"> 	
					                        				<div style="height: 20px;"></div>
					                        				<label>Present&nbsp;Address&nbsp;<font color="red">&nbsp;*</font>:</label>
					                        				<form:textarea path="TxtPA" cssClass="form-control" onkeyup="textAreaAdjust(this)" style="overflow:hidden"></form:textarea>
					                        			</div>
					                        			<%-- <div class="col-md-6">
					                        				<form:input path="TxtPA" cssClass="form-control"/>
					                        			</div> --%>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-10">
					                        			<input type="checkbox" id="chkYes" name="chkYes" onclick="same(this)" style="vertical-align: top">Same as Present&nbsp;:
					                        				<label>Permanent&nbsp;Address&nbsp;<font color="red">&nbsp;*</font>:</label>
					                        				<form:textarea path="TxtPermAdd" cssClass="form-control" onkeyup="textAreaAdjust(this)" style="overflow:hidden"></form:textarea>
					                        			</div>
					                        			<%-- <div class="col-md-6">
					                        				<form:input path="TxtPermAdd" cssClass="form-control"/>
					                        			</div> --%>
					                        		</div>
					                        	</div>
					                        	<br>
					                        </div>					                    
					                   	</div>
					                    <br>
					                    <div id="showDepartment" style="display: none;">
					                        <div class="panel panel-default">
					                        <div class="panel-heading">
					                            Department
					                        </div>
					                        <div class="panel-body">
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Name : <font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<input name="txtDeptName" id="txtDeptName" Class="form-control" />
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Description : <font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<textarea name="txtDeptDesc" id="txtDeptDesc" Class="form-control"></textarea>
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        	<div class="col-md-12">
					                        		<input type="button" value="Save" onclick="addDepartment();" id="saveDept" class="btn btn-primary">
					                        		<input type="button" value="Cancel" id="deptCancel" class="btn btn-primary">
					                        	</div>
					                        </div>
					                     </div>
					                     </div>
					                    <div id="showDesignation" style="display: none;">
					                        <div class="panel panel-default">
					                        <div class="panel-heading">
					                            Designation
					                        </div>
					                        <div class="panel-body">
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Tital : <font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<input name="txtDesigName" id="txtDesigName" Class="form-control" />
					                        			</div>
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Description : <font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<textarea name="txtDesigDesc" id="txtDesigDesc" Class="form-control"></textarea>
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        	<div class="col-md-12">
					                        		<input type="button" value="Save" id="saveDesig" onclick="addDesignation()" class="btn btn-primary">
					                        		<input type="button" value="Cancel" id="desigCancel" class="btn btn-primary">
					                        	</div>
					                        </div>
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
					                        				<input type="text" id="dp2" class="form-control" name="JDdt"  >
					                        			</div>
					                        		</div>
					                        	</div><br>
					                        	<div class="row">
					                        		
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Department<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div id="showDept">
					                        			<div class="col-md-6">					                        				
					                        					<select name="dept" class="form-control">
					                        					<option value="0">---Select---</option>
					                        					<c:forEach items="${deptList}" var="deptList">
					                        						<option value="${deptList.txtDeptId}">${deptList.txtDeptName}</option>
					                        					</c:forEach>
																</select>					                        				
					                        			</div>
					                        			</div>
					                        			<input type="button"  value="+" id="showdept" class="btn btn-primary btn-xs">
					                        		</div>
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Designation<font color="red">&nbsp;*</font> : </label>
					                        			</div>	
					                        			<div id="showDesigtn">				                        			
					                        			<div class="col-md-6">					                        				
					                        					<select name="Designation" class="form-control">
					                        					<option value="0">---Select---</option>
					                        					<c:forEach items="${desigList}" var="desigList">
					                        						<option value="${desigList.txtDesigId}">${desigList.txtDesigName}</option>
					                        					</c:forEach>
																</select>					                        				
					                        			</div>
					                        			</div>
					                        			<input type="button" value="+" id="desig" class="btn btn-primary btn-xs">
					                        		</div>
					                        	</div><br>
					                        	<div class="row">
					                        		<div class="col-md-6">
					                        			<div class="col-md-5">
					                        				<label>Work Type<font color="red">&nbsp;*</font> : </label>
					                        			</div>
					                        			<div class="col-md-6">
					                        				<select name="worktype" class="form-control">
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
					                        				<input type="text" class="form-control" id="dp3" name="TxtLeavingdt"  >
					                        			</div>
					                        		</div>
					                        	</div>
					                        </div>
					                    </div>
					                        <br>
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
					                     </div>
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
										<!-- <div class="panel" style="background-color: #E9E9E9" >
											<label>Work Details</label>
										</div> -->

										<%-- <div class="row">
											<div class="col-md-4">
												<div class="row">
													<div class="col-md-4">
														<label>Gender<font color="red">&nbsp;*</font></label>
													</div>
													<div class="col-md-8">
														<form:select path="Gender" cssClass="form-control">
															<option value=0>Select Gender</option>
															<option>Male</option>
															<option>Female</option>
														</form:select>
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Blood&nbsp;Group<font color="red">&nbsp;*</font></label>
													</div>
													<div class="col-md-8">
															<form:select path="bloodgrp" cssClass="form-control">
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
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Contact<font color="red">&nbsp;*</font></label>
													</div>
													<div class="col-md-8">
														<form:input path="TxtContact" cssClass="form-control"
															onkeypress="return isNumberKey(this)" maxlength="15"/>
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Birth&nbsp;Date<font color="red">&nbsp;*</font></label>
													</div>
													<div class="col-md-8">
														<input type="text" id="dp1" class="form-control" name="birthdt">
														
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Present Address<font color="red">&nbsp;*</font></label>
													</div>
													<div class="col-md-8">
														<form:input path="TxtPA" cssClass="form-control"/>
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Permanent Address<font color="red">&nbsp;*</font></label>
													</div>
													<div class="col-md-8">
														<form:input path="TxtPermAdd" cssClass="form-control"/>
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>ESI No </label>
													</div>
													<div class="col-md-8">
														<form:input path="TxtEsi" cssClass="form-control"/>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-4">
													<div class="row">
														<div class="col-md-4">
															<label>Employee Id<font color="red">&nbsp;*</font></label>
														</div>
														<div class="col-md-8">
															<form:input path="TxtEmpId"  readonly="true" cssClass="form-control"/>
														</div>
													</div>
													<br>
													
													<div class="row">
														<div class="col-md-4">
															<label>Joinig date<font color="red">&nbsp;*</font></label>
														</div>
														<div class="col-md-8">
															<input type="text" id="dp2" class="form-control" name="JDdt">
														</div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-4">
															<label>Work&nbsp;type<font color="red">&nbsp;*</font></label>
														</div>
														<div class="col-md-8">
															<form:select path="worktype" cssClass="form-control">
																<option value=0>Select Work Type</option>
																<option>permanent</option>
																<option>Temparory</option>
															</form:select>
														</div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-4">
															<label>Payment Type<font color="red">&nbsp;*</font></label>
														</div>
														<div class="col-md-8">
																<form:select path="PayType" cssClass="form-control">
																<option value=0>Select Payment</option>
																<option>Bank Transfer</option>
																<option>Cash</option>
															</form:select>
														</div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-4">
															<label>Department<font color="red">&nbsp;*</font></label>
														</div>
														<div class="col-md-8">
															<form:select path="dept" cssClass="form-control">
																<option value=0>Select Department</option>
																<option>Production</option>
																<option>R&D</option>
															</form:select>
														</div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-4">
															<label>Designation<font color="red">&nbsp;*</font></label>
														</div>
														<div class="col-md-8">
															<form:select path="Designation" cssClass="form-control"
																onkeypress="return AllowCharacters(this);">
																<option value=0>Select Designation</option>
																<option>Developer</option>
																<option>Officer</option>
															</form:select>
														</div>
													</div>
													<br>
													<div class="row">
															<div class="col-md-4">
																<label>Leaving&nbsp;Date</label>
															</div>
															<div class="col-md-7">
																<input type="text" class="form-control" id="dp3"
																	name="TxtLeavingdt">
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
																<form:input path="TxtPFNo" cssClass="form-control"/>
															</div>
														</div>
														<br>
														<div class="row">
															<div class="col-md-4">
																<label>Bank&nbsp;Acc No<font color="red">&nbsp;*</font></label>
															</div>
															<div class="col-md-7">
																<form:input path="TxtBankNo" cssClass="form-control"
																	onkeypress="return isNumberKey(this)"/>
															</div>
														</div>
														<br>
														<div class="row">
															<div class="col-md-4">
																<label>Bank Name<font color="red">&nbsp;*</font></label>
															</div>
															<div class="col-md-7">
																<form:input path="TxtBankName" cssClass="form-control"/>
															</div>
														</div>
														<br>
														<div class="row">
															<div class="col-md-4">
																<label>Bank&nbsp;Branch<font color="red">&nbsp;*</font></label>
															</div>
															<div class="col-md-7">
																<form:input path="TxtBankBranch" cssClass="form-control"/>
															</div>
														</div>
														<br>
														<div class="row">
															<div class="col-md-4">
																<label>IFSC Code<font color="red">&nbsp;*</font></label>
															</div>
															<div class="col-md-7">
																<form:input path="TxtIFSCCode" cssClass="form-control"/>
															</div>
														</div>
														<br>
														
													</div>
												</div>
											</div>
										</div> --%>
										<br>
										<div class="row">
											<div class="col-md-12">
												<div class="col-md-5"></div>

												<div class="col-md-1">
													<a href="#tab2" data-toggle="tab" id="btnNext" onclick="isDateCompare();" class="btn btn-primary">Next</a>
												</div>
												<!-- <div class="col-md-2">
													<input type="button" class="btn btn-primary" value="Cancel">
												</div> -->
												<div>
													<div class="col-md-4"></div>
												</div>	
												</div>
										</div>
									<!-- </div> -->
								</div>
								<!-- BASIC AND WORK DETAILS END -->
								<!-- SALARY STRUCTURE START -->
								<div class="tab-pane fade" id="tab2">
									<!-- <div class="col-md-12"> -->
										<!--     <div class="panel panel-default">  -->
										<div class="panel-body">
											<div class="row">
												<div class="col-md-6"></div>
												<div class="col-md-6">
													<!-- <div class="row">
														<div class="col-md-6">
															<label>Effective From Date*</label>
														</div>
														<div class="col-md-6">
															<input type="date" Class="form-control" name="TxtEffdt">
														</div>-->
													</div> 
											</div>	
											<br>
									<div class="row">
										<div class="col-md-6" style="float: right;">
											<div class="row">
													<div class="col-md-5">													
														<label>Effective Date<font color="red">&nbsp;*</font> : </label>
													</div>
													<div class="col-md-6">	
														<input type="text" name="effectiveDate" id="dpd1" class="form-control"  >
													</div>
											</div>
										</div>
										<div class="col-md-6" style="float: right;">
											<div class="row">
													<div class="col-md-5">													
														<label>Payroll Type<font color="red">&nbsp;*</font> : </label>
													</div>
													<div class="col-md-6">
														<select name="payrollType" id="payrollType" class="form-control" onchange="payheads();">
															<option value="0">---Select---</option>
															<option value="S">Salary</option>
															<option value="W">Wages</option>
														</select>
													</div>
											</div>
										</div>										
									</div>
											<br>
											<div id="showPayheads">
											
											</div>
											<%-- <div class="table-responsive">
												<table class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th>Pay Head</th>
															<th>Pay Head Type</th>
															<th>Amount*</th>
														</tr>
													</thead>
													<tbody><%int cnt=0; %>
													<c:forEach items="${payheadList}" var="payheadList">
													<tr>
															<td><input type="hidden" name="salaryBeans[<%=cnt%>].payheadname" value="${payheadList.txtPayId}">${payheadList.txtPayheadName}</td>
															<td><input type="hidden" name="salaryBeans[<%=cnt%>].payheadtype" value="${payheadList.txtPayheadType}">${payheadList.txtPayheadType}</td>
															<td><input type="text" name="salaryBeans[<%=cnt%>].payamt" id="txtpayhead<%=cnt %>" class="form-control" value="0.0" onblur="onTotal(this.id);" /></td>
															<td><input type="hidden" name="prevpayamt<%=cnt%>" id="prevpayamt<%=cnt%>" class="form-control" value="0.0" /></td>
													</tr><%cnt++; %>
														</c:forEach>	
													<tr>
															<td><input type="hidden" id="payHedCnt" value="<%=cnt%>"></td>
															<td>Total</td>
															<td><input type="text" name="payheadtotal" id="payheadtotal" value="0.0" readonly="readonly" class="form-control"></td>
													</tr>
													</tbody>
												</table>
												<div class="row">
													<div class="col-md-12">
														<div class="row">
															<div class="col-md-5"></div>
															<div class="col-md-1">
																<!-- <input type="submit" value="Save" class="btn btn-primary"> -->
																<input type="submit" name="btn" class="btn btn-primary" value="Save">
															</div>
															<div class="col-md-1">
																<input type="button" value="Cancel"
																	class="btn btn-primary">
															</div>
															<div class="col-md-5"></div>
														</div>
													</div>
												</div>
											</div> --%>
										</div>
									<!-- </div> -->
									<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-md-1">
					<!-- <input type="submit" value="Save" class="btn btn-primary"> -->
					<input type="submit" name="btn" class="btn btn-primary"
						value="Save" data-toggle="tooltip" data-placement="top" title="Save">
				</div>
				<div class="col-md-1">
					<a href="users.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Cancel"> Cancel</a>
				</div>
				<div class="col-md-5"></div>
			</div>
		</div>
	</div>
								</div>
								<!-- END DIPOSIT CASH -->
								<c:out value="${ TxtFname}"></c:out>
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