<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Record Wastage</title>
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
	
	function addRowWaste() {		

		var tbl = document.getElementById('tableWastage');
		var lastRow = tbl.rows.length; 
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		var j=length;
		j++;

		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";       
         inputSrNo.name = "recordWastageDetailsList["+length+"].txtSrNo1";
         inputSrNo.id = "recordWastageDetailsList["+length+"].txtSrNo1";    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
         
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="recordWastageDetailsList["+length+"].txtItem1";
		inputItem.name = "recordWastageDetailsList["+length+"].txtItem1";
		inputItem.onchange=function(){showWastageQuntity(this.value,this.id);};
		var newLength=length-1;
		var ln = document.getElementById("recordWastageDetailsList["+newLength+"].txtItem1").length;
		for ( var k = 0; k < ln; k++)
		{
			var xVal = document.getElementById("recordWastageDetailsList["+newLength+"].txtItem1").options[k].value;
			var xText = document.getElementById("recordWastageDetailsList["+newLength+"].txtItem1").options[k].text;
			desc = document.getElementById("recordWastageDetailsList["+newLength+"].txtItem1").options[k].label;
			
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.className = "form-control";
		secondCell.appendChild(inputItem);

		
		var thirdCell = row.insertCell(2);
		var inputRemark = document.createElement("input");
		inputRemark.type = 'text';
		inputRemark.id = "recordWastageDetailsList["+length+"].remark";
		inputRemark.name = "recordWastageDetailsList["+length+"].remark";		
		inputRemark.style.width='110px';
		inputRemark.className = "form-control";
		inputRemark.style.textAlign="right";
		thirdCell.appendChild(inputRemark);
		//alert("After remark");
		
		
		
		var fourthCell = row.insertCell(3);
		var inputavailqty = document.createElement("input");
		inputavailqty.type = 'text';
		inputavailqty.id = "recordWastageDetailsList["+length+"].availableQty";
		inputavailqty.name = "recordWastageDetailsList["+length+"].availableQty";		
		inputavailqty.style.width='110px';
		inputavailqty.className = "form-control";
		inputavailqty.style.textAlign="right";
		inputavailqty.readOnly=true;;
		fourthCell.appendChild(inputavailqty);
		
		var fifthCell = row.insertCell(4);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "recordWastageDetailsList["+length+"].txtQuant1";
		inputQty.name = "recordWastageDetailsList["+length+"].txtQuant1";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		inputQty.onchange=function(){checkwasteqtydetails(this.value,this.id);};
		fifthCell.appendChild(inputQty);
		
		var sixthCell = row.insertCell(5);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrowWaste(this);};			
		sixthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	function getid(id)
	{
		alert("id="+id);
	}
	
	 function delrowWaste(obj)
	 {
		 var tbl = document.getElementById('tableWastage');
 		 var last =(tbl.rows.length)-1;
 		 
 		 var txtSrNo,ItemCode,Remark,Quantity,btndel,next;		
		 if(last == 1)
			 {
			 	ItemCode = document.getElementById("recordWastageDetailsList["+length+"].itemCode");
			 	Remark = document.getElementById("recordWastageDetailsList["+length+"].rmark");
			 	document.getElementById("recordWastageDetailsList["+length+"].availableQty").value = "";
			 	Quantity = document.getElementById("recordWastageDetailsList["+length+"].quantity");			 	
			 	ItemCode.value = 'select';
			 	Remark.value = ""; 
			 	Quantity.value = "";
			 	
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
 			 	
	 			 	txtSrNo = document.getElementById( "recordWastageDetailsList["+next+"].txtSrNo1");
	 			 	txtSrNo.id =  "recordWastageDetailsList["+counter+"].txtSrNo1";
	 			 	txtSrNo.name = "recordWastageDetailsList["+counter+"].txtSrNo1";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 	
 				 	 			 	
 				 	ItemCode = document.getElementById("recordWastageDetailsList["+next+"].txtItem1");
 				 	ItemCode.id = "recordWastageDetailsList["+counter+"].txtItem1";
 				 	ItemCode.name = "recordWastageDetailsList["+counter+"].txtItem1";
 				 	
 			 	
 				 	Remark = document.getElementById("recordWastageDetailsList["+next+"].remark");
 				 	Remark.id =  "recordWastageDetailsList["+counter+"].remark";
 				 	Remark.name = "recordWastageDetailsList["+counter+"].remark"; 
 			 	
 				 	availableqty = document.getElementById("recordWastageDetailsList["+next+"].availableQty");
 				 	availableqty.id =  "recordWastageDetailsList["+counter+"].availableQty";
 				 	availableqty.name = "recordWastageDetailsList["+counter+"].availableQty"; 
 				 	
 				 	Quantity = document.getElementById("recordWastageDetailsList["+next+"].txtQuant1");
 				 	Quantity.id = "recordWastageDetailsList["+counter+"].txtQuant1";
 				 	Quantity.name = "recordWastageDetailsList["+counter+"].txtQuant1";
 				  			 	
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 	
 					counter++;
 							 	
 			 
 			 }
		 }
 		 
         
	 }
	 
	 function populatdesWaste(obj)
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
function showwasteQuntity(str,id)
{
		var index1=id.indexOf("[");
		var index2=id.indexOf("]");
		var i=id.substring(index1+1,index2);
		var xmlhttp;   
		if (str==" ")
		  {
		  	document.getElementById("recordWastageDetailsList["+i+"].availableQty").value="";
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
			 
			  document.getElementById("recordWastageDetailsList["+i+"].availableQty").value=xmlhttp.responseText;    	
		    }
		  }
		xmlhttp.open("GET","retrivewasteAvailableQty.do?productId="+str,true);
		xmlhttp.send();
		}
		</script>
