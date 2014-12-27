<%@page language="java"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add New Customer</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>

<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"/>"  rel="stylesheet" type="text/css" />	
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
                $('#date').datepicker({
                    format: "yyyy/mm/dd"
                });                
            });
            $( document ).ready(function() {
          	  $('#date').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
          	    $(this).datepicker('hide');
          	});
          	});
    </script>
<script type="text/javascript">
 var i=1;
var j=1;
function addRow()
{ 
	     var tbl = document.getElementById("table1");
     	 var lastRow = tbl.rows.length;
      	 var row = tbl.insertRow(lastRow);
      	 var length=(tbl.rows.length)-2;
		 j=length+1;
		
          var firstCell = row.insertCell(0);
          var inputSrNo = document.createElement("input");
          inputSrNo.type = "text";
          inputSrNo.name =  "customerDetails["+length+"].txtSrNo";
          inputSrNo.id = "customerDetails["+length+"].txtSrNo";
          inputSrNo.style.textAlign ="right";
          inputSrNo.style.width="50px";
          inputSrNo.value=j;
          inputSrNo.className="form-control";          
          firstCell.appendChild(inputSrNo); 
          
          var secondCell = row.insertCell(1);
          var inputName = document.createElement("input");
          inputName.type = "text";          
          inputName.name = "customerDetails["+length+"].txtName";
          inputName.id ="customerDetails["+length+"].txtName";          
          inputName.className="form-control";
          secondCell.appendChild(inputName);
          
          var ThirdCell = row.insertCell(2);
          var inputCon = document.createElement("input");
          inputCon.type = "text";
          inputCon.name = "customerDetails["+length+"].txtCon";
          inputCon.id = "customerDetails["+length+"].txtCon";
          inputCon.className="form-control";
          ThirdCell.appendChild(inputCon);          
          
          var fourthCell = row.insertCell(3);
          var inputMail = document.createElement("input");
          inputMail.type = "text";
          inputMail.name =  "customerDetails["+length+"].txtMail"; 
          inputMail.id =  "customerDetails["+length+"].txtMail";
          inputMail.className="form-control";
          fourthCell.appendChild(inputMail);
          
          var fifthCell = row.insertCell(4);
          var inputDesig = document.createElement("input");
          inputDesig.type = "text";
          inputDesig.name ="customerDetails["+length+"].txtDes";
          inputDesig.id ="customerDetails["+length+"].txtDes";
          inputDesig.className="form-control";
          fifthCell.appendChild(inputDesig); 
          
	      var sixthCell = row.insertCell(5);
			var inputDelete = document.createElement("input");
			inputDelete.type = 'button';
			inputDelete.id = "btndel" + length;
			inputDelete.name = "btndel" + length;
			inputDelete.value="-";		
			inputDelete.className="btn btn-danger";			
			inputDelete.onclick=function(){delrow(this);};		
			 sixthCell.appendChild(inputDelete);
}
function delrow(obj)
{
  		var tbl = document.getElementById('table1');
	    var last = (tbl.rows.length)-1;		
	     var txtSrNo,Customer_Name,Mail,Con,Desg,btndel,next;		
	    if(last == 1)
		 {
			Customer_Name=document.getElementById("customerDetails["+length+"].txtName");
		 	Mail=document.getElementById("customerDetails["+length+"].txtMail");		 	
		 	Con=document.getElementById("customerDetails["+length+"].txtCon");
		 	Desg=document.getElementById("customerDetails["+length+"].txtDes");
		 	Customer_Name.value="";
		 	Mail.value="";
		 	Con.value="";
		 	Desg.value="";
		 }
	   else
	     {			
		   var current = window.event.srcElement;							 
		   while ( (current = current.parentElement)  && current.tagName !="TR");
           current.parentElement.removeChild(current);	
		   var counter = obj.id.slice(6);     
	    while(counter<last)
		 {
		next = counter;
	 	next++;	
	 	var txtSrNo = document.getElementById("customerDetails["+next+"].txtSrNo");	 	
	 	txtSrNo.id = "customerDetails["+counter+"].txtSrNo";
	 	txtSrNo.name = "customerDetails["+counter+"].txtSrNo";
	 	var sr=txtSrNo.value-1;	 	
	 	txtSrNo.value =sr;
	 	
	 	var name = document.getElementById("customerDetails["+next+"].txtName");
	 	name.id = "customerDetails["+counter+"].txtName";	 	
	 	name.name = "customerDetails["+counter+"].txtName";
	 
	 	 var contact = document.getElementById("customerDetails["+next+"].txtCon");	
		 contact.id = "customerDetails["+counter+"].txtCon";
		 contact.name = "customerDetails["+counter+"].txtCon";
		 
		 var mail = document.getElementById("customerDetails["+next+"].txtMail");	   
		 mail.id = "customerDetails["+counter+"].txtMail";
		 mail.name = "customerDetails["+counter+"].txtMail";
		 
	    var designation = document.getElementById("customerDetails["+next+"].txtDes");	 
	 	designation.id = "customerDetails["+counter+"].txtDes";
	 	designation.name = "customerDetails["+counter+"].txtDes";
	 	
	 	btndel = document.getElementById("btndel"+next);
	 	btndel.id = "btndel"+counter;
	 	btndel.name = "btndel"+counter;
	 		
	 	counter++;
	  }
   }   
}
function getId(id)
{
	alert("Id="+id);
	}

