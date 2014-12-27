<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Statement</title>
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

<script>
function validatebankForm()
{
	if(document.frmStatement.txtstartdate.value=="")
    {
        alert("Startdate Should not be Empty....");
        document.frmStatement. txtstartdate.focus();
        return false;
      }
	 else if(document.frmStatement.txtenddate.value=="")
     {
         alert("Enddate field Should not be empty....");
         document.frmStatement.txtenddate.focus();
         return false;
       }
	
	 else if(document.frmStatement.txtbankaccount.value=="")
     {
         alert("Bankaccount field Should not be empty....");
         document.frmStatement.txtbankaccount.focus();
         return false;
       }
	
	 else if(document.frmStatement.txtbankformat.value=="")
     {
         alert("Bankformat field Should not be empty....");
         document.frmStatement.txtbankformat.focus();
         return false;
       }
	
	 else if(document.frmStatement.Browse.value=="0")
     {
         alert("Select proper file....");
         document.frmStatement.Browse.focus();
         return false;
       }
	
	
	 
	
	 else
     {
   	  alert("Data Inserted Successfully....");
   	}
   
 }
</SCRIPT>
 
 <script type="text/javascript">
function showFileName() {
   var fil = document.getElementById("Browse");
   alert(fil.value);
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

    
    </head>
<body style="overflow-x: hidden;"> 
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div class="container"> -->
	<input type="hidden" id="hide" name="hide1" value="0"> <br>
			<div class="col-lg-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-sign-in"></i></small>&nbsp;New<small>&nbsp;Statement</small>
		             	</ul>
		             	</div>
			             	<div class="col-lg-2">
			             	<a href="newReconciliation.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		             
<form:form action="newStatement.do" cssClass="form-inline" commandName="newstatement" name="frmStatement"> <!-- onsubmit="return validatebankForm()"> -->
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
														
													<label>Start Date :</label>
														</div>
														<div class="col-md-6">
															<div class="input-group-btn">
															<input type="date" name="txtstartdate" class="form-control"><input> 

															</div>
														</div>
													</div>
												</div>
												

											</div>

											<br>
											<br>
											
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>End Date :</label>
														</div>
														<div class="col-md-6">
															<div class="input-group-btn">
																<input type="date" name="txtenddate" class="form-control"><input>

															</div>
														</div>
													</div>
												</div>

											</div>
											<br>
											<br>
											
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Select Bank Account :</label>
														</div>
														<div class="col-md-6">
															<div class="input-group-btn">
															<form:select path="txtbankaccount" cssClass="form-control">
															<option>----Select Account----</option>
															<option>Citi Bank</option>
															<option>Standard Chartered Bank</option>
															<option>SBI Bank</option>
															
															</form:select>
															</div>
														</div>
													</div>
												</div>

											</div>

                                             <br>
                                             <br>
                                             
                                             <div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label> Bank Format :</label>
														</div>
														<div class="col-md-6">
															<div class="input-group-btn">
															<form:select path="txtbankformat" cssClass="form-control">
															<option>----Select Bank----</option>
															<option>State Bank Of India</option>
															<option>ICICI Bank</option>
															<option>HDFC Bank</option>
															<option>Corporation Bank</option>
															<option>Bank Of India</option>
															<option>Other</option>
															
															</form:select>
															</div>
														</div>
													</div>
												</div>

											</div>

                                             <br>
                                             <br>
                                             
<%--                                              <form:form action="UploadDownloadFile" name="formUpload" method="post" enctype="multipart/form-data">
 --%>                                             <div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Select File To Upload :</label>

														</div>
														<div class="col-md-6">
															<div class="input-group-bin">
																<input type="file" name="Browse" id="Browse" class="form-control"> 
															</div>
														</div>
													</div>
												</div>
											</div>
											 
											<br>
											<br>
											
											<div class="row">
												<div class="col-md-6">
												     
												     
													<button id="submit" name="btn" value="Upload" class="btn btn-primary">Upload</button>	
 			                                        
												</div>
												<div class="col-md-6"></div>
											</div>
										</div>
									</div>
									
									</form:form>
							</div>
							
							<!-- </div> -->
								
								</body>
								</html>