<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Journal Entry</title>
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
<%-- <script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
            
             
         });
    </script>
    <script>
	function back() {
		window.history.back();

	}
</script>
</head>	
<body>
<div id="wrapper">
	<%@include file="../header.jsp"%>
	<div class="container">
		<%@include file="innerHeader.jsp"%>

<br>

<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-7">
								<ul class="breadcrumb">
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Journal Entry</li>
								</ul>
							</div>
							<div class="col-md-5">		
							<a href="newJournalEntry.do"><input type="button" name="btnAdd" value="+ Add New Record" class="btn btn-primary"/></a>					
							<a href="accounting.do" class="btn btn-primary btn-large"> Back</a> 							
							
							</div>
						</div>
					</div>
</div>
<br>
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
<%-- <c:if test="${message==1}">
<div class = "col-md-12" align="center">	
 <lable id="no" style = "color:green;" >Journal Entry Created Successfully...!!!</lable>
 <script type="text/javascript">	
  $('#no').fadeOut(4000, function() 
{
  });
</script>
</div>
</c:if>
<c:if test="${message==0}">
<div class = "col-md-12" align="center">	
 <lable id="no" style = "color:red;" >Credit and Debit Amount should not be match.</lable>
 <script type="text/javascript">	
  $('#no').fadeOut(4000, function() 
{
  });
</script>
</div>
</c:if> --%>
<br>
    <form:form action="journal.do" cssClass="form-inline" modelAttribute="journalHeader">             
	<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">
        <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                           <thead>
                               <tr> 
                               				<!-- <th>Journal ID</th> -->
                               				<th>voucher ID</th>
                                            <th>Date</th>
                                            <th>Amount</th>
                                            <th>Created By</th>
                                            <th>Action</th>
                               </tr>
                           </thead>
                           <tbody>
                                <c:forEach items="${journalList}" var="journalList">  
                                        <tr class="odd gradeX">
                                        	
                                        	
                                            <td>${journalList.txtjourid}</td>
                                            <td>${journalList.txtDate}</td>                                          
                                            <td>${journalList.amount}</td>
                                            <td>Owner</td>
                                           
                                    <td><div class="btn-group">
								  <button data-toggle="dropdown" class="btn dropdown-toggle">Action <span class="caret"></span></button>
								  <ul class="dropdown-menu">
									 <li><a href="viewJournalEntry.do?voucher_No=${journalList.txtjourid}">View</a></li>
									<%-- <li><a href="editJournalEntry.do?voucher_No=${journalList.txtjourid}">Edit</a></li> --%>
									<li><a href="deleteJournalEntry.do?journal_Id=${journalList .txtjourid}">Delete</a></li>
									
								  </ul></div>
								  </td>
                               </tr>
                              </c:forEach> 
                              
                               </tbody>
                       </table>
                             
                            </div>                                    
        </div>
    </div>
                      
</form:form>	
</div>
 </div>
</body>
</html>