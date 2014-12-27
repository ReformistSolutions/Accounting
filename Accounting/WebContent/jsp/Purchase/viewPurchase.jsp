<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Purchase Order</title>
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
<script type="text/javascript" src="<c:url value="/resources/highslide/highslide-with-html.js" />"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/highslide/highslide.css" />"/>
<script type="text/javascript">
    hs.graphicsDir = 'resources/highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>
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
$("#payment").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
$("#paid").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
$("#history").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
});
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div id="container"> -->
		<%@ include file="innerHeader.jsp" %> 
		 
		<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;View<small>&nbsp;Purchase</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="purchases.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		             <br>
		             <div><div class="col-md-9"></div>
							<a onclick="urlSubmit('editPurchases.do?purchaseId=${purchases.txtPurchaseNo}','1')" title="Edit"><img id="edit" alt="" src="<c:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>
							<a onclick="urlSubmit('purchasePDF.do?purchaseId=${purchases.txtPurchaseNo}','_blank')" title="Print"><img id="print" alt="" src="<c:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
							<a onclick="urlSubmit('purchasecompose_Mail.do?vendId=${purchases.venderID}&id1=${purchases.txtPurchaseNo}','1')" title="E-Mail"><img id="mail" alt="" src="<c:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
							<c:choose>
				<c:when test="${yes == 'yes'}">
					<a onclick="urlSubmit('purchasePayment.do?purchaseId=${purchases.txtPurchaseNo}','1')" title="Apply Payment"><img id="payment" alt="" src="<c:url value="/resources/images/payment.png" />" width="35px" height="35px"></a>
					<%-- <input type="button" value="Apply Payment" name="btn" class="btn btn-primary" onclick="urlSubmit('purchasePayment.do?purchaseId=${purchases.txtPurchaseNo}','1')"> --%>
				</c:when>
				<c:when test="${no == 'no'}">
					<img id="paid" alt="" src="<c:url value="/resources/images/paid.png" />" width="35px" height="35px" title="Paid">
				</c:when>
				<c:otherwise>
					<label class="btn btn-danger">Not Yet proceed</label>
				</c:otherwise>
			</c:choose>
			<a href="paymentHistory.do?purchaseNo=${purchases.txtPurchaseNo}" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '300',width: '800' })" title="Payment History"><img id="history" alt="" src="<c:url value="/resources/images/history.png" />" width="35px" height="35px"></a>
							</div><br>
		             <form:form action="" cssClass="form-inline" modelAttribute="purchases">
		             <div class="col-md-12">
							<div class="panel panel-default">
							<div class="panel-body">
							<div class="row">
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="row">
						<div class="">
						<div class="col-sm-1"></div>
						<label>Vendor Name : </label> 			
						${purchases.selSupplierName}
						</div>
						<br>
						<div class=""> 
						<div class="col-sm-1"></div> 
						<label> Date : </label>			
						${purchases.txtPurchaseDate }
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
						<div class=""> 
						<div class="col-sm-1"></div> 
						<label >Purchase Order No :</label>
						<u>${purchases.txtPurchaseNo}</u>
						</div>	
							
						<br>
						<div class="">
						<div class="col-sm-1"></div>
						<label>Due Date : </label>
						${purchases.txtDueDate}
						</div>
					</div>
				</div>
			</div>
		</div>	
		</div>
		<div class="row">
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"><label>Address</label></div>
				<div class="panel-body">
					<div class="row">
						<div class=""> 
						<div class="col-sm-1"></div> 
						<label>Address : </label> 			
						${purchases.txtAreaAddress}
						</div>							
					</div>
				</div>
			</div>
		</div>		
		</div>				
		<br>
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
				<c:forEach items="${purchases.productList }" var="productList">
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
		<div class="row">
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"><label>Terms and Condition</label></div>
				<div class="panel-body">
					<div class="row">
						<div class=""> 
						<div class="col-sm-1"></div> 						
						${purchases.txtPubNotes}
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
						${purchases.txtPvtNotes }
						</div>
					</div>
				</div>
			</div>
		</div>	
		</div>
		<div class="col-md-6"></div>
		<div class="col-md-5">
		<table id="tableID" class="table table-bordered">	
<tr>
<td><label>Sub Total :</label></td>
<td>${purchases.txtSubTotal }</td>
</tr>
<tr>
<td><label>Discount :</label></td>
<td>
<c:choose>
<c:when test="${purchases.radio=='per'}">
@ ${purchases.txtDiscount}&nbsp;%
</c:when>	
<c:otherwise>
${purchases.txtDiscount}
</c:otherwise>
</c:choose>
</td>
</tr>
<tr>
<td><label>Total :</label></td>
<td>${purchases.txtDisTotal }</td>
</tr>

<c:choose>
<c:when test="${bln!='blank'}">	
<c:forEach items="${purchases.taxList}" var="taxListNm">
<tr>
<td>
<label>${taxListNm.taxType}&nbsp;@&nbsp;${taxListNm.taxRate}%:</label>	
 </td>
<td>
<c:forEach items="${purchases.taxList}" var="taxListAmt">
${taxListAmt.txtTaxValue}
</c:forEach>
</td>
</tr>
</c:forEach>
</c:when>
</c:choose>
<c:choose>
<c:when test="${not empty purchases.linkedTaxList}">	
<tr>
<td><label>Linked Taxes</label></td>
<td></td>
</tr>
</c:when>
</c:choose>
<c:forEach items="${purchases.linkedTaxList}" var="linkedTaxListNm">
<tr>
<td><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:</label></td>
<td>${linkedTaxListNm.serLinkedTax}</td>
</tr>
</c:forEach>
<tr>
<td><label>Amount Payable :</label></td>
<td>${purchases.txtAmtPayble }</td>
</tr>

