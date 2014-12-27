<%@page language="java" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 
   <%@page import="java.text.SimpleDateFormat"%>
   <%@ page import="javax.servlet.*,java.text.*" %>
   <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Vendor</title>
<link rel="icon" href="<core:url value="/resources/images/favicon.ico" />" type="image/icon">
<script src="<core:url value="/resources/ccc/jquery-1.9.1.js" />"></script>
<script src="<core:url value="/resources/ccc/jquery-ui.js" />"></script>
<script type="text/javascript" src="<core:url value="/resources/highslide/highslide-with-html.js" />"></script>
<script src="<core:url value="/resources/js/jquery-1.10.2.js" />"></script>
<script src="<core:url value="/resources/js/bootstrap.js" />"></script>
<script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
<script src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>

<script src="<core:url value="/resources/assets/js/jquery-ui.min.js" />"> </script>	
<link rel="stylesheet" type="text/css" href="<core:url value="/resources/highslide/highslide.css"/>" />
<link rel="stylesheet" href="<core:url value="/resources/ccc/jquery-ui.css" />">
<link rel="stylesheet" href="<core:url value="/resources/css/table.css" />">
<link rel="stylesheet" href="<core:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
<link rel="stylesheet" href="<core:url value="/resources/css/bootstrap.css" />" type="text/css">
<link rel="stylesheet" href="<core:url value="/resources/css/sb-admin.css" />" type="text/css">
<link rel="stylesheet" href="<core:url value="/resources/css/font-awesome.min.css" />" type="text/css">
<link rel="stylesheet" href="<core:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" type="text/css">    

<link rel="stylesheet"href="<core:url value="/resources/datepicker/css/datepicker.css"/>" type="text/css" />		

	<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
                $('#dp1').datepicker({
                	format: "yyyy/mm/dd"
                });
                
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
    </script>
<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>

<script type="text/javascript">
 var i=1;
var j=1;
function addRow()

