<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inventory</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />"
	type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"
	rel="stylesheet" type="text/css">

<link href="<c:url value="/resources/assets/css/main.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/theme.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/MoneAdmin.css" />"
	rel="stylesheet" type="text/css">

<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"
	type="text/javascript"></script>
<%-- <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />"
	type="text/javascript"></script>
<script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();
             $('#dataTables-example4').dataTable();
             $('#dataTables-example5').dataTable();
             $('#dataTables-example6').dataTable();
             $('#dataTables-example7').dataTable();
/*              $('#dataTables-example6').dataTable();
 */         });
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
    <link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="<c:url value="/resources/highslide/highslide-with-html.js" />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/highslide/highslide.css" />"/>
<script type="text/javascript">
    hs.graphicsDir = 'resources/highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>
<script type="text/javascript">
function getValue(id)
{			
	document.getElementById("productionID").value = id;
	showPayheads(id);
}
</script>
</head>
<body style="overflow-x: hidden;">
	<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="page-wrapper">
			<%@include file="innerHeader.jsp"%>
			
				<br>
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-2">
								<ul class="breadcrumb">
									<li class="active"><i class="icon-file-alt"></i> Inventory</li>
								</ul>
							</div>
							<div class="col-md-10">
								<a href="createNewProduct.do"><button type="button"
										class="btn btn-primary " value="">
										<small><i class="fa fa-2x fa-edit"></i></small> Add New
										Product
									</button></a> <a href="manageStock.do"><button type="button"
										class="btn btn-primary " value="">
										<small><i class="fa fa-2x fa-edit"></i></small> Manage Stock
									</button></a>
								<!-- <a href="warehouse.do"><button type="button" class="btn btn-primary " value=""><small><i class="fa fa-2x fa-edit"></i></small> Manage Warehouse</button></a> -->
								<div class="btn-group">
									<div class="btn-group">
										<button data-toggle="dropdown"
											class="btn-primary btn dropdown-toggle">
											<small><i class="fa fa-2x fa-edit"></i></small> Manage
											Warehouse <span class="caret"></span>
										</button>								
								<ul class="dropdown-menu">
									<li><a href="warehouse.do">New Warehouse</a></li>

									<li><a href="showwarehouse.do">Show Warehouses</a></li>
								</ul>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				
					<c:if test="${delete==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${delete==0}">	
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<br>
					<form:form action="inventory.do" method="" modelAttribute="manageStock" cssClass="form-inline">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab1" data-toggle="tab"><i
								class="icon-th-list "></i> All Product Services</a></li>
						<li ><a href="#tab2" data-toggle="tab"><i class="icon-th-list "></i> Production Orders</a></li>
						<!-- <li><a href="#tab2" data-toggle="tab"><i
								class="icon-signout "></i> Issued for Production</a></li>
						<li><a href="#tab3" data-toggle="tab"><i
								class="icon-signout"></i> Received for Sales</a></li>
						 --><li><a href="#tab4" data-toggle="tab"><i
								class="icon-truck"></i> Stock Transfered</a></li>
						<li><a href="#tab5" data-toggle="tab"><i
								class="icon-trash "></i> Record Wastage</a></li>
						<!--                             	<li><a href="#tab6" data-toggle="tab"><i class="icon-trash "></i>  Receive Against Production</a></li>
 -->
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="tab1">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="col-md-12">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover"
												id="dataTables-example1">
												<thead>
													<tr>
														<th>Product Code</th>
														<th>Item Name</th>
														<th>Type</th>
														<th>Quantity</th>
														<th>Unit of Measure</th>
														<th>Reorder Level</th>
														<th>Actions</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${showProductList}" var="showProductList">
														<tr class="odd gradeX">
															<td>${showProductList.productCode}</td>
															<td>${showProductList.txtName}</td>
															<td>${showProductList.productType}</td>

															<td>${showProductList.txtOpeningStock}</td>
															<td>${showProductList.txtUnitOfMeasure}</td>

															<td>${showProductList.txtReorderlevel}</td>

															<td><div class="btn-group">
								
																	<button data-toggle="dropdown"
																		class="btn dropdown-toggle btn-xs">
																		Action <span class="caret"></span>
																	</button>
																	<ul class="dropdown-menu">
																		<!-- <li><a href="#">Action</a></li> -->
																		<li><a
																			href="viewCreateNewProduct.do?productCode=${showProductList.productCode}">View</a></li>
																		<li><a
																			href="editCreateNewProduct.do?productCode=${showProductList.productCode}">Edit</a></li>
																		<li><a
																			href="#" onclick="urlSubmit1('deleteCreateNewProduct.do?productCode=${showProductList.productCode}')">Delete</a></li>
																	</ul>
																</div></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
												
						
						<div class="tab-pane fade" id="tab2">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="col-md-12">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#tabP" data-toggle="tab"><i	class="icon-th-list "></i> Pending</a></li>
										<li ><a href="#tabC" data-toggle="tab"><i class="icon-th-list "></i> Completed</a></li>
									</ul>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="tabP">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="col-md-12">
										<div class="table-responsive">											
												<table class="table table-striped table-bordered table-hover" id="dataTables-example2">
													<thead>
														<tr>
															<th>Production Order No</th>
															<th>Sales Order No</th>
															<th>Date</th>
															<th>Details</th>
															<th>Actions</th>
														</tr>
													</thead>
													<tbody>
														 
														<c:forEach items="${pendingProduction}" var="pendingProduction">
															<tr class="odd gradeX">
															<td>${pendingProduction.productionID}</td>
															<c:choose>
																<c:when test="${pendingProduction.sorderId !=' '}">
																	<td>${pendingProduction.sorderId}</td>
																</c:when>
																<c:otherwise>
																	<td>Direct Order</td>
																</c:otherwise>
															</c:choose>															
															<td>${pendingProduction.prodDate}</td>
															<td><a href="productionOrderDetails.do?productionId=${pendingProduction.productionID}" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '500',width: '850' })">Details</a></td>
															<td>
																<div class="btn-group">								
																	<button data-toggle="dropdown"
																		class="btn dropdown-toggle btn-xs">
																		Action <span class="caret"></span>
																	</button>
																	<ul class="dropdown-menu">
																		<!-- <li><a href="#">Action</a></li> -->
																		<li><a href="viewProduction.do?productionId=${pendingProduction.productionID}">View</a></li>
																		<li><a href="editProduction.do?productionId=${pendingProduction.productionID}">Edit</a></li>
																		<li><a data-toggle="modal" href="#basic" onClick="getValue('${pendingProduction.productionID}')">Complete</a></li>
																		<li><a href="#" onclick="urlSubmit1('deletepProduction.do?productionId=${pendingProduction.productionID}')">Delete</a></li>
																	</ul>
																</div>
															</td><!-- completepProduction.do?productionId=${pendingProduction.productionID}"  -->
														</tr>
															<%-- <c:forEach items="${pendingProduction.productList}" var="productList">
																<tr>
																	<td>${productList.productId}</td>
																</tr>
															</c:forEach> --%>
														</c:forEach>
														
													</tbody>
												</table>											
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tabC">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="col-md-12">
										<div class="table-responsive">											
												<table class="table table-striped table-bordered table-hover" id="dataTables-example3">
													<thead>
														<tr>
															<th>Production Order No</th>
															<th>Sales Order No</th>
															<th>Date</th>
															<th>Details</th>
															<th>Actions</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${completedProduction}" var="completedProduction">
															<tr class="odd gradeX">
															<td>${completedProduction.productionID}</td>
															<c:choose>
																<c:when test="${completedProduction.sorderId !=' '}">
																	<td>${completedProduction.sorderId}</td>
																</c:when>
																<c:otherwise>
																	<td>Direct Order</td>
																</c:otherwise>
															</c:choose>	
															<td>${completedProduction.prodDate}</td>
															<td><a href="productionOrderDetails.do?productionId=${completedProduction.productionID}" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '500',width: '850' })">Details</a></td>
															<td><div class="btn-group">								
																	<button data-toggle="dropdown"
																		class="btn dropdown-toggle btn-xs">
																		Action <span class="caret"></span>
																	</button>
																	<ul class="dropdown-menu">
																		<!-- <li><a href="#">Action</a></li> -->
																		<li><a
																			href="viewProduction.do?productionId=${completedProduction.productionID}">View</a></li>
																			<%-- <input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('productionOrderPDF.do?productionId=${production.productionID}','_blank')"> --%>
																		<li><a
																			href="#" onclick="urlSubmit('productionOrderPDF.do?productionId=${completedProduction.productionID}','_blank')">Print</a></li>
																		</ul>
																</div></td>
														</tr>
														</c:forEach>
													</tbody>
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
						</div>

						<%-- <div class="tab-pane fade" id="tab3">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="col-md-12">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover"
												id="dataTables-example3">
												<thead>
													<tr>
														<th>Voucher Number</th>
														<th>Voucher Date</th>
														<th>Warehouse</th>
														<th>Actions</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${showreceive}" var="showreceive">
														<tr class="odd gradeX">
															<td>${showreceive.txtVNo}</td>
															<td>${showreceive.date}</td>
															<td>${showreceive.selectWarehouse}</td>
															<td><div class="btn-group">
																	<button data-toggle="dropdown"
																		class="btn dropdown-toggle btn-xs">
																		Action <span class="caret"></span>
																	</button>
																	<ul class="dropdown-menu">
																		<!-- <li><a href="#">Action</a></li> -->
																		<li><a
																			href="receiveforSalesView.do?txtVNo=${showreceive.txtVNo}">View</a></li>
																		<li><a
																			href="editreceiveforSales.do?txtVNo=${showreceive.txtVNo}">Edit</a></li>
																		<li><a
																			href="deleteReceiveforSales.do?txtVNo=${showreceive.txtVNo}">Delete</a></li>
																	</ul>
																</div></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div> --%>

						<div class="tab-pane fade" id="tab4">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="col-md-12">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover"
												id="dataTables-example4">
												<thead>
													<tr>
														<th>Voucher Number</th>
														<th>Transfer Date</th>
														<th>Warehouse</th>
														<th>Actions</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${showtransfered}" var="showtransfered">
														<tr class="odd gradeX">
															<td>${showtransfered.txtVNo}</td>
															<td>${showtransfered.date}</td>
															<td>${showtransfered.selectWarehouse}</td>
															<td><div class="btn-group">
																	<button data-toggle="dropdown"
																		class="btn dropdown-toggle btn-xs">
																		Action <span class="caret"></span>
																	</button>
																	<ul class="dropdown-menu">
																		<!-- <li><a href="#">Action</a></li> -->
																		<li><a
																			href="recordTransferredView.do?txtVNo=${showtransfered.txtVNo}">View</a></li>
																		<li><a
																			href="editrecordTransferred.do?txtVNo=${showtransfered.txtVNo}">Edit</a></li>
																		<li><a href="#" onclick="urlSubmit1('deleteRecordTransferred.do?txtVNo=${showtransfered.txtVNo}')">Delete</a></li>
																	</ul>
																</div></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="tab5">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="col-md-12">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover"
												id="dataTables-example5">
												<thead>
													<tr>
														<th>Voucher Number</th>
														<th>Voucher Date</th>
														<th>Warehouse</th>
														<th>Actions</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${showwastage}" var="showwastage">
														<tr class="odd gradeX">
															<td>${showwastage.txtVNo}</td>
															<td>${showwastage.date}</td>
															<td>${showwastage.selectWarehouse}</td>

															<td><div class="btn-group">
																	<button data-toggle="dropdown"
																		class="btn dropdown-toggle btn-xs">
																		Action <span class="caret"></span>
																	</button>
																	<ul class="dropdown-menu">
																		<li><a
																			href="recordWastageView.do?txtVNo=${showwastage.txtVNo}">View</a></li>
																		<li><a
																			href="editrecordWastage.do?txtVNo=${showwastage.txtVNo}">Edit</a></li>
																		<li><a
																			href="#" onclick="urlSubmit1('deleteRecordWastage.do?txtVNo=${showwastage.txtVNo}')">Delete</a></li>
																	</ul>
																</div></td>
														</tr>
													</c:forEach>
												</tbody>
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
			</form:form>
		</div>
	</div>
