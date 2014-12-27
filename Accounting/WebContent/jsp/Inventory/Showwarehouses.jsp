<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Warehouses</title>
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
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
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
         
         
         <script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script>
</head>
<body style="overflow-x: hidden;"> 
<div id="wrapper">
 <%@include file="../header.jsp" %>
<div class="page-wrapper">							
<%@include file="innerHeader.jsp"%>	
<br><br><br>
<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-10">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Manage<small>&nbsp;Warehouse</small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
					<a href="inventory.do" class="btn btn-primary btn-large"> Back</a>	
		         </div>
			</div>
		</div>
</div><br>
 <form:form action="showwarehouse.do" method="" modelAttribute="showwarehouse" cssClass="form-inline">		 

	<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
		         <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                        <th>Warehouse ID</th>
                                        <th>Warehouse Name</th>
                                            <th>Warehouse Address</th>
                                            <th>Products</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${warehouseList}" var="warehouseList">
                                        <tr class="odd gradeX">
                                            <td>${warehouseList.warehousrID}</td>                                             
                                            <td>${warehouseList.wareHouseName}</td>
                                            <td>${warehouseList.address}</td>                                             
                                             <td><a href="warehouseProducts.do?warehouseId=${warehouseList.warehousrID}" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '500',width: '850' })">Products</a></td>                                                                     
                                            <td><div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle btn-xs">Action <span class="caret"></span></button>
											  <ul class="dropdown-menu">
												 
												<li><a href="warehouseview.do?warehousrID=${warehouseList.warehousrID}">View</a></li>
												<li><a href="editWarehouse.do?warehousrID=${warehouseList.warehousrID}">Edit</a></li> 
												<%-- <li><a href="deleteIssueForProduction.do?warehousrID=${warehouseList.warehousrID}">Delete</a></li> --%>
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
</div>
</body>
</html>