<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Record transferred</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
<style>
p {
	word-spacing: 20px;
}
</style>
<script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRowTrans() {

	

		var tbl = document.getElementById('tableTransfer');
		var lastRow = tbl.rows.length; 
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		
		var j=length;
		j++;

		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";       
         inputSrNo.name = "recordTransferredDetailsList["+length+"].txtSrNo1";
         inputSrNo.id = "recordTransferredDetailsList["+length+"].txtSrNo1";
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
     
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="recordTransferredDetailsList["+length+"].txtItem1";
		inputItem.name = "recordTransferredDetailsList["+length+"].txtItem1";
		inputItem.onchange=function(){showQuntity(this.value,this.id);};
		
		
		var newLength=length-1;
		var ln = document.getElementById("recordTransferredDetailsList["+newLength+"].txtItem1").length;
			
		
		for ( var k = 0; k < ln; k++)

		{
			
			var xVal = document.getElementById("recordTransferredDetailsList["+newLength+"].txtItem1").options[k].value;
			var xText = document.getElementById("recordTransferredDetailsList["+newLength+"].txtItem1").options[k].text;
			desc = document.getElementById("recordTransferredDetailsList["+newLength+"].txtItem1").options[k].label;
			
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.className = "form-control";
		secondCell.appendChild(inputItem);

		var thirdCell = row.insertCell(2);
		var inputavailqty = document.createElement("input");
		inputavailqty.type = 'text';
		inputavailqty.id = "recordTransferredDetailsList["+length+"].availableqty";
		inputavailqty.name = "recordTransferredDetailsList["+length+"].availableqty";		
		inputavailqty.style.width='80px';
		inputavailqty.className = "form-control";
		inputavailqty.style.textAlign="right";
		inputavailqty.readOnly=true;
		thirdCell.appendChild(inputavailqty);
		
		var fourthCell = row.insertCell(3);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "recordTransferredDetailsList["+length+"].txtQuant1";
		inputQty.name = "recordTransferredDetailsList["+length+"].txtQuant1";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		inputQty.onchange=function(){checkAvailqty(this.value,this.id);};
		fourthCell.appendChild(inputQty);
		
		var fifththCell = row.insertCell(4);
		var inputDestWare = document.createElement("select");
		inputDestWare.type = "select";
		inputDestWare.id ="recordTransferredDetailsList["+length+"].destWarehouse1";
		inputDestWare.name = "recordTransferredDetailsList["+length+"].destWarehouse1";
		inputDestWare.onchange=function(){showDesc(this.value,this.id);};
		
		
		var newLength=length-1;
		var ln = document.getElementById("recordTransferredDetailsList["+newLength+"].destWarehouse1").length;
		
		for ( var k = 0; k < ln; k++)

		{
			
			var xVal = document.getElementById("recordTransferredDetailsList["+newLength+"].destWarehouse1").options[k].value;
			var xText = document.getElementById("recordTransferredDetailsList["+newLength+"].destWarehouse1").options[k].text;
			desc = document.getElementById("recordTransferredDetailsList["+newLength+"].destWarehouse1").options[k].label;
			
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputDestWare.add(opt, null);
		}
		inputDestWare.className = "form-control";
		fifththCell.appendChild(inputDestWare);

		
		var sixthCell = row.insertCell(5);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrowTrans(this);};			
		sixthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	function getid(id)
	{
		//alert("id="+id);
	}
	 function delrowTrans(obj)
	 {
		 var tbl = document.getElementById('tableTransfer');
 		 var last =(tbl.rows.length)-1;
 		 
 		 var txtSrNo,ItemCode,AvailQty,Quantity,DestWare,btndel,next;		
		 if(last == 1)
			 {
			 	ItemCode = document.getElementById("recordTransferredDetailsList["+length+"].itemCode");
			 	AvailQty=  document.getElementById("recordTransferredDetailsList["+length+"].availableqty");
			 	Quantity = document.getElementById("recordTransferredDetailsList["+length+"].quantity");
			 	DestWare = document.getElementById("recordTransferredDetailsList["+length+"].dWare");
			 	ItemCode.value = 'select';
			 	AvailQty.value="";
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
 			 	
	 			 	txtSrNo = document.getElementById( "recordTransferredDetailsList["+next+"].txtSrNo1");
	 			 	txtSrNo.id =  "recordTransferredDetailsList["+counter+"].txtSrNo1";
	 			 	txtSrNo.name = "recordTransferredDetailsList["+counter+"].txtSrNo1";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 	
 				 	 			 	
 				 	ItemCode = document.getElementById("recordTransferredDetailsList["+next+"].txtItem1");
 				 	ItemCode.id = "recordTransferredDetailsList["+counter+"].txtItem1";
 				 	ItemCode.name = "recordTransferredDetailsList["+counter+"].txtItem1";
 				 	
 				 	AvailQty = document.getElementById("recordTransferredDetailsList["+next+"].availableqty");
 				 	AvailQty.id = "recordTransferredDetailsList["+counter+"].availableqty";
 				 	AvailQty.name = "recordTransferredDetailsList["+counter+"].availableqty";			 		 	
 				 	
 				 	Quantity = document.getElementById("recordTransferredDetailsList["+next+"].txtQuant1");
 				 	Quantity.id = "recordTransferredDetailsList["+counter+"].txtQuant1";
 				 	Quantity.name = "recordTransferredDetailsList["+counter+"].txtQuant1";
 				 	
 				 	
 				 	DestWare = document.getElementById("recordTransferredDetailsList["+next+"].destWarehouse1");
 				 	DestWare.id =  "recordTransferredDetailsList["+counter+"].destWarehouse1";
 				 	DestWare.name = "recordTransferredDetailsList["+counter+"].destWarehouse1";
 				  			 	
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 	
 					counter++;
 							 	
 			 
 			 }
		 }
 		 
         
	 }
	 
	 function populatdesTrans(obj)
	 {
		
		 var index;
		 index= obj.id.slice(8);
		
		 var des = document.getElementById("Des"+index);
		
		 if(obj.value=="select")
			{
				 des.value = "";
		 	}
		 else
			 {
		 		var desc = obj.value.split("-");
		 		
		 		des.value = desc[1];
		 		
			 }
	 }
