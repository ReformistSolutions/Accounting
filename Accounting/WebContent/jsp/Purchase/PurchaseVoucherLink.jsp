<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.text.SimpleDateFormat"%>
   <%@ page import="javax.servlet.*,java.text.*" %>
   <%@page import="java.util.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Purchase Voucher</title>
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
function showAvlBalance(id)
{
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
				  innerDiv.innerHTML = abc;
				  document.getElementById("avlBalance").appendChild(innerDiv);	 */					
				document.getElementById("avlBalance").value = xmlhttp.responseText ;
			}
		}
	}
	xmlhttp.open("GET", "retriveAvlBalance.do?orderId=" + orderId, true);
	xmlhttp.send();
}
</script>
<script type="text/javascript">
function chkAmount()
{
	var currentAmount = document.getElementById("amount").value;	
	var balAmount = document.getElementById("avlBalance").value;
	if(parseFloat(currentAmount) > parseFloat(balAmount))
	{
		alert("Amount should not greater than Payble Amount.");
		document.getElementById("amount").value = "";
		document.frmPurchaseVoucher.amount.focus();
	}	
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
			             	<button name="back" class="btn btn-primary btn-large" onclick="backPage()"><i class="fa fa-reply"></i> Back</button>
			             	</div>
		             	</div>
		             	</div>
		             </div><br>
		             <form:form action="addVoucher.do" cssClass="form-inline" modelAttribute="purchaseVoucher">
		             <div class="col-md-12">
		             	<c:if test="${message==1}">                     
								<h4 class="msg-succ">
								Voucher Added Successfully.
								</h4> 
							</c:if>
							<c:if test="${message==0}">                     
								<h4 class="msg-error">
								Voucher Not Added Successfully.
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
											<form:label path="voucherNo">Voucher&nbsp;No&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<%-- <form:input path="voucherNo" cssClass="form-control" ></form:input> --%>					 						
											<input type="text" name="voucherNo" class="form-control" style="width: 100px" readonly="readonly" value="${voucherId.voucherNo}"/>											
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="orderId">Purchase&nbsp;No&nbsp;: </form:label> 
										</div>
										<div class="col-md-7">
											<input type="text" name="orderId" class="form-control" value="${purchaseVoucher.orderId}" readonly="readonly" autofocus="autofocus" onfocus="showAvlBalance(this.value);" id="${applyVoucher.orderId}">											
										</div>
									</div>
								</div>					
							</div><br>
							<div class="row">
							<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="date">Date&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
										<%
													DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
													Date date = new Date();
													String dt = dateFormat.format(date);
											%>  
											<input type="text" id="dp1" value="<%=dt %>" name="date" class="form-control"/>
										</div>
									</div>
								</div><div class="col-sm-1"></div>
								<%-- <div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="amount">Amount&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<form:input path="amount" cssClass="form-control"></form:input>
										</div>
									</div>
								</div> --%>
						</div><br>
							<div class="row">
							<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="payMode">Payment&nbsp;Mode&nbsp;: </form:label>
										</div> 
										<div class="col-md-7">
											<select name="payMode" id="paymode" class="form-control" onchange="showFromAccount();">
												<option value="Select">---Select---</option>
												<option value="Cash">Cash</option>	
												<option value="Cheque">Cheque</option>
												<!-- <option value="RTGS">RTGS</option> -->
											</select>	
										</div>
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
											<select name="accountNo" class="form-control" style="width:200px;">
												<option value="Select">---Select---</option>
												<%-- <c:forEach items="${accountList}" var="accountList">		 											
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
											<form:label path="amount">Payble Amt&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<input type="text" name="avlBalance" id="avlBalance" readonly="readonly" class="form-control" onkeypress="return isNumberKey(this)"></input>
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="amount">Amount&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<input type="text" name="amount" id="amount" onblur="chkAmount()" class="form-control" onkeypress="return isNumberKey(this)"></input>
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="tds">TDS&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<form:input path="tds" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<form:label path="description">Description&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<%-- <form:input path="description" cssClass="form-control"></form:input> --%>
											<textarea name="description" rows="2" cols="35" class="form-control">${editvoucher.description}</textarea>
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
								<button type="submit" class="btn btn-primary" name="btn" value="Save" data-toggle="tooltip" data-placement="top" title="Save">Save</button>
								<button type="button" onclick="cancel();" class="btn btn-primary" name="btn" data-toggle="tooltip" data-placement="top" title="Cancel">Cancel</button>
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