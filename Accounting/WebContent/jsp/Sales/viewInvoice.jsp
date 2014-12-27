<%@page language="java" import="java.sql.*"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Sales Invoice</title>
<link rel="icon" href="<core:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<core:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<core:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<core:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<core:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<core:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<core:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<core:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<core:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<core:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<core:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<core:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<core:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<core:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<core:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>

<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>
<script type="text/javascript" src="<core:url value="/resources/highslide/highslide-with-html.js" />"></script>
	<link rel="stylesheet" type="text/css" href="<core:url value="/resources/highslide/highslide.css" />"/>
<script type="text/javascript">
    hs.graphicsDir = 'resources/highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>
<script>
function goBack()
	{
		window.history.back();
	}
</script>

</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
<!-- <div class="container"> -->
<%@ include file="innerHeader.jsp" %>
<br>

		       <div class="col-md-12">	   
					<div class="panel panel-default">
						<div class="panel-body">         
	            		<div class="col-md-10">	            		
			            	<ol class="breadcrumb">
			             	<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Invoice</small>          
			             	</ol>			             
			             </div>
			              <div class="col-md-2 pull right" >
			             	<div>
			             		<a href="invoice.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
			             </div>
			             </div>
			             </div>
			      </div><br>
			      
<script type="text/javascript">
$(document).ready(function(){
$("#edit").hover(
	  function(){
	    $(this).animate({width: 50,height: 50}, 300);
	  },
	  function(){
	      $(this).animate({width: 25,height: 25}, 300);
	});
$("#print").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 30,height: 30}, 300);
		});
$("#mail").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});

$("#challan").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
$("#applyPayment").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
$("#paymenthistory").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
});
</script>
			      <div>
			      <div class="col-md-8"></div>
					<c:if test="${salesInvoice.oc_status=='O' || salesInvoice.dstatus !='Completed'}">
					<a onclick="urlSubmit('editInvoice.do?invoiceId=${salesInvoice.txtInvID }','1')" title="Edit" data-toggle="tooltip" data-placement="top" title="Edit"><img id="edit" alt="" src="<core:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>
					</c:if>
					<a onclick="urlSubmit('salesinvoicePDF.do?invoiceId=${salesInvoice.txtInvID }','_blank')" title="Print" data-toggle="tooltip" data-placement="top" title="Print"><img id="print" alt="" src="<core:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
					<a onclick="urlSubmit('sendInvPdfMail.do?custId=${salesInvoice.custId}&id1=${salesInvoice.txtInvID }','1')" title="E-Mail"><img id="mail" alt="" src="<core:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
					<c:if test="${salesInvoice.dstatus !='Completed' }">
					<a onclick="urlSubmit('challanFromInvoice.do','1')" title="Delivery Challan" data-toggle="tooltip" data-placement="top" title="Delivery Challan"><img id="challan" alt="" src="<core:url value="/resources/images/challan.png" />" width="35px" height="35px"></a>
					</c:if>					
					<core:choose>
		    			<core:when test="${salesInvoice.oc_status=='O'}">	
		    				<a onclick="urlSubmit('newReceiptApplyPay.do?invoiceId=${salesInvoice.txtInvID}','1')" title="Apply Payment" data-toggle="tooltip" data-placement="top" title="Apply Payment"><img id="applyPayment" alt="" src="<core:url value="/resources/images/applyPayment.png" />" width="35px" height="35px"></a>
		    					<%-- <input type="button" name="btn" class="btn btn-primary" value="Apply Payment" onclick="urlSubmit('newReceiptApplyPay.do?invoiceId=${salesInvoice.txtInvID}','1')"> --%>
						</core:when>
				<core:otherwise>
						<img alt="" src="<core:url value="/resources/images/paid.png" />" width="35px" height="35px">
				</core:otherwise> 
				</core:choose>
				<a href="receivedPaymentHistory.do?invoiceId=${salesInvoice.txtInvID}" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '300',width: '800' })" title="Payment History" data-toggle="tooltip" data-placement="top" title="Payment History"><img id="paymenthistory" alt="" src="<core:url value="/resources/images/paymentHistory.png" />" width="35px" height="35px"></a>
				</div>
		       
		       <!-- <div class="col-md-12">
						        	<input type="button" value="Print" name="btn" onclick="urlSubmit('salesinvoicePDF.do?invoiceId=${salesInvoice.txtInvID }','_blank')" class="btn btn-primary">									 
									<input type="button" name="btn" value="E-Mail" onclick="urlSubmit('sendInvPdfMail.do?custId=${salesInvoice.custId}&id1=${salesInvoice.txtInvID }','1')" class="btn btn-primary">
									<input type="button" name="btn" value="Delivery Challan" onclick="urlSubmit('challanFromInvoice.do','1')" class="btn btn-primary">
									<input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editInvoice.do?invoiceId=${salesInvoice.txtInvID }','1')">		
									<core:choose>
		    							<core:when test="${salesInvoice.oc_status=='O'}">	
		    								<input type="button" name="btn" class="btn btn-primary" value="Apply Payment" onclick="urlSubmit('newReceiptApplyPay.do?invoiceId=${salesInvoice.txtInvID}','1')">
										</core:when>
										<%-- <core:otherwise>
											<input type="button" name="btn" class="btn btn-danger" value="Received">
										</core:otherwise> --%>
									</core:choose>
									<a href="receivedPaymentHistory.do?invoiceId=${salesInvoice.txtInvID}" class="btn btn-primary" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '450',width: '800' })">Payment History</a>
									<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
							</div> -->
		      <br>
