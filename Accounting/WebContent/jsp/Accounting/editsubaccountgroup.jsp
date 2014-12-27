<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
            
             
         });
    </script>
    
     <!-- <script>
function validateForm()
{
    if(document.frmCreateAccount.txtName.value=="")
    {
      alert("Account Name should not be blank");
      document.frmCreateAccount.txtName.focus();
      return false;
    }
     else if(document.frmCreateAccount.txtParentacntgrp.value=="0")
    {
      alert("Please select Parents Group...");
      document.frmCreateAccount.txtParentacntgrp.focus();
      return false;
    } 
    else if(document.frmCreateAccount.txtDescription.value=="")
    {
      alert("Description Should not be Empty...");
      document.frmCreateAccount.txtDescription.focus();
      return false;
    }
    else
    	{
    	alert("Data Inserted Successfully...");
    	
    	}
}
</script> -->

<SCRIPT language=Javascript>
 function isNumberKey(evt)
       {
          var charCode = (evt.which) ? evt.which : event.keyCode;
          if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
             return false;

          return true;
       }

/*  function AllowCharacters(e)
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

	} */

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

<br>					
<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;New Account Group</li>
								</ul>
							</div>
							<div class="col-md-2">							
							<a href="frmAccountGroups.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
							</div>
						</div>
					</div>
</div>
<form:form action="updatesGroupAccount.do" cssClass="form-inline" name="frmCreateAccount" modelAttribute="editsGrpAccount">
	         <div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<br> <br>
							<hr></hr>
							<div class="col-sm-3">
								<div>                            
                            	<label>Account ID</label>                            	
                            </div><br>
                            <div> 
                        	<div>                            
                            	<label>Name* :-</label>                            	
                            </div><br>
                           <div>                            
                            	<label>Parent Account Group* :-</label>                           	
                            	
                            </div><br> 
                            <div>                            
                            	<label>Description:-</label>                            	
                            </div><br>
                   		
                   		</div>
							</div>
							<div class="col-sm-3">
							<div>  
                            	<form:input path="txtsAccGrpNo" readonly="true"></form:input>
                            </div><br>                 		
                   		<div>  
                            	<form:input path="txtName" cssClass="form-control"></form:input>
                            </div><br>
                             <div>                            
                            	
                            	
                            	<form:select path="txtParentacntgrp" id="txtParentacntgrp" cssClass="form-control">
                            		
                            		<option value="${editsGrpAccount.txtAccGrpNo}">${editsGrpAccount.txtParentacntgrp}</option>
                            		<option >----Select----</option>
                            		<option value="p">Primary</option>
                            		<c:forEach items="${grpList}" var="grpList">									
										    <option value="${grpList.txtAccGrpNo}">${grpList.txtName}</option>
									    </c:forEach>
                            	</form:select>
                            	
                            </div><br> 
                            <div>                            
                            	<form:textarea path="txtDescription" rows="4" cols="50"  id="txtOpnBal" cssClass="form-control"></form:textarea>
                            	
                            </div><br>
                   			<div>
                   				
                   				<input type="submit" value="Update" name="btn" class="btn btn-primary">							
								<a href="frmAccountGroups.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Cancel</a>
                   			</div>
                   		</div>
                   		
								
								
                   			<c:if test="${message==1}">                     
<h4 class="msg-succ">
Item Updated Succesfully.
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
Account created Succesfully.
</h4> 
</c:if>
							</div>

						</div>


					</div>
					</form:form>
				</div> 
       
  			
		
<!-- </div> -->
<!-- </div> -->
</body>
</html>