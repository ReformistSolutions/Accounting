<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Salary Voucher</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="http://cdn.oemdith.co.uk/morris-0.4.3.min.css"/>">
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                $('#dp1').datepicker({
                    format: "yyyy/mm/dd"
                });
                
                $( document ).ready(function() {
              	  $('#dp1').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
              	    $(this).datepicker('hide');
              	});
              	});              
            	});            
</script>	
<script type="text/javascript">
function backs()
{
	
window.history.back();
}
</script>
</head>
<body>
<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="container">
			<%@include file="innerHeader.jsp"%>
			<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Salary<small>&nbsp;Voucher</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2"> 
			             	<button name="back" class="btn btn-primary btn-large" onclick="backs()"><i class="fa fa-reply"></i> Back</button>			   
			             	</div>
		             	</div>
		             	</div>
			</div>
			<form:form action="salaryVoucher.do" modelAttribute="salaryVoucher">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
								<div class="col-md-4">	
									<div class="row">
										<div class="col-md-5">
											<label>Voucher&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-7">											
											<input type="text" name="txtvoucherNo" class="form-control" value="${salaryVoucher.txtvoucherNo}" readonly="readonly">
											<%-- <form:input path="txtvoucherNo" cssClass="form-control" ></form:input> --%> 
										</div>	
									</div>
								</div>
								<div class="col-sm-1"></div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher&nbsp;Date&nbsp;: </label>
										</div>
										<div class="col-md-7">
											<%-- <form:input path="voucherDate" cssClass="form-control" /> --%> 											
											<input type="text" id="dp1" name="voucherDate" class="form-control" />
										</div> 
									</div> 
								</div>					
							</div><br>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Salary&nbsp;Date&nbsp;: </label>
										</div>
										<div class="col-md-7">											
											<%-- <form:input path="salaryDate" cssClass="form-control"/> --%>
											<input type="text" value="${saldate}" name="salaryDate" class="form-control" readonly="readonly"/>
										</div>
									</div>
								</div>
								<div class="col-sm-1"></div>	
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Total&nbsp;Amount&nbsp;: </label>
										</div>
										<div class="col-md-7"> 
											<input type="text" name="totalAmount" value="INR&nbsp;${totalamnt}" class="form-control" readonly="readonly"/>
										</div>
									</div>
								</div>					
							</div><br>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Paid&nbsp;Account&nbsp;: </label>
										</div>
										<div class="col-md-7">											 
											<input class="form-control" value="${paidaccount}" name="paidAmount" readonly="readonly">
											<!-- <select class="form-control" name="paidAmount">
												<option>---Select---</option>
											</select> -->
										</div>
									</div>
								</div>
							</div><br>
							<div class="table-responsive">
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>Account Name</th>															
															<th>Amount</th>
														</tr>
													</thead>	
													<tbody>
													<% int cnt = 0; %>
													<c:forEach items="${detailsList}" var="detailsList">
													<tr>		
														<td><input type="text" name="salaryList[<%=cnt%>].id" id="salaryList[<%=cnt%>].id" value="${detailsList.id}">${detailsList.accountName}</td>
														<td><input type="text" name="salaryList[<%=cnt%>].amount" id="salaryList[<%=cnt%>].amount" value="${detailsList.amount}"></td>
													</tr>		
													<% cnt++; %>		
													</c:forEach>
													</tbody>
												</table>
							</div>
							<div class="col-md-12">
							    <div>
							      <button type="submit" class="btn btn-default">Save</button>
							      <button type="submit" class="btn btn-default">Cancel</button>
							    </div>
							</div>
					</div>
				</div>
			</div>
			</form:form>
		</div>
</div>
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>