<div class="col-md-12">
	<form:form action="" method="post" modelAttribute="salesInvoice" cssClass="form-inline" name="frm1" >
		<div class="panel panel-default">
		<div class="panel-body">	
		<div class="row">
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="row">
					<div class="col-sm-1"></div>
						<div class=""> 						
						<label>Invoice No : </label>
						<u>${salesInvoice.txtInvID}</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>Order No : </label>
						<u>${salesInvoice.orderId}</u>
						</div><br>
						<div class="col-sm-1"></div>
						<div class="">						
						<label>PO&nbsp;No:</label>
							<u>${salesInvoice.txtCPONo }</u>
						</div><br>
						<div class="col-sm-1"></div>
						<div class="">						
						<label>Customer&nbsp;Name:</label>			
						<input type="hidden" value="${salesInvoice.custId}">
							${salesInvoice.txtCName }
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="row">	
					<div class="col-sm-1"></div>										
						<div class="">			
						<label>Date : </label>
						${salesInvoice.txtDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>Delivery Date:</label>
						${salesInvoice. txtDueDate}
						</div>
					</div>
					<br>
					<div class="row">	
					<div class="col-sm-1"></div>										
						<div class="">			
						<label>Delivery Status : </label>
						${salesInvoice. dstatus}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						</div>
					</div>
				</div>
			</div>
		</div>	
		</div>
						<%-- <div class="row">
							<div class="col-md-2">
								<label>Invoice&nbsp;No:-</label>									
							</div>
							<div class="col-md-2">
							<label>${salesInvoice.txtInvID }</label>								
							</div>
							<div class="col-md-2">
								<label>Order&nbsp;Id:-</label>									
							</div>
							<div class="col-md-2">
							<label>${salesInvoice.orderId }</label>								
							</div>
							</div><br>
							<div class="row">
							<div class="col-md-2">		
								<label>Customer&nbsp;Name:-</label>
							</div>
							<div class="col-md-4">
							<label>${salesInvoice.txtCName }</label>													
							</div>
						</div>
		<br>			      
						<div class="row">
							<div class="col-md-2">
								<label>Date:-</label>									
							</div>
							<div class="col-md-3">
						<label>${salesInvoice.txtDate }</label>								
							</div>
							<div class="col-md-2">		
								<label>Due Date:-</label>
							</div>
							<div class="col-md-4">
							<label>${salesInvoice.txtDueDate }</label>													
							</div>
						</div> --%>
						<br>
						<div class="row">
							<div class="col-md-6">
								<div class="panel-default">
									<div class="panel-heading"><label>Billing Address</label></div>
									<div class="panel-body">
										<div class="row">											
											<div class="col-md-6">
												${salesInvoice.txtBillAddr}
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="panel-default">
									<div class="panel-heading"><label>Shipping Address</label></div>
									<div class="panel-body">
										<div class="row">
											<div class="col-md-6 pull right">												
												${salesInvoice.txtShipAddr}
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>	
						<%-- <div class="row">
							<div class="col-md-2">
								<label style="vertical-align: top">Bill To:-</label>									
							</div>
							<div class="col-md-3">
						<label>${salesInvoice.txtBillAddr}</label>								
							</div>
							<div class="col-md-2">		
								<label style="vertical-align: top">Ship To:-</label>
							</div>
							<div class="col-md-4">
							<label>${salesInvoice.txtShipAddr}</label>													
							</div>
						</div> --%>
						
					<br>
			
		<div class="table-responsive">
			<table id="tableID" class="table table-bordered">
		
								<tr>
									<th>Sr No</th>
									<th>Product</th>
									<th>Description</th>
									<th>Unit</th>
									<th>Quantity</th>
									<th>Disp. Qty</th>
									<th>Rem. Qty</th>									
									<th>Unit Price(INR)</th>									
									<th>Total(INR)</th>
								</tr>
								
							<core:forEach items="${salesInvoice.productList}" var="productList">
								<tr>
									<td> ${productList.srNo}</td>
									<td>${productList.itemCode}<input type="hidden" value="${productList.prodId }"></td>
									<td>${productList.des}</td>
									<td>${productList.unit}</td>
									<td>${productList.quantity}</td>
									<td>${productList.dQty}</td>
									<td>${productList.rQty}</td>									
									<td>${productList.unitPrice}</td>
									<td>${productList.itemTotal}</td>
								</tr>
								
								</core:forEach>
							</table>
							
						</div><br>
						<%-- <div class="row">				
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-5">
								<label>Customer&nbsp;PO&nbsp;No:-</label>
							</div>
							<div class="col-md-2">
								<label>${salesInvoice.txtCPONo}</label>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="row">
							<div class="col-md-4">
								<label>Charges:-	</label>
							</div>
							<div class="col-md-2">
								<label>${salesInvoice.txtTransCost }</label>
							</div>
						</div>
					</div>
				</div>
						 --%>
						<%-- <div class="row">
							<div class="col-md-4">
								<label>Customer&nbsp;PO&nbsp;No:-</label>									
							</div>
							<div class="col-md-3">
							<label>${salesInvoicesalesInvoice.txtCPONo}</label>								
							</div>
							<div class="col-md-2">		
								<label>Charges:-</label>
							</div>
							<div class="col-md-4">
							<label>${salesInvoice.txtTransCost }</label>													
							</div>
						</div> --%>
			<br>	
			
			<div class="row">
							<div class="col-md-6">
								<div class="panel-default">
									<div class="panel-heading"><label>Terms and Condition</label></div>
									<div class="panel-body">
										<div class="row">											
											<div class="col-md-6">
												${salesInvoice.txtpubNotes}
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="panel-default">
									<div class="panel-heading"><label>Private Notes</label></div>
									<div class="panel-body">
										<div class="row">
											<div class="col-md-6 pull right">												
												${salesInvoice.txtpvtNotes}
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>				
			
			<div class="col-md-6 pull-right">
					<div class="row">	<div class="col-md-4"></div>
					<div class="col-md-12">	
						<table id="tableID" class="table table-bordered" style="width:100%;">	
							<tr style="height: 1px;">
								<td><label>Charges :</label></td>
								<td style="text-align: right;">${salesInvoice.txtTransCost }</td>
							</tr>
							<tr>
								<td><label>Sub Total :</label></td>
								<td style="text-align: right;">${salesInvoice.txtSubTotal }</td>
							</tr>
							<core:choose>
								<core:when test="${salesInvoice.radio != 'null'}">								
								<tr>
									<td><label>Discount :</label></td>
									<td style="text-align: right;">
										<core:choose>
											<core:when test="${salesInvoice.radio=='per'}">
												@ ${salesInvoice.txtDiscount}&nbsp;%
											</core:when>		
											<core:otherwise>
												${salesInvoice.txtDiscount}
											</core:otherwise>
										</core:choose>
									</td>
								</tr>
								</core:when>
							 </core:choose>							
							<tr>
								<td><label>Total :</label></td>
								<td style="text-align: right;">${salesInvoice.txtDisTotal }</td>
							</tr>
							
							<core:choose>
								<core:when test="${bln!='blank'}">									
								<core:forEach items="${salesInvoice.taxList}" var="taxListNm">
								<tr>
								<td>
									<label>${taxListNm.taxType}&nbsp;@&nbsp;${taxListNm.taxRate}%:</label>									
								 </td>
								<td style="text-align: right;">
									<%-- <core:forEach items="${salesInvoice.taxList}" var="taxListAmt"> --%>
										${taxListNm.txtTaxValue}
									<%-- </core:forEach> --%>
								</td>
							</tr>
							</core:forEach>
								</core:when>
							</core:choose>
							<core:choose>
										<core:when test="${not empty salesInvoice.linkedTaxList}">	
											<tr>
												<td><label>Linked Taxes</label></td>
												<td></td>
											</tr>
										</core:when>
									</core:choose>
						<core:forEach items="${salesInvoice.linkedTaxList}" var="linkedTaxListNm">
							<tr>
								<td><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:</label></td>
								<td style="text-align: right;">${linkedTaxListNm.serLinkedTax}</td>
							</tr>
						</core:forEach>
						<tr>
							<td><label>Amount Payable :</label></td>
							<td style="text-align: right;">${salesInvoice.txtAmtPayble }</td>
						</tr>
							
						</table>
					</div>
					</div>
					</div>
			<%-- <div class="col-md-7"> 
						<div class="row">	
							<div class="col-md-6">						
								<div><label>Sub Total:-</label></div>								
								<div><label>Discount:-</label></div>						
								<div><label>Total:-</label></div>
								<core:choose>
								<core:when test="${bln!='blank'}">									
								<core:forEach items="${salesInvoice.taxList}" var="taxListNm">
									<div><label>${taxListNm.taxType}&nbsp;@&nbsp;${taxListNm.taxRate}%:-</label></div>
								</core:forEach>
								<!-- <div><label>Linked Taxes:-</label></div> -->
								<label style="color: green;">Linked Taxes </label><br>
								<core:forEach items="${salesInvoice.linkedTaxList}" var="linkedTaxListNm">
									<div><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:-</label></div>
								</core:forEach>
								</core:when>
								</core:choose>
								<div><label>Amount Payable:-</label></div>								
							</div>
							<div class="col-md-3">	
							<div><label>${salesInvoice.txtSubTotal}</label></div>  
							<core:choose>
								<core:when test="${salesInvoice.radio=='per'}">
									<div><label>@ ${salesInvoice.txtDiscount}&nbsp;%</label></div> 
								</core:when>		
								<core:otherwise>
									<div>${salesInvoice.txtDiscount}</div>
								</core:otherwise>
							</core:choose>
							<div><label>${salesInvoice.txtDisTotal}</label></div>
							<core:forEach items="${salesInvoice.taxList}" var="taxListAmt">
									<div><label>${taxListAmt.txtTaxValue}</label></div>
								</core:forEach>
								<label style="display: none;">   Hidden    </label><br>
								<core:forEach items="${salesInvoice.linkedTaxList}" var="linkedTaxListAmt">
									<div><label>${linkedTaxListAmt.serLinkedTax}</label></div>
								</core:forEach>
							<div><label>${salesInvoice.txtAmtPayble}</label></div>								
							</div>
						</div>						
					</div>								 --%>		<br>
			<%-- <div class="col-md-12">
						        	<input type="button" value="Print" name="btn" onclick="urlSubmit('salesinvoicePDF.do?invoiceId=${salesInvoice.txtInvID }','_blank')" class="btn btn-primary">									 
									<input type="button" name="btn" value="E-Mail" onclick="urlSubmit('sendInvPdfMail.do?custId=${salesInvoice.custId}&id1=${salesInvoice.txtInvID }','1')" class="btn btn-primary">
									<input type="button" name="btn" value="Delivery Challan" onclick="urlSubmit('challanFromInvoice.do','1')" class="btn btn-primary">
									<input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editInvoice.do?invoiceId=${salesInvoice.txtInvID }','1')">		
									<core:choose>
		    							<core:when test="${salesInvoice.oc_status=='O'}">	
		    								<input type="button" name="btn" class="btn btn-primary" value="Apply Payment" onclick="urlSubmit('newReceiptApplyPay.do?invoiceId=${salesInvoice.txtInvID}','1')">
										</core:when>
										<core:otherwise>
											<input type="button" name="btn" class="btn btn-danger" value="Received">
										</core:otherwise>
									</core:choose>
									<a href="receivedPaymentHistory.do?invoiceId=${salesInvoice.txtInvID}" class="btn btn-primary" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '450',width: '800' })">Payment History</a>
									<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
							</div> --%>
	</div>
	</div>

	</form:form>
		</div>
</div>
</body>
</html>
<script>
function urlSubmit(url,target)
{
	if(target=="1")
		{
		
			window.location.assign(url);
		}
	else
		{
			window.open(url,target);
		}

}
</script>