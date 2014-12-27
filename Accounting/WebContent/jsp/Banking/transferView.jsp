<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Cash</title>
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

    
</head>
<body style="overflow-x: hidden;"> 
<div id="wrapper">
<%@ include file="../header.jsp" %>
<!-- 	<div class="container"> -->
	<form:form action="Transfer.do" cssClass="form-inline" commandName="transferView" name="frmTransfer" onsubmit="return validateForm3()">
	
			<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-exchange"></i></small>&nbsp;Transfer<small>&nbsp;Cash</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="banking.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
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
					<c:if test="${update==1}">
					<div class="col-md-12">
					<div class="alert alert-success" role="alert" id="success">${msg}</div>
					</div>
					<script type="text/javascript">	
					  $('#success').fadeOut(4000, function() 
					{
					  });
					</script>
					</c:if>
					<c:if test="${update==0}">
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
		             <div class="col-md-12">
    <div class="panel panel-default">
    
       <div class="panel-body">
                        <div class="col-sm-3">	                         
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
                            	<label >Transaction Type :-</label>                          	
                            </div><br> 
                            
                            <div>                            
                            	<label >Amount :-</label>                            	
                            </div><br> 
                            
                            <div>                            
                            	<label>Description :-</label>                            	
                            </div><br> 
                            
                            
                   		</div>
                   		
                   		
                   		<div class="col-sm-9">                   		
                   		<div>  
                            	<label>${transferView.txttransVchrNo}</label>
                            </div><br>
                            
                            <div>  
                            <label>${transferView.txttransdate}</label>
                            </div><br>
                            
                            <div>     
                                  <label>${transferView.txttransFrmAccnt}</label>              
                            </div>
                            <br>                      
                          <div>      
                            	<label>${transferView.txttransToAccnt}</label>
                            </div><br>
                            
                             <div>      
                            	<label>${transferView.txttransTransType}</label>
                            </div><br>
                            
                            <div>  
                            	<label>${transferView.txttransAmount}</label>
                            </div><br>
                            
                            <div>                            
                            	<label>${transferView.txttransDesc}</label>                            	
                            </div><br>                         
                           	</div>
                        </div>                  
                        <div class="col-md-12">
                        <center>
						<input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('transferPDF.do?voucherNo=${transferView.txttransVchrNo}','_blank')">									 
<!-- 						<input type="button" value="E-Mail" name="btn" class="btn btn-primary">
 -->						</center>
				</div>
				
				<br><br><br><br> 
       </div>
</div>
</form:form>    		
</div>
<!-- </div> -->
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
</body>
</html>
												