<%@page language="java" import="java.sql.*"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Customer Details</title>
<link rel="icon" href="<core:url value="/resources/images/favicon.ico" />"
	type="image/icon">
<link href="<core:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css" />
<link href="<core:url value="/resources/css/sb-admin.css" />"
	rel="stylesheet" type="text/css" />
<link href="<core:url value="/resources/css/table.css" />" rel="stylesheet"
	type="text/css" />
<link href="<core:url value="/resources/css/table.css" />" rel="stylesheet"
	type="text/css" />
<link href="<core:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
<link href="<core:url value="/resources/assets/css/main.css" />"
	rel="stylesheet" type="text/css">
<link href="<core:url value="/resources/assets/css/theme.css" />"
	rel="stylesheet" type="text/css">
<link href="<core:url value="/resources/assets/css/MoneAdmin.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<core:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<core:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"
	rel="stylesheet" type="text/css">

<script
	src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"
	type="text/javascript"></script>
<script
	src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />"
	type="text/javascript"></script>
<script
	src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"
	type="text/javascript"></script>
<script
	src="<core:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />"
	type="text/javascript"></script>
<script
	src="<core:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />"
	type="text/javascript"></script>

<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>
     
      <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
            
             
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
	<div id="container">
		<%@ include file="innerHeader.jsp" %>
					
		<br> 
		<div class="col-md-12">		
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;View<small>&nbsp;Customer</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="sales.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
			             	
			             	<!--"deleteCustomer.do?customerID=${custlist.txtCustID}"  -->
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
});
</script>
		     <div>
			      <div class="col-md-11"></div>
					<a onclick="urlSubmit('editCustomer.do?customerID=${viewCustomerDetails.txtCustID}','1')" title="Edit" data-toggle="tooltip" data-placement="top" title="Edit"><img id="edit" src="<core:url value="/resources/images/edit.png" />" width="25px" height="25px"></a>
					 <%--  <input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editCustomer.do?customerID=${viewCustomerDetails.txtCustID}','1')"> --%>
				  </div>
		     
		     <br>
