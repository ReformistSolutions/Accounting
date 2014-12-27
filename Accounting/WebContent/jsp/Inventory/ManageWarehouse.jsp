<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Warehouse</title>
<script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" ></script>
<link rel="icon" href="<core:url value="/resources/images/favicon.ico" />" type="image/icon">
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
<script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();             
         });
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
		inputItem.onchange=function(){showDesc(this.value,this.id);showQuntity(this.value,this.id);};
		
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
		var inputunit = document.createElement("input");
		inputunit.type = 'text';
		inputunit.id = "warehousedetails["+length+"].unit";
		inputunit.name = "warehousedetails["+length+"].unit";		
		inputunit.className = "form-control";
		//inputunit.readOnly=true;
		inputunit.style.width='80px';
		thirdCell.appendChild(inputunit);
		
		
		var fourthCell = row.insertCell(3);
		var inputDesc = document.createElement("input");
		inputDesc.type = 'text';
		inputDesc.id = "warehousedetails["+length+"].decription";
		inputDesc.name = "warehousedetails["+length+"].decription";		
		inputDesc.className = "form-control";
		//inputDesc.style.textAlign="centre";
		inputDesc.style.width='140px';
		fourthCell.appendChild(inputDesc);
		
		var avlqty = row.insertCell(4);
		var Qty = document.createElement("input");
		Qty.type = 'text';
		Qty.id = "warehousedetails["+length+"].avlqty";
		Qty.name = "warehousedetails["+length+"].avlqty";		
		Qty.style.width='80px';
		Qty.className = "form-control";
		Qty.style.textAlign="right";
		Qty.readOnly=true;
		avlqty.appendChild(Qty);
		
		var fifthcell = row.insertCell(5);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "warehousedetails["+length+"].quantity";
		inputQty.name = "warehousedetails["+length+"].quantity";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		fifthcell.appendChild(inputQty);
		
		
		var sixcell = row.insertCell(6);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrow(this);};
		sixcell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('warehouse');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Quantity,DestWare,btndel,next,avlqty;		
		 if(last == 2)
			 {
			 	ItemCode = document.getElementById("warehousedetails["+length+"].itemCode");
			 	avlqty = document.getElementById("warehousedetails["+length+"].avlqty");
			 	Quantity = document.getElementById("warehousedetails["+length+"].quantity");
			 	document.getElementById("warehousedetails["+length+"].unit").value="";
			 	document.getElementById("warehousedetails["+length+"].decription").value="";
			 	
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
 				 	
 				 	Unit = document.getElementById("warehousedetails["+next+"].unit");
 				 	Unit.id = "warehousedetails["+counter+"].unit";
 				 	Unit.name = "warehousedetails["+counter+"].unit";
 				 	
 				 	Description = document.getElementById("warehousedetails["+next+"].decription");
 				 	Description.id = "warehousedetails["+counter+"].decription";
 				 	Description.name = "warehousedetails["+counter+"].decription";
 			 	 				 		 	
 				 	avlqty = document.getElementById("warehousedetails["+next+"].avlqty");
 				 	avlqty.id = "warehousedetails["+counter+"].avlqty";
 				 	avlqty.name = "warehousedetails["+counter+"].avlqty";
 				 	
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
<script>
function showDesc(str,id)
{
	
var index1=id.indexOf("[");
var index2=id.indexOf("]");
var i=id.substring(index1+1,index2);
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("warehousedetails["+i+"].decription").value="";
  	document.getElementById("warehousedetails["+i+"].unit").value="";
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
	  
	 
	  document.getElementById("warehousedetails["+i+"].decription").value=address.substring(0,index);    	
	  document.getElementById("warehousedetails["+i+"].unit").value=address.substring(index+1,address.length);
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
<script>
function showQuntity(str,id)
{
var index1=id.indexOf("[");
var index2=id.indexOf("]");
var i=id.substring(index1+1,index2);
var productId = document.getElementById("warehousedetails["+i+"].itemCode").value;

var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("warehousedetails["+i+"].avlqty").value="";
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
	 	
	  document.getElementById("warehousedetails["+i+"].avlqty").value=xmlhttp.responseText;    	
    }
  }
xmlhttp.open("GET", "retriveWarehouseAvailableQty.do?productId=" + productId, true);
/* xmlhttp.open("GET","retriveTransAvailableQty.do?productId="+str+"wID="+wid,true); */
xmlhttp.send();
}
</script>
<script>
function checkAvailqty(str,id)
{
	var index1=id.indexOf("[");
	var index2=id.indexOf("]");
	var i=id.substring(index1+1,index2);
	var availableqty=document.getElementById("warehousedetails["+i+"].avlqty").value;
	var currentqty=document.getElementById("warehousedetails["+i+"].quantity").value;
 	if(parseFloat(currentqty) > parseFloat(availableqty))
		{
		alert("Current Quantity not Greater than Available Quantity");
		document.getElementById("warehousedetails["+i+"].quantity").focus();
		document.getElementById("warehousedetails["+i+"].quantity").value="";
		return false;
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
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Manage&nbsp;Warehouse<small></small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
					<a href="inventory.do" class="btn btn-primary btn-large"> Back</a>	
		         </div>
			</div>
		</div>
</div>
<form:form action="warehouseTrans.do" method="post" cssClass="form-inline" modelAttribute="warehouseTrans" name="frmwarehouse"> 
<div class="col-md-12">
<div class="panel panel-default">                       
<div class="panel-body">
						
							<%-- <div class="row">
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
											<input type="text" name="wareHouseName" id="wareHouseName" class="form-control">
											
									</div>
								</div>								
							</div>
							</div><br> --%>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5"> 
											<label>Warehouse Name:-</label>
										</div>
										<div class="col-md-5">  
											<input type="text" name="wareHouseName" id="wareHouseName" class="form-control">
										</div>
									</div>
								</div>
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
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5"> 
											<label>Warehouse&nbsp;Address:-</label>
										</div>
										<div class="col-md-5">
													<textarea name="address" rows="4" cols="35"
														class="form-control" ></textarea>
												</div>
												
									</div>
								</div>																
							</div><br>							
					<div class="table-responsive">
						<table id="warehouse" class="table table-striped">
							<tr>
								<th align="center">Sr No</th>
								<th align="center">Product</th>
								<th align="center">Unit</th>
								<th align="center">Description</th>	
								<th align="center">Available Qty</th>
								<th align="center">Quantity</th>
								<th></th>
							</tr>
							<tr>
								<td><input type="text" name="warehousedetails[0].srNo" id="warehousedetails[0].srNo" class="form-control" style="width: 50px; text-align: right;" value="1"/></td>
								<td><form:select path="warehousedetails[0].itemCode" id="warehousedetails[0].itemCode" onchange="showDesc(this.value,this.id);showQuntity(this.value,this.id);" cssClass="form-control">
										<option value="Select">----Select----</option>
										<c:forEach items="${prodID}" var="prodID">
											<option value="${prodID.productCode}">${prodID.txtName}</option>
										</c:forEach>										
									</form:select>
								</td>
								<td><input type="text" name="warehousedetails[0].unit" id="warehousedetails[0].unit" class="form-control" style="width: 80px;" /></td>
								<td><input type="text" name="warehousedetails[0].decription" id="warehousedetails[0].decription"  class="form-control" style="width: 140px;"/></td>
								<td><input type="text" name="warehousedetails[0].avlqty" id="warehousedetails[0].avlqty" class="form-control" style="text-align: right; width: 80px;" readonly="readonly"/></td> 
								<td><input type="text" name="warehousedetails[0].quantity" id="warehousedetails[0].quantity" onchange="checkAvailqty(this.value,this.id);" class="form-control" style="text-align: right; width: 80px;" /></td>
								<td><input type="button" id="btndel0" name="btndel0" class="btn btn-danger" value="-" onclick="delrow(this);" /></td>
								
							</tr>
						</table>
						<input type="button" name="addRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRow()">
					</div>
				<br>
												<div>
													<label>Warehouse Comment</label>
												</div>
												<div>
													<textarea name="comments" rows="4" cols="35"
														class="form-control" ></textarea>
												</div>
												<br>
												<br>
												<div>
													<button type="submit" class="btn btn-primary" name="btn"
														value="Save">SAVE</button>
													<a href="inventory.do" class="btn btn-primary btn-large"> Cancel</a>

												</div>
												</div>
												</div>
												</div>
											</form:form>

</div>
</div>
</body>
</html>