<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>New Tax</title>

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

<script>
	function back() {
		window.history.back();

	}
</script>

<script type="text/javascript">
	$(document).ready(function	(){
		
		
		
		$('input[type="checkbox"]').click(function(){
			if($(this).attr("value")=="sales"){
				$("#linksale").toggle(1000);
				$("#salestaxhide").toggle(1000);
				
			}
			
			if($(this).attr("value")=="purchase"){
				$("#purchasetaxhide").toggle(1000);
				$("#linkpur").toggle(1000);
			}
			if(($(this).attr("value")=="sales")&&($(this).attr("value")=="purchase"))
				{
				$("#salestaxhide").toggle(1000);
				$("#purchasetaxhide").toggle(1000);
				$("#salestaxhide").toggle(1000);
				$("#linkpur").toggle(1000);
				}
			
		});
		$('#addLinkedTax').click(function(){
			 
				$('#linkedTax').show('slow');
			
	});
		 $('#backdel').click(function(){
			$('#linkedTax').hide('slow');	
				});
	});
</script>
<script type="text/javascript">
	var i=1;
	var j=1;	
	function addRow() {
		var tbl = document.getElementById('tableID');
		var lastRow = tbl.rows.length; 
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		
		 var firstCell = row.insertCell(0);
         var inputlinkTaxName = document.createElement("input");
         inputlinkTaxName.type = "text";       
         inputlinkTaxName.name = "linkedTax["+length+"].linkTaxName";
         inputlinkTaxName.id = "linkedTax["+length+"].linkTaxName";
         inputlinkTaxName.style.width='160px';
        // inputlinkTaxName.value=inputlinkTaxName.id;
         inputlinkTaxName.className = "form-control";
         firstCell.appendChild(inputlinkTaxName);
		
         
		var secondCell = row.insertCell(1);
		var inputlinkregNo = document.createElement("input");
		inputlinkregNo.type = "text";
		inputlinkregNo.id ="linkedTax["+length+"].linkregNo";
		inputlinkregNo.name = "linkedTax["+length+"].linkregNo";
		inputlinkregNo.className = "form-control";
		inputlinkregNo.style.width='130px';
		//inputlinkregNo.value=inputlinkregNo.id;
		secondCell.appendChild(inputlinkregNo);
		
		var thirdCell=row.insertCell(2);
		var inputrate=document.createElement("input");
		inputrate.type = "text";
		inputrate.id ="linkedTax["+length+"].rate";
		inputrate.name = "linkedTax["+length+"].rate";
		inputrate.className = "form-control";
		inputrate.style.width="80px";
		//inputrate.value=inputrate.id;
		thirdCell.appendChild(inputrate);
		
		var fourthCell = row.insertCell(3);
		var inputlinkdesc = document.createElement("input");
		inputlinkdesc.type = 'text';
		inputlinkdesc.id = "linkedTax["+length+"].linkdesc";
		inputlinkdesc.name = "linkedTax["+length+"].linkdesc";		
		inputlinkdesc.style.width='160px';
		//inputlinkdesc.value=inputlinkdesc.id;
		inputlinkdesc.className = "form-control";
		fourthCell.appendChild(inputlinkdesc);
		
		var fifthCell = row.insertCell(4);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrow(this);};			
		fifthCell.appendChild(inputDelete);
	
	}	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('tableID');
 		 var last =tbl.rows.length; 	
		 if(last == 2)
			 {
			 	document.getElementById("linkedTax["+length+"].linkTaxName").value="";			 	
			 	document.getElementById("linkedTax["+length+"].linkregNo").value="";
			 	document.getElementById("linkedTax["+length+"].rate").value="";			 	
			 	document.getElementById("linkedTax["+length+"].linkdesc").value="";
			 }		 
		 else
		 {
			 var current = window.event.srcElement;
			 while ( (current = current.parentElement)  && current.tagName !="TR");
       		 current.parentElement.removeChild(current);         
      				
 			 var counter = obj.id.slice(6);
 			
 			 while(counter<last)
 				 {
 				 	var next = counter;
 				 	next++;
 			 	
	 			 	var linkTaxName = document.getElementById( "linkedTax["+next+"].linkTaxName");
	 			 	linkTaxName.id =  "linkedTax["+counter+"].linkTaxName";
	 			 	linkTaxName.name = "linkedTax["+counter+"].linkTaxName";
	 			 	//linkTaxName.value=linkTaxName.id;
 				 	 			 	
 				 	var linkregNo = document.getElementById("linkedTax["+next+"].linkregNo");
 				 	linkregNo.id = "linkedTax["+counter+"].linkregNo";
 				 	linkregNo.name = "linkedTax["+counter+"].linkregNo"; 
 				 	//linkregNo.value=linkregNo.id;
 				 	
 				 	var rate = document.getElementById("linkedTax["+next+"].rate");
 				 	rate.id = "linkedTax["+counter+"].rate";
 				 	rate.name = "linkedTax["+counter+"].rate"; 	
 				 	//rate.value=rate.id;
 			 	
 				 	var linkdesc = document.getElementById("linkedTax["+next+"].linkdesc");
 				 	linkdesc.id = "linkedTax["+counter+"].linkdesc";
 				 	linkdesc.name = "linkedTax["+counter+"].linkdesc";
 				 	//linkdesc.value=linkdesc.id;
 				  			 	
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 	
 					counter++;
 			 }
		 }
	 }
	function getid(id)
	{
		alert("Id="+id);
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
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;New Tax</li>
								</ul>
							</div>
							<div class="col-md-2">							
							<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button> 							
							</div>
						</div>
					</div>
</div>
	<form:form action="addsalpurTax.do" cssClass="form-horizontal" modelAttribute="addNeTax">
		<div class="col-md-12">
						<div class="panel">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-3">
								   <div class="row">
										<div class="col-md-8">
											<label>Tax No 	: </label>
										</div>
										<div class="col-md-4">
										    <form:input path="taxid" cssClass="form-control"  cssStyle="width: 200px;" readonly="true"/>
										
										</div>
									</div>
									
								</div>
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-8">
											<label style="width: 155px;">Registration No  :</label>
										</div>
										<div class="col-md-4">
											<form:input path="txtRegNo" cssClass="form-control" cssStyle="width: 200px;"/>
										</div>
									</div>
								</div>	
												
							</div><br>
							<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-8">
											<label>Tax Name : </label>
										</div>
										<div class="col-md-4">
											<form:input path="txtTaxName" cssClass="form-control"  cssStyle="width: 200px;"/>
										</div>
									</div>
								</div>
								<div class="col-md-2"></div>
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-8">
											<label style="width: 155px;">Filling Frequency :</label>
										</div>
										<div class="col-md-4">
											<form:select path="txtFillingFre" id="txtPAcGrp" cssClass="form-control" cssStyle="width: 200px;">
                            		        <option>----Select----</option>
                            	           	<option>Half-Yearly</option>
                            	           	<option>Yearly</option>
                            	           	<option>Monthly</option>
                            	           	<option >Weekly</option>
                            	</form:select>
										</div>
									</div>
								</div>					
							</div><br>
							
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label style="width: 150px;">Tax applies to : </label>
										</div>
										<div class="col-md-8">
											<label class="checkbox-inline">
  												<form:checkbox id="chkSale" path="salepurchase" value="sales"/> <b>Sales</b>
											</label><br>
											<label class="checkbox-inline">
  											<form:checkbox id="chkPur" path="salepurchase" value="purchase"/><b> Purchase</b>
											</label>
										</div>
										
									</div>
								</div>
								
											
							</div><br>
							<div id="salestaxhide" style="display: none;">
							<div class="row" >
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-8">
											<label>Sales Tax Rate : </label>
										</div>
										<div class="col-md-4">
											<form:input path="txtSalesTaxRate" cssClass="form-control" cssStyle="width: 200px;"></form:input>
										</div>
									</div>
								</div>
								<div class="col-md-2"></div>
										
							</div>
							</div><br>
							<div id="purchasetaxhide" style="display: none;">
							<div class="row" >
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-8">
											<label style="width: 155px;">Purchase Tax Rate : </label>
										</div>
										<div class="col-md-4">
											<form:input path="txtPurTax" cssClass="form-control" cssStyle="width: 200px;"></form:input>
										</div>
									</div>
								</div>
								</div>
							</div>
							<br>
								<div class="row">
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-8">
											<label>Description :</label>
										</div>
										<div class="col-md-4">
											<form:textarea path="txtDescription" cols="20" rows="2"  cssClass="form-control" cssStyle="width: 200px;"></form:textarea>
										</div>
									</div>
								</div>
								
							</div>
							
							<br>
							<div id="linkedTax" style="display: none;">
							<!-- <div class="col-md-12">
									<div class="panel">
										<div class="panel-body">
											<div class="col-md-10">
												<ul class="breadcrumb">
													<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Linked Tax </li>
												</ul>
											</div>
											<div class="col-md-2">
												<button type="button" class="btn btn-primary btn btn_danger" id="backdel">X</button>
											</div>
										</div>
									</div>
								</div> -->
								<div class="table-responsive" style="width: 90%;">
										<table id="tableID" class="table table-striped">
										<thead>
											<tr>
												<th align="center">Tax Name</th>
												<th align="center">Registration No</th>
												<th align="center">Rate</th> 
												<th align="center">Description</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="text" name="linkedTax[0].linkTaxName" id="linkedTax[0].linkTaxName" style="width: 160px;" class="form-control" ></input></td>												
												<td><input type="text" name="linkedTax[0].linkregNo" id="linkedTax[0].linkregNo" style="width: 130px;" class="form-control" ></td>
												<td><input type="text" name="linkedTax[0].rate" id ="linkedTax[0].rate" style="width: 80px;text-align: right;" class="form-control" ></input></td> 
												<td><input type="text" name="linkedTax[0].linkdesc" id="linkedTax[0].linkdesc" class="form-control" style="width:160px;"></td>
												<td><input type="button" name="btndel0" id="btndel0" value="-" onclick="delrow(this)" class="btn btn-danger"></td>
												
											</tr>											
											</tbody>
										</table>
										<div><input type="button" name="btnadd1" id="btnadd1" value="+ Add New Row" onclick="addRow();" class="btn btn-default btn-xs"></div>
									</div>
							</div><br>
							<%-- <div id="linkedTax" style="display: none;">
							<hr>
								<div class="col-md-12">
									<div class="panel">
										<div class="panel-body">
											<div class="col-md-10">
												<ul class="breadcrumb">
													<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Linked Tax </li>
												</ul>
											</div>
											<div class="col-md-2">
												<button type="button" class="btn btn-primary btn btn_danger" id="backdel">X</button>
												
											</div>
										</div>
									</div>
								</div>
								
								<form:form action="addsalpurTax.do" cssClass="form-horizontal" modelAttribute="addlinktax">
								<div class="row">
								<div class="col-md-3">
								   <div class="row">
										<div class="col-md-8">
											<label>Tax No 	: </label>
										</div>
										<div class="col-md-4">
										    <form:input path="linkTaxID" cssClass="form-control"  cssStyle="width: 200px;"/>
										
										</div>
									</div>
									
								</div>
												
							</div><br>
							<div class="row">
								<div class="col-md-3">
								   <div class="row">
										<div class="col-md-8">
											<label>Tax Name 	: </label>
										</div>
										<div class="col-md-4">
										    <form:input path="linkTaxName" cssClass="form-control"  cssStyle="width: 200px;" />
										
										</div>
									</div>
									
								</div>
												
							</div><br>
							
							<div class="row">
								<div class="col-md-3">
								   <div class="row">
										<div class="col-md-8">
											<label>Registration&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-4">
										    <form:input path="linkregNo" cssClass="form-control"  cssStyle="width: 200px;"/>
										
										</div>
									</div>
									
								</div>
												
							</div><br>
							<div id="linksale" style="display: none;">
							<div class="row">
								<div class="col-md-3">
								   <div class="row">
										<div class="col-md-8">
											<label>Sales Tax Rate : </label>
										</div>
										<div class="col-md-4">
										    <form:input path="linksalesTax" cssClass="form-control"  cssStyle="width: 200px;"/>
										
										</div>
									</div>
									
								</div>
							</div>
							</div>
							<br>
							<div id="linkpur" style="display: none;">
							<div class="row">
								<div class="col-md-3">
								   <div class="row">
										<div class="col-md-8">
											<label style="width: 150px;">Purchase Tax Rate : </label>
										</div>
										<div class="col-md-4">
										    <form:input path="linkPurTax" cssClass="form-control"  cssStyle="width: 200px;"/>
										
										</div>
									</div>
									
								</div>
												
							</div>
							</div>
							<br>
							
							<div class="row">
								<div class="col-md-3">
								   <div class="row">
										<div class="col-md-8">
											<label>Description 	: </label>
										</div>
										<div class="col-md-4">
										    <form:input path="linkdesc" cssClass="form-control"  cssStyle="width: 200px;"/>
										
										</div>
									</div>
									
								</div>
												
							</div><br> 
							</form:form>
							</div> --%>
							
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-3">
											<button type="button" class="btn btn-primary btn-xs" id="addLinkedTax"><i class="fa fa-plus-square"></i> Add linked tax</button>
										</div>
										<div class="col-md-2">
												<button type="button" class="btn btn-danger btn-xs" id="backdel">X</button>
											</div>
									</div>
								</div>
							</div>
						<br>
						
							<div class="row">
								<div class="col-md-8">
									<div class="row">
										<div class="col-md-3">
											
										</div>
										<div class="col-md-9">
											<button type="submit" class="btn btn-primary">Save</button>
										    <button type="button" class="btn btn-primary" onclick="back()">Cancel</button>
										</div>
									</div>
								</div>
							</div>
							
						
						<br><br>
							<div class="row">
							<div class="col-md-3"></div>
								
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
								
								<div class="col-sm-1"></div>													
							</div><br>
							</div>
					</div>
				</div>																
		</form:form>
	</div>
	<!-- </div> -->
</body>
</html>