</script>

     
      <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
            
             
         });
    </script>
    
<script>
function validateForm()
{
    if(document.frmAddNewCustomer.txtCustName.value=="")
    {
      alert("Cutomer Name should not be blank");
      document.frmAddNewCustomer.txtCustName.focus();
      return false;
    }
     else if(document.frmAddNewCustomer.slctRegion.value=="")
    {
      alert("Please select Region...");
      document.frmAddNewCustomer.slctRegion.focus();
      return false;
    } 
    else if(document.frmAddNewCustomer.txtCustID.value=="")
    {
      alert("Cutomer Id Should not be Empty...");
      document.frmAddNewCustomer.txtCustID.focus();
      return false;
    }
   /*  else if(document.frmAddNewCustomer.slctType.value=="0")
    {
        alert("Please select Supplier Name");
        document.frmAddNewCustomer.slctType.focus();
        return false;
      }  */
    else if(document.frmAddNewCustomer.txtDate.value=="")
      {
          alert("Date field Should not be empty....");
          document.frmAddNewCustomer.txtDate.focus();
          return false;
        }
   
    else if(document.frmAddNewCustomer. billingAddress.value=="")
    {
        alert("Billing Address Should not be Empty....");
        document.frmAddNewCustomer. billingAddress.focus();
        return false;
      }
    
    else if(document.frmAddNewCustomer.billingcity.value=="")
    {
        alert("Billing City Should not be empty....");
        document.frmAddNewCustomer.billingcity.focus();
        return false;
      }

    else if(document.frmAddNewCustomer.billingstate.value=="")
    {
        alert("Billing State Should not be empty....");
        document.frmAddNewCustomer.billingstate.focus();
        return false;
      }
   
    else if(document.frmAddNewCustomer.billingcountry.value=="")
    {
        alert("Billing Country Should not be empty....");
        document.frmAddNewCustomer.billingcountry.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.billingppincode.value=="")
    {
        alert("Billing Pin code should not be empty....");
        document.frmAddNewCustomer.billingppincode.focus();
        return false;
      }
    else if(document.frmAddNewCustomer. shippingAddrLine.value=="")
    {
        alert("Shipping Address Should not be Empty....");
        document.frmAddNewCustomer. shippingAddrLine.focus();
        return false;
      }
    
    else if(document.frmAddNewCustomer.shippingcity.value=="")
    {
        alert("Shipping City Should not be empty....");
        document.frmAddNewCustomer.shippingcity.focus();
        return false;
      }

    else if(document.frmAddNewCustomer.shippingstate.value=="")
    {
        alert("Shipping State Should not be empty....");
        document.frmAddNewCustomer.shippingstate.focus();
        return false;
      }
   
    else if(document.frmAddNewCustomer.shippingcountry.value=="")
    {
        alert("Shipping Country Should not be empty....");
        document.frmAddNewCustomer.shippingcountry.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.shippingpincode.value=="")
    {
        alert("Shipping Pin code should not be empty....");
        document.frmAddNewCustomer.shippingpincode.focus();
        return false;
      }
   /*  else if(document.frmAddNewCustomer.txtSrNo.value=="")
    {
        alert("Sr.No Should not be empty....");
        document.frmAddNewCustomer.txtSrNo.focus();
        return false;
      }
     else if(document.frmAddNewCustomer.txtName.value=="")
    {
        alert("Customer Name Should not be empty....");
        document.frmAddNewCustomer.txtName1.focus();
        return false;
      }
  /*   else if(document.frmAddNewCustomer.txtCon.value=="")
    {
        alert("Contact number Should not be empty....");
        document.frmAddNewCustomer.txtCon1.focus();
        return false;
      } */
    else if(document.frmAddNewCustomer.txtMail.value=="")
    {
        alert("Email ID field Should not be empty....");
        document.frmAddNewCustomer.txtMail1.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtDes.value=="")
    {
        alert("Designanation field Should not be empty....");
        document.frmAddNewCustomer.txtDes1.focus();
        return false;
      } 
    else if(document.frmAddNewCustomer.txtMail1.value=="")
    {
        alert("Email ID field Should not be empty....");
        document.frmAddNewCustomer.txtMail.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtMob.value=="")
    {
        alert("Mobile number Should not be empty....");
        document.frmAddNewCustomer.txtMob.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtTel.value=="")
    {
        alert("Telephone Should not be empty....");
        document.frmAddNewCustomer.txtTel.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtFax.value=="")
    {
        alert("Fax field Should not be empty....");
        document.frmAddNewCustomer.txtFax.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtWeb.value=="")
    {
        alert("Website field Should not be empty....");
        document.frmAddNewCustomer.txtWeb.focus();
        return false;
      }
   /*  else if(document.frmAddNewCustomer.txtStatus.value=="")
    {
        alert("Status Should not be empty....");
        document.frmAddNewCustomer.txtWeb.focus();
        return false;
      } */
    else if(document.frmAddNewCustomer.txtAcNo.value=="")
    {
        alert("Account no Should not be empty....");
        document.frmAddNewCustomer.txtAcNo.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtBankNm.value=="")
    {
        alert("Bank Name Should not be empty....");
        document.frmAddNewCustomer.txtBankNm.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtIfscCode.value=="")
    {
        alert("IFSC Code Should not be empty....");
        document.frmAddNewCustomer.txtIfscCode.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtPanNo.value=="")
    {
        alert("Pan Number Should not be empty....");
        document.frmAddNewCustomer.txtPanNo.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtCstNo.value=="")
    {
        alert("CST Number Should not be empty....");
        document.frmAddNewCustomer.txtCstNo.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtVatNo.value=="")
    {
        alert("Vat Number Should not be empty....");
        document.frmAddNewCustomer.txtVatNo.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtLbtNo.value=="")
    {
        alert("LBT Number Should not be empty....");
        document.frmAddNewCustomer.txtLbtNo.focus();
        return false;
      } 
    else if(document.frmAddNewCustomer.txtExcNo.value=="")
    {
        alert("Excise number Should not be empty....");
        document.frmAddNewCustomer.txtExcNo.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtservicetax.value=="")
    {
        alert("Service Tax Should not be empty....");
        document.frmAddNewCustomer.txtservicetax.focus();
        return false;
      }
   
  }
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode;
   if (charCode != 36 && charCode > 31 && (charCode < 38 || charCode > 57))
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
if((keycode >= 65 && kecode <= 90) || (keycode >= 97 && keycode <= 122) || (keycode ==32))
{
  return true;
}
else
{
 return false;
}

