<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Purchase Enquiry</title>
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
$("#quotation").hover(
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
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;View<small>&nbsp;Enquiry</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="purchaseEnquiry.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		             <br> 
		             
		             <div><div class="col-md-9"></div>				            
							<c:choose>
								<c:when test="${viewenquiry.qoutCreated=='No'}">
									<a data-toggle="tooltip" data-placement="top" title="Edit" onclick="urlSubmit('editPurchaseEnquiry.do?enquiryId=${viewenquiry.enqID}','1')" title="Edit"><img id="edit" alt="" src="<c:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>
								</c:when>
								<c:otherwise>
									
								</c:otherwise>
							</c:choose>
							<a data-toggle="tooltip" data-placement="top" title="Print" onclick="urlSubmit('purchaseEnquiryPDF.do?enqID=${viewenquiry.enqID}','_blank')" title="Print"><img id="print" alt="" src="<c:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
							<a data-toggle="tooltip" data-placement="top" title="Email" onclick="urlSubmit('purchaseEnquiryMail.do?vendId=${viewenquiry.venderID}&id1=${viewenquiry.enqID}','1')" title="E-Mail"><img id="mail" alt="" src="<c:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
							<%-- <a onclick="urlSubmit('purchaseEnquiryMail.do?vendId=${viewenquiry.venderID}&id1=${viewenquiry.enqID}','1'" title="E-Mail"><img id="mail" alt="" src="<c:url value="/resources/images/email.png" />" width="35px" height="35px"></a> --%>
							<c:choose>
								<c:when test="${viewenquiry.qoutCreated=='No'}">
									<a data-toggle="tooltip" data-placement="top" title="Quotation" onclick="urlSubmit('quotation.do?quotationID=${viewenquiry.enqID}','1')" title="Quotation"><img id="quotation" alt="" src="<c:url value="/resources/images/purchasequotation.png" />" width="35px" height="35px"></a>			
								</c:when>
								<c:otherwise>
									
								</c:otherwise>
							</c:choose>
							<%-- <c:if test="${viewenquiry.qoutCreated=='No'}">
							<a onclick="urlSubmit('quotation.do?quotationID=${viewenquiry.enqID}','1')" title="Quotation"><img id="quotation" alt="" src="<c:url value="/resources/images/purchasequotation.png" />" width="35px" height="35px"></a>
							</c:if> --%>
							
							
							
							
								<%-- <input type="button" value="Edit" name="btn" class="btn btn-primary" onclick="urlSubmit('editPurchaseEnquiry.do?enquiryId=${viewenquiry.enqID}','1')"> --%>
								<%-- <input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('purchaseEnquiryPDF.do?enqID=${viewenquiry.enqID}','_blank')"> --%>
								<%-- <input type="button" value="E-Mail" name="btn" class="btn btn-primary" onclick="urlSubmit('Enquirycompose_Mail.do?vendId=${viewenquiry.venderID}&id1=${viewenquiry.enqID}','1')"> --%>
								<%-- <input type="button" value="Quotation" name="btn" class="btn btn-primary" onclick="urlSubmit('quotation.do?quotationID=${viewenquiry.enqID}','1')"> --%>
					</div>
		             <br>
		             <form:form action="" cssClass="form-inline" modelAttribute="viewenquiry">
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
						<label>Vender Name : </label> 			
						${viewenquiry.supplierName}
						<input type="hidden" name="venderID" value="${viewenquiry.venderID}"/>
						<input type="hidden" name="venderEmail" value="${viewenquiry.venderEmail}">
						</div>
						<br>
						<div class="">			
						<div class="col-sm-1"></div>								
						<div class="col-md-6">			
						<label> Date : </label>
						${viewenquiry.enqDate }
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel-default">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class=""> 
						<div class="col-sm-1"></div> 
						<label>Enquiry No : </label>
						<u>${viewenquiry.enqID}</u>
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
						<td align="center">Sr No</td>
						<td align="center">Item Code</td>
						<td align="center">Description</td>
						<td align="center">Unit of Measure</td>
						<td align="center">Quantity</td>											
					</tr> 
				</thead>
				<tbody>
				<c:forEach items="${viewenquiry.purchasenquiryDetails}" var="purchasenquiryDetails">
					<tr>
						<td>${purchasenquiryDetails.srNo }<!-- <input type="text" name="srNo" id="srNo" value=""> --></td>
						<td>${purchasenquiryDetails.itemCode }<!-- <input type="text" class="form-control" name="itemCode" id="itemCode" value=""> --></td> 
						<td>${purchasenquiryDetails.des }<!-- <input type="text" class="form-control" name="des" id="des" value=""> --></td>
						<td>${purchasenquiryDetails.unit }<!-- <input type="text" class="form-control" name="des" id="des" value=""> --></td>
						<td>${purchasenquiryDetails.quantity }<!-- <input type="text" class="form-control" name="quantity" id="quantity" value=""> --></td>								
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
						${viewenquiry.pubNotes}
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
						${viewenquiry.priNotes }
						</div>
					</div>
				</div>
			</div>
		</div>	
		</div>		
		
							<%-- <div class="row"><div class="col-md-3"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-4">
											<label>Enquiry&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-4"> 
											<form:input path="enqID" cssClass="form-control"></form:input>		
											<label>${viewenquiry.enqID}</label>																			
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Vender&nbsp;Name&nbsp;: </label>
										</div>
										<div class="col-md-7">
											<form:input path="supplierName" cssClass="form-control"></form:input>
											<label>${viewenquiry.supplierName}</label>
											<input type="hidden" name="venderID" value="${viewenquiry.venderID}"/>
											<input type="hidden" name="venderEmail" value="${viewenquiry.venderEmail}">
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
							<div class="col-md-3"></div>					
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-4">
											<label>Date&nbsp;: </label>
										</div>
										<div class="col-md-8">
											<form:input path="enqDate" cssClass="form-control" ></form:input>
											<label>${viewenquiry.enqDate }</label>
										</div>
									</div>
								</div>								
							</div>	
							<br>											
							<center>																
							<div class="table-responsive" style="width: 70%;"> 					
										<table id="tableID" class="table table-striped">										
										<thead>
											<tr> 
												<td align="center">Sr No</td>
												<td align="center">Item Code</td>
												<td align="center">Description</td>
												<td align="center">Unit of Measure</td>
												<td align="center">Quantity</td>											
											</tr> 
										</thead>
										<tbody>
										<c:forEach items="${viewenquiry.purchasenquiryDetails}" var="purchasenquiryDetails">
											<tr>
												<td>${purchasenquiryDetails.srNo }<!-- <input type="text" name="srNo" id="srNo" value=""> --></td>
												<td>${purchasenquiryDetails.itemCode }<!-- <input type="text" class="form-control" name="itemCode" id="itemCode" value=""> --></td> 
												<td>${purchasenquiryDetails.des }<!-- <input type="text" class="form-control" name="des" id="des" value=""> --></td>
												<td>${purchasenquiryDetails.unit }<!-- <input type="text" class="form-control" name="des" id="des" value=""> --></td>
												<td>${purchasenquiryDetails.quantity }<!-- <input type="text" class="form-control" name="quantity" id="quantity" value=""> --></td>								
											</tr>
											</c:forEach>
											</tbody>
										</table>							
							</div>
							</center>
							<br>
							<div class="row">
							<div class="col-md-3"></div>
								<div class="col-md-3">
									<label>Public Notes :</label>
								</div>
								<div class="col-md-3">
									<form:textarea rows="3" cols="25" path="pubNotes" cssClass="form-control"></form:textarea>
									<label>${viewenquiry.pubNotes }</label>
								</div>
							</div>							
							<br>
							<div>
							<div class="col-md-4"></div>								
								<input type="button" value="Edit" name="btn" class="btn btn-primary" onclick="urlSubmit('editPurchaseEnquiry.do?enquiryId=${viewenquiry.enqID}','1')">
								<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('purchaseEnquiryPDF.do?enqID=${viewenquiry.enqID}','_blank')">
								<input type="button" value="E-Mail" name="btn" class="btn btn-primary" onclick="urlSubmit('Enquirycompose_Mail.do?vendId=${viewenquiry.venderID}&id1=${viewenquiry.enqID}','1')">
								<input type="button" value="Quotation" name="btn" class="btn btn-primary" onclick="urlSubmit('quotation.do?quotationID=${viewenquiry.enqID}','1')">
							</div> --%>
 					</div>	
 					
					</div>
					</div>
					</form:form>
	</div>
	<!-- </div> -->
</body>
</html>