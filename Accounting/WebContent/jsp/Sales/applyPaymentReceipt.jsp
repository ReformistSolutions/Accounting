<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sales Payment Receipt</title>
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
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
                $('#date').datepicker({
                    format: "yyyy/mm/dd"
                });

                $('#ddate').datepicker({
                    format: "yyyy/mm/dd"
                });                
            });
            $( document ).ready(function() {
            	  $('#date').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
            $( document ).ready(function() {
            	  $('#ddate').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
    </script>
</head>
<script>
function goBack() {	
    window.history.back();
}
</script>
 <script>
function validateForm()
{  
	 if(document.frmSalesReceipt.receiptsNo.value=="")
    {
      alert("Receipt Number Should not be Empty...");
      document.frmSalesReceipt.receiptsNo.focus();
      return false;
    } 
     else if(document.frmSalesReceipt.date.value=="")
    {
      alert("Please Enter The Date");
      document.frmSalesReceipt.date.focus();
      return false;
    } 	  
     else if(document.frmSalesReceipt.invoiceId.value==" ")
     {
       alert("Please Select Invoice ID");
       document.frmSalesReceipt.invoiceId.focus();
       return false;
     } 	  	 	
     else if(document.frmSalesReceipt.payMode.value==" ")
     {
       alert("Please Select Payment Mode");
       document.frmSalesReceipt.payMode.focus();
       return false;
     }    
     else if(document.frmSalesReceipt.fromaccount.value==" ")
     {
       alert("Please Select From Account");
       document.frmSalesReceipt.fromaccount.focus();
       return false;
     } 
     else if(document.frmSalesReceipt.toaccount.value==" ")
     {
       alert("Please Select To Account");
       document.frmSalesReceipt.toaccount.focus();
       return false;
     }
     else if(document.frmSalesReceipt.amount.value=="")
     {
       alert("Please Enter Amount");
       document.frmSalesReceipt.amount.focus();
       return false;
     }
     else if(document.frmSalesReceipt.balAmt.value=="")
     {
       alert("Balance Amount Should Not Empty");
       document.frmSalesReceipt.amount.focus();
       return false;
     } 
         
     else if(document.frmSalesReceipt.tds.value=="")
     {
       alert("Please Enter TDS");
       document.frmSalesReceipt.tds.focus();
       return false;
     }
     else if(document.frmSalesReceipt.description.value=="")
     {
       alert("Please Enter Description");
       document.frmSalesReceipt.description.focus();
       return false;
     } 
     else if(parseFloat(document.frmSalesReceipt.amount.value) > parseFloat(document.frmSalesReceipt.balAmt.value))
     {
       alert("Amount Should Not Greater Than Balance Amount"); 
       document.frmSalesReceipt.description.focus();
       return false;
     }
    
     
 }
</script>
<SCRIPT language=Javascript>
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
 
 function checkSame()
 {
	 var fromAc = document.getElementById("fromaccount");
	 var selfromAc = fromAc.options[fromAc.selectedIndex].text;
	 var toAc = document.getElementById("toaccount");
	 var seltoAc = toAc.options[toAc.selectedIndex].text;
	 if(selfromAc==seltoAc)
		 {
		 	alert("Please Select Different Accounts");
		 	return false;
		 }
 }
 function checkAmt()
 {
	 var balAmt=document.getElementById("balAmt").value;
     var amount=document.getElementById("amount").value;
     if(parseFloat(amount) > parseFloat(balAmt))
    	{
    		alert("Amount Should Not Greater Than Balance Amount"); 
    		document.getElementById("amount").value="";
    		document.frmSalesReceipt.amount.focus();
    		return true;
    	}
     else
    	 {
    	 	return false;
    	 }
 }
 </SCRIPT>
<script>
function showInvBal(str)
{
showAccount(str);
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("balAmt").value="";
  return;
  }
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
    document.getElementById("balAmt").value=xmlhttp.responseText;
       
    }
  }
xmlhttp.open("GET","retriveInvBal.do?invoiceId="+str,true);
xmlhttp.send();
}
</script>
<script>
function showAccount(str)
{
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("frmAc").innerHTML="";
  return;
  }
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
    document.getElementById("frmAc").innerHTML=xmlhttp.responseText;
       
    }
  }
xmlhttp.open("GET","retriveAccount.do?invoiceId="+str,true);
xmlhttp.send();
}
</script>
<script>
function showToAccount(str)
{
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("toAc").innerHTML="";
  return;
  }
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
    document.getElementById("toAc").innerHTML=xmlhttp.responseText;       
    }
  }