return false;   
}

function validateEmail(sEmail) {
var reEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,3})$/;

if(!sEmail.match(reEmail)) {
 alert("Invalid email address");
 return false;
}

return true;

}

</script>

<script>
function asNullVal(){
	alert("0");
	/* if(document.getElementById("txtCustName").value=="")
		{
		alert("1");
		document.getElementById("txtCustName").value=null;
		alert("In Assign Null Value"+document.getElementById("txtCustName").value);
		}
	else */ if(document.getElementById("date").value=="")
		{
		document.getElementById("date").value=null;
		alert("In Assign Null Value="+document.getElementById("date").value);
		}
}
function goBack()
{
	window.history.back();
}
</script>
<script type="text/javascript">
var shipingAdd = "",shipingCity="",shipingState="",shipingCountry="",shipingpincode="";
function same(s)
{	
	var billingadd=document.frmAddNewCustomer.billingAddress.value;
	var billingcity=document.frmAddNewCustomer.billingcity.value;
	var billingstate=document.frmAddNewCustomer.billingstate.value;
	var billingcountry=document.frmAddNewCustomer.billingcountry.value;
	var billingpincode=document.frmAddNewCustomer.billingppincode.value;
	if(s.checked)
		{
		shipingAdd = document.frmAddNewCustomer.shippingAddrLine.value;
		shipingCity = document.frmAddNewCustomer.shippingcity.value;
		shipingState = document.frmAddNewCustomer.shippingstate.value;
		shipingCountry = document.frmAddNewCustomer.shippingcountry.value;
		shipingpincode = document.frmAddNewCustomer.shippingpincode.value;
		
		document.frmAddNewCustomer.shippingAddrLine.value=billingadd;
		document.frmAddNewCustomer.shippingcity.value=billingcity;
		document.frmAddNewCustomer.shippingstate.value=billingstate;
		document.frmAddNewCustomer.shippingcountry.value=billingcountry;
		document.frmAddNewCustomer.shippingpincode.value=billingpincode;
		}
	else
	{
	  document.frmAddNewCustomer.shippingAddrLine.value= shipingAdd;
	  document.frmAddNewCustomer.shippingcity.value= shipingCity;
	  document.frmAddNewCustomer.shippingstate.value= shipingState;
	  document.frmAddNewCustomer.shippingcountry.value= shipingCountry;
	  document.frmAddNewCustomer.shippingpincode.value= shipingpincode;
	}
}
</script>
</head>