<script>
function checkwasteqtydetails(str,id)
{
	var index1=id.indexOf("[");
	var index2=id.indexOf("]");
	var i=id.substring(index1+1,index2);
	
	var availableqty=document.getElementById("recordWastageDetailsList["+i+"].availableQty").value;
	var currentqty=document.getElementById("recordWastageDetailsList["+i+"].txtQuant1").value;
	
	
	
	
	if(parseFloat(currentqty) > parseFloat(availableqty))
		{
		alert("current Qty not greater than available qty");
		document.getElementById("recordWastageDetailsList["+i+"].txtQuant1").focus();
		document.getElementById("recordWastageDetailsList["+i+"].txtQuant1").value="";
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
                <script type="text/javascript">
function showWasteProduct()
{
	var xmlhttp;
	var wid = document.getElementById("wastageWarehouse").value;
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
		    document.getElementById("showWastage").innerHTML=xmlhttp.responseText;
	    }
	  }
	xmlhttp.open("GET","retrievewastageID.do?wID="+wid,true);
	xmlhttp.send();
}
</script>
<script>
function showWastageQuntity(str,id)
{
var index1=id.indexOf("[");
var index2=id.indexOf("]");
var i=id.substring(index1+1,index2);
var wid = document.getElementById("wastageWarehouse").value;
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("recordWastageDetailsList["+i+"].availableQty").value="";
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
	 	
	  document.getElementById("recordWastageDetailsList["+i+"].availableQty").value=xmlhttp.responseText;    	
    }
  }
