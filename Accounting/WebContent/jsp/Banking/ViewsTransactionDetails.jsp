<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Transaction Details</title>
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
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">

<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     
     <script>     
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();             
         });
    </script>
</head>
<body style="overflow-x: hidden;"> 
<div id="wrapper">
<%@ include file="../header.jsp" %> 
	<!-- <div id="container"> -->	
	<%@ include file="innerHeader.jsp" %>
<form:form action="viewtrans.do" method="post" cssClass="form-inline" commandName="withdraw">
<br>
<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-7">
						<ul class="breadcrumb">
							<li class="active"><i class="icon-file-alt"></i> Banking transaction</li>
		             	</ul>
		             	</div>
			             	<div class="col-md-5">
			             	<a href="newTransaction.do"><button type="button" class="btn btn-primary " value="+"><i class="fa fa-plus-square"></i> New Transaction</button></a>
                            <a href="newReconciliation.do"><button type="button" class="btn btn-primary" value=""><small><i class="fa fa-building-o"></i></small> Bank Reconcilition</button></a>
			             	</div>
		             	</div>
		             	</div>
		             </div>	<br><br><br><br>
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
	<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">                           
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-sign-in"></i>  Withdraw Cash</a></li>
                                <li><a href="#tab2" data-toggle="tab"><i class="fa fa-download"></i>  Deposit</a></li>
                                <li><a href="#tab3" data-toggle="tab"><i class="fa fa-exchange"></i>  Transfer Cash</a></li>
                            </ul>
           <div class="tab-content">                 
              <div class="tab-pane fade in active" id="tab1">
                
                    <div class="panel panel-default">                       
                        <div class="panel-body">
                			<div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Voucher Number</th>
                                            <th>Transaction Date</th>
                                            <th>From Account</th>
                                            <th>To Account</th>
                                            <th>Balance</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${withdrawList}" var="withdrawList">  
                                        <tr class="odd gradeX">
                                            <td>${withdrawList.txtwithVchrNo}</td>
                                            <td>${withdrawList.txtwithdate }</td>
                                            <td>${withdrawList.txtwithFrmAccnt }</td>
                                            <td>${withdrawList.txtwithToAccnt }</td>
                                            <td>${withdrawList.txtwithAmount }</td> 
                                       
                                            <td><div class="btn-group">
											   <button data-toggle="dropdown" class="btn dropdown-toggle">Actions <span class="caret"></span></button>
											  <ul class="dropdown-menu">
											  <li><a href="withdrawView.do?voucherNo=${withdrawList.txtwithVchrNo}">View</a></li>
												<%-- <li><a href="withdrawEdit.do?voucherNo=${withdrawList.txtwithVchrNo}">Edit</a></li> --%>
												<li><a href="withdrawDelete.do?voucherNo=${withdrawList.txtwithVchrNo}">Delete</a></li>
												
											  </ul>
											  </div>
											  </td>
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
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                    <thead>
                                        <tr>
                                            <th>Voucher Number</th>
                                            <th>Transaction Date</th>
                                            <th>From Account</th>
                                            <th>To Account</th>
                                            <th>Balance</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${depositList}" var="depositList">  
                                        <tr class="odd gradeX">
                                            <td>${depositList.txtdepoVchrNo}</td>
                                            <td>${depositList.txtdepodate }</td>
                                            <td>${depositList.txtdepoFrmAccnt }</td>
                                            <td>${depositList.txtdepoToAccnt }</td>
                                            <td>${depositList.txtdepoAmount }</td>
                                    
                                            <td><div class="btn-group">
											 <button data-toggle="dropdown" class="btn dropdown-toggle">Actions <span class="caret"></span></button>
											  <ul class="dropdown-menu">											  
											   <li><a href="depositView.do?voucherNo=${depositList.txtdepoVchrNo}">View</a></li>
												<%-- <li><a href="depositEdit.do?voucherNo=${depositList.txtdepoVchrNo}">Edit</a></li> --%>
												<li><a href="depositDelete.do?voucherNo=${depositList.txtdepoVchrNo}">Delete</a></li>
												
											  </ul>
											  </div>
											  </td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
             </div>



<div class="tab-pane fade" id="tab3">
                
                    <div class="panel panel-default">                       
                        <div class="panel-body">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example3">
                                    <thead>
                                        <tr>
                                            <th>Voucher Number</th>
                                            <th>Transaction Date</th>
                                            <th>From Account</th>
                                            <th>To Account</th>
                                            <th>Balance</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${transferList}" var="transferList">  
                                        <tr class="odd gradeX">
                                            <td>${transferList.txttransVchrNo}</td>
                                            <td>${transferList.txttransdate }</td>
                                            <td>${transferList.txttransFrmAccnt }</td>
                                            <td>${transferList.txttransToAccnt }</td>
                                            <td>${transferList.txttransAmount }</td> 
                                      
                                            <td><div class="btn-group">
											    <button data-toggle="dropdown" class="btn dropdown-toggle">Actions <span class="caret"></span></button>
											  <ul class="dropdown-menu">
											   <li><a href="transferView.do?voucherNo=${transferList.txttransVchrNo}">View</a></li>
												<%-- <li><a href="transferEdit.do?voucherNo=${transferList.txttransVchrNo}">Edit</a></li> --%>
												<li><a href="transferDelete.do?voucherNo=${transferList.txttransVchrNo}">Delete</a></li>
												
											  </ul>
											  </div>
											  </td>
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
<!-- </div> -->
</body>

</html>