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
$("#purchases").hover(
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
	
	<input type="hidden" name="hide" id="hidden" />
		<div class="page-wrapper"> 
		<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;View<small>&nbsp;Order</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="purchaseOrder.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		              <br> 
		             <div><div class="col-md-9"></div>
							<c:if test="${vieweorder.purchasesCreated=='No'}">
							<a onclick="urlSubmit('editPurchaseOrder.do?orderID=${vieweorder.txtPurchaseOrdNo}','1')" title="Edit"><img id="edit" alt="" src="<c:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>								
							</c:if>
							<a onclick="urlSubmit('purchaseOrderPDF.do?orderID=${vieweorder.txtPurchaseOrdNo}','_blank')" title="Print"><img id="print" alt="" src="<c:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
							<a onclick="urlSubmit('pOrdercompose_Mail.do?vendId=${vieweorder.venderID}&id1=${vieweorder.txtPurchaseOrdNo}&orderId=${vieweorder.txtPurchaseOrdNo}','1')" title="E-Mail"><img id="mail" alt="" src="<c:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
							<c:if test="${vieweorder.purchasesCreated=='No'}">
							<a onclick="urlSubmit('convertToPurchase.do?orderID=${vieweorder.txtPurchaseOrdNo}','1')" title="Purchases"><img id="purchases" alt="" src="<c:url value="/resources/images/purchasequotation.png" />" width="35px" height="35px"></a>								
							</c:if>
							</div><br>
		             <form:form action="" cssClass="form-inline" modelAttribute="vieweorder">
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
						${vieweorder.selSupplierName}
						</div>
						<br>
						<div class=""> 
						<div class="col-sm-1"></div> 
						<label> Date : </label>			
						${vieweorder.txtPurcaseDate }
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
						<u>${vieweorder.txtPurchaseOrdNo}</u>
						</div>		
						<br>
						<div class="">
						<div class="col-sm-1"></div>
						<label>Due Date : </label>
						${vieweorder.txtDueDate}
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
						${vieweorder.txtAreaAddress}
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
				<c:forEach items="${vieweorder.productList }" var="productList">
					<tr>
					    <td>${productList.srNo} </td>
						<td>${productList.itemCode} </td>
						<td>${productList.des}</td>
						<td>${productList.unit}</td>
						<td>${productList.quantity}</td>
						<td>${productList.unitPrice}</td>
					    <td>${productList.itemTotal}</td>
						
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
						${vieweorder.txtPubNotes}
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
						${vieweorder.txtPvtNotes }
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
<td>${vieweorder.txtSubTotal }</td>
</tr>
<tr>
<td><label>Discount :</label></td>
<td>
<c:choose>
<c:when test="${vieweorder.radio=='per'}">
@ ${vieweorder.txtDiscount}&nbsp;%
</c:when>	
<c:otherwise>
${vieweorder.txtDiscount}
</c:otherwise>
</c:choose>
</td>
</tr>
<tr>
<td><label>Total :</label></td>
<td>${vieweorder.txtDisTotal }</td>
</tr>

<c:choose>
<c:when test="${bln!='blank'}">	
<c:forEach items="${vieweorder.taxList}" var="taxListNm">
	<tr>
		<td>
			<label>${taxListNm.taxType}&nbsp;@&nbsp;${taxListNm.taxRate}%:</label>	
		</td>	
		<td>	
			<c:forEach items="${vieweorder.taxList}" var="taxListAmt">	
				${taxListAmt.txtTaxValue}	
			</c:forEach>
		</td>
	</tr>
</c:forEach>
</c:when>
</c:choose>
<c:choose>
<c:when test="${not empty vieweorder.linkedTaxList}">	
<tr>
<td><label>Linked Taxes</label></td>
<td></td>
</tr>
</c:when>
</c:choose>
<c:forEach items="${vieweorder.linkedTaxList}" var="linkedTaxListNm">
<tr>
<td><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:</label></td>
<td>${linkedTaxListNm.serLinkedTax}</td>
</tr>
</c:forEach>
<tr>
<td><label>Amount Payable :</label></td>
<td>${vieweorder.txtAmtPayble }</td>
</tr>

</table>
</div>		
<br>
			<%-- <div class="row"><div class="col-md-5"></div>
			<input type="button" value="Edit" name="btn" class="btn btn-primary" onclick="urlSubmit('editPurchaseOrder.do?orderID=${vieweorder.txtPurchaseOrdNo}','1')">
			<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('purchaseOrderPDF.do?orderID=${vieweorder.txtPurchaseOrdNo}','_blank')">
			<input type="button" value="E-Mail" name="btn" class="btn btn-primary" onclick="urlSubmit('pOrdercompose_Mail.do?vendId=${vieweorder.venderID}&id1=${vieweorder.txtPurchaseOrdNo}&orderId=${vieweorder.txtPurchaseOrdNo}','1')">
			<input type="button" value="Purchase" name="btn" class="btn btn-primary" onclick="urlSubmit('convertToPurchase.do?orderID=${vieweorder.txtPurchaseOrdNo}','1')">
		</div> --%>
		<%-- <div class="row">
		<div class="col-md-6"><div class="col-md-3"></div>
			<label >Purchase Order No :</label>
			<form:input path="txtPurchaseOrdNo" cssClass="form-control"/>
			<label>${vieweorder.txtPurchaseOrdNo} </label>
			</div>
		<div class="col-md-6">
			<label> Date : </label>			
			<label>${vieweorder.txtPurcaseDate }</label>			
			</div>							
		</div><br>
		<div class="row">			
			<div class="col-md-6"><div class="col-md-3"></div>
			<label>Vendor Name:</label>			
			<label>${vieweorder.selSupplierName}</label>
			</div>
			<div class="col-md-6">
			<label>Due Date : </label>
			<form:input path="txtDueDate" cssClass="form-control"/>
			<label>${vieweorder.txtDueDate}</label>
			</div>
			
		</div><br>
		<div class="row">
		<div class="col-md-6">
		<div class="col-md-3"></div>
			<label>Address : </label> 
			<form:textarea path="txtAreaAddress" rows="2" cols="25" cssClass="form-control"></form:textarea>
			<label>${vieweorder.txtAreaAddress}</label>
		</div>
		</div><br>
		<div class="table-responsive" style="width: 90%;"> 	
			<table class="table table-striped" id="tableID">
				<thead>
					<tr>
						<th>Sr No</th>
						<th>Item Name</th>
						<th>Description</th>
						<th>Unit of Measure</th>
						<th>Quantity</th>
						<th>Unit Price</th>						
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${vieweorder.productList }" var="productList">
					<tr>
					    <td>${productList.srNo} <!-- <input name="txtSrNo1" id="txtSrNo1" class="form-control" style="width: 50px;"/> --></td>
						<td>${productList.itemCode} <!-- <input name="txtDes1" class="form-control"> --></td>
						<td>${productList.des}<!-- <input name="txtDes1" class="form-control"> --></td>
						<td>${productList.unit}<!-- <input name="txtQuant1" class="form-control" style="width: 80px;"> --></td>
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
			<div><label>${vieweorder.txtPubNotes}</label></div></div>
				<div class="col-md-7"> 
<div class="row">	
<div class="col-md-6">	
<div><label>Sub Total:-</label></div>	
<div><label>Discount:-</label></div>	
<div><label>Total:-</label></div>
<c:choose>
<c:when test="${bln!='blank'}">	
<c:forEach items="${vieweorder.taxList}" var="taxListNm">
<div><label>${taxListNm.taxType}&nbsp;@&nbsp;${taxListNm.taxRate}%:-</label></div>
</c:forEach>
<!-- <div><label>Linked Taxes:-</label></div> -->
<label style="color: green;">Linked Taxes </label><br>
<c:forEach items="${vieweorder.linkedTaxList}" var="linkedTaxListNm">
<div><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:-</label></div>
</c:forEach>
</c:when>
</c:choose>
<div><label>Amount Payable:-</label></div>	
</div>
<div class="col-md-3">	
<div><label>${vieweorder.txtSubTotal}</label></div>  
<c:choose>
<c:when test="${vieweorder.radio=='per'}">
<div><label>@ ${vieweorder.txtDiscount}&nbsp;%</label></div> 
</c:when>	
<c:otherwise>
<div>${vieweorder.txtDiscount}</div>
</c:otherwise>
</c:choose>
<div><label>${vieweorder.txtDisTotal}</label></div>
<c:forEach items="${vieweorder.taxList}" var="taxListAmt">
<div><label>${taxListAmt.txtTaxValue}</label></div>
</c:forEach>
<label style="display: none;">   Hidden    </label><br>
<c:forEach items="${vieweorder.linkedTaxList}" var="linkedTaxListAmt">
<div><label>${linkedTaxListAmt.serLinkedTax}</label></div>
</c:forEach>
<div><label>${vieweorder.txtAmtPayble}</label></div>	
</div>
</div>	
</div>
			<br><br>
			<div class="row"><div class="col-md-3"></div>
			<input type="button" value="Edit" name="btn" class="btn btn-primary" onclick="urlSubmit('editPurchaseOrder.do?orderID=${vieweorder.txtPurchaseOrdNo}','1')">
			<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('purchaseOrderPDF.do?orderID=${vieweorder.txtPurchaseOrdNo}','_blank')">
			<input type="button" value="E-Mail" name="btn" class="btn btn-primary" onclick="urlSubmit('pOrdercompose_Mail.do?vendId=${vieweorder.venderID}&id1=${vieweorder.txtPurchaseOrdNo}&orderId=${vieweorder.txtPurchaseOrdNo}','1')">
			<input type="button" value="Purchase" name="btn" class="btn btn-primary" onclick="urlSubmit('convertToPurchase.do?orderID=${vieweorder.txtPurchaseOrdNo}','1')">
		</div> --%>
		
		
			</div>
			<%-- <div class="row"><div class="col-md-3"></div>
			<input type="button" value="Edit" name="btn" class="btn btn-primary" onclick="urlSubmit('editPurchaseOrder.do?orderID=${vieweorder.txtPurchaseOrdNo}','1')">
			<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('purchaseOrderPDF.do?orderID=${vieweorder.txtPurchaseOrdNo}','_blank')">
			<input type="button" value="E-Mail" name="btn" class="btn btn-primary" onclick="urlSubmit('pOrdercompose_Mail.do?vendId=${vieweorder.venderID}&id1=${vieweorder.txtPurchaseOrdNo}&orderId=${vieweorder.txtPurchaseOrdNo}','1')">
			<input type="button" value="Purchase" name="btn" class="btn btn-primary" onclick="urlSubmit('convertToPurchase.do?orderID=${vieweorder.txtPurchaseOrdNo}','1')">
		</div><br> --%>
			</div>
			</div>					
	</form:form>		
</div><br>
</div>
<!-- </div> -->
</body>
</html>