<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Purchase Quotation</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon"> 
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">

<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
 <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> 
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
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
<script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script>
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
$("#order").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
});
</script>
</head>
<!-- <body> -->
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div id="container"> -->
		<%@ include file="innerHeader.jsp" %>	
	
	<input type="hidden" name="hide" id="hidden" />
		<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;View<small>&nbsp;Quotation</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="purchaseQuotation.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		</div><br>
		             <div><div class="col-md-9"></div>
							<c:if test="${viewquotation.orderCreated=='No'}">
							<a onclick="urlSubmit('editQuotation.do?quoationId=${viewquotation.txyQuotationNo}','1')" title="Edit"><img id="edit" alt="" src="<c:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>								
							</c:if>
							<a onclick="urlSubmit('purchaseQuotationPDF.do?quotationID=${viewquotation.txyQuotationNo}','_blank')" title="Print"><img id="print" alt="" src="<c:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
							<a onclick="urlSubmit('purchaseQuotationcompose_Mail.do?vendId=${viewquotation.venderID}&id1=${viewquotation.txyQuotationNo}','1')" title="E-Mail"><img id="mail" alt="" src="<c:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
							<c:if test="${viewquotation.orderCreated=='No'}">
							<a onclick="urlSubmit('order.do?orderID=${viewquotation.txyQuotationNo}','1')" title="Order"><img id="order" alt="" src="<c:url value="/resources/images/purchasequotation.png" />" width="35px" height="35px"></a>								
							</c:if>
							</div><br>
		<form:form action=""  cssClass="form-inline" modelAttribute="viewquotation">
		<div class="col-md-12">
		<div class="panel panel-default">
		<div class="panel-body">
		<%-- <div class="row">
			<div class="col-md-6">
			<label>Quotation No : </label>
			<form:input path="txyQuotationNo" cssClass="form-control"></form:input>
			<label>${viewquotation.txyQuotationNo}</label>
			</div>
			<div class="col-md-6 pull right"><!-- <div class="col-md-3"></div> -->			
			<label>Date : </label>
			<form:input cssClass="form-control" path="txtQuotationDate"></form:input>
			<label>${viewquotation.txtQuotationDate}</label>
			</div>			
		</div><br> --%>
		<%-- <div class="row">
		<div class="col-md-6">
			<label>Vender Name : </label> 			
			<label>${viewquotation.txtCustName}</label>
			<input type="hidden" name="venderID" value="${viewquotation.venderID}"/>			
		</div>
		</div> --%>
		<div class="row">
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="row">
					<div class="">
						<div class="col-sm-1"></div>
						<label>Vender Name : </label> 			
						${viewquotation.txtCustName}
						</div>
							<br>
							<div class="">
						<div class="col-sm-1"></div>	
						<label>Date : </label>
						${viewquotation.txtQuotationDate}
						</div>
						<br>
						
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="row">
						<div class=""> 
						<div class="col-sm-1"></div> 
						<label>Quotation No : </label>
						<u>${viewquotation.txyQuotationNo}</u>
						</div>										
						
					</div>
				</div>
			</div>
		</div>	
		</div>				
		<br>
		<div class="row">
							<div class="col-md-6">
								<div class="panel-default">
									<div class="panel-heading"><label>Billing Address</label></div>
									<div class="panel-body">
										<div class="row">											
											<div class="col-md-6">
												${viewquotation.txtBillingTo}<br>
												${viewquotation.txtBillingCity}, 
												${viewquotation.txtBillingState}<br>
												${viewquotation.txtBillingPinCode}
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
												${viewquotation.txtAreaShipto}<br>
												${viewquotation.txtShippingCity}, 
												${viewquotation.txtShippingState}<br>
												${viewquotation.txtShippingPinCode}
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>
		 <div class="row">
			<%-- <div class="col-md-6">
			<label>Billing To : </label>
			<label>${viewquotation.txtBillingTo}</label> 
			</div>
			<div class="col-md-6 pull right"><!-- <div class="col-md-3"></div> -->
			<label>Shipping To : </label>
			<label>${viewquotation.txtAreaShipto}</label>
			</div> --%>
		</div>	<br>			
		<center>
		<div class="table-responsive" style="width: 90%;">	
			<table class="table table-bordered" id="tableID">
				<thead>
					<tr>
						<th>Sr No</th>
						<th>Item Name</th>
						<th>Description</th>
						<th>Unit of Measure</th>
						<th>Quantity</th>
						<th>Unit Price(INR)</th>
						<th>Total(INR)</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${viewquotation.productList }" var="productList">
					<tr>
						<td>${productList.srNo} <!-- <input name="txtSrNo1" id="txtSrNo1" class="form-control" style="width: 50px;"/> --></td>
						<td>${productList.itemCode} <!-- <input name="txtDes1" class="form-control"> --></td>
						<td>${productList.des}<!-- <input name="txtDes1" class="form-control"> --></td>
						<td>${productList.unit}<!-- <input name="txtDes1" class="form-control"> --></td>
						<td>${productList.quantity}<!-- <input name="txtQuant1" class="form-control" style="width: 80px;"> --></td>
						<td>${productList.unitPrice}<!-- <input name="txtUnitPrice1" class="form-control" style="width: 90px;"> --></td>
						<td>${productList.itemTotal}<!-- <input name="txtTotal1" class="form-control" style="width: 80px;"> --></td>
						
					</tr>
					</c:forEach> 
				</tbody>
			</table>			
		</div></center><br>
		</div>
			<div class="row">
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"><label>Terms and Condition</label></div>
				<div class="panel-body">
					<div class="row">
						<div class=""> 
						<div class="col-sm-1"></div> 						
						${viewquotation.txtPubNotes}
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"><label>Private Note</label></div>
				<div class="panel-body">
					<div class="row">
						<div class=""> 
						<div class="col-sm-1"></div> 
						${viewquotation.txtPvtNotes }
						</div>
					</div>
				</div>
			</div>
		</div>	
		</div>
			<br>
			<div class="col-md-5"></div>			
			<div class="col-md-5">			
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td>Amount Payable</td>
						<td>${viewquotation.txtAmtPayble}</td>
					</tr>
				</tbody>
			</table> 