</script>

<script>
function showQuntity(str,id)
{
var index1=id.indexOf("[");
var index2=id.indexOf("]");
var i=id.substring(index1+1,index2);
var wid = document.getElementById("selectWarehouse").value;
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("recordTransferredDetailsList["+i+"].availableqty").value="";
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
	 
	  document.getElementById("recordTransferredDetailsList["+i+"].availableqty").value=xmlhttp.responseText;    	
    }
  }
xmlhttp.open("GET", "retriveTransAvailableQty.do?productId=" + str + "&wID="+ wid+ "", true);
/* xmlhttp.open("GET","retriveTransAvailableQty.do?productId="+str+"wID="+wid,true); */
xmlhttp.send();
}
</script>

<script type="text/javascript">
function showProduct()
{
	var xmlhttp;
	var wid = document.getElementById("selectWarehouse").value;
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
		    document.getElementById("show").innerHTML=xmlhttp.responseText;
	    }
	  }
	xmlhttp.open("GET","retrievewID.do?wID="+wid,true);
	xmlhttp.send();
}
</script>

<script>
function checkAvailqty(str,id)
{
	var index1=id.indexOf("[");
	var index2=id.indexOf("]");
	var i=id.substring(index1+1,index2);
	
	var availableqty=document.getElementById("recordTransferredDetailsList["+i+"].availableqty").value;
	var currentqty=document.getElementById("recordTransferredDetailsList["+i+"].txtQuant1").value;
	
	//alert(availableqty);
	//alert(currentqty);
	
	
	 if(parseFloat(currentqty) > parseFloat(availableqty))
		{
		alert("current Qty not greater than available qty");
		document.getElementById("recordTransferredDetailsList["+i+"].txtQuant1").focus();
		document.getElementById("recordTransferredDetailsList["+i+"].txtQuant1").value="";
		return false;
		}
	
	}

</script>


<script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script>


<script>
function checkAvailqty(str,id)
{
	var index1=id.indexOf("[");
	var index2=id.indexOf("]");
	var i=id.substring(index1+1,index2);
	
	var availableqty=document.getElementById("recordTransferredDetailsList["+i+"].availableqty").value;
	var currentqty=document.getElementById("recordTransferredDetailsList["+i+"].txtQuant1").value;
	
	//alert(availableqty);
	//alert(currentqty);
	
	
	 if(parseFloat(currentqty) > parseFloat(availableqty))
		{
		alert("current Qty not greater than available qty");
		document.getElementById("recordTransferredDetailsList[0].txtQuant1").focus();
		document.getElementById("recordTransferredDetailsList[0].txtQuant1").value="";
		return false;
		}
	
	}

</script>


<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>	
	<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {            	
                $('#dp1').datepicker({
                    format: "yyyy/mm/dd"
                });
                $( document).ready(function() {
               	  $('#dp1').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
               	    $(this).datepicker('hide');
               	});
               	});
            });
                </script> 
</head>
<body style="overflow-x: hidden;"> 
	<div id="wrapper">
		<%@ include file="../header.jsp"%>
		<div class="page-wrapper">	
<%@include file="innerHeader.jsp"%>
			<input type="hidden" id="hide" name="hide1" value="0"> <br>
			<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-10">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Edit&nbsp;Record&nbsp;Transferred<small></small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
					<a href="inventory.do" class="btn btn-primary btn-large"> Back</a>	
		         </div>
			</div>
		</div>