{ 	
		  /* //var srNo=j;		
          var tbl = document.getElementById("table1");
          var lastRow = tbl.rows.length;        
          var row = tbl.insertRow(lastRow); */
     	 
	     var tbl = document.getElementById("table1");
     	 var lastRow = tbl.rows.length;
      	 //var i= lastRow - 1;
      	 var row = tbl.insertRow(lastRow);
      	 var length=(tbl.rows.length)-2;
			j=length+1;
			
			//alert("Length="+length);
		//	alert("J="+j);
          
          var firstCell = row.insertCell(0);
          var inputSrNo = document.createElement("input");
          inputSrNo.type = "text";
          inputSrNo.name =  "venderDetails["+length+"].txtSrNo";
          inputSrNo.id = "venderDetails["+length+"].txtSrNo";
          inputSrNo.style.textAlign ="right";
          inputSrNo.style.width="50px";
          inputSrNo.value=j;
          inputSrNo.className="form-control";          
          firstCell.appendChild(inputSrNo);         
          
          
          
          var secondCell = row.insertCell(1);
          var inputName = document.createElement("input");
          inputName.type = "text";          
          inputName.name = "venderDetails["+length+"].txtName";
          inputName.id ="venderDetails["+length+"].txtName";          
          inputName.className="form-control";
        /*   inputName.onblur=function(){getId(this.id);}; */
          secondCell.appendChild(inputName);

           
         
          var ThirdCell = row.insertCell(2);
          var inputCon = document.createElement("input");
          inputCon.type = "text";
          inputCon.name = "venderDetails["+length+"].txtCon";
          inputCon.id = "venderDetails["+length+"].txtCon"; 
          inputCon.className="form-control";
         // inputCon.onblur=function(){getValue(this.value);};
          ThirdCell.appendChild(inputCon);
          
          
          var fourthCell = row.insertCell(3);
          var inputMail = document.createElement("input");
          inputMail.type = "text";
          inputMail.name =  "venderDetails["+length+"].txtMail"; 
          inputMail.id =  "venderDetails["+length+"].txtMail";
          inputMail.className="form-control";
          fourthCell.appendChild(inputMail);

          
          var fifthCell = row.insertCell(4);
          var inputDesig = document.createElement("input");
          inputDesig.type = "text";
          inputDesig.name ="venderDetails["+length+"].txtDes";
          inputDesig.id ="venderDetails["+length+"].txtDes";
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
			inputDelete.id = "btndel" + length;
			inputDelete.name = "btndel" + length;
			inputDelete.value="-";		
			inputDelete.className="btn btn-danger";
			/* inputDelete.onclick=function(){getId(this.id);}; */
			inputDelete.onclick=function(){delrow(this);};		
			 sixthCell.appendChild(inputDelete);
          
	    
			  
		  i++;
		 // document.getElementById("hide").value=i;
         
}
function delrow(obj)
{
  		var tbl = document.getElementById('table1');
	    var last = (tbl.rows.length)-1;	
	   // alert("Last="+last);
	     var txtSrNo,Customer_Name,Mail,Con,Desg,btndel,next;		
	    if(last == 1)
		 {
			Customer_Name=document.getElementById("venderDetails["+length+"].txtName");
		 	Mail=document.getElementById("venderDetails["+length+"].txtMail");		 	
		 	Con=document.getElementById("venderDetails["+length+"].txtCon");
		 	Desg=document.getElementById("venderDetails["+length+"].txtDes");
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

    	//   j--;
   
          var counter = obj.id.slice(6);
      //  alert("Counter Before While="+counter);
	    while(counter<last)
		 {
		next = counter;
	 	next++;
//	 	alert("next="+next);
	 //alert("Counter In While="+counter);	 	
	 	var txtSrNo = document.getElementById("venderDetails["+next+"].txtSrNo");	 	
	 	txtSrNo.id = "venderDetails["+counter+"].txtSrNo";
	// 	alert("Sr no id="+txtSrNo.id);
	 	txtSrNo.name = "venderDetails["+counter+"].txtSrNo";
	// 	alert("Sr no name="+txtSrNo.name);
	 	var sr=txtSrNo.value-1;	 	
	 	txtSrNo.value =sr;
	 //	alert("After Sr No"+sr);
	 	
	 	var name = document.getElementById("venderDetails["+next+"].txtName");
	 	name.id = "venderDetails["+counter+"].txtName";	 	
	 	name.name = "venderDetails["+counter+"].txtName";
	 	
	//	alert("After name");
	 
	 	 var contact = document.getElementById("venderDetails["+next+"].txtCon");	   
	 //	alert("contact id="+contact.id);
		 contact.id = "venderDetails["+counter+"].txtCon";
		 contact.name = "venderDetails["+counter+"].txtCon";
		 
		// alert("After con");
		 		 
		 var mail = document.getElementById("venderDetails["+next+"].txtMail");	   
		 mail.id = "venderDetails["+counter+"].txtMail";
		 mail.name = "venderDetails["+counter+"].txtMail";
		    
	//	alert("After Mail");		 	
		 
	    var designation = document.getElementById("venderDetails["+next+"].txtDes");	 
	 	designation.id = "venderDetails["+counter+"].txtDes";
	 	designation.name = "venderDetails["+counter+"].txtDes";
	 	
	 //	alert("After designation ");
	 	
	 	btndel = document.getElementById("btndel"+next);
	 	btndel.id = "btndel"+counter;
	 	btndel.name = "btndel"+counter;
	 	
	 //	alert("Counter BI="+counter);	 	
	 	counter++;
	//			alert("Counter AI="+counter);	 	
	 
	 }
}   
}
function getValue(obj)
{
	alert("Id="+obj);
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
	var srno = document.getElementById("venderDetails[0].txtSrNo").value;	
	var name = document.getElementById("venderDetails[0].txtName").value;
	var pName = document.getElementById("venderDetails[0].txtCon").value;
	var email = document.getElementById("venderDetails[0].txtMail").value;
	var designation = document.getElementById("venderDetails[0].txtDes").value;
    if(document.frmAddNewCustomer.txtCustName.value=="")
    {
      alert("User Name should not be blank");
      document.frmAddNewCustomer.txtCustName.focus();
      return false;
    }
     else if(document.frmAddNewCustomer.slctRegion.value=="Select")
    {
      alert("Please select Region...");
      document.frmAddNewCustomer.slctRegion.focus();
      return false;
    } 
    else if(document.frmAddNewCustomer.txtCustID.value=="")
    {
      alert("Vendor Id Should not be Empty...");
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
   
    else if(document.frmAddNewCustomer.txtBillingAdd.value=="")
    {
        alert("Billing Address Should not be Empty....");
        document.frmAddNewCustomer.txtBillingAdd.focus();
        return false;
      }
    
    else if(document.frmAddNewCustomer.txtBillingCity.value=="")
    {
        alert("Billing City Should not be empty....");
        document.frmAddNewCustomer.txtBillingCity.focus();
        return false;
      }

    else if(document.frmAddNewCustomer.txtBillingState.value=="")
    {
        alert("Billing State Should not be empty....");
        document.frmAddNewCustomer.txtBillingState.focus();
        return false;
      }
   
    else if(document.frmAddNewCustomer.txtBillingCountry.value=="")
    {
        alert("Billing Country Should not be empty....");
        document.frmAddNewCustomer.txtBillingCountry.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtBillingPinCode.value=="")
    {
        alert("Billing Pin code should not be empty....");
        document.frmAddNewCustomer.txtBillingPinCode.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtShippingAdd.value=="")
    {
        alert("Shipping Address Should not be Empty....");
        document.frmAddNewCustomer.txtShippingAdd.focus();
        return false;
      }
    
    else if(document.frmAddNewCustomer.txtShippingCity.value=="")
    {
        alert("Shipping City Should not be empty....");
        document.frmAddNewCustomer.txtShippingCity.focus();
        return false;
      }

    else if(document.frmAddNewCustomer.txtShippingState.value=="")
    {
        alert("Shipping State Should not be empty....");
        document.frmAddNewCustomer.txtShippingState.focus();
        return false;
      }
   
    else if(document.frmAddNewCustomer.txtShippingCountry.value=="")
    {
        alert("Shipping Country Should not be empty....");
        document.frmAddNewCustomer.txtShippingCountry.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.shippingpincode.value=="")
    {
        alert("Shipping Pin code should not be empty....");
        document.frmAddNewCustomer.shippingpincode.focus();
        return false;
      }
    else if(srno=="")
    {
        alert("Sr.No Should not be empty....");
        srno.focus();
        return false;
      }
     else if(name=="")
    {
        alert("Vendor Name Should not be empty....");
        name.focus();
        return false;
      }
  		else if(pName=="")
    {
        alert("Contact number Should not be empty....");
        pName.focus();
        return false;
      }
    else if(email=="")
    {
        alert("Email ID field Should not be empty....");
        email.focus();
        return false;
      }
    else if(designation=="")
    {
        alert("Designanation field Should not be empty....");
        designation.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtMail1.value=="")
    {
        alert("Email ID field Should not be empty....");
        document.frmAddNewCustomer.txtMail1.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtMob.value=="")
    {
        alert("Mobile number Should not be empty....");
        document.frmAddNewCustomer.txtMob.focus();
        return false;
      }
    /* else if(document.frmAddNewCustomer.txtTel.value=="")
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
      } */
    else if(document.frmAddNewCustomer.txtWeb.value=="")
    {
        alert("Website field Should not be empty....");
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
    else if(document.frmAddNewCustomer.txtCurrency.value=="")
    {
        alert("Bank Name Should not be empty....");
        document.frmAddNewCustomer.txtCurrency.focus();
        return false;
      }
    else if(document.frmAddNewCustomer.txtCreditLimit.value=="")
    {
        alert("Bank Name Should not be empty....");
        document.frmAddNewCustomer.txtCreditLimit.focus();
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
    else if(document.frmAddNewCustomer.txtServiceTaxNo.value=="")
    {
        alert("Service Tax Should not be empty....");
        document.frmAddNewCustomer.txtServiceTaxNo.focus();
        return false;
      }    
    else
    {
    	  alert("Data Inserted Successfully....");
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
if((keycode >= 65 && kecode <= 90) || (keycode >= 97 && keycode <= 122) || (keycode == 32))
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

 <script type="text/javascript">
function backPage()
{
	window.history.back();
}

function cancel()
{
	window.history.back();
}
</script>
 <script type="text/javascript">
var shipingAdd = "",shipingCity="",shipingState="",shipingCountry="",shipingpincode="";
function same(s)
{	
	var billingadd=document.frmAddNewCustomer.txtBillingAdd.value;
	var billingcity=document.frmAddNewCustomer.txtBillingCity.value;
	var billingstate=document.frmAddNewCustomer.txtBillingState.value;
	var billingcountry=document.frmAddNewCustomer.txtBillingCountry.value;
	var billingpincode=document.frmAddNewCustomer.txtBillingPinCode.value;
	if(s.checked)
		{
		shipingAdd = document.frmAddNewCustomer.txtShippingAdd.value;
		shipingCity = document.frmAddNewCustomer.txtShippingCity.value;
		shipingState = document.frmAddNewCustomer.txtShippingState.value;
		shipingCountry = document.frmAddNewCustomer.txtShippingCountry.value;
		shipingpincode = document.frmAddNewCustomer.txtShippingPinCode.value;
		
		document.frmAddNewCustomer.txtShippingAdd.value=billingadd;
		document.frmAddNewCustomer.txtShippingCity.value=billingcity;
		document.frmAddNewCustomer.txtShippingState.value=billingstate;
		document.frmAddNewCustomer.txtShippingCountry.value=billingcountry;
		document.frmAddNewCustomer.txtShippingPinCode.value=billingpincode;
		}
	else
	{
	  document.frmAddNewCustomer.txtShippingAdd.value= shipingAdd;
	  document.frmAddNewCustomer.txtShippingCity.value= shipingCity;
	  document.frmAddNewCustomer.txtShippingState.value= shipingState;
	  document.frmAddNewCustomer.txtShippingCountry.value= shipingCountry;
	  document.frmAddNewCustomer.txtShippingPinCode.value= shipingpincode;
	}
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
<%@ include file="../header.jsp" %>
	<!-- <div id="container"> -->
		<%@ include file="innerHeader.jsp" %>
		<br>
		<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;New<small>&nbsp;Vendor</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="purchase.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="bottom" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		     </div>	
		     <form:form method="post" action="addVender.do" modelAttribute="createvender" name="frmAddNewCustomer" onsubmit="return validateForm()">
		    <div class="col-md-12">
			 		<core:if test="${message==1}">                     
					<h4 class="msg-succ">
					Vendor Added Succesfully
					</h4> 
					</core:if>
					<core:if test="${message==0}">                     
					<h4 class="msg-error">
					Vendor Not Added Succesfully.
					</h4> 
					</core:if>
		    </div>
		<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">      					
					<div class="first column">
					
					<div class="col-md-3">
							<label>Vendor Name:</label>
							<form:input path="txtCustName" cssClass="form-control" ></form:input>
					</div>
					 <div class="col-md-3">
							<label>Region:</label>
							<select name="slctRegion" class="form-control" onchange= "custid()" >
									<option value="Select">Select Region</option>
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
								</select>
					 </div>
					 <div class="col-md-2"> 
					 			<label>Date:</label> 
								<%
													DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
													Date date = new Date();
													String dt = dateFormat.format(date);
											%> 
								 <input type="text" id="dp1" name="txtDate" class="form-control" value="<%=dt%>"/> 
					 </div>
					 <div class="col-md-3">
							<label>Vendor ID:</label>
							<form:input path="txtCustID" readonly="true" cssClass="form-control"/>
							<%-- <input type="text" class="form-control" value="${venderId.txtCustID}"/> --%>
					</div>
					 </div>
					 <br>
					 <div class="col-md-12" style="height: 20px;"> </div>
					 <div class="col-md-12">
    						<!-- <div class="panel panel-default">
       						<div class="panel-body"> -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab"><i class="icon-th-list "></i>  Billing Address</a></li>
                               	<li><a href="#tab2" data-toggle="tab"><i class="icon-th-list "></i>  Shipping Address</a></li>
                            </ul>
                            <div class="tab-content">
             <div class="tab-pane fade in active" id="tab1">             	 
                      <div class="panel panel-default">  
                      <div class="panel-heading"> Billing Address </div>                     
                        <div class="panel-body">
                        <div class="col-md-12">
                           	<div class="row">
					  <div class="col-md-6">
								 	<label>Address&nbsp;:</label>
									<textarea name="txtBillingAdd" cols="25" rows="3" class="form-control" onkeyup="textAreaAdjust(this)" style="overflow:hidden"></textarea>
					 </div>
					 </div> <br>
					 <div class="row">
					 <div class="col-md-3">
									 <label>City&nbsp;:</label>
									  <form:input path="txtBillingCity" cssClass="form-control" onkeypress="return AllowCharacters(this);"/>
					   		   </div>
					 	<div class="col-md-3">
					 				<label>State:</label>
									<form:input path="txtBillingState" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>
					 	<div class="col-md-3">
					 				<label>Country:</label>
									<form:input path="txtBillingCountry" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>
					    <div class="col-md-3">
					 				<label>Pin Code:</label>
									<form:input path="txtBillingPinCode" onkeypress="return isNumberKey(this);" cssClass="form-control"/>
					    </div>
					 </div>
                        </div>
                    </div>
                </div>
             </div>
             <div class="tab-pane fade" id="tab2">             	 
                      <div class="panel panel-default"> 
                      <div class="panel-heading"> Shipping Address </div>                       
                        <div class="panel-body">
                        <div class="col-md-12">
                        <input type="checkbox" id="chkYes" name="chkYes" onclick="same(this)" style="vertical-align: top">&nbsp;Same as Billing Address&nbsp;:
                           	<div class="row">
					  <div class="col-md-6">
								 	<label>Address&nbsp;:</label>
									<textarea name="txtShippingAdd" cols="25" rows="3" class="form-control" onkeyup="textAreaAdjust(this)" style="overflow:hidden"></textarea>
					 </div>
							  				    
					 </div> <br>
					 <div class="row">
					 <div class="col-md-3">
									 <label>City&nbsp;:</label>
									  <form:input path="txtShippingCity" cssClass="form-control" onkeypress="return AllowCharacters(this);"/>
					   		   </div>
					 	<div class="col-md-3">
					 				<label>State:</label>
									<form:input path="txtShippingState" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>	
					 	<div class="col-md-3">
					 				<label>Country:</label>
									<form:input path="txtShippingCountry" onkeypress="return AllowCharacters(this);" cssClass="form-control"/>
					    </div>
					    <div class="col-md-3">
					 				<label>Pin Code:</label>
									<form:input path="txtShippingPinCode" onkeypress="return isNumberKey(this);" cssClass="form-control"/>
					    </div>
					 </div>
                        </div>
                    </div>
                </div>
             </div>   
             </div>
                            <!-- </div>
                            </div> -->
                      </div>
					<br> 
					<div class="col-md-12" style="height: 20px;"> </div>
					<br>
					
					    <div class="col-md-12">
    						<!-- <div class="panel panel-default">
       						<div class="panel-body"> -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#persontab" data-toggle="tab"><i class="icon-th-list "></i>  Contact Person</a></li>
                               	<li><a href="#detailtab" data-toggle="tab"><i class="icon-th-list "></i>  Contact Details</a></li>
                               	<li><a href="#banktab" data-toggle="tab"><i class="icon-th-list "></i>  Bank Details</a></li>
                            </ul>
     	<div class="tab-content">
             <div class="tab-pane fade in active" id="persontab">             	 
                      <div class="panel panel-default"> 
                                            <div class="panel-heading"> </div>  
                        <div class="panel-body">
                        <div class="col-md-12">
                            <div class="table-responsive">
                    		<div style="width:overflow:auto;"> 
         					<table id="table1" cellpadding="-1" class="table table-bordered">         					     					
        					<tr>
					        		<td align="center" class="fnt" class="short">Sr No</td> 
					        		<td align="center" class="fnt" >Name</td>					        		
					        		<td align="center" class="fnt">Contact No</td>
					        		<td align="center" class="fnt">E-Mail</td>
					        		<td align="center" class="fnt">Designation</td>					        		
        					</tr>
        						<tr>
         						<td><input type="text" name="venderDetails[0].txtSrNo" value="1" class="form-control" id="venderDetails[0].txtSrNo" style="width: 50px;text-align: right;" /></td> 
            					<td><input type="text" name="venderDetails[0].txtName" id="venderDetails[0].txtName" class="form-control" onkeypress="return AllowCharacters(this);"/></td>
            					<td><input type="text" name="venderDetails[0].txtCon" id="venderDetails[0].txtCon" class="form-control" onkeypress="return isNumberKey(this);" maxlength="15" /></td>
            					<td><input type="text" name="venderDetails[0].txtMail" id="venderDetails[0].txtMail" class="form-control" onblur="validateEmail(this.value);" /></td> 
            					<td><input type="text"  name="venderDetails[0].txtDes" id="venderDetails[0].txtDes" class="form-control" onkeypress="return AllowCharacters(this);" /></td>
            					<td><input type="button" class="btn btn-danger" name="button" value="-" onclick="delrow(this);"></td>
    					    	</tr>           					            					
           					 </table> 
         					<div> <input type="button"  name="btnAdd" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRow();"> </div>
          					</div>
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
									<label>E-Mail:</label>
									<form:input path="txtMail1" onblur="validateEmail(this.value);" cssClass="form-control"/>
								</div>
								<div class="col-md-3">
									<label>Mobile No:</label>
									<form:input path="txtMob" cssClass="form-control" onkeypress="return isNumberKey(this);"/>
								</div>
								<div class="col-md-3">
									<label>Telephone:</label>
									<form:input path="txtTel" cssClass="form-control" onkeypress="return isNumberKey(this)" maxlength="20"/>
								</div>
							</div><br><br><br>
							<div class="col-md-12">							
							  		<div class="col-md-3">
										<label>Fax:</label>
										<form:input path="txtFax" cssClass="form-control" onkeypress="return isNumberKey(this)" maxlength="20"/>
									</div>
									<div class="col-md-3">
										<label>Website</label>
										<form:input path="txtWeb" cssClass="form-control" />
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
									<label>Account No:</label>
									<form:input path="txtAcNo" cssClass="form-control" onkeypress="return isNumberKey(this);"/>
							</div>
							<div class="col-md-3">
								<label>Bank Name:</label>
									<form:input path="txtBankNm" cssClass="form-control" onkeypress="return AllowCharacters(this);" />
							</div>
							<div class="col-md-3">
								<label>IFSC Code:</label>
									<form:input path="txtIfscCode" cssClass="form-control" />
							</div>
							<div class="col-md-3">
								<label>PAN No:</label>
									<form:input path="txtPanNo" cssClass="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label>CST No:</label>
								<form:input path="txtCstNo" cssClass="form-control"/>
							</div>
							<div class="col-md-3">
								<label>VAT No:</label>
									<form:input path="txtVatNo" cssClass="form-control"/>
							</div>
							<div class="col-md-3">
								<label>LBT No:</label>
									<form:input path="txtLbtNo" cssClass="form-control" />
							</div>
							<div class="col-md-3">
								<label>Excise No:</label>
									<form:input path="txtExcNo" cssClass="form-control" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label>Service Tax No:</label>
									<form:input path="txtServiceTaxNo" cssClass="form-control" />
							</div>
						</div>
                        <br>
                       <%--  <div class="row">
                            <div class="col-md-3">                                		
									<label>Account No:</label>
									<form:input path="txtAcNo" cssClass="form-control" onkeypress="return isNumberKey(this);"/>
									
									<label>Bank Name:</label>
									<form:input path="txtBankNm" cssClass="form-control" onkeypress="return AllowCharacters(this);" />
							</div>
							<div class="col-md-3">
									<label>Currency:</label> 
									<form:input path="txtCurrency" cssClass="form-control" onkeypress="return AllowCharacters(this)"/>
									
									<label>Credit Limit:</label>
									<form:input path="txtCreditLimit" cssClass="form-control" onkeypress="return isNumberKey(this);" />
							</div>
							<div class="col-md-3">
									<label>IFSC Code:</label>
									<form:input path="txtIfscCode" cssClass="form-control" />
									
									<label>PAN No:</label>
									<form:input path="txtPanNo" cssClass="form-control"/>
							</div>
							<div class="col-md-3">	
									
									<label>CST No:</label>
									<form:input path="txtCstNo" cssClass="form-control"/>
									
									<label>VAT No:</label>
									<form:input path="txtVatNo" cssClass="form-control"/>
							</div>
							<div class="col-md-3">	
									
									<label>LBT No:</label>
									<form:input path="txtLbtNo" cssClass="form-control" />
							</div>
							<div class="col-md-3">		
									<label>Excise No:</label>
									<form:input path="txtExcNo" cssClass="form-control" />
							</div>
							<div class="col-md-3">	
									<label>Service Tax No:</label>
									<form:input path="txtServiceTaxNo" cssClass="form-control" />	
                           </div>
                           </div>  --%>
                        </div>
                    </div>
                </div>
             </div>        			    
               </div>                 
 	<!-- 	</div>
</div> -->
</div>
<div class="col-md-12" style="height: 30px;"> </div>
							<div class="col-md-12">
								<button type="submit" class="btn btn-primary" name="btn" value="Save" data-toggle="tooltip" data-placement="top" title="Save">SAVE</button>
								<a href="purchase.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Cancel"> Cancel</a>
								<!-- <button type="reset" class="btn btn-primary"  name="btn">Cancel</button> -->
							</div>
</div>
</div>
 </div>
</form:form>
</div>
<!-- </div> -->
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>