<%@page language="java" import="java.sql.*"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Sales Order</title>
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
<script type="text/javascript">
    hs.graphicsDir = 'highslide/graphics/';
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
			             		<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Order</small>          
			             	</ol>			             
			             </div>
			              <div class="col-md-2 pull right" >
			             	<div>
			             		<a href="salesOrder.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
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

$("#invoice").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
});
</script>
		 <div>
			      <div class="col-md-9"></div>
					<c:if test="${salesOrder.invCreated=='No'}">
					<a onclick="urlSubmit('editOrder.do?orderId=${salesOrder.txtSOID }','1')" title="Edit" data-toggle="tooltip" data-placement="top" title="Edit"><img id="edit" src="<core:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>
					</c:if>
					<a onclick="urlSubmit('salesOrderPDF.do?salesOrderID=${salesOrder.txtSOID }','_blank')" title="Print" data-toggle="tooltip" data-placement="top" title="Print"><img id="print" alt="" src="<core:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
					<a onclick="urlSubmit('sendOrdPdfMail.do?custId=${salesOrder.custId}&id1=${salesOrder.txtSOID }','1')" title="E-Mail" data-toggle="tooltip" data-placement="top" title="E-Mail"><img id="mail" alt="" src="<core:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
					<core:choose>
						<core:when test="${salesOrder.invCreated=='No'}">
							<a onclick="urlSubmit('invoiceFromOrder.do','1')" title="Invoice" data-toggle="tooltip" data-placement="top" title="invoice"><img id="invoice" alt="" src="<core:url value="/resources/images/invoice.png" />" width="35px" height="35px"></a>
						</core:when>
						<core:otherwise>
							
						</core:otherwise>
					</core:choose>
					
				</div>
		<br>
		<div class="col-md-12">
		<form:form action="" method="post" cssClass="form-inline" modelAttribute="salesOrder" name="frm1">
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
						<label>Order No : </label>
						<u>${salesOrder.txtSOID}</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>PO No : </label>
						<u>${salesOrder.txtCPONo}</u>
						</div><br>
						<div class="col-sm-1"></div>
						<div class="">						
						<label>Customer&nbsp;Name:</label>			
						<input type="hidden" value="${salesOrder.custId}">
							${salesOrder.txtCName }
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
						${salesOrder.txtDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label>Delivery Date:</label>
						${salesOrder. txtDueDate}
						</div>
					</div>
				</div>
			</div>
		</div>	
		</div>
						<div class="row">
							<div class="col-md-6">
								<div class="panel-default">
									<div class="panel-heading"><label>Billing Address</label></div>
									<div class="panel-body">
										<div class="row">											
											<div class="col-md-6">
												${salesOrder.txtBillAddr}
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
												${salesOrder.txtShipAddr}
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>	
					<%-- 	<div class="row">
						
							<div class="col-md-1">
								<label>Order&nbsp;No:</label>
							</div>
							<div class="col-md-2">${salesOrder.txtSOID }</div>	
							<div class="col-md-2">
								<label>Customer&nbsp;Name:</label>
							</div>
							<div class="col-md-3">
							<input type="hidden" value="${salesOrder.custId}">
							${salesOrder.txtCName }
							</div>
							<div class="col-md-1">
								<label>Date:</label>
							</div>
							<div class="col-md-2">${salesOrder.txtDate}</div>	
						</div><br>
						<div class="row">	
						<div class="col-md-1">
								<label>PO&nbsp;No:</label>
							</div>
							<div class="col-md-2">${salesOrder.txtCPONo}</div>				
								
								<!-- <div class="col-md-2"></div> -->
							<div class="col-md-2">						
								<label>Delivery Date:</label>
							</div>
							<div class="col-md-2">${salesOrder. txtDueDate}</div>
					</div><br>
					<div class="row">
					
						<div class="col-md-2">
							<label style="vertical-align: top">Billing To:</label>	
						</div>	
						<div class="col-md-2">${salesOrder.txtBillAddr}</div>	
						<div class="col-md-2">			
							<label style="vertical-align: top">Ship To:</label>
						</div>
						<div class="col-md-2">${salesOrder.txtShipAddr}</div>
					</div> --%><br>		
				
	<div class="table-responsive">
			<table id="tableID" class="table table-bordered" border="1">		
								<tr>
									<th>Sr No</th>
									<th>Product</th>
									<th>Description</th>
									<th>Unit</th>
									<th>Quantity</th>
									<th>Inv. Qty</th>
									<th>Rem. Qty</th>
									<th>Unit Price(INR)</th>									
									<th>Total(INR)</th>
								</tr>								
							<core:forEach items="${salesOrder.productList}" var="productList">
								<tr>
									<td> ${productList.srNo}</td>
									<td>${productList.itemCode}</td>
									<td>${productList.des}</td>
									<td>${productList.unit}</td>
									<td>${productList.quantity}</td>
									<td>${productList.invQty}</td>
									<td>${productList.rQty}</td>
									<td>${productList.unitPrice}</td>										
            						<td>${productList.itemTotal}</td>            					
								</tr>
								</core:forEach>
							</table>							
						</div>
					
					<br>	
					<div class="row">
							<div class="col-md-6">
								<div class="panel-default">
									<div class="panel-heading"><label>Terms and Condition</label></div>
									<div class="panel-body">
										<div class="row">											
											<div class="col-md-6">
												${salesOrder.txtpubNotes}
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
												${salesOrder.txtpvtNotes}
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>	
			<%-- <div class="row">					
						<div class="col-md-2">
							<label>Public Note :</label>
						</div>	
						<div class="col-md-4">${salesOrder.txtpubNotes}</div>	
						<div class="col-md-2">			
							<label>Private Note :</label>
						</div>
						<div class="col-md-2">${salesOrder.txtpvtNotes}</div>
			</div> --%><br>	
					<div class="col-md-6 pull-right"> 
					<div class="row">	<div class="col-md-4"></div>
					<div class="col-md-12">	
						<table id="tableID" class="table table-bordered" style="width:100%;">	
							<tr style="height: 1px;">
								<td><label>Charges :</label></td>
								<td style="text-align: right;">${salesOrder.txtTransCost }</td>
							</tr>
							<tr>
								<td><label>Sub Total :</label></td>
								<td style="text-align: right;">${salesOrder.txtSubTotal }</td>
							</tr>
							<core:choose>
								<core:when test="${salesOrder.radio != 'null'}">								
							<tr>
								<td><label>Discount :</label></td>
								<td style="text-align: right;">
									<core:choose>
										<core:when test="${salesOrder.radio=='per'}">
											@ ${salesOrder.txtDiscount}&nbsp;%
										</core:when>		
										<core:otherwise>
											${salesOrder.txtDiscount}
										</core:otherwise>
									</core:choose>
								</td>
							</tr>
							</core:when>
							</core:choose>
							<tr>
								<td><label>Total :</label></td>
								<td style="text-align: right;">${salesOrder.txtDisTotal }</td>
							</tr>							
							<core:choose>
								<core:when test="${bln!='blank'}">									
								<core:forEach items="${salesOrder.taxList}" var="taxListNm">
								<tr>
								<td>
									<label>${taxListNm.taxType}&nbsp;@&nbsp;${taxListNm.taxRate}%:</label>									
								</td>
								<td style="text-align: right;">
									<%-- <core:forEach items="${salesOrder.taxList}" var="taxListAmt" > --%>
										${taxListNm.txtTaxValue}
									<%-- </core:forEach> --%>
								</td>
							</tr>
							</core:forEach>
								</core:when>
							</core:choose>
							<core:choose>
										<core:when test="${not empty salesOrder.linkedTaxList}">	
											<tr>
												<td><label>Linked Taxes</label></td>
												<td></td>
											</tr>
										</core:when>
									</core:choose>
						<core:forEach items="${salesOrder.linkedTaxList}" var="linkedTaxListNm">
							<tr>
								<td><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:</label></td>
								<td style="text-align: right;">${linkedTaxListNm.serLinkedTax}</td>
							</tr>
						</core:forEach>
						<tr>
							<td><label>Amount Payable :</label></td>
							<td  style="text-align: right;">${salesOrder.txtAmtPayble }</td>
						</tr>
							
						</table>
					</div>
					</div>
					</div>
			<%-- <div class="col-md-7 pull-right"> 
						<div class="row">	<div class="col-md-2"></div>
							<div class="col-md-7">	
								<div><label>Charges :</label></div>					
								<div><label>Sub Total :</label></div>								
								<div><label>Discount :</label></div>						
								<div><label>Total :</label></div>
								<core:choose>
								<core:when test="${bln!='blank'}">									
								<core:forEach items="${salesOrder.taxList}" var="taxListNm">
									<div><label>${taxListNm.taxType}&nbsp;@&nbsp;${taxListNm.taxRate}%:</label></div>
								</core:forEach>
								<core:choose>
								<core:when test="${not empty salesOrder.linkedTaxList}">	
									<label style="color: green;">Linked Taxes </label>
								</core:when>
								</core:choose>
								<core:forEach items="${salesOrder.linkedTaxList}" var="linkedTaxListNm">
									<div><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:</label></div>
								</core:forEach>
								</core:when>
								</core:choose>
								<div><label>Amount Payable :</label></div>								
							</div>
							<div class="col-md-3">	
							<div>${salesOrder.txtTransCost }</div>
							<div>${salesOrder.txtSubTotal}</div>  
							<core:choose>
								<core:when test="${salesOrder.radio=='per'}">
									<div>@ ${salesOrder.txtDiscount}&nbsp;%</div> 
								</core:when>		
								<core:otherwise>
									<div>${salesOrder.txtDiscount}</div>
								</core:otherwise>
							</core:choose><br>
							<div>${salesOrder.txtDisTotal}</div>
							<core:forEach items="${salesOrder.taxList}" var="taxListAmt">
									<div>${taxListAmt.txtTaxValue}</div>
								</core:forEach>
								<label style="display: none;">   Hidden    </label><br><br>
								<core:forEach items="${salesOrder.linkedTaxList}" var="linkedTaxListAmt">
									<div>${linkedTaxListAmt.serLinkedTax}</div>
								</core:forEach>
							<div>${salesOrder.txtAmtPayble}</div>								
							</div>
						</div>						
				</div> --%>
			<br>
			<%-- <div class="col-md-12">
						        	<input type="button" value="Print" name="btn" onclick="urlSubmit('salesOrderPDF.do?salesOrderID=${salesOrder.txtSOID }','_blank')" class="btn btn-primary">									 
									<input type="button" name="btn" value="E-Mail" onclick="urlSubmit('sendOrdPdfMail.do?custId=${salesOrder.custId}&id1=${salesOrder.txtSOID }','1')" class="btn btn-primary">
									<input type="button" name="btn" value="Invoice" onclick="urlSubmit('invoiceFromOrder.do','1')" class="btn btn-primary">				
									<input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editOrder.do?orderId=${salesOrder.txtSOID }','1')">
									<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
							</div>
			 --%>
				
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