<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  import="java.text.SimpleDateFormat" import=" java.lang.*" pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.01 Transitional//EN" "http://www.w3.org/TR/html3/loose.dtd">
<html>
<head>

<script type="text/javascript" src="../JS/jquery.min.js"></script>
<script language="javascript" type="text/javascript">

 var i=1;
var j=1;
<%//rec=0;%>
function addRow()

{ 	
		  //var srNo=j;		
          var tbl = document.getElementById("table1");
          var lastRow = tbl.rows.length;        
          var row = tbl.insertRow(lastRow);
           
			j++;
          
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
         // inputName.value=name;
         inputName.className="form-control";
          secondCell.appendChild(inputName);

           
         
          var ThirdCell = row.insertCell(2);
          var inputCon = document.createElement("input");
          inputCon.type = "text";
          inputCon.name = "txtCon" + i;
          inputCon.id = "txtCon" + i;
          inputCon.className="form-control";
          ThirdCell.appendChild(inputCon);
          
          
          var fourthCell = row.insertCell(3);
          var inputMail = document.createElement("input");
          inputMail.type = "text";
         
          inputMail.name =  "customerDetails["+length+"].txtMail"; 
          inputMail.id =  "customerDetails["+length+"].txtMail";
          inputMail.className="form-control";
          fourthCell.appendChild(inputMail);

          
          var fifthCell = row.insertCell(3);
          var inputDesig = document.createElement("input");
          inputDesig.type = "text";
      
          inputDesig.name ="customerDetails["+length+"].txtDes";
          inputDesig.id ="customerDetails["+length+"].txtDes";
          inputDesig.className="form-control";
          fifthCell.appendChild(inputDesig);         
          
          
         /*  var sixthCell = row.insertCell(5);
       	  var inputbutton = document.createElement("input");
	      inputbutton.type = "button";
	      inputbutton.name = "add"+i;
	      inputbutton.id = "btnadd"+i;       	
	      inputbutton.value="+"; 
	      inputbutton.setAttribute("onClick","addRow()");
          sixthCell.appendChild(inputbutton); */
          
          
	      var sixthCell = row.insertCell(5);
			var inputDelete = document.createElement("input");
			inputDelete.type = 'button';
			inputDelete.id = "btndel" + i;
			inputDelete.name = "btndel" + i;
			inputDelete.value="-";		
			inputDelete.className="btn btn-primary";
			 inputDelete.onclick=function(){delrow(this);};			
			 sixthCell.appendChild(inputDelete);
          
	    
			  
		  i++;
		  document.getElementById("hide").value=i;
         
}
function delrow(obj)
{
  		var tbl = document.getElementById('table1');
	    var last = tbl.rows.length;	
	    //alert("Last="+last);
	    if(last == 2)
		 {
			document.getElementById("customerDetails["+length+"].txtName").value ="";
		 	document.getElementById("customerDetails["+length+"].txtMail").value = "";		 	
		 	document.getElementById("customerDetails["+length+"].txtCon").value = "";
		 	document.getElementById("customerDetails["+length+"].txtDes").value = "";
		 	
		 	
			 	
		 }
	   else
	     {			
		   var current = window.event.srcElement;							 
		   while ( (current = current.parentElement)  && current.tagName !="TR");
          current.parentElement.removeChild(current);	

    	   j--;
   
          var counter = obj.id.slice(6);
          //alert("Counter Before While="+counter);
	    while(counter<last)
		 {
		next = counter;
	 	next++;
	 	//alert("Counter In While="+counter);
	 	
	 	var txtSrNo = document.getElementById("customerDetails["+next+"].txtSrNo");
	 	txtSrNo.id = "customerDetails["+counter+"].txtSrNo";
	 	txtSrNo.name = "customerDetails["+counter+"].txtSrNo";
	 	txtSrNo.value =txtSrNo.value - 1 ;
	 	//alert("Sr No="+inputSrNo.value );
	 	
	 	var name = document.getElementById("customerDetails["+next+"].txtName");
	 	name.id = "customerDetails["+counter+"].txtName";
	 	name.name = "customerDetails["+counter+"].txtName";
	 	
	    var mail = document.getElementById("customerDetails["+next+"].txtMail");	   
	 	mail.id = "customerDetails["+counter+"].txtMail";
	 	mail.name = "customerDetails["+counter+"].txtMail";
	    
	 	 var contact = document.getElementById("customerDetails["+next+"].txtCon");	   
		 contact.id = "customerDetails["+counter+"].txtCon";
		 contact.name = "customerDetails["+counter+"].txtCon";
	 	
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


</script>

<link href="<c:url value="resources/ccc/jquery-ui1.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/ccc/demo1.css"/>" rel="stylesheet" type="text/css" />

<script src="<c:url value="resources/ccc/jquery-1.9.11.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/ccc/jquery-ui1.js" />" type="text/javascript"></script>

<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add New Customer</title>
<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">

<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
  
     
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
      alert("User Name should not be blank");
      document.frmAddNewCustomer.txtCustName.focus();
      return false;
    }
     else if(document.frmAddNewCustomer.slctRegion.value=="0")
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
    else if(document.frmAddNewCustomer.slctType.value=="0")
    {
        alert("Please select Supplier Name");
        document.frmAddNewCustomer.slctType.focus();
        return false;
      } 
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
    else if(document.frmAddNewCustomer.txtSrNo.value=="")
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
    else if(document.frmAddNewCustomer.txtCon.value=="")
    {
        alert("Contact number Should not be empty....");
        document.frmAddNewCustomer.txtCon1.focus();
        return false;
      }
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
    else if(document.frmAddNewCustomer.txtStatus.value=="")
    {
        alert("Status Should not be empty....");
        document.frmAddNewCustomer.txtWeb.focus();
        return false;
      }
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
    else if(document.frmAddNewCustomer.txtcurrency.value=="")
    {
        alert("Currency Should not be empty....");
        document.frmAddNewCustomer.txtcurrency.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtcurrencyLimit.value=="")
    {
        alert("Currency Limit Should not be empty....");
        document.frmAddNewCustomer.txtcurrencyLimit.focus();
        return false;
      }
    else
      {
    	  alert("Data Inserted Successfully....");
    	}
    
  }
</script>
<SCRIPT language=Javascript>
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

 function validateEmail(sEmail) {
	  var reEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,3})$/;

	  if(!sEmail.match(reEmail)) {
	    alert("Invalid email address");
	    return false;
	  }

	  return true;

	}

 </SCRIPT>
