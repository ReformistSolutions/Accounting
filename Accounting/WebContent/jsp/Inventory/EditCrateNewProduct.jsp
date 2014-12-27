<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Product</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />"
	type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"
	rel="stylesheet" type="text/css">

<link href="<c:url value="/resources/assets/css/main.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/theme.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/MoneAdmin.css" />"
	rel="stylesheet" type="text/css">

<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"
	type="text/javascript"></script>
<%-- <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script> --%>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#radio1').click(function(){
			$("#batch").toggle(800);
			$("#batchchk").toggle(800);
			$("#stock").toggle(800);
			value = $("#prevOpeningStock").val();
			$('#txtOpeningStock').val(value);
			value1 = $("#prevReorderlevel").val();
			$('#txtReorderlevel').val(value1);
		});
		
		$('#radio2').click(function(){
			$("#batch").hide(800);
			$("#batchchk").hide(800);
			$("#stock").hide(800);
			$('#txtOpeningStock').removeAttr('value');
			$('#txtReorderlevel').removeAttr('value');
		});
			
	});		
</script>
<script type="text/javascript">
	$(document).ready(function	()
	{
		$('input[type="checkbox"]').click(function()
		{
			if($(this).attr("value")=="sell")
			{
				$("#sellbox").toggle(800);		
			}
			if($(this).attr("value")=="purchase")
			{
				$("#purbox").toggle(800);
			}
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function()
	{
		/* $("#chkPur").change(function() {
	        if ($(this).not(":checked")) 
	        {
	        	$('#txtPurchasePrice').val('');
				$('#selectExpenseAccnt').val('');
	        }
	        else if ($(this).is(":checked")) 
	        {
	        	$('#txtPurchasePrice').val('');
				$('#selectExpenseAccnt').val('');
	        }
	    });	 */
	});
</script>
<script type="text/javascript">
function verifyBox()
{
	if(document.getElementById("chkSell").checked && document.getElementById("chkPur").checked)
	{
	
		document.getElementById("tablemanufacture").style.display = "none";
		document.getElementById("addRec").style.display = "none";
	   var resale = "Resale Product";
		document.getElementById("productType").value= resale;
	}	
	else if(document.getElementById("chkPur").checked)
	{
		var purchase = "Purchase Item";
		document.getElementById("productType").value= purchase;
	}
	else if(document.getElementById("chkSell").checked)
	{
		document.getElementById("tablemanufacture").style.display = "";
		document.getElementById("addRec").style.display = "";
		var sell = "Sale Item";
		document.getElementById("productType").value = sell;
	}
}
</script>
<script type="text/javascript">
function enable()
{
	if(document.getElementById("InventY").checked)
		{
			var invYes = "Yes";
			document.getElementById("Inventory").value = invYes;
		}
	else if(document.getElementById("InventN").checked)
	{
		var invNo = "No";
		document.getElementById("Inventory").value = invNo;
	}
}
</script>
<script type="text/javascript">
function batchenable()
{
	if(document.getElementById("BatchY").checked)
	{
		var BYes = "Yes";
		document.getElementById("Batch").value = BYes;
	}
	else if(document.getElementById("BatchN").checked)
	{
			var BNo = "No";
			document.getElementById("Batch").value = BNo;
	}		
}
</script>
<script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRow() 
	
	{

		var tbl = document.getElementById('tablemanufacture');
		var lastRow = tbl.rows.length; 
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		
		var j=length;
		j++;

		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";       
         inputSrNo.name = "createNewPdetails["+length+"].txtSrNo1";
         inputSrNo.id = "createNewPdetails["+length+"].txtSrNo1";    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
       
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="createNewPdetails["+length+"].txtItem1";
		inputItem.name = "createNewPdetails["+length+"].txtItem1";
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
		 
		var newLength=length-1;
		var ln = document.getElementById("createNewPdetails["+newLength+"].txtItem1").length;
		
		for ( var k = 0; k < ln; k++)

		{
			
			var xVal = document.getElementById("createNewPdetails["+newLength+"].txtItem1").options[k].value;
			var xText = document.getElementById("createNewPdetails["+newLength+"].txtItem1").options[k].text;
			desc = document.getElementById("createNewPdetails["+newLength+"].txtItem1").options[k].label;
			
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.className = "form-control";
		inputItem.style.width='100px';
		secondCell.appendChild(inputItem); 

		//alert("After Item");
		
		/* var secondCell = row.insertCell(1);
		var inputItem = document.createElement("input");
		inputItem.type = 'text';
		inputItem.id = "createNewPdetails["+length+"].txtItem1";
		inputItem.name = "createNewPdetails["+length+"].txtItem1";		
		inputItem.style.width='80px';
		inputItem.className = "form-control";
		//inputItem.readOnly=true;
		secondCell.appendChild(inputItem); */
		
		
		var thirdCell = row.insertCell(2);
		var inputunit = document.createElement("input");
		inputunit.type = 'text';
		inputunit.id = "createNewPdetails["+length+"].unit";
		inputunit.name = "createNewPdetails["+length+"].unit";		
		inputunit.style.width='60px';
		inputunit.className = "form-control";
		//inputunit.readOnly=true;
		thirdCell.appendChild(inputunit);
		
		
		var fourthCell = row.insertCell(3);
		var inputDesc = document.createElement("input");
		inputDesc.type = 'text';
		inputDesc.id = "createNewPdetails["+length+"].decription";
		inputDesc.name = "createNewPdetails["+length+"].decription";		
		inputDesc.style.width='100px';
		inputDesc.className = "form-control";
		//inputDesc.style.textAlign="centre";
		fourthCell.appendChild(inputDesc);
		
		var fifthCell = row.insertCell(4);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "createNewPdetails["+length+"].quantity";
		inputQty.name = "createNewPdetails["+length+"].quantity";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="centre";
		fifthCell.appendChild(inputQty);
		
		var sixthCell = row.insertCell(5);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel"+length;
		inputDelete.name = "btndel"+length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrow(this);};			
		sixthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('tablemanufacture');
 		 var last = tbl.rows.length-1;
 		 
 		 var txtSrNo,ItemCode,Unit,Description,Quantity,btndel,prodId,next;		
		 if(last == 1)
			 {
			 	document.getElementById("createNewPdetails["+length+"].txtItem1").options[0].selected=true;
			 	document.getElementById("createNewPdetails["+length+"].unit").value="";
			 	document.getElementById("createNewPdetails["+length+"].decription").value="";
			 	document.getElementById("createNewPdetails["+length+"].quantity").value="";
			 	
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
 				 	
	 			 	txtSrNo = document.getElementById("createNewPdetails["+next+"].txtSrNo1");
	 			 	txtSrNo.id =  "createNewPdetails["+counter+"].txtSrNo1";
	 			 	txtSrNo.name = "createNewPdetails["+counter+"].txtSrNo1";	 			 				 	 				 
 				 	txtSrNo.value = txtSrNo.value-1 ;
 				 	
 				 	 				 	 			 	
 				 	ItemCode = document.getElementById("createNewPdetails["+next+"].txtItem1");
 				 	ItemCode.id = "createNewPdetails["+counter+"].txtItem1";
 				 	ItemCode.name = "createNewPdetails["+counter+"].txtItem1";
 				 	
 				 	Unit = document.getElementById("createNewPdetails["+next+"].unit");
 				 	Unit.id = "createNewPdetails["+counter+"].unit";
 				 	Unit.name = "createNewPdetails["+counter+"].unit";
 				 	
 				 	Description = document.getElementById("createNewPdetails["+next+"].decription");
 				 	Description.id = "createNewPdetails["+counter+"].decription";
 				 	Description.name = "createNewPdetails["+counter+"].decription";
 				 	
 				 	Quantity = document.getElementById("createNewPdetails["+next+"].quantity");
 				 	Quantity.id = "createNewPdetails["+counter+"].quantity";
 				 	Quantity.name = "createNewPdetails["+counter+"].quantity";
 				  		 	
 				 	
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 		
 			 		
 					counter++; 			
 			 }
		 }         
	 }
</script>
<script>
function showDesc(str,id)
{
var index1=id.indexOf("[");
var index2=id.indexOf("]");
var i=id.substring(index1+1,index2);
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("createNewPdetails["+i+"].decription").value="";
  	document.getElementById("createNewPdetails["+i+"].unit").value="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	  var index=0;
	  var address=xmlhttp.responseText;
	 
	  	index=address.indexOf("^");	
	  
	 
	  document.getElementById("createNewPdetails["+i+"].decription").value=address.substring(0,index);    	
	  document.getElementById("createNewPdetails["+i+"].unit").value=address.substring(index+1,address.length);
    }
  }
xmlhttp.open("GET","retrieveprodDesc.do?productId="+str,true);
xmlhttp.send();
}
</script>
<script type="text/javascript">	
function backPage()
{
	window.history.back();
}
</script>