<form:form action="completeProductionOrder.do" cssClass="form-inline" modelAttribute="production">
<br>
<div class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">	
<div class="modal-dialog modal-wide" style="width: 700px;">
									<div class="modal-content">
									
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title">Veriable Name</h4>
										</div>
										<div class="modal-body">										
											<div class="row">
												<div class="col-md-12">
														<div class="col-md-6">
															<label>Select Warehouse To Receive Products&nbsp;:</label>
															<input type="hidden" name="productionID" id="productionID" value="${production.productionID}" class="form-control" readonly="readonly"	style="width: 100px;" />
														</div>
														<div class="col-md-6">
														<label>Warehouse&nbsp;:</label>
															<select name="warehouse" class="form-control" id="warehouse" onchange="">																
																<option value=" ">---Select---</option>	
																	<c:forEach items="${wareID}" var="wareID">
																		<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
																	</c:forEach>
															</select>
														</div>
												</div>	
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">Save</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											
										</div>
									</div>									
								</div>							
							</div>		
<%-- <div class="col-md-12">
	<div class="panel">
		<div class="panel-body">
			<div class="row">
			<div class="col-md-12">
					<div class="col-md-6">
						<label>Select Warehouse To Receive Products&nbsp;:</label>
						<input type="text" name="productionID" id="productionID" value="${production.productionID}" class="form-control" readonly="readonly"	style="width: 100px;" />
					</div>
					<div class="col-md-6">
					<label>Warehouse&nbsp;:</label>
						<select name="warehouse" class="form-control" id="warehouse" onchange="">																
							<option value=" ">---Select---</option>	
								<c:forEach items="${wareID}" var="wareID">
									<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
								</c:forEach>
						</select>
					</div>
			</div>	
		</div>
		</div>
		<div class="row">
			<div class="col-md-12">
					<div class="col-md-6">
					 	<button type="submit" class="btn btn-primary btn-xs">Submit</button>
					<!--  	<button type="button" class="btn btn-primary btn-xs" onclick="this.close()">Cancel</button> -->
					</div>
			</div>
		</div>
		<br>
		</div>
		<div>
	</div>
</div> --%>
</div>
</form:form>
	
</body>
</html>
<script>
function urlSubmit1(url)
{
	if((confirmDelete()==true))
		{
		
			window.location.assign(url);
		}
	else
		{
			return false;
		}

}
function confirmDelete()
{
	var res=confirm("Are You Sure To Delete Record");
	if(res==true)
		{
			return true;
		}
	else
		{
			return false;
		}
}
</script>