<form:form method="post" action="" commandName="viewCustomerDetails" name="frmAddNewCustomer" onsubmit="return validateForm()">	   	
<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
						<ul class="nav nav-tabs">
								<li class="active"><a href="#tab1" data-toggle="tab"> Basic Details</a></li>
								<li><a href="#tab2" data-toggle="tab"> Contact Details</a></li>
								<li><a href="#tab3" data-toggle="tab"> Bank Details</a></li>
								<li><a href="#tab4" data-toggle="tab"> Contact Person Details</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1">
									<div class="panel panel-default">
				                        <div class="panel-heading"> Basic Details </div>
				                        <div class="panel-body">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-4">
														<label>Vender ID:</label> ${viewCustomerDetails.txtCustID}
													</div>
													<div class="col-md-6">
														<label>Vender Name:</label> ${viewCustomerDetails.txtCustName}
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">
														<label>Region:</label> ${viewCustomerDetails.slctRegion}
													</div>
													<div class="col-md-3">
														<label>Date:</label> ${viewCustomerDetails.txtDate}
													</div>
												</div>
											</div>
											<br>
											<div class="col-md-12">
												<br>
												<div class="panel panel-default">
												<div class="panel-heading">Billing Address</div>
												<div class="panel-body">
												<div class="row">
													<div class="col-md-5">
														<label>Address&nbsp;:</label> ${viewCustomerDetails.billingAddress}
													</div>
													<div class="col-md-3">
														<label>City&nbsp;:</label> ${viewCustomerDetails.billingcity}
													</div>
													<div class="col-md-3">
														<label>State:</label> ${viewCustomerDetails.billingstate}
													</div>
												</div>
												<br>     
												<div class="row">
													<div class="col-md-5">
														<label>Country:</label> ${viewCustomerDetails.billingcountry}
													</div>
													<div class="col-md-3">
														<label>Pin Code:</label> ${viewCustomerDetails.billingppincode}
													</div>
												</div>
												</div>
												</div>
												<div class="panel panel-default">
												<div class="panel-heading">Shipping Address</div>
												<div class="panel-body">
												<div class="row">
													<div class="col-md-5">
														<label>Address&nbsp;:</label>
														${viewCustomerDetails.shippingAddrLine}
													</div>
													<div class="col-md-3">
														<label>City&nbsp;:</label> ${viewCustomerDetails.shippingcity}
													</div>
													<div class="col-md-3">
														<label>State:</label> ${viewCustomerDetails.shippingstate}
													</div>
												</div>
												<br>     
												<div class="row">
													<div class="col-md-5">
														<label>Country:</label> ${viewCustomerDetails.shippingcountry}
													</div>
													<div class="col-md-3">
														<label>Pin Code:</label> ${viewCustomerDetails.shippingpincode}
													</div>
												</div>
												</div>
												</div>
											</div>
										</div>
				                    </div>
				            </div>
				            <div class="tab-pane fade" id="tab2">
									<div class="panel panel-default">
				                        <div class="panel-heading"> Contact Details </div>
				                        <div class="panel-body">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-5">
														<label>E-Mail:</label> ${viewCustomerDetails.txtMail1}
													</div>
													<div class="col-md-4">
														<label>Mobile No:</label> ${viewCustomerDetails.txtMob}
													</div>
													<div class="col-md-3">
														<label>Telephone:</label> ${viewCustomerDetails.txtTel}
													</div><br><br>
													<div class="col-md-5">
														<label>Fax:</label> ${viewCustomerDetails.txtFax}
													</div>
													<div class="col-md-3">
														<label>Website</label> ${viewCustomerDetails.txtWeb}
													</div>
												</div>
											</div>
										</div>
				                    </div>
				            </div>
				            <div class="tab-pane fade" id="tab3">
									<div class="panel panel-default">
				                        <div class="panel-heading"> Bank Details </div>
				                        <div class="panel-body">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-4">
														<label>Account No:</label> ${viewCustomerDetails.txtAcNo}
													</div>
													<div class="col-md-3">
														<label>Bank Name:</label> ${viewCustomerDetails.txtBankNm}
													</div>													
													<div class="col-md-3">
														<label>IFSC Code:</label> ${viewCustomerDetails.txtIfscCode}
													</div>
												</div><br>
												<div class="row">
													<div class="col-md-4">
														<label>PAN No:</label> ${viewCustomerDetails.txtPanNo}
													</div>
													<div class="col-md-3">
														<label>CST No:</label> ${viewCustomerDetails.txtCstNo}
													</div>
													<div class="col-md-3">
														<label>VAT No:</label> ${viewCustomerDetails.txtVatNo}
													</div>
												</div><br>
												<div class="row">
													
													<div class="col-md-4">
														<label>LBT No:</label> ${viewCustomerDetails.txtLbtNo}
													</div>
													<div class="col-md-3">
														<label>Excise No:</label> ${viewCustomerDetails.txtExcNo}
													</div>
													<div class="col-md-5">
														<label>Service Tax No:</label>
														${viewCustomerDetails.txtservicetax}
													</div>
												</div>
											</div>
										</div>
				                    </div>
				            </div>
				            <div class="tab-pane fade" id="tab4">
									<div class="panel panel-default">
				                        <div class="panel-heading"> Contact Person Details </div>
				                        <div class="panel-body">
											<div class="col-md-12">
												<div class="row">
													<div class="table-responsive">
														<div style="width: overflow:auto;">
															<table id="table1" class="table table-striped">
																<tr>
																	<td align="center">Sr No</td>
																	<td align="center">Name</td>
																	<td align="center">Contact No</td>
																	<td align="center">E-Mail</td>
																	<td align="center">Designation</td>
																</tr>
																<core:forEach items="${viewCustomerDetails.customerDetails}" var="customerDetails">
																	<tr>
																		<td align="center">${customerDetails.txtSrNo}</td>
																		<td align="center">${customerDetails.txtName}</td>
																		<td align="center">${customerDetails.txtCon}</td>
																		<td align="center">${customerDetails.txtMail}</td>
																		<td align="center">${customerDetails.txtDes}</td>
																	</tr>
																</core:forEach>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
				                    </div>
				            </div>
				         </div>
						</div>
						<%-- <div class="row">
					  <div class="col-md-6">
			          
			             <input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editCustomer.do?customerID=${viewCustomerDetails.txtCustID}','1')">
			          <button type="button" onclick="goBack()" class="btn btn-primary" name="btn">Cancel</button>
			          </div>
					</div> --%>
 <br>
					</div>
				</div>