xmlhttp.open("GET", "retriveWastageqty.do?productId=" + str + "&wID="+ wid+ "", true);
/* xmlhttp.open("GET","retriveTransAvailableQty.do?productId="+str+"wID="+wid,true); */
xmlhttp.send();
}
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
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Edit&nbsp;Record&nbsp;Wastage<small></small>
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
						<form:form action="updaterecordWastage.do" method="post" cssClass="form-inline" modelAttribute="recordWastageVEdit" name="frmrecordWastage">
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
											<input type="text" id="dp1" name="date" class="form-control" style="width: 160px;" value="${recordWastageVEdit.date}" />								
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
											<select name="selectWarehouse" id="wastageWarehouse" class="form-control" style="width: 150px;" onchange="showWasteProduct();">
									<option>----Select----</option> 
									<option value="${recordWastageVEdit.wearehouseID}" selected="selected">${recordWastageVEdit.selectWarehouse}</option>
										<c:forEach items="${wareID}" var="wareID">
             	 						<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
                            	 		</c:forEach>
                            	 </select>
										</div>
									</div>
								</div>																
							</div><br>							
							<div class="table-responsive" style="width: 70%;">
								<table id="tableWastage" class="table table-striped">
									<tr>
										<th align="center">Sr No</th>
										<th align="center">Product</th>
										<th align="center">Remark</th>
										<th align="center">Available Qty</th>
										<th align="center">Quantity</th>
										<th></th>
									</tr>
									<c:forEach items="${recordWastageVEdit.recordWastageDetailsList}" var="recordWastageDetailsList">
										<tr>
											<td><input type="text" name="recordWastageDetailsList[${recordWastageDetailsList.txtSrNo1-1}].txtSrNo1" value="${recordWastageDetailsList.txtSrNo1}" id="recordWastageDetailsList[${recordWastageDetailsList.txtSrNo1-1}].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" onkeypress="return isNumberKey(this)" /></td>
											<td id="showWastage">
												<select name="recordWastageDetailsList[${recordWastageDetailsList.txtSrNo1-1}].txtItem1" id="recordWastageDetailsList[${recordWastageDetailsList.txtSrNo1-1}].txtItem1" onchange="showWastageQuntity(this.value,this.id);" class="form-control">
													<option value="${recordWastageDetailsList.itemID}">${recordWastageDetailsList.txtItem1}</option>
													<option>----Select----</option>
													<c:forEach items="${prodID}" var="prodID">
                            	 						<option value="${prodID.productCode}">${prodID.txtName}</option>
                                 					</c:forEach>
												</select>
											</td>
											<td><input type="text" name="recordWastageDetailsList[${recordWastageDetailsList.txtSrNo1-1}].remark" value="${recordWastageDetailsList.remark}" id="recordWastageDetailsList[${recordWastageDetailsList.txtSrNo1-1}].remark" class="form-control" style="text-align: right; width: 110px;" /></td>
											<td><input name="recordWastageDetailsList[${recordWastageDetailsList.txtSrNo1-1}].availableQty" value="${recordWastageDetailsList.availableQty}" id="recordWastageDetailsList[${recordWastageDetailsList.txtSrNo1-1}].availableQty" readonly="readonly" class="form-control" style="text-align: right; width: 110px;" /></td>
											<td><input type="text" name="recordWastageDetailsList[${recordWastageDetailsList.txtSrNo1-1}].txtQuant1" value="${recordWastageDetailsList.txtQuant1}" id="recordWastageDetailsList[${recordWastageDetailsList.txtSrNo1-1}].txtQuant1" onchange="checkwasteqtydetails(this.value,this.id);" class="form-control" style="text-align: right; width: 80px;" />
											</td>
											<td class="fnt"><input type="button" id="btndel${recordWastageDetailsList.txtSrNo1-1}" name="btndel${recordWastageDetailsList.txtSrNo1-1}" class="btn btn-danger" value="-" onclick="delrowWaste(this);"></td>
										</tr>
									</c:forEach>
								</table>
								<input type="button" name="addWasteRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRowWaste()">
							</div>
							<br>
							<div>
								<label>Details</label>
							</div>
							<div>
								<textarea rows="4" cols="50" name="txtDetails" class="form-control" style="width: 400px;">${recordWastageVEdit.txtDetails}</textarea>
							</div>
							<br>
							<br>
							<div>
								<input type="submit" value="UPDATE" name="btn" class="btn btn-primary"> 
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