</table>
</div>		
<br>
							
		<%-- <div class="row">
		<div class="col-md-6"><div class="col-md-3"></div>
			<label >Purchase No :</label>
			<form:input path="txtPurchaseOrdNo" cssClass="form-control"/>
			<label>${purchases.txtPurchaseNo} </label>
			</div>
		<div class="col-md-6">
			<label> Date : </label>			
			<label>${purchases.txtPurchaseDate }</label>			
			</div>							
		</div><br>
		<div class="row">			
			<div class="col-md-6"><div class="col-md-3"></div>
			<label>Vendor Name:</label>			
			<label>${purchases.selSupplierName}</label>
			</div>
			<div class="col-md-6">
			<label>Due Date : </label>
			<form:input path="txtDueDate" cssClass="form-control"/>
			<label>${purchases.txtDueDate}</label>
			</div>
			
		</div><br>
		<div class="row">
		<div class="col-md-6">
		<div class="col-md-3"></div>
			<label>Address : </label> 
			<form:textarea path="txtAreaAddress" rows="2" cols="25" cssClass="form-control"></form:textarea>
			<label>${purchases.txtAreaAddress}</label>
		</div>
		</div><br>
		<div class="table-responsive" style="width: 90%;"> 	
			<table class="table table-striped" id="tableID">
				<thead>
					<tr>
						<th>Sr No</th>
						<th>Item Name</th>
						<th>Description</th>
						<th>Unit</th>
						<th>Quantity</th>
						<th>Unit Price</th>						
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${purchases.productList }" var="productList">
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
		</div><br>
		<div class="col-md-5">
				<div class="col-md-5"><label>Public Note :</label></div>
			<div><label>${purchases.txtPubNotes}</label></div></div>
				<div class="col-md-7"> 
<div class="row">	
<div class="col-md-6">	
<div><label>Sub Total:-</label></div>	
<div><label>Discount:-</label></div>	
<div><label>Total:-</label></div>
<c:choose>
<c:when test="${bln!='blank'}">	
<c:forEach items="${purchases.taxList}" var="taxListNm">
<div><label>${taxListNm.taxType}&nbsp;@&nbsp;${taxListNm.taxRate}%:-</label></div>
</c:forEach>
<!-- <div><label>Linked Taxes:-</label></div> -->
<label style="color: green;">Linked Taxes </label><br>
<c:forEach items="${purchases.linkedTaxList}" var="linkedTaxListNm">
<div><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:-</label></div>
</c:forEach>
</c:when>
</c:choose>
<div><label>Amount Payable:-</label></div>	
</div>
<div class="col-md-3">	
<div><label>${purchases.txtSubTotal}</label></div>  
<c:choose>
<c:when test="${purchases.radio=='per'}">
<div><label>@ ${purchases.txtDiscount}&nbsp;%</label></div> 
</c:when>	
<c:otherwise>
<div>${purchases.txtDiscount}</div>
</c:otherwise>
</c:choose>
<div><label>${purchases.txtDisTotal}</label></div>
<c:forEach items="${purchases.taxList}" var="taxListAmt">
<div><label>${taxListAmt.txtTaxValue}</label></div>
</c:forEach>
<label style="display: none;">   Hidden    </label><br>
<c:forEach items="${purchases.linkedTaxList}" var="linkedTaxListAmt">
<div><label>${linkedTaxListAmt.serLinkedTax}</label></div>
</c:forEach>
<div><label>${purchases.txtAmtPayble}</label></div>	
</div>
</div>	
</div><br><br>
			<div class="row"><div class="col-md-3"></div>
			<input type="button" value="Edit" name="btn" class="btn btn-primary" onclick="urlSubmit('editPurchases.do?purchaseId=${purchases.txtPurchaseNo}','1')">
			<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('purchasePDF.do?purchaseId=${purchases.txtPurchaseNo}','_blank')">
			<input type="button" value="E-Mail" name="btn" class="btn btn-primary" onclick="urlSubmit('purchasecompose_Mail.do?vendId=${purchases.venderID}&id1=${purchases.txtPurchaseNo}','1')">
			<input type="button" value="Apply Payment" name="btn" class="btn btn-primary" onclick="urlSubmit('purchasePayment.do?purchaseId=${purchases.txtPurchaseNo}','1')">
		</div> --%>
			</div>
			<%-- <div class="row"><div class="col-sm-1"></div>
			<input type="button" value="Edit" name="btn" class="btn btn-primary" onclick="urlSubmit('editPurchases.do?purchaseId=${purchases.txtPurchaseNo}','1')">
			<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('purchasePDF.do?purchaseId=${purchases.txtPurchaseNo}','_blank')">
			<input type="button" value="E-Mail" name="btn" class="btn btn-primary" onclick="urlSubmit('purchasecompose_Mail.do?vendId=${purchases.venderID}&id1=${purchases.txtPurchaseNo}','1')">
			<c:choose>
				<c:when test="${yes == 'yes'}">
					<input type="button" value="Apply Payment" name="btn" class="btn btn-primary" onclick="urlSubmit('purchasePayment.do?purchaseId=${purchases.txtPurchaseNo}','1')">
				</c:when>
				<c:when test="${no == 'no'}">
					<label class="btn btn-danger">Paid</label>
				</c:when>
				<c:otherwise>
					<label class="btn btn-danger">Not Yet proceed</label>
				</c:otherwise>
			</c:choose>
			<a href="paymentHistory.do?purchaseNo=${purchases.txtPurchaseNo}" class="btn btn-primary" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '400',width: '800' })">Payment History</a>
		</div> --%><br>
			</div>
			</div>					
	</form:form>		
</div><br>
<!-- </div> -->
</body>
</html>