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
<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
</head>
<script>
function goBack()
	{
		window.history.back();
	}
</script>
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
            $( document ).ready(function() {
          	  $('#date').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
          	    $(this).datepicker('hide');
          	});
          	});
            $( document ).ready(function() {
          	  $('#ddate').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
          	    $(this).datepicker('hide');
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
<SCRIPT>
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
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div id="container"> -->
		<%@ include file="innerHeader.jsp" %>
					
					<!-- <div class="container">		 -->		<br>			
						 <div class="col-md-12">	   
					<div class="panel panel-default">
						<div class="panel-body">         
	            		<div class="col-md-10">	            		
			            	<ol class="breadcrumb">
			             	<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Compose<small>&nbsp;Mail</small>          
			             	</ol>			             
			             </div>
			              <div class="col-md-2 pull right" >
			             	<div>
			             		<button onclick="goBack()" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</button>
			             	</div>
			             </div>
			             </div>
			             </div>
			      </div>
	<div class="col-md-12">		
			<form:form action="sendMail.do" cssClass="form-inline" modelAttribute="composeMail" name="frmSendMail" onsubmit="return validateForm()">
		           
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>To&nbsp;: </label>
										</div>
										<div class="col-md-10">
											<%-- <form:input path="mailTo" id="mailTo" cssStyle="width:350px;" cssClass="form-control"></form:input> --%>
											<input type="text" name="mailTo" id="mailTo" value="${custInfo.txtMail1}" onblur="validateEmail(this.value)" style="width:350px;" class="form-control">
										<br><font size="1">For Multiple Mail Id Use <font size="3"><b>,</b></font> (eg.abc@reformist.in<font size="3"><b>,</b></font>info@reformist.co.in)</font>
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
											<input type="text" name="subject" id="subject" value="${custInfo.subject}" style="width:350px;" class="form-control">
											<input type="hidden" name="custId" value="${custInfo.txtCustID}">
											<input type="hidden" name="id" value="${custInfo.id}">
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
											<textarea name="body" id="body" rows="8" cols="52" class="form-control">Hello  ${custInfo.txtCustName}<%="\n"%><%="\n"%>${custInfo.bodyPart}<%="\n"%><%="\n"%>Kind Regards<%="\n"%> ${custInfo.regards}</textarea>
										</div>
									</div>
								</div>
							
							</div><br>
							<div class="row">
								<div class="col-md-10">
									<div class="row">
										<div class="col-md-2">
											<label>Attachment&nbsp;: </label>
										</div>
										<div class="col-md-8">
											<%-- <img src="<c:url value="/resources/images/PDF-icon.png" />" height="20" width="20"></img> <input type="text" name="attachment" id="attachment" value="${custInfo.attachment}" readonly="readonly" style="width: 200px;border: none;" class="form-control"> --%>
										<input type="hidden" name="attachment" id="attachment" value="${custInfo.attachment}" readonly="readonly" style="width: 200px;border: none;" class="form-control">
										<label><img src="<c:url value="/resources/images/PDF-icon.png" />" height="20" width="20"></img>&nbsp;&nbsp;${custInfo.attachment}</label>
										<!-- <link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon"> -->
										</div>
									</div>
								</div>
							
							</div><br>
							
							<div class="row">
								<div class="col-md-3">
								<input type="submit" class="btn btn-primary" name="btn" value="Send" data-toggle="tooltip" data-placement="top" title="Send"> <!-- onclick="javascript: history.go(-1)" -->
								<button type="button" onclick="goBack()" class="btn btn-primary" name="btn" data-toggle="tooltip" data-placement="top" title="Cancel">Cancel</button>
								</div>
							</div>
							</div>
						</div>
				
					<br>	
					</form:form>
					</div>
					<c:if test="${message==1}">                     
<h4 class="msg-succ">
<script>
	alert("Mail Sent Successfully");
	 history.go(-2) ;
</script>
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
<script>
	alert("Mail Sending Fail");
	history.go(-2) ;
</script>
</h4> 
</c:if>
	</div>
<!-- </div> -->	
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>				
</body>

</html>