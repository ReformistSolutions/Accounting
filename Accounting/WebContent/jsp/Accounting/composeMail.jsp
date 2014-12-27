<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Send Mail</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/jquery-1.10.2.js" />" ></script>
<script src="<c:url value="/resources/js/bootstrap.js" />" ></script>
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"/>"  rel="stylesheet" type="text/css" />	
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
                $('#date').datepicker({
                    format: "yyyy/mm/dd"
                });

                $('#ddate').datepicker({
                    format: "yyyy/mm/dd"
                });
                
            });
    </script>
</head>
<script>
function goBack() {	
    window.history.back();
}

</script>
<script type="text/javascript">
function showFileName() {
   var fil = document.getElementById("attachment");
   alert(fil.value);
}
</script>
<script>
function validateForm()
{  
	
	 if(document.frmSendMail.mailTo.value=="")
    {
      alert("Please Enter Receipants Mail ID...");
      document.frmSendMail.mailTo.focus();
      return false;
    }
     else if(document.frmSendMail.subject.value=="")
    {
      alert("Do You Really Want To Send Mail Without Subject");
      document.frmSendMail.mailTo.focus();
      return false;
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
	  var reEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,3})$/;

	  if(!sEmail.match(reEmail)) {
	    alert("Invalid email address");
	    return false;
	  }

	  return true;

	}
 </SCRIPT>

<script>
	function back() {
		window.history.back();

	}
</script>

<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
<!-- 	<div id="container"> -->
				
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-8">
								<ul class="breadcrumb">
								<li class="active"><i class="fa fa-2x fa-table"></i>&nbsp;&nbsp;Compose Mail</li>								</ul>
							</div>
							<div class="col-md-4">
							<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
							</div>
						</div>
					</div>
               </div>
		             <!-- <i class="fa fa-2x fa-table"> -->
			<form:form action="asendMail.do" cssClass="form-inline" modelAttribute="composeMail" name="frmSendMail" onsubmit="return validateForm()">
		            <div class="col-md-12">
						<div class="panel">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>To&nbsp;: </label>
										</div>
										<div class="col-md-8">
											<%-- <form:input path="mailTo" id="mailTo" cssStyle="width:350px;" cssClass="form-control"></form:input> --%>
											<input type="text" name="mailTo" id="mailTo" value="${vendInfo.txtMail1}" onblur="validateEmail(this.value)" style="width:350px;" class="form-control">
										</div>
									</div>
								</div>												
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>CC&nbsp;: </label>
										</div>
										<div class="col-md-8">
											<input type="text" name="mailCC" id="mailCC" style="width:350px;" class="form-control">
											
										</div>
									</div>
								</div>												
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>BCC&nbsp;: </label>
										</div>
										<div class="col-md-8">
											<input type="text" name="mailBCC" id="mailBCC" style="width:350px;" class="form-control">
										</div>
									</div>
								</div>												
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>Subject: </label>
										</div>
										<div class="col-md-8">
											<input type="text" name="subject" id="subject" style="width:350px;" class="form-control">
											<input type="hidden" name="custId" value="${vendInfo.txtCustID}">
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>Message&nbsp;: </label>
										</div>
										<div class="col-md-8">
											<textarea name="body" id="body" rows="8" cols="52" class="form-control">Hello  ${vendInfo.txtCustName}</textarea>
										</div>
									</div>
								</div>
							
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>Attachments&nbsp;: </label>
										</div>
										<div class="col-md-8">
											<input type="file" name="attachment" id="attachment" class="form-control">
										</div>
									</div>
								</div>
							</div><br>
							<div class="row">
								<div class="col-md-3">
								<input type="submit" class="btn btn-primary" name="btn" value="Send">
								<button type="reset" class="btn btn-primary" name="btn">Cancel</button>
								</div>
							</div>
							</div>
						</div>
					</div>
					<br>	
					</form:form>
					
					<c:if test="${message==1}">                     
<h4 class="msg-succ">
<script>
	alert("Mail Sent Successfully");
</script>
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
<script>
	alert("Mail Sending Fail");
</script>
</h4> 
</c:if>
	</div>
<!-- </div> -->	
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>				
</body>
</html>