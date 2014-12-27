<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>New Debit Note</title>

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
    
    <link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">

$(document).ready(function () {            	
    $('#dp1').datepicker({
        format: "yyyy-mm-dd"
    });
    $( document).ready(function() {
     	  $('#dp1').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
     	    $(this).datepicker('hide');
     	});
    });
});
    </script>
    
<SCRIPT>
function addDebit(){
	
	var addCredit=document.getElementById("txtAmount").value;
	alert(addCredit);
	document.getElementById("txtAmounthidden").value=parseFloat(addCredit);
	alert(addCredit);
}
</SCRIPT>

<script>
	function back() {
		window.history.back();

	}
</script>

</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
	<%@include file="../header.jsp"%>
<!-- 	<div class="container"> -->
		<%@include file="innerHeader.jsp"%>				

<%-- <form:input path="hidden" id="hide" name="hide1" value="0"></form:input> --%>	
<br>			
<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-9">
								<ul class="breadcrumb">
									<li class="active"><small><i class="glyphicon glyphicon-pencil"></i></small><small>New&nbsp;Debit&nbsp;Note</small>
								</ul>
							</div>
							<div class="col-md-3">							
			             	<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
							</div>
						</div>
					</div>
</div>	
<form:form action="newDebitNotes.do" modelAttribute="newdebitnote" cssClass="form-inline" name="frmAC">
		
<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">
                        <div class="col-md-4">	                         
                        	<div>                            
                            	<label style="vertical-align: middle;">Voucher Number :-</label>                            	
                            </div><br>
                            <div>                            
                            	<label style="vertical-align: middle;">Transaction Date :-</label>                            	
                            </div><br>  <br>    

                            <div>                            
                            	<label style="vertical-align: middle;">From Account:-</label>                            	
                            </div><br> 
                            
                            <div>                            
                            	<label style="vertical-align: middle;">To Account :-</label>                          	
                            </div><br> <br>
                            
                            <div>                            
                            	<label style="vertical-align: middle;">Amount :-</label>                            	
                            </div><br> <br>
                            
                            <div>                            
                            	<label style="vertical-align: middle;">Description :-</label>                            	
                            </div><br> 
                            
                            
                   		</div>
                   		<div class="col-md-8">                   		
                   		<div>  
                            	<form:input path="txtVoucherNo" id="txtVnm" cssClass="form-control" cssStyle="width: 180px;" readonly="true"></form:input>
                            </div><br>
                            
                            <div>  
                          <input type="text" id="dp1" name="txtTransactionDate" class="form-control" style="width: 160px;" />
                            
<!--                             <input type="date" name="txtTransactionDate" class="form-control" style="width: 180px;">
 -->                            	<%-- <form:input path="txtTransactionDate" id="txtTD" cssClass="form-control" cssStyle="width: 180px;"></form:input> --%>
                            </div><br>
                            
                            <div>                            
                            	
                            	<form:select path="txtFromAcnt" id="txtFA" cssClass="form-control" cssStyle="width: 150px;">
                            		<option>----Select----</option>                            		
                            		<c:forEach items="${acclists}" var="acclists">
                            		<option value="${acclists.txtNewAccNo}">${acclists.txtAccountName}</option>
                            
                            		</c:forEach>
                            	</form:select>
                            	
                            </div><br>
                       <div>                           	
                            	<form:select path="txtToAcnt" id="txtTA" cssClass="form-control" cssStyle="width: 150px;">
                            	
                            		<option>----Select----</option>                            		
                            		<c:forEach items="${acclists}" var="acclists">
                            		<option value="${acclists.txtNewAccNo}">${acclists.txtAccountName}</option>
                            
                            		</c:forEach>
                            	</form:select>
                            	
                       </div>
                       <br>
                       <div>  
                       
                       	<form:input path="txtAmount" id="txtAmount" cssClass="form-control" cssStyle="width: 180px;" onblur="addDebit()"></form:input>
                        <form:input path="txtAmounthidden" id="txtAmounthidden" cssClass="form-control" cssStyle="width: 180px;"></form:input> 
                        </div><br>
                         <div>                            
                            	<form:textarea path="txtDescription" rows="4" cols="50" id="txtDes" cssClass="form-control"></form:textarea>
                            	
                            </div><br>
                            
                            <div>
                   				<input type="submit" value="Save" name="btn" class="btn btn-primary">								
								<input type="reset" value="Cancel" name="btn" class="btn btn-primary">
                   			</div>
                   			<%-- <c:if test="${message==1}">                     
<h4 class="msg-succ">
Item Updated Succesfully.
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
Item Not Updated Succesfully.
</h4> 
</c:if> --%>
                   		</div>
                   		
                        </div>
                        
						
                    </div>
                </div>
            
	          
       
  			
</form:form>    		
</div>
<!-- </div> -->
<script
		src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>