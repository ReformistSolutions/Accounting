<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>	
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Purchase Voucher</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/jquery-1.10.2.js" />" ></script>
<script src="<c:url value="/resources/js/bootstrap.js" />" ></script>
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>	
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
function showFromAccount()
{
	document.getElementById("showAccountName").innerHTML="";
	var paymode = document.getElementById("paymode").value;
	var xmlhttp;
	if (window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	else
	{
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() 
	{
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
		{
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
			{
				var abc = xmlhttp.responseText ;
				  var innerDiv = document.createElement('div');
				  innerDiv.id="linkedDiv";
				  innerDiv.innerHTML = abc;
				  document.getElementById("showAccountName").appendChild(innerDiv);
			}
		}
	}
	xmlhttp.open("GET", "retriveFromAccount.do?paymode=" + paymode, true);
	xmlhttp.send();
}

</script>
<!-- function showAvlBalance(id)
{
	
	document.getElementById("avlBalance").innerHTML="";
	var orderId = id;
	var xmlhttp;
	if (window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	else
	{
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() 
	{
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
		{
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
			{
				/* var abc = xmlhttp.responseText ;
				  var innerDiv = document.createElement('div');
				  innerDiv.id="linkedDiv";
				  innerDiv.innerHTML = abc; */
				  document.getElementById("avlBalance").value = xmlhttp.responseText ;				  
			} 
		}
	}
	xmlhttp.open("GET", "retriveAvlBalance.do?orderId=" + orderId, true);
	xmlhttp.send();
} -->
<script>
function validateForm()
{	   
	if(document.frmPurchaseVoucher.voucherNo.value=="")
	    {
	      alert("Voucher Number Should not be Empty...");
	      document.frmPurchaseVoucher.voucherNo.focus();
	      return false;
	    }
	   else if(document.frmPurchaseVoucher.orderId.value=="Select")
	      {
	          alert("Order Id Should not be empty....");
	          document.frmPurchaseVoucher.orderId.focus();
	          return false;
	        }
	  else if(document.frmPurchaseVoucher.accountNo.value=="Select")
    {
      alert("Please Select From Account");
      document.frmPurchaseVoucher.accountNo.focus();
      return false;
    }   
    else if(document.frmPurchaseVoucher.payMode.value=="Select")
    {
      alert("Please Select Payment Mode");
      document.frmPurchaseVoucher.payMode.focus();
      return false;
    } 
    else if(document.frmPurchaseVoucher.date.value=="")
    {
      alert("Date should not be empty.....");
      document.frmPurchaseVoucher.date.focus();
      return false;
    }
    else if(document.frmPurchaseVoucher.amount.value=="")
    {
      alert("Amount should not be empty.....");
      document.frmPurchaseVoucher.amount.focus();
      return false;
    }
    else if(document.frmPurchaseVoucher.tds.value=="")
    {
      alert("TDS should not be empty.....");
      document.frmPurchaseVoucher.tds.focus();
      return false;
    }
    else if(document.frmPurchaseVoucher.description.value=="")
    {
      alert("Description should not be empty.....");
      document.frmPurchaseVoucher.description.focus();
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
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div id="container"> -->
		<%@ include file="innerHeader.jsp" %>
					
					<!-- <div class="container">		 -->		<br>			
						<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Purchase<small>&nbsp;Voucher</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="purchaseVoucher.do" class="btn btn-primary btn-large"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		             <form:form action="updateVoucher.do" cssClass="form-inline" name="frmPurchaseVoucher" onsubmit="return validateForm()" modelAttribute="updatevoucher">
		             <div class="col-md-12">
		             	<c:if test="${message==1}">                     
								<h4 class="msg-succ">
								Voucher Updated Successfully.
								</h4> 
							</c:if>
							<c:if test="${message==0}">                     
								<h4 class="msg-error">
								Voucher Not Updated Successfully.
								</h4> 
							</c:if>
		             </div>
		            <div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-7">
											<%-- <form:input path="voucherNo" cssClass="form-control" ></form:input> --%>											
											<input type="text" name="voucherNo" class="form-control" style="width: 100px" readonly="readonly" value="${editvoucher.voucherNo}"/>											
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Purchase&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-7">
											<input name="orderId" class="form-control" value="${editvoucher.orderId}" readonly="readonly" autofocus="autofocus" onfocus="showAvlBalance(this.value);" id="${applyVoucher.orderId}"></input>
										</div>
									</div>
								</div>					
							</div><br>
							
							<div class="row">
							<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Date&nbsp;: </label>
										</div>
										<div class="col-md-7">
											<input type="text" name="date" class="form-control" value="${editvoucher.date}" id="dp1"/>
										</div>
									</div>
								</div><div class="col-sm-1"></div>
								<%-- <div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Amount&nbsp;: </label>
										</div>
										<div class="col-md-7">
											<input type="text" name="amount" class="form-control" onkeypress="return isNumberKey(this)" value="${editvoucher.amount}">
										</div>
									</div>
								</div> --%>
								</div><br>
							<div class="row">
							<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Payment&nbsp;Mode&nbsp;: </label>
										</div> 
										<div class="col-md-7">
											<select name="payMode" id="paymode" class="form-control" onchange="showFromAccount();">
												<option>${editvoucher.payMode}</option>
												<option value="Select">---Select---</option>
												<option value="Cash">Cash</option>	
												<option value="Cheque">Cheque</option>
												<!-- <option value="RTGS">RTGS</option> -->
											</select>	
										</div>
										<%-- <div class="col-md-7">   
										<select name="payMode" class="form-control">
												<option>${editvoucher.payMode}</option>
												<option>---Select---</option>
												<option>Cash</option>
												<option>Cheque</option>
												<option>RTGS</option>
											</select>
										</div> --%>
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div  id="showAccountName">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>From&nbsp;Account&nbsp;: </label>
										</div>
										<div class="col-md-7"> 
											<%-- <form:input path="accountNo" cssClass="form-control"></form:input> --%>
											<select class="form-control" name="accountNo" style="width:200px;"> 
												<option value="${editvoucher.accountNo}">${editvoucher.accName}</option>
												<%-- <option value="Select">---Select---</option>
												<c:forEach items="${accountList}" var="accountList">		 											
													<option value="${accountList.txtNewAccNo}">${accountList.txtAccountName}</option>													
											    </c:forEach> --%>
											</select>
										</div>
									</div>
								</div>
								</div>
							</div><br>	
								<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label> Avl Balance&nbsp;: </label>
										</div>
										<div class="col-md-7"> 
											<input type="text" name="avlBalance" id="avlBalance" value="${editvoucher.avlBalance}" readonly="readonly" class="form-control" onkeypress="return isNumberKey(this)"></input>
										</div>
									</div>
								</div> 
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Amount&nbsp;</label>
										</div>
										<div class="col-md-7">
											<input type="text" name="amount" value="${editvoucher.amount}" class="form-control" onkeypress="return isNumberKey(this)"></input>
										</div>
									</div>
								</div>
								
							</div><br>
							
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>TDS&nbsp;: </label>
										</div>
										<div class="col-md-7">
											<input type="text" name="tds" class="form-control" onkeypress="return isNumberKey(this)" value="${editvoucher.tds}">
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Description&nbsp;: </label>
										</div>
										<div class="col-md-7">
											<textarea name="description" rows="2" cols="35" class="form-control">${editvoucher.description}</textarea>
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
								<button type="submit" class="btn btn-primary" name="btn" value="Save" data-toggle="tooltip" data-placement="top" title="Update">Update</button>
								<a href="purchaseVoucher.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Cancel"> Cancel</a>
								</div>
								
							</div>
							</div>
						</div>
					</div>
					<br>	
					</form:form>
	</div>
<!-- </div> -->					
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>