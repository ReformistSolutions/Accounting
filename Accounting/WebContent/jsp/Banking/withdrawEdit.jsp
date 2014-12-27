<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WithDraw Cash</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
 <link rel="stylesheet" href="<c:url value="/resources/assets/plugins/bootstrap/css/bootstrap.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/theme.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/MoneAdmin.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" />
        <link href="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.css" />" rel="stylesheet" />
    <script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" ></script>
     <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" ></script>
    <script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" ></script>
    <script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" > </script>
    <script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" ></script>
    <link rel="stylesheet" href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" >

    
     <!-- <script>
function validateForm1()
{
	if(document.frmWithdraw.txtwithVchrNo.value=="")
    {
        alert("VchrNo Should not be Empty....");
        document.frmWithdraw. txtwithVchrNo.focus();
        return false;
      }
	 else if(document.frmWithdraw.txtwithdate.value=="")
     {
         alert("Date field Should not be empty....");
         document.frmWithdraw.txtwithdate.focus();
         return false;
       }
	
	 else if(document.frmWithdraw.txtwithFrmAccnt.value=="0")
     {
         alert("Account field Should not be empty....");
         document.frmWithdraw.txtwithFrmAccnt.focus();
         return false;
       }
	
	 else if(document.frmWithdraw.txtwithToAccnt.value=="0")
     {
         alert("Account1 field Should not be empty....");
         document.frmWithdraw.txtwithToAccnt.focus();
         return false;
       }
	
	 else if(document.frmWithdraw.txtwithTransType.value=="")
     {
         alert("Transaction Type field Should not be empty....");
         document.frmWithdraw.txtwithTransType.focus();
         return false;
       }
	
	 else if(document.frmWithdraw.txtwithAmount.value=="")
     {
         alert("Amount field Should not be empty....");
         document.frmWithdraw.txtwithAmount.focus();
         return false;
       }
	
	 else if(document.frmWithdraw.txtwithDesc.value=="")
     {
         alert("Description field Should not be empty....");
         document.frmWithdraw.txtwithDesc.focus();
         return false;
       }
	
	 else
     {
   	  alert("Data Inserted Successfully....");
   	}
   
 }
 
 </script>
 
 <SCRIPT language=Javascript>
 function isNumberKey(evt)
       {
          var charCode = (evt.which) ? evt.which : event.keyCode;
          if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
             return false;

          return true;
       }

 function AllowCharacters(e)
 {
     var keycode;
     if (window.event) keycode = window.event.keyCode;
     else if (event) keycode = event.keyCode;
     else if (e) keycode = e.which;
     else return true;

     
     if((keycode >= 65 && kecode <= 90) || (keycode >= 97 && keycode <= 122))
     {
         return true;
     }
    else
    {
        return false;
      }

  return false;   
}

 function validateEmail(sEmail) {
	  var reEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

	  if(!sEmail.match(reEmail)) {
	    alert("Invalid email address");
	    return false;
	  }

	  return true;

	}

 </SCRIPT>
 --></head>
<body style="overflow-x: hidden;"> 
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div class="container"> -->
	<input type="hidden" id="hide" name="hide1" value="0"> <br>
			<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-sign-in"></i></small>&nbsp;Withdraw<small>&nbsp;Cash</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="banking.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
<form:form action="updateWithdraw.do" cssClass="form-inline" commandName="withdrawEdit" name="frmWithdraw" ><%-- onsubmit="return validateForm1()" --%>
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Voucher Number :</label>
														</div>
														<div class="col-md-6">
															<div class="input-group-btn">
																<form:input path="txtwithVchrNo" cssClass="form-control" readonly="true"></form:input> 

															</div>
														</div>
													</div>
												</div>

											</div>

											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Transaction Date* :</label>
														</div>
														<div class="col-md-6">
															<div class="input-group-btn">
																<form:input path="txtwithdate" cssClass="form-control"></form:input>

															</div>
														</div>
													</div>
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>From Account</label>
														</div>
														
														<div class="col-md-6">
														<div class="input-group">	
															<%-- <input type="text" value="${withdrawEdit.fromAccountNo}"> --%>
																<form:select path="txtwithFrmAccnt" cssClass="form-control">
																<option value="${withdrawEdit.fromAccountNo}">${withdrawEdit.txtwithFrmAccnt}</option>
																<option>----Select----</option>
																<c:forEach items="${acList}" var="acList">
																<option value="${acList.txtNewAccNo}">${acList.txtAccountName}</option>
																
																</c:forEach>
																</form:select>
															
															
															</div>
														</div>
													</div>
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>To Account</label>
														</div>
														<div class="col-md-6">
														<div class="input-group">	
																<form:select path="txtwithToAccnt" cssClass="form-control">
																
																<option value="${withdrawEdit.toAccountNo}">${withdrawEdit.txtwithToAccnt}</option>
																<option>----Select----</option>
																<c:forEach items="${acList}" var="acList">
																<option value="${acList.txtNewAccNo}">${acList.txtAccountName}</option>
																
																</c:forEach>
																</form:select>
															
															
															</div>
														</div>
													</div>
												</div>

											</div>
											<br>
											
											
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Transaction Type :</label>
														</div>
														<div class="col-md-6">
															<div class="input-group-btn">
															<form:select path="txtwithTransType" cssClass="form-control">
															<option>Withdraw Cash</option>
															</form:select>

															</div>
														</div>
													</div>
												</div>

											</div>

                                             <br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Amount</label>

														</div>
														<div class="col-md-6">
															<div class="input-group-bin">
																<form:input path="txtwithAmount" cssClass="form-control" ></form:input><%-- onkeypress="return isNumberKey(this)" maxlength="10"> --%>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Description</label>

														</div>
														<div class="col-md-6">
															<div class="input-group-bin">
																<form:textarea cssClass="form-control" rows="3" cols="22" path="txtwithDesc"></form:textarea>  <%-- onkeypress="return AllowCharacters(this);" --%>
															</div>
														</div>
													</div>
												</div>
											</div><br>
											<div class="row">
												<div class="col-md-6">
													<button id="submit" name="btn" value="Update" class="btn btn-primary">Update</button>	
 			                                         <button id="reset" name="btn" value="Cancel" class="btn btn-primary">Cancel</button>
												</div>
												<div class="col-md-6"></div>
											</div>
											<c:if test="${message==1}">       
												<h4 class="msg-succ">
												Enquiry Added Succesfully.
												</h4> 
												</c:if>
												<c:if test="${message==0}">                     
												<h4 class="msg-error">
												Enquiry Not Added Succesfully.
												</h4> 
												</c:if>
											
										</div>
									</div>
								</div>
								</form:form>
								</div>
								<!-- </div> -->
								</body>
								</html>
								