<!-- <div class="row">	
<div class="col-md-6">	 -->
<!-- <div><label>Sub Total:-</label></div>	
<div><label>Discount:-</label></div>	
<div><label>Total:-</label></div> -->
<%-- <c:choose>
<c:when test="${bln!='blank'}">	
<c:forEach items="${viewquotation.taxList}" var="taxListNm">
<div><label>${taxListNm.taxType}&nbsp;@&nbsp;${taxListNm.taxRate}%:-</label></div>
</c:forEach>
<!-- <div><label>Linked Taxes:-</label></div> -->
<label style="color: green;">Linked Taxes </label><br>
<c:forEach items="${viewquotation.linkedTaxList}" var="linkedTaxListNm">
<div><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:-</label></div>
</c:forEach>
</c:when>
</c:choose> --%>
<!-- <div><label>Amount Payable:-</label></div>	
</div> 
<div class="col-md-3">	-->
<%-- <div><label>${viewquotation.txtSubTotal}</label></div>  
<c:choose>
<c:when test="${viewquotation.radio=='per'}">
<div><label>@ ${viewquotation.txtDiscount}&nbsp;%</label></div> 
</c:when>	
<c:otherwise>
<div>${viewquotation.txtDiscount}</div>
</c:otherwise>
</c:choose>
<div><label>${viewquotation.txtDisTotal}</label></div>
<c:forEach items="${viewquotation.taxList}" var="taxListAmt">
<div><label>${taxListAmt.txtTaxValue}</label></div>
</c:forEach>
<label style="display: none;">   Hidden    </label><br>
<c:forEach items="${viewquotation.linkedTaxList}" var="linkedTaxListAmt">
<div><label>${linkedTaxListAmt.serLinkedTax}</label></div>
</c:forEach>
 --%>
<%-- <div><label>${viewquotation.txtAmtPayble}</label></div>	 
</div>
</div>	--%>
</div><br><br>
				
				<%-- <div class="col-md-7"> 
						<div class="row">	
							<div class="col-md-7">						
								<div><label>Sub Total:-</label></div>
								<div><label>Discount Type:-</label></div>	
								<div><label>Discount Value:-</label></div>						
								<div><label>Total:-</label></div>
								
								<c:forEach items="${viewquotation.taxList}" var="taxList">
									<div><label>${taxList.taxType}&nbsp;@&nbsp;${taxList.taxRate}%:-</label></div>
								</c:forEach>
								<!-- <div><label>Linked Taxes:-</label></div> -->
								<label style="color: green;">Linked Taxes </label><br>
								<c:forEach items="${viewquotation.linkedTaxList}" var="linkedTaxListNm">
									<div><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:-</label></div>
								</c:forEach>
								<div><label>Amount Payable:-</label></div>								
							</div>
							<div class="col-md-4">	
							<div><label>${viewquotation.txtSubTotal}</label></div>  
							<c:choose>
								<c:when test="${viewquotation.radio=='per'}"><div><label>Percentage (%)</label></div></c:when>		
								<c:otherwise><div><label>Amount</label></div></c:otherwise>
							</c:choose>							
							<div><label>${viewquotation.txtDiscount}</label></div>  																
							<div><label>${viewquotation.txtDisTotal}</label></div>
							<c:forEach items="${viewquotation.taxList}" var="taxList">
									<div><label>${taxList.txtTaxValue}</label></div>
								</c:forEach>
								<label style="display: none;">   Hidden    </label><br>
								<c:forEach items="${viewquotation.linkedTaxList}" var="linkedTaxListAmt">
									<div><label>${linkedTaxListAmt.serLinkedTax}</label></div>
								</c:forEach>
							<div><label>${viewquotation.txtAmtPayble}</label></div>								
							</div>
						</div>				<br><br>		
									
</div> --%><br><br>
		
		<%-- <div class="row"><div class="col-md-5">
		<input type="button" value="Edit" name="btn" class="btn btn-primary" onclick="urlSubmit('editQuotation.do?quoationId=${viewquotation.txyQuotationNo}','1')">
		<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('purchaseQuotationPDF.do?quotationID=${viewquotation.txyQuotationNo}','_blank')">
			<input type="button" value="E-Mail" name="btn" class="btn btn-primary" onclick="urlSubmit('purchaseQuotationcompose_Mail.do?vendId=${viewquotation.venderID}&id1=${viewquotation.txyQuotationNo}','1')">
			<input type="button" value="Create Order" name="btn" class="btn btn-primary" onclick="urlSubmit('order.do?orderID=${viewquotation.txyQuotationNo}','1')">
		</div>
		<br><br>
			
		<br>
		</div> --%>
</div></div>
		</form:form>
</div>
<!-- </div> -->
</body>
</html>