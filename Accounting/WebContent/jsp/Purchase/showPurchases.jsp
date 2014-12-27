<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Show Purchases</title>
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

    <script type="text/javascript" src="<c:url value="/resources/highslide/highslide-with-html.js" />"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/highslide/highslide.css" />"/>
<script type="text/javascript">
    hs.graphicsDir = 'resources/highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();
             $('#dataTables-example4').dataTable();
             $('#dataTables-example5').dataTable();
             
         });
    </script>
<script type="text/javascript">
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
	var res=confirm("Are You Sure To Disable Record");
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
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div id="container"> -->
		<%@ include file="innerHeader.jsp" %>
								
		 
						<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-9">
						<ul class="breadcrumb">
							<li class="active"><i class="icon-file-alt"></i> Purchases</li>
		             	</ul>
		             	</div>
			             	<div class="col-md-3">
			             	<a href="newPurchase.do"><button type="button" class="btn btn-primary " data-toggle="tooltip" data-placement="bottom" title="Purchases" value=""><i class="fa fa-plus-square"></i> Add New Purchase</button></a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
									<br>
					<c:if test="${message==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${message==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${update==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${update==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#failure').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>		
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
					<form:form action="" cssClass="form-inline" modelAttribute="purchases"><br>
						<div class="col-md-12">
		             		<div class="panel panel-default">		             			
		             			<div class="panel-body">
		             				<div class="table-responsive">
				                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
				                                    <thead>
				                                        <tr>
				                                            <th>Purchase ID</th>
				                                            <th>Vender Name</th>
				                                            <th>Date</th>
				                                            <th>Amount</th>		
				                                            <th>Details</th>
				                                            <!-- <th>Bal Amt</th> -->
				                                            <th>Apply Payment</th>
				                                            <th>Actions</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody>
				                                    <c:forEach items="${purchaseList}" var="purchaseList">
				                                        <tr class="odd gradeX">
				                                            <td>${purchaseList.txtPurchaseNo}</td>
				                                            <td>${purchaseList.selSupplierName}</td>
				                                            <td>${purchaseList.txtPurchaseDate}</td>
				                                            <td>${purchaseList.txtAmtPayble}</td>
				                                           <%--  <td>${purchaseList.balAmt}</td> --%>
				                                            <td><a href="purchaseDetails.do?purchaseId=${purchaseList.txtPurchaseNo}" data-toggle="tooltip" data-placement="bottom" title="Purchases Details" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '400',width: '800' })">Details</a></td>
														<c:choose>
															<c:when test="${purchaseList.balAmt == 0}">
																<td><font color="red">Paid</font>	
															</c:when>
															<c:otherwise>
																<td><a href="purpayment.do?purchaseId=${purchaseList.txtPurchaseNo}" data-toggle="tooltip" data-placement="bottom" title="Apply Payment">Apply Payment</a></td>	
															</c:otherwise>
														</c:choose>
														<td><div class="btn-group">
															  <button data-toggle="dropdown" class="btn dropdown-toggle btn-xs">Action <span class="caret"></span></button>
															  <ul class="dropdown-menu">
																<li><a href="viewPurchases.do?purchaseId=${purchaseList.txtPurchaseNo}" data-toggle="tooltip" data-placement="left" title="Purchases View">View</a></li>
																<li><a href="editPurchases.do?purchaseId=${purchaseList.txtPurchaseNo}" data-toggle="tooltip" data-placement="left" title="Purchases Edit">Edit</a></li>
																<li><a onclick="urlSubmit1('deletePurchases.do?purchaseId=${purchaseList.txtPurchaseNo}&amt=${purchaseList.txtAmtPayble}')" href="#" data-toggle="tooltip" data-placement="left" title="Purchases Disable">Disable</a></li>
															  </ul></div></td>
				                                        </tr>
				                                      </c:forEach>
				                                        </tbody>
				                                </table>
				                            </div>
		             			</div>
		             		</div>
		             	</div>
</form:form>    		
</div>
<!-- </div> -->
</body>
</html>