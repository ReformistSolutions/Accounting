<%@page language="java" import="java.sql.*"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Sales Enquiry</title>
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
$(function() {
$( "#tabs" ).tabs();
});
</script>

 <script type="text/javascript" src="<c:url value="/resources/highslide/highslide-with-html.js" />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/highslide/highslide.css" />"/>
<script type="text/javascript">
    hs.graphicsDir = 'resources/highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

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
<!-- 	<div class="container"> -->
		<%@ include file="innerHeader.jsp" %>
		<br>			
					<div class="col-md-12">	   
					<div class="panel panel-default">
						<div class="panel-body">         
	            		<div class="col-md-10">	            		
			            	<ol class="breadcrumb">
			             		<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Enquiry</small>          
			             	</ol>			             
			             </div>
			              <div class="col-md-2 pull right" >
			             	<div>
			             		<a href="enquiry.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
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

$("#estimate").hover(
		  function(){
		    $(this).animate({width: 50,height: 50}, 300);
		  },
		  function(){
		      $(this).animate({width: 35,height: 35}, 300);
		});
});
</script>
			      <div>
			      <div class="col-md-9" class="col-md-12"></div>
					<c:if test="${salesEnquiry.estCreated=='No'}">
					<a onclick="urlSubmit('editEnquiry.do?enquiryID=${salesEnquiry.txtEnqId}','1')" title="Edit" data-toggle="tooltip" data-placement="top" title="Edit"><img id="edit" alt="" src="<c:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>
					</c:if>
					
					<a onclick="urlSubmit('enquiryPDF.do?enquiryID=${salesEnquiry.txtEnqId}','_blank')" title="Print" data-toggle="tooltip" data-placement="top" title="Print"><img id="print" alt="" src="<c:url value="/resources/images/print.png" />" width="30px" height="30px"></a>
					<a onclick="urlSubmit('sendEnqPdfMail.do?custId=${salesEnquiry.custID}&id1=${salesEnquiry.txtEnqId}','1')" title="E-Mail" data-toggle="tooltip" data-placement="top" title="E-Mail"><img id="mail" alt="" src="<c:url value="/resources/images/email.png" />" width="35px" height="35px"></a>
					
					<c:choose>
						<c:when test="${salesEnquiry.estCreated=='No'}">
							<a onclick="urlSubmit('estimateFromEnquiry.do','1')" title="Estimate" data-toggle="tooltip" data-placement="top" title="Estimate"><img id="estimate" alt="" src="<c:url value="/resources/images/estimate.png" />" width="35px" height="35px"></a>
						</c:when>
						<c:otherwise>
							
						</c:otherwise>
					</c:choose>
					
				</div>
				<!--<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('enquiryPDF.do?enquiryID=${salesEnquiry.txtEnqId}','_blank')">	 						
						<%-- <a href="sendEnqPdfMail.do?custId=${salesEnquiry.custID}&id1=${salesEnquiry.txtEnqId}&enquiryID=${salesEnquiry.txtEnqId}" onclick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '500',width: '850' })"><img src="<c:url value="/resources/images/email-icon.png" />"  height="30" width="30"/></a> --%>
						<input type="button" value="E-Mail" onclick="urlSubmit('sendEnqPdfMail.do?custId=${salesEnquiry.custID}&id1=${salesEnquiry.txtEnqId}','1')" name="btn" class="btn btn-primary">
						<input type="button" value="Estimate" onclick="urlSubmit('estimateFromEnquiry.do','1')" name="btn" class="btn btn-primary">
						<input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editEnquiry.do?enquiryID=${salesEnquiry.txtEnqId}','1')">
						<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>  -->
