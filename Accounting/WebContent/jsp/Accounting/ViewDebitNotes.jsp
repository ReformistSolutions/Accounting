<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Debit Note</title>

<link href="<c:url value="resources/assets/plugins/bootstrap/css/bootstrap.css" /> "rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/css/main.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="res ources/assets/css/theme.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.css"/>"rel="stylesheet" type="text/css" />

<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" /> "type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" /> "type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" /> "type="text/javascript"></script>

    
     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();
             $('#dataTables-example4').dataTable();
             $('#dataTables-example5').dataTable();
             
         });
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
<!-- <script>
	function back() {
		window.history.back();

	}
</script> -->
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
	<%@include file="../header.jsp"%>
	<!-- <div class="container"> -->
    <%@include file="innerHeader.jsp"%>				

<%-- <form:input path="hidden" id="hide" name="hide1" value="0"></form:input> --%>	
<br>			
<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small><i class="glyphicon glyphicon-pencil"></i></small><small>New&nbsp;Debit&nbsp;Note</small>
								</ul>
							</div>
							<div class="col-md-2">	
							
							 <a href="debitnote.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
													
<!-- 			             	<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
 -->							</div>
						</div>
					</div>
</div>	
		<form:form action=" " modelAttribute="viewDebit" cssClass="form-inline" name="frmAC">  
<div class="col-md-12">
    <div class="panel panel-default">
    
       <div class="panel-body">
                        <div class="col-md-3">	                         
                        	<div>                            
                            	<label >Voucher Number :-</label>                            	
                            </div><br>
                            <div>                            
                            	<label >Transaction Date :-</label>                            	
                            </div><br>    

                            <div>                            
                            	<label >From Account:-</label>                            	
                            </div><br> 
                            
                            <div>                            
                            	<label >To Account :-</label>                          	
                            </div><br> 
                            
                            <div>                            
                            	<label >Amount :-</label>                            	
                            </div><br> 
                            
                            <div>                            
                            	<label>Description :-</label>                            	
                            </div><br> 
                            
                            
                   		</div>
                   		<div class="col-md-9">                   		
                   		<div>  
                            	<label>${viewDebit.txtVoucherNo}</label>
                            </div><br>
                            
                            <div>  
                            <label>${viewDebit.txtTransactionDate}</label>
                            	<%-- <form:input path="txtTransactionDate" id="txtTD" cssClass="form-control" cssStyle="width: 180px;"></form:input> --%>
                            </div><br>
                            
                            <div>     
                                  <label>${viewDebit.txtFromAcnt}</label>              
                            </div>
                            <br>                      
                          <div>      
                            	<label>${viewDebit.txtToAcnt}</label>
                            </div><br>
                            
                            <div>  
                            	<label>${viewDebit.txtAmount}</label>
                            </div><br>
                            
                            <div>                            
                            	<label>${viewDebit.txtDescription}</label>                            	
                            </div><br>
                            
								<div class="col-md-12">
  									
  									<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('debitNotesPDF.do?voucherID=${viewDebit.txtVoucherNo}')">  
									<input type="button" value="Email" name="btn" class="btn btn-primary" onclick="urlSubmit('composemailDr.do?voucherID=${viewDebit.txtVoucherNo}')">

								</div>
							</div>
                        	
                        </div>
                  
                        
				
				<br><br><br><br> 
                     </div>
                    
                </div>
            
</form:form>    		
</div>
<!-- </div> -->
</body>
</html>