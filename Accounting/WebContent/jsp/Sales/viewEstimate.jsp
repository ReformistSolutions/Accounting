<%@page language="java" import="java.sql.*"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Estimate</title>
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
$(function() {
$( "#tabs" ).tabs();
});
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
			             		<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Estimate</small>          
			             	</ol>			             
			             </div>
			              <div class="col-md-2 pull right" >
			             	<div>
			             		<a href="estimate.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>	
			             	</div>
			             </div>
			             </div>
			             </div>
			      </div><br>
			      <div>
			      
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
			      <div class="col-md-9"></div>
					<c:if test="${salesEstimate.ordCreated=='No'}">
					<a onclick="urlSubmit('editEstimate.do?estimateID=${salesEstimate.txtEstID}','1')" title="Edit" data-toggle="tooltip" data-placement="top" title="Edit"><img id="edit" src="<core:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>
					</c:if>
					<a onclick="urlSubmit('salesEstimatePDF.do?estimateID=${salesEstimate.txtEstID}','_blank')" title="Print" data-toggle="tooltip" data-placement="top" title="Print"><img id="print" alt="" src="<core:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
					<a onclick="urlSubmit('sendEstPdfMail.do?custId=${salesEstimate.custID}&id1=${salesEstimate.txtEstID}','1')" title="E-Mail" data-toggle="tooltip" data-placement="top" title="E-Mail"><img id="mail" alt="" src="<core:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
					
					<core:choose>
						<core:when test="${salesEstimate.ordCreated=='No'}">
							<a onclick="urlSubmit('orderFromEstimate.do','1')" title="Sales Order" data-toggle="tooltip" data-placement="top" title="Sales Order"><img id="order" alt="" src="<core:url value="/resources/images/salesOrder.png" />" width="35px" height="35px"></a>
						</core:when>
						<core:otherwise>
							
						</core:otherwise>
					</core:choose>
				</div>
<br>
<div class="col-md-12">
<form:form action="" method="post" modelAttribute="salesEstimate"> 
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
						<label>Estimate No : </label>
						<u>${salesEstimate.txtEstID}</u>
						</div><br>
						<div class="col-sm-1"></div>
						<div class="">						
						<label>Customer&nbsp;Name:</label>			
						<input type="hidden" value="${salesEstimate.custID}">
							${salesEstimate.txtCutName }
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
						${salesEstimate.txtDate}
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
												${salesEstimate.txtBillAddr}
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
												${salesEstimate.txtShipAddr}
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>	
		
						<%-- <div class="row">
							<div class="col-md-2">
								<label>Estimate&nbsp;No:</label>									
							</div>
							<div class="col-md-1">${salesEstimate.txtEstID}</div>
							<div class="col-md-2">		
								<label>Customer&nbsp;Name:</label>
							</div>
							<div class="col-md-4">
							<input type="hidden" value="${salesEstimate.custID}">
							${salesEstimate.txtCutName}												
							</div>
							<div class="col-md-1">
							<label>Date:</label>									
						</div>
						<div class="col-md-2">${salesEstimate.txtDate}</div>
						</div><br>
				<div class="row">
					<div class="col-md-2">
						<label style="vertical-align: top">Bill To:</label>	
					</div>
					<div class="col-md-3">${salesEstimate.txtBillAddr}</div>
					<div class="col-md-2">	
						<label style="vertical-align: top">Ship To:</label>
					</div>
					<div class="col-md-3">${salesEstimate.txtShipAddr}</div>					
					
				</div> --%><br>			
					<div class="table-responsive">
						<table id="tableID" class="table table-bordered">		
								<tr>
									<th>Sr No</th>
									<th>Product</th>
									<th>Description</th>
									<th>Unit</th>
									<th>Quantity</th>
									<th>Unit Price(INR)</th>									
									<th>Total(INR)</th>
								</tr>								
								<core:forEach items="${salesEstimate.productList}" var="productList">
								<tr>
									<td>${productList.srNo}</td>
									<td>${productList.itemCode}	</td>           						
									<td>${productList.des}</td>
									<td>${productList.unit}</td>
									<td>${productList.quantity}</td>
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
												${salesEstimate.txtpubNotes}
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
												${salesEstimate.txtpvtNotes}
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>		<br>	
		<div class="row">		
				<div class="col-md-12">
					<div class="row">
					<div class="col-md-7"> </div>
						<div class="col-md-5">	
							<table id="tableID" class="table table-bordered">
								<tr>
									<td><label>Amount Payable :</label></td>
									<td>${salesEstimate.txtAmtPayble}</td>
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
								<core:forEach items="${salesEstimate.taxList}" var="taxListNm">
									<div><label>${taxListNm.taxType}&nbsp;@&nbsp;${taxListNm.taxRate}%:-</label></div>
								</core:forEach>
								<!-- <div><label>Linked Taxes:-</label></div> -->
								<label style="color: green;">Linked Taxes </label><br>
								<core:forEach items="${salesEstimate.linkedTaxList}" var="linkedTaxListNm">
									<div><label>${linkedTaxListNm.linkedTaxName}&nbsp;@&nbsp;${linkedTaxListNm.linkedTaxRate}%:-</label></div>
								</core:forEach>
								</core:when>
								</core:choose>
								<div><label>Amount Payable:-</label></div>								
							</div>
							<div class="col-md-3">	
							<div><label>${salesEstimate.txtSubTotal}</label></div>  
							<core:choose>
								<core:when test="${salesEstimate.radio=='per'}">
									<div><label>@ ${salesEstimate.txtDiscount}&nbsp;%</label></div> 
								</core:when>		
								<core:otherwise>
									<div>${salesEstimate.txtDiscount}</div>
								</core:otherwise>
							</core:choose>
							<div><label>${salesEstimate.txtDisTotal}</label></div>
							<core:forEach items="${salesEstimate.taxList}" var="taxListAmt">
									<div><label>${taxListAmt.txtTaxValue}</label></div>
								</core:forEach>
								<label style="display: none;">   Hidden    </label><br>
								<core:forEach items="${salesEstimate.linkedTaxList}" var="linkedTaxListAmt">
									<div><label>${linkedTaxListAmt.serLinkedTax}</label></div>
								</core:forEach>
							<div><label>${salesEstimate.txtAmtPayble}</label></div>								
							</div>
						</div>						
					</div> --%>
				<%-- <div class="col-md-12">
					<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('salesEstimatePDF.do?estimateID=${salesEstimate.txtEstID}','_blank')">									 
					<input type="button" value="E-Mail" name="btn" onclick="urlSubmit('sendEstPdfMail.do?custId=${salesEstimate.custID}&id1=${salesEstimate.txtEstID}','1')" class="btn btn-primary">
					<input type="button" value="Order" name="btn" onclick="urlSubmit('orderFromEstimate.do','1')" class="btn btn-primary">	
					<input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editEstimate.do?estimateID=${salesEstimate.txtEstID}','1')">
					<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
				</div><br> --%>
</div><br>		
</div>
</div>
						
	</form:form><!-- <a href="orderFromEstimate.do"> -->
	</div>
	</div>
<!-- </div> -->

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