</div>
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<form:form action="updaterecordTransferred.do" method="post" cssClass="form-inline" modelAttribute="recordTransferredView" name="frmrecordTransferred">
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-4">  
											<form:input path="txtVNo" id="txtVNo" readonly="true" cssStyle="width: 100px;" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher Date:-</label>
										</div>
										<div class="col-md-7">
										<input type="text" id="dp1" name="date" class="form-control" style="width: 160px;" value=${recordTransferredView.date}>
										</div>
									</div>
								</div>								
							</div><br>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-4"> 
											<label>Warehouse:-</label>
										</div>
										<div class="col-md-4">  
											<select name="selectWarehouse" id="selectWarehouse" class="form-control" onchange="showProduct();" style="width: 150px;">
										<option value="${recordTransferredView.wearehouseID}">${recordTransferredView.selectWarehouse}</option>
										<c:forEach items="${wareID}" var="wareID">
	                            	 		<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>                            
	                            	 	</c:forEach>
									</select>
										</div>
									</div>
								</div>																
							</div><br>							
							<br>						
							<div class="table-responsive" style="width: 70%;">
								<table id="tableTransfer" class="table table-striped">
									<tr>
										<th align="center">Sr No</th>
										<th align="center">Product</th>
										<th align="center">Available Qty</th>
										<th align="center">Quantity</th>
										<th align="center">Destination Warehouse</th>
										<th></th>
									</tr>
									<c:forEach items="${recordTransferredView.recordTransferredDetailsList}" var="recordTransferredDetailsList">
										<tr>
											<td><input type="text" name="recordTransferredDetailsList[${recordTransferredDetailsList.txtSrNo1-1}].txtSrNo1" value="${recordTransferredDetailsList.txtSrNo1 }" id="recordTransferredDetailsList[${recordTransferredDetailsList.txtSrNo1-1 }].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" onkeypress="return isNumberKey(this)" /></td>
											<td id="show">
												<select name="recordTransferredDetailsList[${recordTransferredDetailsList.txtSrNo1-1}].txtItem1" id="recordTransferredDetailsList[${recordTransferredDetailsList.txtSrNo1-1}].txtItem1" onchange="showQuntity(this.value,this.id);" class="form-control">
													<option>----Select----</option> 
													<option value="${recordTransferredDetailsList.itemID}" selected="selected">${recordTransferredDetailsList.txtItem1}</option>
													<c:forEach items="${prodID}" var="prodID">
														<option value="${prodID.productCode}">${prodID.txtName}</option>
													</c:forEach>
												</select>
											</td>
											<td><input type="text" name="recordTransferredDetailsList[${recordTransferredDetailsList.txtSrNo1-1}].availableqty" value="${recordTransferredDetailsList.availableqty}" id="recordTransferredDetailsList[${recordTransferredDetailsList.txtSrNo1-1}].availableqty"  class="form-control" style="text-align: right; width: 80px;" readonly="readonly" onkeypress="return isNumberKey(this);" /></td>
											<td><input type="text" name="recordTransferredDetailsList[${recordTransferredDetailsList.txtSrNo1-1}].txtQuant1" value="${recordTransferredDetailsList.txtQuant1 }" id="recordTransferredDetailsList[${recordTransferredDetailsList.txtSrNo1-1 }].txtQuant1" onchange="checkAvailqty(this.value,this.id);" class="form-control" style="text-align: right; width: 80px;" onkeypress="return isNumberKey(this)" /></td>
											<td><select name="recordTransferredDetailsList[${recordTransferredDetailsList.txtSrNo1-1}].destWarehouse1" id="recordTransferredDetailsList[${recordTransferredDetailsList.txtSrNo1-1}].destWarehouse1" onchange="showDesc(this.value,this.id)" class="form-control">
													<option value="${recordTransferredDetailsList.desti_warehouseId}">${recordTransferredDetailsList.destWarehouse1}</option>
													<option>----Select----</option>
													<c:forEach items="${wareID}" var="wareID">
	                            	 					<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
	                            	 				</c:forEach>
												</select>
											</td>
											<td class="fnt"><input type="button" id="btndel${recordTransferredDetailsList.txtSrNo1-1}" name="btndel${recordTransferredDetailsList.txtSrNo1-1}" class="btn btn-danger" value="-" onclick="delrowTrans(this);"></td>
										</tr>
									</c:forEach>
								</table>
								<input type="button" name="addRec" class="btn btn-default btn-xs" value="+ Add New Row" onClick="addRowTrans()">
								</div>
							<br>
							<div>
								<label>Details</label>
							</div>
							<div>
								<textarea rows="4" cols="50" name="txtDetails" class="form-control" style="width: 400px;">${recordTransferredView.txtDetails}</textarea>
							</div>
							<br>
							<br>
							<div>
								<button type="submit" class="btn btn-primary" name="btn" value="UPDATE">UPDATE</button> 
								<a href="inventory.do" class="btn btn-primary btn-large"> Cancel</a>
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
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
	
</body>
</html>