xmlhttp.open("GET","retriveToAccount.do?paymentMode="+str,true);
xmlhttp.send();
}
</script>

<body>
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<div id="container">
		<%@ include file="innerHeader.jsp" %>				
						<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Receipts</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<button onclick="goBack()" data-toggle="tooltip" data-placement="top" title="Back" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</button>
			             <!-- 	<div class="btn btn-primary btn-large" style="height:30px;"><i class="fa fa-reply"></i><input type="button" value="Back" onclick="goBack()" class="btn btn-primary btn-large"></div> -->
			             	</div>
		             	</div>
		             	</div>
		             </div>
			<form:form action="addReceipt.do" cssClass="form-inline" modelAttribute="salesReceipts" name="frmSalesReceipt" onsubmit="return validateForm()">
		            <div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<label>Receipt&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-5">
											<form:input path="receiptsNo" id="receiptsNo" cssClass="form-control" readonly="true" ></form:input>
										</div>
									</div>
								</div>
								<%
									DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
							     	Date date = new Date();	     
							     	String dt=dateFormat.format(date);
								%>
								<div class="col-sm-2"></div>
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<form:label path="date">Date&nbsp;: </form:label>
										</div>
										<div class="col-md-5">
											<input type="text" name="date" id="date" value="<%=dt %>" class="form-control">
										</div>
									</div>
								</div>
				
							</div><br>
							<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<label>Invoice&nbsp;Id:</label>
										</div>
										<div class="col-md-5">
										<%-- <select name="invoiceId" id="invoiceId"  class="form-control"><!--invoiceList  -->
											<option value="0">--Select--</option>
											<c:forEach items="${invoiceList}" var="invoiceList">
												<option value="${invoiceList.txtInvID}">${invoiceList.txtInvID}</option>
											</c:forEach>
										</select> --%>
											<%-- <form:input path="invoiceId" cssClass="form-control" autofocus="autofocus" readonly="true"></form:input> --%>
										 <input name="invoiceId" id="invoiceId" class="form-control" autofocus="autofocus" onfocus="showInvBal(this.value);" readonly="readonly" value="${salesReceipts.invoiceId}"></input>
										</div>
									</div>
								</div>
								<div class="col-sm-2"></div>
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<form:label path="payMode">Payment&nbsp;Mode&nbsp;: </form:label>
										</div>
										<div class="col-md-5">
											<form:select path="payMode" id="payMode" onchange="showToAccount(this.value);" cssClass="form-control">
												<option value=" ">---Select---</option>
												<option value="Cash">Cash</option>
												<option value="Cheque">Cheque</option>
											</form:select>
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3" id="frmAc">
									
								</div>
								<div class="col-sm-2"></div>
								<div class="col-md-3" id="toAc">
									
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<label>Bal Amt&nbsp;: </label>
										</div>
										<div class="col-md-5">
											<input name="balAmt" id="balAmt"  readonly="readonly" style="text-align: right;width: 90px;" class="form-control"></input>
										</div>
									</div>
								</div>
								<div class="col-sm-2"></div>
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<label>Amount&nbsp;: </label>
										</div>
										<div class="col-md-5">
											<input name="amount" id="amount" style="text-align: right;width: 90px;" onblur="checkAmt();" class="form-control" onkeypress="return isNumberKey(this)"></input>
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<form:label path="tds">TDS&nbsp;: </form:label>
										</div>
										<div class="col-md-5">
											<input name="tds" id="tds" style="text-align: right;width: 90px;" class="form-control" onkeypress="return isNumberKey(this)"></input>
											<%-- <form:input path="tds" id="tds" onkeypress="return isNumberKey(this)" cssClass="form-control"></form:input> --%>
										</div>
									</div>
								</div>
								<div class="col-sm-2"></div>
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<form:label path="description">Description&nbsp;: </form:label>
										</div>
										<div class="col-md-5">
											<form:input path="description" id="description" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
								<input type="submit" class="btn btn-primary" name="btn" value="Save" data-toggle="tooltip" data-placement="top" title="Save">
								<button type="button" onclick="goBack()" class="btn btn-primary" name="btn" data-toggle="tooltip" data-placement="top" title="Cancel">Cancel</button>
								</div>
							</div>
							</div>
						</div>
					</div>
					<br>	
					</form:form>
					
					<c:if test="${message==1}">                     
<h4 class="msg-succ">
<script>
	alert("Receipt Added Successfully");
</script>
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
<script>
	alert("Receipt Not Added Successfully");
</script>
</h4> 
</c:if>
	</div>
</div>	
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>				
</body>
</html>