<br>
<div class="col-md-12">			
<form:form action="" name="salesEnquiry" modelAttribute="salesEnquiry" onsubmit="return validateForm()">
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
						<label>Customer&nbsp;Name:</label>			
						<input type="hidden" value="${salesEnquiry.custID}">
							${salesEnquiry.txtCutName }
						</div><br>
						<div class="col-sm-1"></div>
						<div class="">			
						<label>Date : </label>
						${salesEnquiry.txtDate}
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
						<label>Enquiry No : </label>
						<u>${salesEnquiry.txtEnqId}</u>
						</div>
						
					</div>
				</div>
			</div>
		</div>	
		</div>
		
			 <%--   <div class="row">
			  	<div class="col-md-12">		
			  	
			  	<div class="col-md-12"> 
			  	<div class="col-md-1"></div>
					<div class="col-md-2">
				    	 <label>Enquiry No:-</label>
				    </div>
					<div class="col-md-3">								
						 <form:input path="txtEnqId" cssStyle="width:150px;border:none;"></form:input>
					</div>						
			
					<div class="col-md-2">
						<label>Customer Name:-</label>				
					</div>
					<div class="col-md-3">	
						<input type="hidden" name="custID" value="${salesEnquiry.custID}">		
						<form:input path="txtCutName" id="txtCutName" cssStyle="width:150px;border:none;"  onkeypress="return AllowCharacters(this);"></form:input>
					</div>
					</div>	  	
				</div>
			</div>	 --%>
			
			<%--  <div class="row">
			  	<div class="col-md-12">		
			  	<div class="col-md-12"> 
			  	<div class="col-md-1"></div>
					<div class="col-md-2">
				    	 <label>Date:-</label>
				    </div>
					<div class="col-md-3">								
						 <form:input path="txtDate" cssStyle="border:none;"></form:input>
					</div>			
			
					</div>	  	
				</div>
			</div>	 --%>			
					<br>	
							<center>
									<div class="table-responsive">
										<table id="tableID" class="table table-bordered">
									
											<tr>
												<th style="text-align: center;">Sr No</th>
												<th style="text-align: center;">Item Code</th>
												<th style="text-align: center;">Description</th>
												<th style="text-align: center;">Unit</th>
												<th style="text-align: center;">Quantity</th>
												
											</tr>
										
										<c:forEach items="${salesEnquiry.enquiryDetails}" var="enquiryDetails">										
				 							<tr>
												<td style="text-align: center;">${enquiryDetails.srNo}</td>												
												<td style="text-align: center;"> ${enquiryDetails.itemCode}</td>												
												<td style="text-align: center;">${enquiryDetails.des }</td>
												<td style="text-align: center;">${enquiryDetails.munit }</td>
												<td style="text-align: center;">${enquiryDetails.quantity }</td>
												<td style="text-align: center;display: none;">${enquiryDetails.unitPrice}</td>											
											</tr>
										</c:forEach>		
										
										</table>										
									</div>
									</center>
								<div>
								<br>
								<div class="row">
							<div class="col-md-6">
								<div class="panel-default">
									<div class="panel-heading"><label>Terms and Condition</label></div>
									<div class="panel-body">
										<div class="row">											
											<div class="col-md-6">
												${salesEnquiry.txtPubNotes}
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
												${salesEnquiry.txtPvtNotes}
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>	
			<%-- <div class="row">
			  	<div class="col-md-12">		
			  	<div class="col-md-12"> 
			  	<div class="col-md-1"></div>
					<div class="col-md-2">
				    	 <label>Public Notes:-</label>
				    </div>
					<div class="col-md-3">								
						  <form:input path="txtPubNotes" cssStyle="width:150px;border:none;"></form:input>
					</div>	
					<div class="col-md-2">
				    	 <label>Private Notes:-</label>
				    </div>
					<div class="col-md-3">								
						  <form:input path="txtPvtNotes" cssStyle="width:150px;border:none;"></form:input>
					</div>
					<br>		
			
					</div>	<br>  	
				</div><br>
			</div>	 --%><br>					
			
				<%-- <div align="center">
								<!-- <button name="btn" class="btn btn-primary"><i class="fa fa-floppy-o"></i>&nbsp;Save</button>
							 -->
						<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('enquiryPDF.do?enquiryID=${salesEnquiry.txtEnqId}','_blank')">	 						
						<a href="sendEnqPdfMail.do?custId=${salesEnquiry.custID}&id1=${salesEnquiry.txtEnqId}&enquiryID=${salesEnquiry.txtEnqId}" onclick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '500',width: '850' })"><img src="<c:url value="/resources/images/email-icon.png" />"  height="30" width="30"/></a>
						<input type="button" value="E-Mail" onclick="urlSubmit('sendEnqPdfMail.do?custId=${salesEnquiry.custID}&id1=${salesEnquiry.txtEnqId}','1')" name="btn" class="btn btn-primary">
						<input type="button" value="Estimate" onclick="urlSubmit('estimateFromEnquiry.do','1')" name="btn" class="btn btn-primary">
						<input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editEnquiry.do?enquiryID=${salesEnquiry.txtEnqId}','1')">
						<button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
			</div>	 --%><br>
		<!--?enquiryID=${salesEnquiry.txtEnqId } 
		;return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '500',width: '850' }) -->
		</div>
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