</head>

<body>
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<div id="container">
		<%@ include file="innerHeader.jsp" %>
	<form:form method="post" action="addCustomer.do" commandName="newCustomer" name="frmAddNewCustomer" onsubmit="return validateForm()">	
		<br>
		<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;<small>Add New Customer</small>
								</ul>
							</div>
							<div class="col-md-2">
							<a href="#" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
							</div>
						</div>
					</div>
</div>				
		<div class="col-lg-12">
    <div class="panel panel-default">
       <div class="panel-body">      					
					<div class="row first column">
					<div class="col-md-3">
							<label>Customer Name:-</label>
							<form:input path="txtCustName" cssClass="form-control" onkeypress="return AllowCharacters(this);"></form:input>
					</div>
					 <div class="col-md-3">
							<label>Region:-</label>
							<form:select path="slctRegion" cssClass="form-control" onchange= "custid()" >
									<form:option value="0">Select Region</form:option>
									<form:option value="1">PN-Pune</form:option>
									<form:option value="2">MB-Mumbai</form:option>
									<form:option value="3">AG-Aurangabad</form:option>
									<form:option value="3">VB-Vidarbha</form:option>
									<form:option value="5">SL-Solapur</form:option>
									<form:option value="6">KH-Kolhapur</form:option>
									<form:option value="7">AH-Ahmedabad</form:option>
									<form:option value="8">KO-Kolkata</form:option>
									<form:option value="9">KN-Kanpur</form:option>
									<form:option value="10">DL-Delhi</form:option>
									<form:option value="11">BL-Banglore</form:option>
									<form:option value="12">IT-International</form:option>
								</form:select>
					 </div>
					 <div class="col-md-3">
							<label>Customer ID:-</label>
							<form:input path="txtCustID" cssClass="form-control"/>
					 </div>
					 </div>
					 <br>
					 <div class="row first column">
					 
					  <div class="col-md-3">
					 		<label>Supplier Name:-</label>
						
								<form:select path="slctType" cssClass="form-control">
									<form:option value="0">Select Type</form:option>																
									<form:option value="1">Tushar</form:option>
									<form:option value="2">Pradeep</form:option>
									<form:option value="3">Bhimsen</form:option>	
								</form:select>
					 </div>
					 <div class="col-md-3">
					 			<label>Date:-</label>
								 <input type="date" name="txtDate" class="form-control"/>
					 </div>
					 </div>
					 <br>
					 <div class="col-lg-12">
    						<div class="panel panel-default">
       						<div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#billingtab" data-toggle="tab"><i class="icon-th-list "></i>Billing Address</a></li>
                               	<li><a href="#shippingtab" data-toggle="tab"><i class="icon-th-list "></i>Shipping Address</a></li>
                            </ul>
                            <div class="tab-content">
             <div class="tab-pane fade in active" id="billingtab">             	 
                      <div class="panel panel-default">                       
                        <div class="panel-body">
                        <div class="col-lg-12">
                           	<div class="row">
					  <div class="col-md-3">
								 	<label>Address&nbsp;:-</label>
									<form:textarea path="billingAddress" cols="" rows="" cssClass="form-control"/>
					 </div>
							  <div class="col-md-3">
									 <label>City&nbsp;:-</label>
									  <form:input path="billingcity" cssClass="form-control"/>
					   		   </div>
					 	<div class="col-md-3">
					 				<label>State:-</label>
									<form:input path="billingstate" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>
					    
					 </div> 
					 <div class="row">
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
                        <div class="panel-body">
                        <div class="col-lg-12">
                           	<div class="row">
					  <div class="col-md-3">
								 	<label>Address&nbsp;:-</label>
									<form:textarea path="shippingAddrLine" cols="" rows="" cssClass="form-control"/>
					 </div>
							  <div class="col-md-3">
									 <label>City&nbsp;:-</label>
									  <form:input path="shippingcity" cssClass="form-control"/>
					   		   </div>
					 	<div class="col-md-3">
					 				<label>State:-</label>
									<form:input path="shippingstate" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>
					    
					 </div> 
					 <div class="row">
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
                            </div>
                            </div>
                      </div>
					  <%-- <div class="row first column">
					  <div class="col-md-3">
								 
								 	<label>Address&nbsp;Line1:-</label>
									<form:input path="txtAddrLine1" cssClass="form-control"/>
					 </div>
							  <div class="col-md-3">
									 <label>Address&nbsp;Line2:-</label>
									  <form:input path="txtAddrLine2" cssClass="form-control"/>
					   		   </div>
					 	<div class="col-md-3">
					 				<label>City:-</label>
									<form:input path="txtcity1" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>
					 </div> --%>
					 <br>
					 <%-- <div class="row first column">
					  <div class="col-md-3">
								 	
								 	<label>City:-</label>
									<form:input path="txtcity2" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					 </div>
							  <div class="col-md-3">
									 <label>Country:-</label>
									  <form:input path="txtCountry" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					   		   </div>
					 	<div class="col-md-3">
					 				<label>Pin:-</label>
									<form:input path="txtpin" onkeypress="return isNumberKey(this)" maxlength="6" cssClass="form-control"/>
					    </div>
					  </div> --%><br>
					    <div class="col-lg-12">
    						<div class="panel panel-default">
       						<div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#persontab" data-toggle="tab"><i class="icon-th-list "></i>Contact Person</a></li>
                               	<li><a href="#detailtab" data-toggle="tab"><i class="icon-th-list "></i>Contact Details</a></li>
                               	<li><a href="#banktab" data-toggle="tab"><i class="icon-th-list "></i>Bank Details</a></li>
                            </ul>
     	<div class="tab-content">
             <div class="tab-pane fade in active" id="persontab">             	 
                      <div class="panel panel-default">                       
                        <div class="panel-body">
                        <div class="col-lg-12">
                            <div class="table-responsive">
                    		<div style="width:580;height:160;overflow:auto;"> 
         					<table id="table1" cellpadding="-1" class="table table-striped">
         					<tr><th colspan="6">Contact Person</th></tr>         					
        					<tr>
					        		<td align="center" class="fnt" class="short">Sr No</td> 
					        		<td align="center" class="fnt" >Name</td>					        		
					        		<td align="center" class="fnt">Contact No</td>
					        		<td align="center" class="fnt">E-Mail</td>
					        		<td align="center" class="fnt">Designation</td>					        		
        					</tr>
        						<tr>
         						 <td><input type="text" name="txtSrNo" value="1" class="form-control" id="txtSrNo" style="width: 50px;" /></td> 
            					<td><input type="text" name="txtName" id="txtName" class="form-control" onkeypress="return AllowCharacters(this);"/></td>
            					<td><input type="text" name="txtCon" id="txtCon" class="form-control" onkeypress="return isNumberKey(this)" maxlength="15" /></td>
            					<td><input type="text" name="txtMail" id="txtMail" class="form-control" onblur="validateEmail(this.value);" /></td> 
            					<td><input type="text"  name="txtDes" id="txtDes" class="form-control" onkeypress="return AllowCharacters(this);" /></td>
            					<td><input type="button" class="btn btn-primary"name="button" value="-" onclick="delrow(this);"></td>
    					    	</tr>           					 
           					 <tr height="10"></tr>
           					 </table> 
         					<div> <input type="button"  name="btnAdd" class="btn btn-primary" value="+" onclick="addRow();"> </div>
          					</div>
                            </div>
                        </div>
                    </div>
                </div>
             </div>          
            
              <div class="tab-pane fade" id="detailtab">             	                     
                      <div class="panel panel-default">                       
                        <div class="panel-body">
                        <div class="col-lg-12">
                           <div class="row first-column">                            
                            <div class="col-md-12">								
								<div class="col-md-3">
									<label>E-Mail:-</label>
									<form:input path="txtMail1" onblur="validateEmail(this.value);" cssClass="form-control"/>
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
										<form:input path="txtWeb" cssClass="form-control" onblur="validateEmail(this.value);"  />
									</div>	
						  </div>
						  <div class="col-md-12">							
							  		<div class="col-md-3">
										<label>Status</label>
										<form:input path="txtStatus" cssClass="form-control"/>
									</div>
									
						  </div>
						 
					    </div>							   					
          			  </div>
                    </div>
                   </div>
               </div>
             
                     
         
           
            <div class="tab-pane fade" id="banktab">             	 
                    
                    <div class="panel panel-default">                       
                        <div class="panel-body">
                        <div class="col-md-12">
                        <div class="row">
                            	<div class="col-md-3">                                		
									<label>Account No:-</label>
									<form:input path="txtAcNo" cssClass="form-control" onkeypress="return isNumberKey(this)"/>
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
                        </div>
                        <div class="row">
								<div class="col-md-3">
									<label>Service Tax :-</label>
									<form:input path="txtservicetax" cssClass="form-control" />
								</div>
								<div class="col-md-3">
									<label>Currency :-</label>
									<form:input path="txtcurrency" cssClass="form-control" />								
                            	</div>
                        </div>
                        <div class="row">
								<div class="col-md-3">
									<label>Currency Limit:-</label>
									<form:input path="txtcurrencyLimit" cssClass="form-control" />								
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
		<div>
								<button type="submit" class="btn btn-primary" name="btn" value="Save">SAVE</button>
								<button type="reset" class="btn btn-primary" name="btn">CLEAR</button>
							</div>
 		<c:if test="${message==1}">                     
								<h4 class="msg-succ">
								Customer Added Succesfully.
								</h4> 
							</c:if>
							<c:if test="${message==0}">                     
								<h4 class="msg-error">
								Customer Not Added Succesfully.
								</h4> 
							</c:if>		
 
 </div>
</div>
</form:form>
</div>
</div>
</body>
</html>