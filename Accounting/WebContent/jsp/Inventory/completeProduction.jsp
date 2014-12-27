<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Complete Production Order</title>
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
         $(document).ready(function () {
             $('#dataTables-example1').dataTable(); 
         });
    </script>
<script type="text/javascript">
function backPage()
{
	window.close();
}
</script>
</head>
<body>
<form:form action="completeProductionOrder.do" cssClass="form-inline" modelAttribute="production">
<br>			
<div class="col-md-12">
	<div class="panel">
		<div class="panel-body">
			<div class="col-md-10">
				<ul class="breadcrumb">
					<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Complete&nbsp;Production<small>&nbsp;Order</small>
		        </ul>
		    </div>
		</div>
	</div>
</div>
<div class="col-md-12">
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
</div>
</form:form>
<%-- <c:if test="${msg==1 }">
	<script>
	setTimeout(function(){var ww = this.window(); ww.close(); }, 10);
</script> --%>
<%-- </c:if> --%>
</body>
</html>


