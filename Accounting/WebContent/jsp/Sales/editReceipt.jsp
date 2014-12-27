<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
function goBack()
	{
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
   
     else if(document.frmSalesReceipt.toaccount.value==" ")
     {
       alert("Please Select To Account");
       document.frmSalesReceipt.toaccount.focus();
       return false;
     }
     else if(document.frmSalesReceipt.balAmt.value=="")
     {
       alert("Balance Amount Should Not Empty");
       document.frmSalesReceipt.amount.focus();
       return false;
     } 
     else if(document.frmSalesReceipt.amount.value=="")
     {
       alert("Please Enter Amount");
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
     else if(document.frmSalesReceipt.fromaccount.value==" ")
     {
       alert("Please Select From Account");
       document.frmSalesReceipt.fromaccount.focus();
       return false;
     } 
 }
</script>
<SCRIPT type="text/javascript">
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
 
 function checkSame(id)
 {
	 var selID =id;	
	 var fromAc = document.getElementById("fromaccount");
	 var selfromAc = fromAc.options[fromAc.selectedIndex].text;
	 var toAc = document.getElementById("toaccount");
	 var seltoAc = toAc.options[toAc.selectedIndex].text;
	 if(selfromAc==seltoAc)
		 {
		 	alert("Please Select Different Accounts");
		 	if(selID=='fromaccount')
		 		{
		 			fromAc.options[1].selected=true;
		 		}
		 	else
		 		{
		 			toAc.options[1].selected=true;
		 		}	 
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
				
					<!-- <div class="container">		 -->		<br>			
						<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Receipts</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="receipts.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		            <div class="col-md-12">
		            	<form:form action="updateReceipt.do" cssClass="form-inline" modelAttribute="salesReceipts" name="frmSalesReceipt" onsubmit="return validateForm()">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<form:label path="receiptsNo">Receipt&nbsp;No&nbsp;:- </form:label>
										</div>
										<div class="col-md-5">
											<form:input path="receiptsNo" readonly="true" cssClass="form-control" ></form:input>
										</div>
									</div>
								</div>
								<div class="col-sm-2"></div>
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<form:label path="date">Date&nbsp;:- </form:label>
										</div>
										<div class="col-md-5">
											<input type="text" id="date" name="date" value="${salesReceipts.date}" class="form-control">
										</div>
									</div>
								</div>					
							</div><br>
							<div class="row">
								<div class="col-md-3">
								<div class="row">
										<div class="col-md-7">
											<label>Invoice&nbsp;Id:- </label>
										</div>
										<div class="col-md-5">
											<input name="invoiceId" id="invoiceId" readonly="readonly" value="${salesReceipts.invoiceId}" style="width:90px;" class="form-control"></input>
										</div>
									</div>
									<%-- <div class="row">
										<div class="col-md-7">
											<label>Invoice&nbsp;Id:- </label>
										</div>
										<div class="col-md-5">
										.<input name="invoiceId" id="invoiceId" readonly="readonly" value="${salesReceipts.invoiceId}" style="width:90px;" class="form-control"></input>
										<select name="invoiceId" id="invoiceId" class="form-control" onchange="showInvBal(this.value);showAccount(this.value);"><!--invoiceList  -->
											<option value=" ">--Select--</option>
											<option value="${salesReceipts.invoiceId}" selected="selected">${salesReceipts.invoiceId}</option>
											<c:forEach items="${invoiceList}" var="invoiceList">
												<option value="${invoiceList.txtInvID}">${invoiceList.txtInvID}</option>
											</c:forEach>
										</select>
											<form:input path="invoiceId" cssClass="form-control"></form:input>
										</div>
									</div> --%>
								</div>
								<div class="col-sm-2"></div>
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<form:label path="payMode">Payment&nbsp;Mode&nbsp;:- </form:label>
										</div>
										<div class="col-md-5">
											<form:select path="payMode" onchange="showToAccount(this.value);" cssClass="form-control">
												<option value=" ">---Select---</option>
												<option value="${salesReceipts.payMode}" selected="selected">${salesReceipts.payMode}</option>
												<option value="Cash">Cash</option>
												<option value="Cheque">Cheque</option>
											</form:select>
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3" id="frmAc">
									<div class="row">
										<div class="col-md-7">
											<form:label path="fromaccount">From&nbsp;Account&nbsp;:- </form:label>
										</div>
										<div class="col-md-5">
										<select name="fromaccount" id="fromaccount" onchange="checkSame(this.id)" style="width:200px;" class="form-control">
											<option value="${salesReceipts.fromAcNo}">${salesReceipts.fromaccount}</option>
											<%-- <option>--Select--</option>
											<c:forEach items="${accountList}" var="accountList">
												<option value="${accountList.txtNewAccNo}">${accountList.txtAccountName}</option>
											</c:forEach> --%>
										</select>
											<%-- <form:input path="fromaccount" cssClass="form-control"></form:input> --%>
										</div>
									</div>
								</div>
								<div class="col-sm-2"></div>
								<div class="col-md-3" id="toAc">
									<div class="row">
										<div class="col-md-7">
											<form:label path="toaccount">To&nbsp;Account&nbsp;:- </form:label>
										</div>
										<div class="col-md-5">
										<select name="toaccount" id="toaccount" onchange="checkSame(this.id)" style="width:200px;" class="form-control">
											<option>--Select--</option>
											<option value="${salesReceipts.toAcNo}" selected="selected">${salesReceipts.toaccount}</option>
											<%-- <c:forEach items="${accountList}" var="accountList">
												<option value="${accountList.txtNewAccNo}">${accountList.txtAccountName}</option>
											</c:forEach> --%>
										</select>
											
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<label>Bal Amt&nbsp;(INR):- </label>
										</div>
										<div class="col-md-5">
											<form:input path="balAmt" id="balAmt" readonly="true" cssStyle="text-align: right;width:90px;" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								<div class="col-sm-2"></div>
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<form:label path="amount">Amount&nbsp;(INR):- </form:label>
										</div>
										<div class="col-md-5">
											<form:input path="amount" cssClass="form-control" cssStyle="text-align: right;width:90px;" onkeypress="return isNumberKey(this)" onblur="checkAmt();"></form:input>
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<form:label path="tds">TDS&nbsp;:- </form:label>
										</div>
										<div class="col-md-5">
											<form:input path="tds" cssClass="form-control" cssStyle="text-align: right;width:90px;" onkeypress="return isNumberKey(this)"></form:input>
										</div>
									</div>
								</div>
								<div class="col-sm-2"></div>
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-7">
											<form:label path="description">Description&nbsp;:- </form:label>
										</div>
										<div class="col-md-5">
											<form:input path="description" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
								<button type="submit" class="btn btn-primary" name="btn" value="Save" data-toggle="tooltip" data-placement="top" title="Update">Update</button>
								<a href="receipts.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Cancel"> Cancel</a>
								</div>
							</div>
							</div>
						</div>
						</form:form>
					</div>
					<br>	
					
	</div>
</div>	
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>				
</body>
</html>