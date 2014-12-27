<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Warehouse</title>
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
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();             
         });
</script>
<script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script>

<!--Dynamic row addition for warehouse  -->
<script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRow() {

	
		var tbl = document.getElementById('warehouse');
		var lastRow = tbl.rows.length; 
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		
		var j=length;
		j++;

		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";
         inputSrNo.name = "warehousedetails["+length+"].srNo";
         inputSrNo.id = "warehousedetails["+length+"].srNo";    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
      
         
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="warehousedetails["+length+"].itemCode";
		inputItem.name = "warehousedetails["+length+"].itemCode";
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
		 
		var newLength=length-1;
		var ln = document.getElementById("warehousedetails["+newLength+"].itemCode").length;
		
		for ( var k = 0; k < ln; k++)
		{
			
			var xVal = document.getElementById("warehousedetails["+newLength+"].itemCode").options[k].value;
			var xText = document.getElementById("warehousedetails["+newLength+"].itemCode").options[k].text;
			desc = document.getElementById("warehousedetails["+newLength+"].itemCode").options[k].label;
			
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.className = "form-control";
		secondCell.appendChild(inputItem);

		
		
		var thirdCell = row.insertCell(2);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "warehousedetails["+length+"].quantity";
		inputQty.name = "warehousedetails["+length+"].quantity";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		thirdCell.appendChild(inputQty);
		//

		//
		var fifthCell = row.insertCell(3);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrow(this);};
		fifthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('warehouse');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Quantity,DestWare,btndel,next;		
		 if(last == 2)
			 {
			 	ItemCode = document.getElementById("warehousedetails["+length+"].itemCode");
			 	Quantity = document.getElementById("warehousedetails["+length+"].quantity");
			 	
			 	ItemCode.value = 'select';
			 	Quantity.value = "";
			 	DestWare.value = 'select';
			 	
			 }		 
		 else
		 {
			 var current = window.event.srcElement;				 
		
			 while ( (current = current.parentElement)  && current.tagName !="TR");
       		 current.parentElement.removeChild(current);
         
      			  j--;      		
 			 var counter = obj.id.slice(6);
 			
 			 while(counter<last)
 				 {
 				 	next = counter;
 				 	next++;
 			 	
	 			 	txtSrNo = document.getElementById( "warehousedetails["+next+"].srNo");
	 			 	txtSrNo.id =  "warehousedetails["+counter+"].srNo";
	 			 	txtSrNo.name = "warehousedetails["+counter+"].srNo";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 	
 				 	 			 	
 				 	ItemCode = document.getElementById("warehousedetails["+next+"].itemCode");
 				 	ItemCode.id = "warehousedetails["+counter+"].itemCode";
 				 	ItemCode.name = "warehousedetails["+counter+"].itemCode";
 				 	
 			 	 				 		 	
 				 	Quantity = document.getElementById("warehousedetails["+next+"].quantity");
 				 	Quantity.id = "warehousedetails["+counter+"].quantity";
 				 	Quantity.name = "warehousedetails["+counter+"].quantity";
 				 	 				 	
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 	
 					counter++; 
 			 }
		 }
	 }
</script>
</head>
<body style="overflow-x: hidden;"> 
<div id="wrapper">
<%@include file="../header.jsp" %>
<div class="page-wrapper">	
<%@include file="innerHeader.jsp"%><br>
<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-10">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Edit&nbsp;Warehouse<small></small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
					<a href="showwarehouse.do" class="btn btn-primary btn-large"> Back</a>	
		         </div>
			</div>
		</div>
</div>
<form:form action="updatewarehouse.do" method="post" cssClass="form-inline" modelAttribute="editWarehouse" name="frmwarehouse"> 
<div class="col-md-12">
<div class="panel panel-default">                       
<div class="panel-body">
						
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5"> 
											<label>Warehouse&nbsp;ID:-</label>
										</div>
										<div class="col-md-5">  
											<form:input path="warehousrID" id="warehousrID" cssClass="form-control" readonly="true" cssStyle="width: 100px;"></form:input>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Warehouse Name:-</label>
										</div>
										<div class="col-md-5">  
											<form:input path="wareHouseName" id="wareHouseName" class="form-control"></form:input>
											<!-- <select name="wareHouseName" class="form-control" style="width: 150px;">
												<option value="Select">---Select---</option>
										</select> -->
									</div>
								</div>								
							</div>
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5"> 
											<label>Warehouse&nbsp;Address:-</label>
										</div>
										<div class="col-md-5">
													<form:textarea path="address" rows="4" cols="35" class="form-control" ></form:textarea>
														
												</div>
												
									</div>
								</div>																
							</div><br>							
					<div class="table-responsive" style="width: 70%;">
						<table id="warehouse" class="table table-striped">
							<tr>
								<th align="center">Sr No</th>
								<th align="center">Product</th>
								<th align="center">Quantity</th>
								<th></th>
							</tr>
							<c:forEach items="${editWarehouse.warehousedetails}" var="warehousedetails">	
							<tr>
								<td><form:input path="warehousedetails[${warehousedetails.srNo-1 }].srNo" id="warehousedetails[${warehousedetails.srNo-1 }].srNo" class="form-control" style="width: 50px; text-align: right;" value="${warehousedetails.srNo}"></form:input></td>
								<td><form:select path="warehousedetails[${warehousedetails.srNo-1 }].itemCode" id="warehousedetails[${warehousedetails.srNo-1 }].itemCode" onchange="showDesc(this.value,this.id)" cssClass="form-control">
										<option value="${warehousedetails.itemId}">${warehousedetails.itemCode}</option>
										<option value="Select">----Select----</option>
										<c:forEach items="${prodID}" var="prodID">
											<option value="${prodID.productCode}">${prodID.txtName}</option>
										</c:forEach>
										
									</form:select>
								</td>
								<td><form:input path="warehousedetails[${warehousedetails.srNo-1 }].quantity" id="warehousedetails[${warehousedetails.srNo-1 }].quantity" value="${warehousedetails.quantity}" class="form-control" style="text-align: right; width: 80px;"></form:input></td>
								<td><input type="button" id="btndel${warehousedetails.srNo-1 }" name="btndel${warehousedetails.srNo-1 }" class="btn btn-danger" value="-" onclick="delrow(this);" /></td>
								
							</tr>
							</c:forEach>
						</table>
						<input type="button" name="addRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRow()">
					</div>
				<br>
												<div>
													<label>Warehouse Comment</label>
												</div>
												<div>
													<form:textarea path="comments" rows="4" cols="35" class="form-control" ></form:textarea>
														
												</div>
												<br>
												<br>
												<div>
													<!-- <a href="inventory.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a> -->
													<button type="submit" class="btn btn-primary" name="btn"value="Update">Update</button>
													<a href="showwarehouse.do" class="btn btn-primary btn-large"> Cancel</a>	
												</div>
												</div>
												<c:if test="${message==1}">                     
<script>
alert("Product Updated Succesfully.");
</script>
</c:if>
<c:if test="${message==0}">                     
<script>
alert("Product Not Updated Succesfully.");
</script>
</c:if>
												</div>
												</div>
											</form:form>

</div>
</div>
</body>
</html>