</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@include file="../header.jsp" %>
<div class="page-wrapper">	
<%@include file="innerHeader.jsp"%>	<br>
<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-10">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Edit&nbsp;Product<small></small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
					<!-- <button name="back" class="btn btn-primary btn-large" onclick="backPage()"><i class="fa fa-reply"></i> Back</button> -->
					<a href="inventory.do" class="btn btn-primary btn-large"> Back</a>	
		         </div>
			</div>
		</div>
</div>
<form:form action="updateProduct.do" cssClass="form-inline" modelAttribute="createNewProView"  name="frmEditCreateNewProduct">	
<div class="col-md-12">
<div class="panel panel-default">                       
<div class="panel-body">
		<input type="hidden" name="productCode" class="form-control" value="${createNewProduct.productCode}">
			<div class="row">
				<div class="col-md-6">
					<div class="row">
					<div class="col-md-4">
						<label>Product Name :</label>		
					</div>					
					<div class="col-md-4">
						<form:input path="txtName" cssClass="form-control"/><br><br>		
					</div>
					</div>
				</div>						
				<div class="col-md-5">
					<div class="row">
					<div class="col-md-4">
						<label>Description&nbsp;: </label>		
					</div>					
					<div class="col-md-4">
						<form:textarea path="txtDes" rows="2" cols="25" cssClass="form-control"></form:textarea><br><br>		
					</div>
					</div>
				</div>			
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
					<div class="col-md-7">
						<label>Enable&nbsp;inventory&nbsp;for&nbsp;this&nbsp;product?</label>
 					</div>
					<div class="col-md-4">
					<c:choose>
						<c:when test="${createNewProView.inventory == 'Yes'}">
							<input id="radio1" type="radio" checked="checked" name="inventory" value="Yes" onclick="calDis();"><label>&nbsp;Yes&nbsp;</label>
	 						<input id="radio2" type="radio" name="inventory" value="No" onclick="calDis();"><label>&nbsp;No&nbsp;</label>
						</c:when>
						<c:otherwise>
							<input id="radio1" type="radio"  name="inventory" value="Yes" onclick="calDis();"><label>&nbsp;Yes&nbsp;</label>
	 						<input id="radio2" type="radio" checked="checked" name="inventory" value="No" onclick="calDis();"><label>&nbsp;No&nbsp;</label>
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${yes == 'Yes'}">
						<input id="radio1" type="radio" checked="checked" name="inventory" value="Yes" onclick="calDis();"><label>&nbsp;Yes&nbsp;</label>
						<input id="radio2" type="radio" name="inventory" value="No" onclick="calDis();"><label>&nbsp;No&nbsp;</label>
					</c:if>
					<c:if test="${no == 'No'}">
					    <input id="radio1" type="radio" name="inventory" value="Yes" onclick="calDis();"><label>&nbsp;Yes&nbsp;</label>
				        <input id="radio2" type="radio" checked="checked" name="inventory" value="No" onclick="calDis();"><label>&nbsp;No&nbsp;</label>
					
					</c:if> --%>
						</div>
					</div>
				</div>						
				<div class="col-md-5">
					<div class="row">
					<div class="col-md-4">
						<label>Unit&nbsp;of&nbsp;Measure&nbsp;: </label>		
					</div>					
					<div class="col-md-4">
					<form:select path="txtUnitOfMeasure" cssClass="form-control" >
				      <option>${createNewProView.txtUnitOfMeasure}</option>
						<option value="0">Select Units</option>
						<option>Foot</option>
						<option>Gram</option>
						<option>Inch</option>
						<option>Kilogram</option>
						<option>Meter</option>
						<option>Piece</option>
						<option>Square Centimeter</option>
						<option>Square Foot</option>
						<option>Square Meter</option>
						<option>Square Inch</option>
						</form:select>
