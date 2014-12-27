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
function validateForm()
{
    if(document.frmJournalEntry.txtVchrNo.value=="")
    {
      alert(" Voucher No should be blank");
      document.frmJournalEntry.txtVchrNo.focus();
      return false;
    }
     else if(document.frmJournalEntry.txtDate.value=="")
    {
      alert("Date should not be empty");
      document.frmJournalEntry.txtDate.focus();
      return false;
    }
     else if(document.frmJournalEntry.txtAccountGroup.value=="-1")
     {
       alert("Account Group should not be empty..");
       document.frmJournalEntry.txtAccountGroup.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtdebit1.value=="")
     {
       alert("Debit Amount should not be empty..");
       document.frmJournalEntry.txtdebit1.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtcredit1.value=="")
     {
       alert("Credit Amount should not be empty..");
       document.frmJournalEntry.txtcredit1.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtDescription.value=="")
     {
       alert("Description should not be empty..");
       document.frmJournalEntry.txtDescription.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtTag.value=="")
     {
       alert("Email Id should not be empty..");
       document.frmJournalEntry.txtTag.focus();
       return false;
     }
    else{
    	alert("Data Insert Successfully...");
    }
}
</script>

<!-- <SCRIPT>
	function updateValue(){
		
	  var hideCerdit=document.getElementById("txtAmount").value;
	  alert("Hidden Value="+hideCerdit);
	 
	  var hideCerdit1=document.getElementById("txtAmounthidden").value;
	  alert("Hidden Value="+hideCerdit1);

	  document.getElementById("txtAmounthidden").value=parseFloat(hideCerdit);
	  var demo=document.getElementById("txtAmounthidden").value;
	  
	  alert(demo);
	} 
</SCRIPT>-->
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
						

<%-- <form:input path="hidden" id="hide" name="hide1" value="0"></form:input> --%>	
<br>					
<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small><i class="glyphicon glyphicon-pencil"></i></small><small> Update&nbsp;Credit&nbsp;Note</small>
								</ul>
							</div>
							<div class="col-md-2">							
			             	<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
							</div>
						</div>
					</div>
</div>
<form:form action="updateCreditNote.do" modelAttribute="editcreditnote" cssClass="form-inline" name="frmAC" >
<c:if test="${message==1}">                     
<h4 class="msg-succ">
Item Updated Succesfully.
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
Item Not Updated Succesfully.
</h4> 
</c:if>      .
         			
<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">    
          
                        <div class="col-md-3">	     
                   
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
                   		<div class="col-md-9">                   		
                   		<div>  
                            	<form:input path="txtVoucherNo" id="txtVnm" cssClass="form-control" cssStyle="width: 180px;"></form:input>
                            </div><br>
                            
                            <div>  
                            <input type="date" name="txtTransactionDate" class="form-control" value="${editcreditnote.txtTransactionDate}"style="width: 180px;">
                            <%-- <form:input path="txtTransactionDate" id="txtTD" cssClass="form-control" cssStyle="width: 180px;"></form:input> --%>
                            </div><br>
                            
                            <div>                            
                            	 <%-- <input type="text" name="txtFromAcnt" value="${editcreditnote.fromAccount}"> --%> 
                            	<form:select path="txtFromAcnt" id="txtFA" cssClass="form-control" cssStyle="width: 150px;">
                            		
                            		<option value="${editcreditnote.fromAccount}">${editcreditnote.txtFromAcnt}</option>                            		                                                    		
                            		<option>-----SELECT-----</option>
                            		<c:forEach items="${acccountList}" var="acccountList">
                            		<option value="${acccountList.txtNewAccNo}">${acccountList.txtAccountName}</option>
                            
                            		</c:forEach>
								</form:select>
                            	
                            </div><br>
                            
                          <div>                            
                            	<%-- <input type="text" name="txtToAcnt" value="${editcreditnote.toAccount}"> --%>
                            	<form:select path="txtToAcnt" id="txtTA" cssClass="form-control" cssStyle="width: 150px;">
                                                     		
                            		<option value="${editcreditnote.toAccount}">${editcreditnote.txtToAcnt}</option>
                            		<option>-----SELECT-----</option>
                            		<c:forEach items="${acccountList}" var="acccountList">
                            		<option value="${acccountList.txtNewAccNo}">${acccountList.txtAccountName}</option>
                            
                            		</c:forEach>
                            	</form:select>
                            	
                            </div><br>
                            
                            <div>  
                            	<form:input path="txtAmount" id="txtAmount" cssClass="form-control" cssStyle="width: 180px;" ></form:input>
								<form:hidden path="txtAmounthidden" id="txtAmounthidden"></form:hidden>                            
								<%-- <form:input path="txtNewAmount" id="txtNewAmount" cssClass="form-control" cssStyle="width: 180px;"></form:input> --%>                            
                            </div><br>
                            
                            <div>                            
                            	<textarea name="txtDescription" rows="4" cols="50" id="txtDes" class="form-control">${editcreditnote.txtDescription}</textarea>
                            </div><br>
                            
                            <div>
                   				<input type="submit" value="Update" name="btn" class="btn btn-primary">								
								<input type="reset" value="Cancel" name="btn" class="btn btn-primary">
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