<body>
<div id="wrapper">
<%@ include file="../header.jsp" %> 
	<div id="container">
		<%@ include file="innerHeader.jsp" %>
		
		<br>
		<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;<small>Add New Customer</small>
								</ul>
							</div>
							<div class="col-md-2">
							<a href="sales.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back" > Back</a>
							<!-- <button name="back" onclick="goBack()" class="btn btn-primary"><i class="fa fa-reply"></i> Back</button> -->
							</div>
						</div>
					</div>
</div>				
<form:form method="post" action="addCustomer.do" commandName="newCustomer" name="frmAddNewCustomer" onsubmit="return validateForm()">
		<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">      					
					<div class="row first column">
					<div class="col-md-3">
							<label>Customer Name:-</label>
							<input type="text" name="txtCustName" id="txtCustName" class="form-control" onkeypress="return AllowCharacters(this);"></input>
					</div>
					 <div class="col-md-3">
							<label>Region:-</label>
							<form:select path="slctRegion" cssClass="form-control" onchange= "custid()" >
									<option value="">Select Region</option>
									<option>PN-Pune</option>
									<option>MB-Mumbai</option>
									<option>AG-Aurangabad</option>
									<option>VB-Vidarbha</option>
									<option>SL-Solapur</option>
									<option>KH-Kolhapur</option>
									<option>AH-Ahmedabad</option>
									<option>KO-Kolkata</option>
									<option>KN-Kanpur</option>
									<option>DL-Delhi</option>
									<option>BL-Banglore</option>
									<option>IT-International</option>
								</form:select>
					 </div>
					 <div class="col-md-3">
							<label>Customer ID:-</label>
							<form:input path="txtCustID" readonly="true" cssClass="form-control"/>
					 </div>
					 <%
						DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
				     	Date date = new Date();	     
				     	String dt=dateFormat.format(date);
					%>
					 <div class="col-md-2">
					 			<label>Date:-</label>
								 <input type="text" id="date" value="<%=dt%>" name="txtDate" class="form-control"/>
					 </div>
					 </div>
					 <!-- <br>
					
					 <div class="row first column">
				
					 
					 </div> -->
					 <br>
					 <div class="col-md-12">
    						<!-- <div class="panel panel-default">
       						<div class="panel-body"> -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#billingtab" data-toggle="tab"><i class="icon-th-list "></i>Billing Address</a></li>
                               	<li><a href="#shippingtab" data-toggle="tab"><i class="icon-th-list "></i>Shipping Address</a></li>
                            </ul>
                            <div class="tab-content">
             <div class="tab-pane fade in active" id="billingtab">             	 
                      <div class="panel panel-default">  
                      <div class="panel-heading"> Billing Address </div>                       
                        <div class="panel-body">
                        <div class="col-md-12">
                           	<div class="row">
					  <div class="col-md-6">
								 	<label>Address&nbsp;:-</label>
									<textarea name="billingAddress" cols="25" rows="3" class="form-control"></textarea>
					 </div>
					 </div> <br>
					 <div class="row">
							  <div class="col-md-3">
									 <label>City&nbsp;:-</label>
									  <form:input path="billingcity" cssClass="form-control"/>
					   		   </div>
					 	<div class="col-md-3">
					 				<label>State:-</label>
									<form:input path="billingstate" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>
					
					 	<div class="col-md-3">
					 				<label>Country:-</label>
									<form:input path="billingcountry" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>
					    <div class="col-md-3">
					 				<label>Pin Code:-</label>
									<form:input path="billingppincode" onkeypress="return isNumberKey(this)"  cssClass="form-control"/>
					    </div>
					 </div>
					 
                        </div>
                    </div>
                </div>
             </div>
             <div class="tab-pane fade" id="shippingtab">             	 
                      <div class="panel panel-default">      
                       <div class="panel-heading"> Shipping Address </div>                               
                        <div class="panel-body">
                        <div class="col-md-12">
                        <input type="checkbox" id="chkYes" name="chkYes" onclick="same(this)" style="vertical-align: top">&nbsp;Same as Billing Address&nbsp;:
                           	<div class="row">
					  <div class="col-md-6">
								 	<label>Address&nbsp;:-</label>
									<textarea name="shippingAddrLine" cols="25" rows="3" class="form-control"></textarea>
					 </div>
					  </div> <br>
					 <div class="row">
							  <div class="col-md-3">
									 <label>City&nbsp;:-</label>
									  <form:input path="shippingcity" cssClass="form-control"/>
					   		   </div>
					 	<div class="col-md-3">
					 				<label>State:-</label>
									<form:input path="shippingstate" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>
					 
					 	<div class="col-md-3">
					 				<label>Country:-</label>
									<form:input path="shippingcountry" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>
					    <div class="col-md-3">
					 				<label>Pin Code:-</label>
									<form:input path="shippingpincode" onkeypress="return isNumberKey(this)"  cssClass="form-control"/>
					    </div>
					 </div>
                        </div>
                    </div>
                </div>
             </div>   
             </div>
                          <!--   </div>
                            </div> -->
                      </div>
					<br> 
					<div class="col-md-12" style="height: 20px;"> </div>
					<br>
					    <div class="col-md-12">
    						<!-- <div class="panel panel-default">
       						<div class="panel-body"> -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#persontab" data-toggle="tab"><i class="icon-th-list "></i>Contact Person</a></li>
                               	<li><a href="#detailtab" data-toggle="tab"><i class="icon-th-list "></i>Contact Details</a></li>
                               	<li><a href="#banktab" data-toggle="tab"><i class="icon-th-list "></i>Bank Details</a></li>
                            </ul>
     	<div class="tab-content">
             <div class="tab-pane fade in active" id="persontab">             	 
                      <div class="panel panel-default">   
                      <div class="panel-heading"> </div>                    
                        <div class="panel-body">
                        <div class="col-md-12">
                            <div class="table-responsive">
                    		
         					<table id="table1" class="table table-striped">
         					     					
        					<tr>
					        		<td align="center" class="fnt" class="short">Sr No</td> 
					        		<td align="center" class="fnt" >Name</td>					        		
					        		<td align="center" class="fnt">Contact No</td>
					        		<td align="center" class="fnt">E-Mail</td>
					        		<td align="center" class="fnt">Designation</td>	<td></td>				        		
        					</tr>
        						<tr>
         						 <td><input type="text" name="customerDetails[0].txtSrNo" value="1" class="form-control" id="customerDetails[0].txtSrNo" style="width: 50px;text-align: right;" /></td> 
            					<td><input type="text" name="customerDetails[0].txtName" id="customerDetails[0].txtName" class="form-control" onkeypress="return AllowCharacters(this);"/></td>
            					<td><input type="text" name="customerDetails[0].txtCon" id="customerDetails[0].txtCon" class="form-control" onkeypress="return isNumberKey(this)" maxlength="15" /></td>
            					<td><input type="text" name="customerDetails[0].txtMail" id="customerDetails[0].txtMail" class="form-control" onblur="validateEmail(this.value);" /></td> 
            					<td><input type="text"  name="customerDetails[0].txtDes" id="customerDetails[0].txtDes" class="form-control" onkeypress="return AllowCharacters(this);" /></td>
            					<td><input type="button" class="btn btn-danger" name="button" value="-" onclick="delrow(this);"></td>
    					    	</tr>           					 
           					
           					 </table> 
         					<div> <input type="button"  name="btnAdd" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRow();"> </div>
          					
                            </div>
                        </div>
                    </div>
                </div>
             </div>          
            
              <div class="tab-pane fade" id="detailtab">             	                     
                      <div class="panel panel-default">  
                      <div class="panel-heading"> </div>                     
                        <div class="panel-body">
                        <div class="col-md-12">
                           <div class="row first-column">                            
                            <div class="col-md-12">								
								<div class="col-md-3">
									<label>E-Mail:-</label>
									<form:input path="txtMail1" onkeypress="return AllowCharacters(this);" onblur="validateEmail(this.value);" cssClass="form-control"/>
								</div>
								<div class="col-md-3">
									<label>Mobile No:-</label>
									<form:input path="txtMob" onkeypress="return isNumberKey(this)" maxlength="15" cssClass="form-control" />
								</div>
								<div class="col-md-3">
									<label>Telephone:-</label>
									<form:input path="txtTel" cssClass="form-control" onkeypress="return isNumberKey(this)" maxlength="20"/>
								</div>
							</div><br><br><br>
							
							<div class="col-md-12">							
							  		<div class="col-md-3">
										<label>Fax:-</label>
										<form:input path="txtFax" cssClass="form-control" onkeypress="return isNumberKey(this)" maxlength="20"/>
									</div>
									<div class="col-md-3">
										<label>Website</label>
										<form:input path="txtWeb" onkeypress="return AllowCharacters(this);" cssClass="form-control" />
									</div>	
						  </div>
						 
						  </div>
						 
					    </div>							   					
          			  </div>
                    </div>
                   </div>
           <div class="tab-pane fade" id="banktab">             	 
                    
                    <div class="panel panel-default">     
                    <div class="panel-heading"> </div>                  
                        <div class="panel-body">
                        <div class="col-md-12">
                        <div class="row">
                            	<div class="col-md-3">                                		
									<label>Account No:-</label>
									<input type="text" name="txtAcNo" class="form-control" value="0" onkeypress="return isNumberKey(this)"/>
								</div>	
								<div class="col-md-3">
									<label>Bank Name:-</label>
									<form:input path="txtBankNm" cssClass="form-control" onkeypress="return AllowCharacters(this);" />
								</div>
								<div class="col-md-3">
									<label>IFSC Code:-</label>
									<form:input path="txtIfscCode" cssClass="form-control"/>
								</div>
						</div>
						<div class="row">
								<div class="col-md-3">	
									<label>PAN No:-</label>
									<form:input path="txtPanNo" cssClass="form-control"/>									
								</div>
								<div class="col-md-3">
									<label>CST No:-</label>
									<form:input path="txtCstNo" cssClass="form-control"/>
								</div>
								<div class="col-md-3">
									<label>VAT No:-</label>
									<form:input path="txtVatNo" cssClass="form-control"/>
								</div>
						</div>
						<div class="row">
								<div class="col-md-3">
									<label>LBT No:-</label>
									<form:input path="txtLbtNo" cssClass="form-control" />
								</div>
								<div class="col-md-3">
									<label>Excise No:-</label>
									<form:input path="txtExcNo" cssClass="form-control" />								
                            	</div>
                            	<div class="col-md-3">
									<label>Service Tax :-</label>
									<form:input path="txtservicetax" cssClass="form-control" />
								</div>
                        </div>
                        <!-- <div class="row"> -->
								
								<%-- <div class="col-md-3">
									<label>Currency :-</label>
									<form:input path="txtcurrency" cssClass="form-control" />								
                            	</div>
                        </div>
                        <div class="row">
								<div class="col-md-3">
									<label>Credit Limit:-</label>
									<input type="text" name="txtcurrencyLimit" class="form-control" value="0.0" />								
                            	</div>
                        </div> --%>
                           </div> 
                        </div>
                    </div>
                </div>
 		<!-- </div></div> -->
</div>
</div>
</div>

		<div>
								<button type="submit" class="btn btn-primary" name="btn" value="Save" data-toggle="tooltip" data-placement="top" title="Save">Save</button>
								<button type="button" onclick="goBack()" class="btn btn-primary" name="btn" data-toggle="tooltip" data-placement="top" title="Cancel">Cancel</button>
							</div></div>
<c:if test="${message==1}">                     
<h4 class="msg-succ">
Customer Added Succesfully
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
Customer Not Added Succesfully.
</h4> 
</c:if>
 
 </div>

</form:form>
</div>
</div>
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>
</body>
</html>