<%-- 						<form:input path="txtUnitOfMeasure" cssClass="form-control" /><br><br>		
 --%>					</div>
					</div>
				</div>			
			</div><br>
			<div class="row" id="stock">
				<div class="col-md-6">
					<div class="row">
					<div class="col-md-4">
						<label>Opening&nbsp;Stock&nbsp;: </label>		
					</div>					
					<div class="col-md-4">
						<form:input path="txtOpeningStock" id="txtOpeningStock" cssClass="form-control" /><br><br>
						<input type="hidden" id="prevOpeningStock" value="${createNewProView.txtOpeningStock}">		
					</div>
					</div>
				</div>						
				<div class="col-md-5">
					<div class="row">
					<div class="col-md-4">
						<label>Reorder&nbsp;Level&nbsp;: </label>		
					</div>
					<div class="col-md-4"> 
						<form:input path="txtReorderlevel" id="txtReorderlevel" cssClass="form-control" onkeypress="return isNumberKey(this)"/><br><br>		
						<input type="hidden" id="prevReorderlevel" value="${createNewProView.txtReorderlevel}">
					</div>
					</div>
				</div>			
			</div><br>
			
			<c:choose>
				<c:when test="${createNewProView.productType == 'Resale Product'}">
						<div class="row">
							<div class="col-md-8">
								<div class="panel panel-default">
									<div class="panel-body">							
										<input type="checkbox" checked="checked" name="chkSell" id="chkSell" value="sell" onclick="verifyBox()"/>&nbsp;
										<label>I sell this product.</label><br><br>
										<div id="sellbox" >
										<div class="row"> 
										<div class="col-md-4">
												<label>Sales Price : </label>
										</div>
										<div class="col-md-4">
												<form:input path="txtSalesPrice" cssClass="form-control" cssStyle="text-align: right;"/><br><br>
										</div>
										</div>
										<div class="row">
										<div class="col-md-4">
										<label>Income&nbsp;Account&nbsp;:</label>
										</div>
										<div class="col-md-4">
										<form:select path="selectIncomeAmt" cssClass="form-control" >
											<form:option value="Sales Account">${createNewProView.selectIncomeAmt}</form:option>
											<form:option value="">---Select---</form:option>
											<form:option value="Sales Account">Sales Account - default income</form:option>
										</form:select>
										</div>
										</div>
										<br><br>
							<div class="row" style="display: none;">
							<div class="table-responsive"><center>
						<table id="tablemanufacture" class="table table-striped">
							<tr>
								<th align="center">Sr No</th>
								<th align="center">Product</th>
							    <th align="center">Unit</th>
							    <th align="center">Description</th>
								<th align="center">Quantity</th>
								<th></th>
							</tr>
							<tr>
								<td><input type="text" name="createNewPdetails[0].txtSrNo1" id="createNewPdetails[0].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" value="1"/></td>
                                <td><form:select path="createNewPdetails[0].txtItem1" id="createNewPdetails[0].txtItem1" onchange="showDesc(this.value,this.id);" cssStyle="width: 100px;" cssClass="form-control">
										<option value=" ">----Select----</option>
										<c:forEach items="${prodID}" var="prodID">
											<option value="${prodID.productCode}">${prodID.txtName}</option>
										</c:forEach>
									</form:select>
									
								</td>
                                <td><input type="text" name="createNewPdetails[0].unit" id="createNewPdetails[0].unit" class="form-control" style="width: 60px;" /></td>
								<td><input type="text" name="createNewPdetails[0].decription" id="createNewPdetails[0].decription"  class="form-control" style="width: 100px;"/></td>
								<td><input type="text" name="createNewPdetails[0].quantity" id="createNewPdetails[0].quantity" value="0.0" class="form-control" style="text-align: right; width: 80px;" /> </td>
								<td><input type="button" id="btndel0" name="btndel0" class="btn btn-danger" value="-" onclick="delrow(this);" /></td>
								
							</tr>
						</table></center>
						<input id="addRec" type="button" name="addRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRow()">
					</div>
					</div>
									</div>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="panel panel-default">
									<div class="panel-body">
												<input type="checkbox" checked="checked" id="chkPur" name="chkPurchase" value="purchase" onclick="verifyBox()"/>&nbsp;
												<label>I purchase this product.</label>
												<br>
												<br>
												<div id="purbox">
												<div class="row">
													<div class="col-md-4">
														<label>Purchase Price : </label>
													</div>
													<div class="col-md-4">
														<form:input path="txtPurchasePrice" cssClass="form-control" cssStyle="text-align: right;width : 90px;" />
														<br>
														<br>
													</div>
												</div>
												<div class="row">
													<div class="col-md-4">
														<label>Expense Account&nbsp;: </label>   
													</div>
													<div class="col-md-4">
														<form:select path="selectExpenseAccnt"
															cssClass="form-control" cssStyle="width : 150px;">
															<form:option value="Purchase Account">${createNewProView.selectExpenseAccnt}</form:option>
															<form:option value="">---Select---</form:option>
															<form:option value="Purchase Account">Purchase Account - default Expense</form:option>
														</form:select>
													</div>
												</div>
											</div>
									</div>
								</div>
							</div>
					</div>
				</c:when>
				<c:when test="${createNewProView.productType == 'Sale Item'}">
							<div class="row">
								<div class="col-md-8">
									<div class="panel panel-default">
										<div class="panel-body">							
											<input type="checkbox" checked="checked" name="chkSell" id="chkSell" value="sell" onclick="verifyBox()"/>&nbsp;
											<label>I sell this product.</label><br><br>
											<div id="sellbox" >
											<div class="row">
											<div class="col-md-4">
													<label>Sales Price : </label>
											</div>
											<div class="col-md-4">
													<form:input path="txtSalesPrice" cssClass="form-control" cssStyle="text-align: right;"/><br><br>
											</div>
											</div>
											
											<div class="row">
											<div class="col-md-4">
											<label>Income&nbsp;Account&nbsp;:</label>
											</div>
											<div class="col-md-4">
											<form:select path="selectIncomeAmt" cssClass="form-control" >
												<form:option value="Sales Account">${createNewProView.selectIncomeAmt}</form:option>
												<form:option value="">---Select---</form:option>
												<form:option value="Sales Account">Sales Account - default income</form:option>
											</form:select>
											</div>
											</div>
											<br><br>
											<div class="row">
											<div class="table-responsive"><center>
										<table id="tablemanufacture" class="table table-striped">
											<thead>
											<tr>
												<th align="center">Sr No</th>
												<th align="center">Product</th>
											    <th align="center">Unit</th>
											    <th align="center">Description</th>
												<th align="center">Quantity</th>
												<th></th>
											</tr>
											</thead>
											<tbody>
											<c:forEach items="${detailsList}" var = "createNewPdetails">
												<tr>
												<td><input type="text" name="createNewPdetails[${createNewPdetails.txtSrNo1-1}].txtSrNo1" id="createNewPdetails[${createNewPdetails.txtSrNo1-1}].txtSrNo1" value="${createNewPdetails.txtSrNo1}" class="form-control" style="width: 50px; text-align: right;"/></td>
				                                <td><form:select path="createNewPdetails[${createNewPdetails.txtSrNo1-1}].txtItem1"  id="createNewPdetails[${createNewPdetails.txtSrNo1-1}].txtItem1" onchange="showDesc(this.value,this.id);" cssStyle="width: 100px;" cssClass="form-control">
														<option value=" ">----Select----</option>
														<option value="${createNewPdetails.txtItem1}" selected="selected">${createNewPdetails.prodName}</option>
														
														<c:forEach items="${prodID}" var="prodID">
														<option value="${prodID.productCode}">${prodID.txtName}</option>
														</c:forEach>
													</form:select>
												</td>
												<td><input type="text" name="createNewPdetails[${createNewPdetails.txtSrNo1-1}].unit" id="createNewPdetails[${createNewPdetails.txtSrNo1-1}].unit" value="${createNewPdetails.unit}" class="form-control" style="width: 60px;" /></td>
												<td><input type="text" name="createNewPdetails[${createNewPdetails.txtSrNo1-1}].decription" id="createNewPdetails[${createNewPdetails.txtSrNo1-1}].decription" value="${createNewPdetails.decription}" class="form-control" style="width: 100px;"/></td>
				                                <td><input type="text" name="createNewPdetails[${createNewPdetails.txtSrNo1-1}].quantity" id="createNewPdetails[${createNewPdetails.txtSrNo1-1}].quantity" value="${createNewPdetails.quantity}"  class="form-control" style="text-align: right; width: 80px;" /> </td>
												<td><input type="button" id="btndel${createNewPdetails.txtSrNo1-1}" name="btndel${createNewPdetails.txtSrNo1-1}" class="btn btn-danger" value="-" onclick="delrow(this);" /></td>
												
											</tr>
												
											</c:forEach>
											
											</tbody>
											
										</table></center>
										<input id="addRec" type="button" name="addRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRow()">
									</div>
									</div>
									</div>
									</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="panel panel-default">
										<div class="panel-body">
											<input type="checkbox" name="chkPurchase" id="chkPur" value="purchase" onclick="verifyBox()"/>&nbsp;
											<label>I purchase this product.</label><br><br>
											<div id="purbox" style="display: none;">
											<div class="row">
												<div class="col-md-4"> 
													<label>Purchase Price : </label>
												</div>
												<div class="col-md-4">
													<form:input path="txtPurchasePrice" cssClass="form-control" cssStyle="text-align: right;width : 80px;"/><br><br>
												</div>	
											</div>
											<div class="row">
												<div class="col-md-4">
													<label>Expense Account&nbsp;: </label>
												</div>
												<div class="col-md-4"> 
													<form:select path="selectExpenseAccnt" cssClass="form-control" cssStyle="width : 150px;">
													<form:option value="">---Select---</form:option>
													<form:option value="Purchase Account">Purchase Account - default Expense</form:option>
													</form:select>
												</div>							
											</div>
											</div>
										</div>
									</div>
								</div>
						</div>
				</c:when>
				<c:when test="${createNewProView.productType == 'Purchase Item'}">
						<div class="row">
							<div class="col-md-8">
								<div class="panel panel-default">
									<div class="panel-body">
										<input type="checkbox" name="chkSell" id="chkSell" value="sell" onclick="verifyBox()"/>&nbsp;
										<label>I sell this product.</label><br><br>
										<div id="sellbox"  style="display: none;">
										<div class="row">
										<div class="col-md-4">
												<label>Sales Price : </label>
										</div>
										<div class="col-md-4">
												<form:input path="txtSalesPrice" cssClass="form-control" cssStyle="text-align: right;"/><br><br>
										</div>
										</div>
										<div class="row">
										<div class="col-md-4">
										<label>Income&nbsp;Account&nbsp;:</label>
										</div>
										<div class="col-md-4">
										<form:select path="selectIncomeAmt" cssClass="form-control" cssStyle="width : 200px;">
											<form:option value="">---Select---</form:option>
											<form:option value="Sales Account">Sales Account - default income</form:option>
										</form:select>
										</div>
										</div><br><br>
										<div class="row">
										<div class="table-responsive"><center>
									<table id="tablemanufacture" class="table table-striped">
										<tr>
											<th align="center">Sr No</th>
											<th align="center">Product</th>
										    <th align="center">Unit</th>
										    <th align="center">Description</th>
											<th align="center">Quantity</th>
											<th></th>
										</tr>
										
										<tr>
											<td><input type="text" name="createNewPdetails[0].txtSrNo1" id="createNewPdetails[0].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" value="1"/></td>
			                                <td><form:select path="createNewPdetails[0].txtItem1" id="createNewPdetails[0].txtItem1" onchange="showDesc(this.value,this.id);" cssClass="form-control">
													<option value=" ">----Select----</option>
													<c:forEach items="${prodID}" var="prodID">
														<option value="${prodID.productCode}">${prodID.txtName}</option>
													</c:forEach>
												</form:select>
												
											</td>
			                                <td><input type="text" name="createNewPdetails[0].unit" id="createNewPdetails[0].unit" class="form-control" style="width: 60px;" /></td>
											<td><input type="text" name="createNewPdetails[0].decription" id="createNewPdetails[0].decription"  class="form-control" style="width: 100px;"/></td>
											<td><input type="text" name="createNewPdetails[0].quantity" id="createNewPdetails[0].quantity" value="0.0" class="form-control" style="text-align: right; width: 80px;" /> </td>
											<td><input type="button" id="btndel0" name="btndel0" class="btn btn-danger" value="-" onclick="delrow(this);" /></td>
											
										</tr>
									</table></center>
									<input id="addRec" type="button" name="addRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRow()">
								</div>
								</div>
								</div>
								</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="panel panel-default">
									<div class="panel-body">
									 
												<input type="checkbox" checked="checked" name="chkPurchase" id="chkPur" value="purchase" onclick="verifyBox()"/>&nbsp;
												<label>I purchase this product.</label>
												<br>
												<br>
												<div id="purbox">
												<div class="row">
													<div class="col-md-4">
														<label>Purchase Price : </label>
													</div>
													<div class="col-md-4">
														<form:input path="txtPurchasePrice"
															cssClass="form-control" cssStyle="text-align: right;width:80px;" />
														<br>
														<br>
													</div>
												</div>
												<div class="row">
													<div class="col-md-4">
														<label>Expense Account&nbsp;: </label>
													</div>
													<div class="col-md-4">
														<form:select path="selectExpenseAccnt"
															cssClass="form-control" cssStyle="width : 150px;">
															<form:option value="Purchase Account ">${createNewProView.selectExpenseAccnt}</form:option>
															<form:option value="">---Select---</form:option>
															<form:option value="Purchase Account ">Purchase Account - default Expense</form:option>
														</form:select>
													</div>
												</div>
									</div>
									</div>
								</div>
							</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row">
				<div class="col-md-8">
					<div class="panel panel-default">
						<div class="panel-body">
							<input type="checkbox" name="chkSell" id="chkSell" value="sell" onclick="verifyBox()"/>&nbsp;
							<label>I sell this product.</label><br><br>
							<div id="sellbox"  style="display: none;">
							<div class="row">
							<div class="col-md-4">
									<label>Sales Price : </label>
							</div>
							<div class="col-md-4">
									<form:input path="txtSalesPrice" cssClass="form-control" cssStyle="text-align: right;"/><br><br>
							</div>
							</div>
							<div class="row">
							<div class="col-md-4">
							<label>Income&nbsp;Account&nbsp;:</label>
							</div>
							<div class="col-md-4">
							<form:select path="selectIncomeAmt" cssClass="form-control" cssStyle="width : 200px;">
								<form:option value="">---Select---</form:option>
								<form:option value="Sales Account">Sales Account - default income</form:option>
							</form:select>
							</div>
							</div><br><br>
							<div class="row">
							<div class="table-responsive"><center>
						<table id="tablemanufacture" class="table table-striped">
							<tr>
								<th align="center">Sr No</th>
								<th align="center">Product</th>
							    <th align="center">Unit</th>
							    <th align="center">Description</th>
								<th align="center">Quantity</th>
								<th></th>
							</tr>
							<tr>
								<td><input type="text" name="createNewPdetails[0].txtSrNo1" id="createNewPdetails[0].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" value="1"/></td>
                                <td><form:select path="createNewPdetails[0].txtItem1" id="createNewPdetails[0].txtItem1" onchange="showDesc(this.value,this.id);" cssStyle="width: 100px;" cssClass="form-control">
										<option value=" ">----Select----</option>
										<c:forEach items="${prodID}" var="prodID">
											<option value="${prodID.productCode}">${prodID.txtName}</option>
										</c:forEach>
									</form:select>
									
								</td>
                                <td><input type="text" name="createNewPdetails[0].unit" id="createNewPdetails[0].unit" class="form-control" style="width: 60px;" /></td>
								<td><input type="text" name="createNewPdetails[0].decription" id="createNewPdetails[0].decription"  class="form-control" style="width: 100px;"/></td>
								<td><input type="text" name="createNewPdetails[0].quantity" id="createNewPdetails[0].quantity" value="0.0" class="form-control" style="text-align: right; width: 80px;" /> </td>
								<td><input type="button" id="btndel0" name="btndel0" class="btn btn-danger" value="-" onclick="delrow(this);" /></td>
								
							</tr>
						</table></center>
						<input id="addRec" type="button" name="addRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRow()">
					</div>
					</div>
					</div>
					</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-default">
						<div class="panel-body">
							<input type="checkbox" name="chkPurchase" id="chkPur" value="purchase" onclick="verifyBox()"/>&nbsp;
							<label>I purchase this product.</label><br><br>
							<div id="purbox" style="display: none;">
							<div class="row">
								<div class="col-md-4"> 
									<label>Purchase Price : </label>
								</div>
								<div class="col-md-4">
									<form:input path="txtPurchasePrice" cssClass="form-control" cssStyle="width : 90px; text-align: right;" /><br><br>
								</div>	
							</div>
							<div class="row">
								<div class="col-md-4">
									<label>Expense Account&nbsp;: </label>
								</div>
								<div class="col-md-5"> 
									<form:select path="selectExpenseAccnt" cssClass="form-control" cssStyle="width : 150px;">
									<form:option value="">---Select---</form:option>
									<form:option value="Purchase Account">Purchase Account - default Expense</form:option>
									</form:select>
								</div>							
							</div>
							</div>
						</div>
					</div>
				</div>
		</div> 
				</c:otherwise>
			</c:choose>
		<br>
		<div class="col-md-12">
			<input type="submit" value="Update" name="btn" class="btn btn-primary">									 
			<a href="inventory.do" class="btn btn-primary btn-large"> Cancel</a>
		</div>			
			<%-- <core:if test="${message==1}">                     
			<script>
			alert("Product Updated Succesfully.");
			</script>
			</core:if>
			<core:if test="${message==0}">                     
			<script>
			alert("Product Not Updated Succesfully.");
			</script>
			</core:if> --%>
            </div>
	</div>
	</div>
</form:form>
</div>
</div>
</body>
</html>