<%-- <div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body"> 
       		<div class="col-md-12">   					
					<div class="row">
					<div class="col-md-3">
							<label>Customer ID:-</label>							
							<label>${viewCustomerDetails.txtCustID}</label>${viewCustomerDetails.txtCustID}
					</div>
					<div class="col-md-6">
							<label>Customer Name:-</label>														
							<label>${viewCustomerDetails.txtCustName}</label>${viewCustomerDetails.txtCustName}
					</div>					 					 
					 </div>
					 <br>
					 <div class="row">
					 		<div class="col-md-3">
							<label>Region:-</label>							
							<label>${viewCustomerDetails.slctRegion}</label>${viewCustomerDetails.slctRegion}							
					 		</div>
					 		<div class="col-md-3"> 
					 			<label>Date:-</label> 								 								 
								 <label>${viewCustomerDetails.txtDate}</label>${viewCustomerDetails.txtDate} 
					 		</div>
					 </div>
					 </div>  
					 <br>
					 <div class="col-md-12"><br>
					 	<div class="row">
					 		<div class="col-md-3">
					 			<label>Billing Address</label>
					 			<hr></hr>
					 		</div>
					 		<!-- <div class="col-md-3 pull right">
					 			<label>Shipping Address</label>
					 		</div> -->
					 	</div>
					 	<div class="row">
					 		<div class="col-md-3">
			 							<label>Address&nbsp;:-</label>
										<label>${viewCustomerDetails.txtBillingAdd}</label>${viewCustomerDetails.billingAddress}
 									</div>
		  							<div class="col-md-3">
				 						<label>City&nbsp;:-</label>
										<label>${viewCustomerDetails.txtBillingCity}</label>${viewCustomerDetails.billingcity}
   		   							</div>
 									<div class="col-md-3">
						 				<label>State:-</label>
										<label>${viewCustomerDetails.txtBillingState}</label>${viewCustomerDetails.billingstate}
    								</div>					    
					 	</div> 
							 <div class="row">
							 	<div class="col-md-3">
					 				<label>Country:-</label>									
									<label>${viewCustomerDetails.txtBillingCountry}</label>${viewCustomerDetails.billingcountry}
							    </div>
							    <div class="col-md-3">
					 				<label>Pin Code:-</label>
									<label>${viewCustomerDetails.txtBillingPinCode}</label>${viewCustomerDetails.billingppincode}
							    </div>
							</div>
							<div class="row"><br>
					 		<div class="col-md-3">
					 			<label>Shipping Address</label>
					 			<hr></hr>
					 		</div>					 		
					 	</div>
					 	<div class="row">
					 			<div class="col-md-3">
											 	<label>Address&nbsp;:-</label>
												<label>${viewCustomerDetails.txtShippingAdd}</label>${viewCustomerDetails.shippingAddrLine}
								 </div> 
								  <div class="col-md-3">
										 <label>City&nbsp;:-</label>
										  <label>${viewCustomerDetails.txtShippingCity}</label>${viewCustomerDetails.shippingcity}
						   		   </div>
								 	<div class="col-md-3">
								 				<label>State:-</label>
												<label>${viewCustomerDetails.txtShippingState}</label>${viewCustomerDetails.shippingstate}
								    </div>											   
					 		</div>
							 <div class="row">
							 	<div class="col-md-3">
							 				<label>Country:-</label>
											<label>${viewCustomerDetails.txtShippingCountry}</label>${viewCustomerDetails.shippingcountry}
							    </div>
							    <div class="col-md-3">
							 				<label>Pin Code:-</label>
											<label>${viewCustomerDetails.txtShippingPinCode}</label>${viewCustomerDetails.shippingpincode}
													    </div>
					 	</div>
					 	</div>
					<br>
					<div class="col-md-12">
						<div class="row"><br>
					 		<div class="col-md-3">
					 			<label>Contact Details</label>
					 			<hr></hr>
					 		</div>					 		
					 	</div>
					 	<div class="row">					 								
													<div class="col-md-3">
														<label>E-Mail:-</label>
														<label>${viewCustomerDetails.txtMail1}</label>${viewCustomerDetails.txtMail1}
													</div>
													<div class="col-md-3">
														<label>Mobile No:-</label>
														<label>${viewCustomerDetails.txtMob}</label>${viewCustomerDetails.txtMob}
													</div>
													<div class="col-md-3">
														<label>Telephone:-</label>														
														<label>${viewCustomerDetails.txtTel}</label>${viewCustomerDetails.txtTel}
													</div>																												
												  		<div class="col-md-3">
															<label>Fax:-</label>															
															<label>${viewCustomerDetails.txtFax}</label>${viewCustomerDetails.txtFax}
														</div>
														<div class="col-md-3">
															<label>Website</label>
															<label>${viewCustomerDetails.txtWeb}</label>${viewCustomerDetails.txtWeb}
														</div>											  
					 	</div>
					</div>
					<div class="col-md-12">
						<div class="row"><br>
					 		<div class="col-md-3">
					 			<label>Bank Details</label>
					 			<hr></hr>
					 		</div>					 		
					 	</div>
					 	<div class="row">
					                            <div class="col-md-3">                                		
														<label>Account No:-</label>
														<label>${viewCustomerDetails.txtAcNo}</label>${viewCustomerDetails.txtAcNo}
												</div>
												<div class="col-md-3">
														<label>Bank Name:-</label>
														<label>${viewCustomerDetails.txtBankNm}</label>${viewCustomerDetails.txtBankNm}
												</div>
												<div class="col-md-3">
														<label>Currency:-</label>
														<label>${viewCustomerDetails.txtCurrency}</label> ${viewCustomerDetails.txtcurrency}
												</div>
												<div class="col-md-3">																			
														<label>Credit Limit:-</label>
														<label>${viewCustomerDetails.txtCreditLimit}</label>${viewCustomerDetails.txtcurrencyLimit}
												</div>
												<div class="col-md-3">
														<label>IFSC Code:-</label>
														<label>${viewCustomerDetails.txtIfscCode}</label>${viewCustomerDetails.txtIfscCode}
												</div>
												<div class="col-md-3">														
														<label>PAN No:-</label>
														<label>${viewCustomerDetails.txtPanNo}</label>${viewCustomerDetails.txtPanNo}
												</div>
												<div class="col-md-3">															
														<label>CST No:-</label>
														<label>${viewCustomerDetails.txtCstNo}</label>${viewCustomerDetails.txtCstNo}
												</div>
												<div class="col-md-3">		
														<label>VAT No:-</label>
														<label>${viewCustomerDetails.txtVatNo}</label>${viewCustomerDetails.txtVatNo}
												</div>
												<div class="col-md-3">															
														<label>LBT No:-</label>
														<label>${viewCustomerDetails.txtLbtNo}</label>${viewCustomerDetails.txtLbtNo}
												</div>
												<div class="col-md-3">		
														<label>Excise No:-</label>
														<label>${viewCustomerDetails.txtExcNo}</label>${viewCustomerDetails.txtExcNo}
												</div>
												<div class="col-md-3">	
														<label>Service Tax No:-</label>
														<label>${viewCustomerDetails.txtServiceTaxNo}</label>${viewCustomerDetails.txtservicetax}
					                           </div>
					 	</div>
					</div>
					<div class="col-md-12">
						<div class="row"><br>
					 		<div class="col-md-3">
					 			<label>Contact Person Details</label>
					 			<hr></hr>
					 		</div>					 		
					 	</div>
					 	<div class="row">
					 			<div class="table-responsive">
		                    		<div style="width:overflow:auto;"> 
		         					<table id="table1" class="table table-striped">		         					     					
		        					<tr>
							        		<td  align="center">Sr No</td> 
							        		<td  align="center">Name</td>					        		
							        		<td  align="center">Contact No</td>
							        		<td  align="center">E-Mail</td>
							        		<td  align="center">Designation</td>					        		
		        					</tr>
		        					<core:forEach items="${viewCustomerDetails.customerDetails}" var="customerDetails">
		        						<tr>	
		         						<td>${customerDetails.txtSrNo}</td> 
		            					<td>${customerDetails.txtName}</td>
		            					<td>${customerDetails.txtCon}</td>
		            					<td>${customerDetails.txtMail}</td> 
		            					<td>${customerDetails.txtDes}</td>
		    					    	</tr> 
		    					    </core:forEach>          					            					
		           					 </table> 		         					
		          					</div>
		                            </div>
					 	</div>
					 </div>					 
					   <div class="row">
					  <div class="col-md-6">
			             	<input type="button" name="btn" class="btn btn-primary" value="Edit" onclick="urlSubmit('editCustomer.do?customerID=${viewCustomerDetails.txtCustID}','1')">
			             	</div>
</div>
</div>
 </div>
 </div> --%>
 
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