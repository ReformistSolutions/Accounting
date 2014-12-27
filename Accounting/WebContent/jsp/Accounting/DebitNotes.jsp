<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Debit Notes</title>

<link href="<c:url value="resources/assets/plugins/bootstrap/css/bootstrap.css" /> "rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/css/main.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="res ources/assets/css/theme.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.css"/>"rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />

<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" /> "type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" /> "type="text/javascript"></script>

     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
                     
         });
    </script>
<script>
	function back() {
		window.history.back();

	}
</script>
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
	<%@include file="../header.jsp"%>
	<!-- <div class="container"> -->
		<%@include file="innerHeader.jsp"%>							
<br>				
<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-8">
								<ul class="breadcrumb">
									<li class="active"><i class="fa fa-edit"></i><i class="icon-file-alt"></i> Debit Notes</li>
								</ul>
							</div>
							<div class="col-md-4">
							<a href="newDebitNote.do"><button type="button" class="btn btn-primary " value=""><i class="fa fa-plus-square"></i> Add New Record</button></a>
			             	<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
							</div>
						</div>
					</div>
</div>	
<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Debit Note No</th>
                                            <th>Transaction Date</th>                                           
                                            <th>From Account</th>
                                            <th>To Account</th>  
                                             <th>Amount</th>  
                                              <th>Action</th>                                            
                                        </tr>
                                        
                                    </thead>
                                    <tbody>
                                     <c:forEach items="${debitNotesList}" var="debitNotesList">
                                            <tr class="odd gradeX">
                                            
                                            <td>${debitNotesList.txtVoucherNo}</td>
                                            <td>${debitNotesList.txtTransactionDate}</td>                                           
                                            <td>${debitNotesList.txtFromAcnt}</td>
                                            <td>${debitNotesList.txtToAcnt}</td>
                                            <td>${debitNotesList.txtAmount}</td>
                                            
                                            <td><div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle">Action <span class="caret"></span></button>
											  <ul class="dropdown-menu">
											   <li><a href="debitNotesView.do?voucherID=${debitNotesList.txtVoucherNo}">View</a></li>
											     
												<li><a href="deleteDebitNotes.do?voucherID=${debitNotesList.txtVoucherNo}">Delete</a></li>
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
<!-- </div> -->
</body>
</html>