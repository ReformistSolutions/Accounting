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
</head>	




<SCRIPT>
function addCredit(){
	
	var addCredit=document.getElementById("txtAmount").value;
	
	document.getElementById("txtAmounthidden").value=addCredit;
}
</SCRIPT>

<script>
	function back() {
		window.history.back();

	}
</script>

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
							<div class="col-md-9">
								<ul class="breadcrumb">
									<li class="active"><small><i class="glyphicon glyphicon-pencil"></i></small><small> New&nbsp;Credit&nbsp;Note</small>
								</ul>
							</div>
							<div class="col-md-3">							
			             	<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
							</div>
						</div>
					</div>
</div>
<form:form action="newCreditNote.do" modelAttribute="newcreditnote"  cssClass="form-inline" name="frmAC">
<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">       
                        <div class="col-sm-6">	     
                    
                        	<div>                            
                            	<form:label path="txtVoucherNo" cssStyle="vertical-align: middle;">Voucher Number :-</form:label>                            	
                            </div><br>
                            <div>                            
                            	<form:label path="txtTransactionDate" cssStyle="vertical-align: middle;">Transaction Date :-</form:label>                            	
                            </div><br>  <br>    

                            <div>                            
                            	<form:label path="txtFromAcnt" cssStyle="vertical-align: middle;">From Account:-</form:label>                            	
                            </div><br> 
                            
                            <div>                            
                            	<form:label path="txtToAcnt" cssStyle="vertical-align: middle;">To Account :-</form:label>                          	
                            </div><br> <br>
                            
                            <div>                            
                            	<form:label path="txtAmount" cssStyle="vertical-align: middle;">Amount :-</form:label>                            	
                            </div><br> <br>
                            
                            <div>                            
                            	<form:label path="txtDescription" cssStyle="vertical-align: middle;">Description :-</form:label>                            	
                            </div><br> 
                            
                            
                   		</div>
                   		<div class="col-sm-6">                   		
                   		<div>  
                            	<form:input path="txtVoucherNo" id="txtVnm" cssClass="form-control" cssStyle="width: 180px;" readonly="true" tabindex="1"></form:input>
                            	
                            </div><br>
                            
                            <div>  
                            <input type="text" id="dp1" name="txtTransactionDate" class="form-control" style="width: 160px;" />
																
<!--                             <input type="date" name="txtTransactionDate" class="form-control" style="width: 180px;" tabindex="2">
 -->                            <%-- <form:input path="txtTransactionDate" id="txtTD" cssClass="form-control" cssStyle="width: 180px;"></form:input> --%>
                            </div><br>
                            
                            <div>                            
                            	
                            	<form:select path="txtFromAcnt" id="txtFA" cssClass="form-control" cssStyle="width: 150px;" tabindex="3">
                            		
                            		<option>----Select----</option>                            		
                            		<c:forEach items="${acList}" var="acList">
                            		<option value="${acList.txtNewAccNo}">${acList.txtAccountName}</option>
                            
                            		</c:forEach>
                            	</form:select>
                            	
                            </div><br>
                            
                          <div>                            
                            	
                            	<form:select path="txtToAcnt" id="txtTA" cssClass="form-control" cssStyle="width: 150px;" tabindex="4">
                            		<option>----Select----</option>                            		
                            		<c:forEach items="${acList}" var="acList">
                            		<option value="${acList.txtNewAccNo}">${acList.txtAccountName}</option>
                            
                            		</c:forEach>
                            	</form:select>
                            	
                            </div><br>
                            
                            <div>  
                            	<form:input path="txtAmount" id="txtAmount" cssClass="form-control" cssStyle="width: 180px;" tabindex="5" onblur="addCredit()"></form:input>
                                <form:hidden path="txtAmounthidden" id="txtAmounthidden"></form:hidden>
                            
                            </div><br>
                            
                            <div>                            
                            	<form:textarea path="txtDescription" rows="4" cols="50" id="txtDes" cssClass="form-control" tabindex="6"></form:textarea>
                            	
                            </div><br>
                            
                            
                            <div>
                   				<input type="submit" value="Save" name="btn" class="btn btn-primary" tabindex="7">								
								<input type="reset" value="Cancel" name="btn" class="btn btn-primary" tabindex="8">
                   			</div>

								<c:if test="${message==1}">
									<h4 class="msg-succ">Item Updated Succesfully.</h4>
								</c:if>
								<c:if test="${message==0}">
									<h4 class="msg-error">Item Not Updated Succesfully.</h4>
								</c:if>

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