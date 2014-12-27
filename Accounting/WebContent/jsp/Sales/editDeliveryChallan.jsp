<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Delivery Challan</title>
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
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
                $('#date').datepicker({
                    format: "yyyy/mm/dd"
                });
                
            });
            $( document ).ready(function() {
            	  $('#date').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
    </script>
<script type="text/javascript">
	var i=1;		
	function addRow() 
	{
		var tbl = document.getElementById('tableID');
		var lastRow = tbl.rows.length; 
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		var j=length;
		j++;

		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";       
         inputSrNo.name = "deliveryChallandetails["+length+"].srNo";
         inputSrNo.id = "deliveryChallandetails["+length+"].srNo";
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
         
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="deliveryChallandetails["+length+"].itemCode";
		inputItem.name = "deliveryChallandetails["+length+"].itemCode";
		inputItem.onchange=function(){showMUnit(this.value,this.id);};
		var newLength=length-1;
		var ln = document.getElementById("deliveryChallandetails["+newLength+"].itemCode").length;
		
		for ( var k = 0; k < ln; k++)
		{
			var xVal = document.getElementById("deliveryChallandetails["+newLength+"].itemCode").options[k].value;
			var xText = document.getElementById("deliveryChallandetails["+newLength+"].itemCode").options[k].text;
			desc = document.getElementById("deliveryChallandetails["+newLength+"].itemCode").options[k].label;
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.className = "form-control";
		secondCell.appendChild(inputItem);		
		
		var thirdCell=row.insertCell(2);
		var inputUnit=document.createElement("input");
		inputUnit.id="unit"+length;
		inputUnit.readOnly=true;
		inputUnit.className="form-control";	
		inputUnit.type="text";
		inputUnit.style.width="80px";
		thirdCell.appendChild(inputUnit);
		
		var fourthCell = row.insertCell(3);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "deliveryChallandetails["+length+"].quantity";
		inputQty.name = "deliveryChallandetails["+length+"].quantity";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		fourthCell.appendChild(inputQty);
		
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
 		 var last =(tbl.rows.length)-1;
 		 var txtSrNo,ItemCode,Quantity,btndel,next;		
		 if(last == 1)
			 {
			 	ItemCode = document.getElementById("deliveryChallandetails["+length+"].itemCode");			 	
			 	Quantity = document.getElementById("deliveryChallandetails["+length+"].quantity");			 	
			 	ItemCode.options[0].selected = true;	
				document.getElementById("unit"+length).value="";
			 	Quantity.value = "";			 	
			 }		 
		 else
		 {
			 var current = window.event.srcElement;	
			 while ( (current = current.parentElement)  && current.tagName !="TR");
       		 current.parentElement.removeChild(current);
 			 var counter = obj.id.slice(6);
 			 while(counter<last)
 				 {
 				 	next = counter;
 				 	next++;
 			 	
	 			 	txtSrNo = document.getElementById( "deliveryChallandetails["+next+"].srNo");
	 			 	txtSrNo.id =  "deliveryChallandetails["+counter+"].srNo";
	 			 	txtSrNo.name = "deliveryChallandetails["+counter+"].srNo";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 	
 				 	 			 	
 				 	ItemCode = document.getElementById("deliveryChallandetails["+next+"].itemCode");
 				 	ItemCode.id = "deliveryChallandetails["+counter+"].itemCode";
 				 	ItemCode.name = "deliveryChallandetails["+counter+"].itemCode"; 
 				 	
 				 	var unit=document.getElementById("unit"+next);
 					unit.id="unit"+counter;
 			 	
 				 	Quantity = document.getElementById("deliveryChallandetails["+next+"].quantity");
 				 	Quantity.id = "deliveryChallandetails["+counter+"].quantity";
 				 	Quantity.name = "deliveryChallandetails["+counter+"].quantity";
 				  			 	
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 	
 					counter++;
 							 	
 			 
 			 }
		 }
	 }
	
</script>
<script>
function retriveAdd(str,id)
{
var xmlhttp;   
if (str=="")
  {
  document.getElementById("txtCutName").innerHTML="";
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
	  for(var i=0;i<=address.length;i++)
		  {
		  	index=address.indexOf("^");		
		  }	
	document.getElementById("billingAdd").value=address.substring(0,index);    	
	  	
    } 
  }
xmlhttp.open("GET","retriveAddress.do?customerId="+str,true);
xmlhttp.send();
}
</script>


<script>
function goBack()
	{
		window.history.back();
	}
</script>
<script>
function validateForm()
{  
	var srno = document.getElementById("deliveryChallandetails[0].srNo").value;
	var itemCode = document.getElementById("deliveryChallandetails[0].itemCode").value;	
	var qty = document.getElementById("deliveryChallandetails[0].quantity").value;
	
	 if(document.frmDeliveryChallan.challanID.value=="")
    {
      alert("Challan Number Should not be Empty...");
      document.frmDeliveryChallan.challanID.focus();
      return false;
    }
     else if(document.frmDeliveryChallan.invoiceID.value=="0")
    {
      alert("Please Select Invoice ID");
      document.frmDeliveryChallan.invoiceID.focus();
      return false;
    }     
     else if(document.frmDeliveryChallan.customerName.value=="0")
     {
       alert("Please Select Customer Name");
       document.frmDeliveryChallan.customerName.focus();
       return false;
     } 	  	 	
     else if(document.frmDeliveryChallan.date.value=="")
     {
       alert("Date field should not be blank");
       document.frmDeliveryChallan.date.focus();
       return false;
     }
     else if(document.frmDeliveryChallan.billingAdd.value=="")
     {
       alert("Billing Address field should not be blank");
       document.frmDeliveryChallan.billingAdd.focus();
       return false;
     }
    
     else if(srno=="")
     {
       alert("Plz Enter Sr.No ....");
      // srno.focus();
       return false;
     }
     else if(itemCode=="0")
     {
       alert("Plz select the Item Code ....");
     //  itemCode.focus();
       return false;
     }
    
     else if(qty=="")
     {
       alert("Plz Enter The Quantity.....");
      // qty.focus();
       return false;
     }
    
    
    
    
 }
</script> 
 <script type="text/javascript">
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
</script>
<script>
function checkProducts(obj)
{	
	var tbl = document.getElementById('tableID');
	var length = tbl.rows.length-1;
	var id = document.getElementById(obj).id;
	var index1 = id.indexOf("[") + 1;
	var index2 = id.indexOf("]");	
	var k = id.slice(index1,index2);
	var cuProduct=document.getElementById("deliveryChallandetails["+k+"].itemCode").value;
	for(var i=0;i<length;i++)
		{
		if(i!=k)
			{
			var exProduct=document.getElementById("deliveryChallandetails["+i+"].itemCode").value;
			if(cuProduct == exProduct)
				{
					alert("Please Select Different Product");
					document.getElementById("deliveryChallandetails["+k+"].itemCode").options[0].selected=true;					 
					var item=document.getElementById("deliveryChallandetails["+k+"].itemCode").value;					
					if(item == '')
						{
							document.getElementById("unit"+k).value="";	
						} 		 								
				}
			}		
		}
	}
</script>
<script>
function showMUnit(str,obj)
{
var id = document.getElementById(obj).id;	   
var index1 = id.indexOf("[") + 1;		
var index2 = id.indexOf("]");		
var i = id.slice(index1,index2);	

var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("unit"+i).value="";
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
    	document.getElementById("unit"+i).value=xmlhttp.responseText;
    	checkProducts(obj);
    }
  }
xmlhttp.open("GET","retrieveMUnit.do?productId="+str,true);
xmlhttp.send();
}
</script>
</head>
<body>
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<div id="container">
		<%@ include file="innerHeader.jsp" %>
					
					<!-- <div class="container">		 -->		<br>			
						<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Delivery<small>&nbsp;Challan</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             		<a href="deliveryChallan.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		            <div class="col-md-12">
		            <form:form action="updateChallan.do" cssClass="form-inline" modelAttribute="deliveryChallan" name="frmDeliveryChallan" onsubmit="return validateForm()">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Challan&nbsp;ID&nbsp;:- </label>
										</div>
										<div class="col-md-3">
											<input type="text" name="challanID" value="${deliveryChallan.challanID }" readonly="readonly" class="form-control" >
										</div>
									</div>
								</div>
								<!-- <div class="col-sm-1"></div> -->
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Invoice&nbsp;ID:- </label>
										</div>
										<div class="col-md-3">
										<select name="orderID" id="orderID" class="form-control"><!--orderList  -->
											<option value="${deliveryChallan.invoiceID }">${deliveryChallan.invoiceID }</option>
											<option value="0">--Select--</option>
											<c:forEach items="${invoiceList}" var="invoiceList">
												<option value="${invoiceList.txtInvID}">${invoiceList.txtInvID}</option>
											</c:forEach>
										</select>
											<%-- <input type="text" name="orderID" value="${deliveryChallan.orderID }" class="form-control"></input> --%>
										</div>
									</div>
								</div>					
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Customer&nbsp;Name&nbsp;:- </label>
										</div>
										<div class="col-md-3">
											<select name="customerName" id="customerName" onchange="retriveAdd(this.value,this.id)" class="form-control">
											<option ${deliveryChallan.custId }>${deliveryChallan.customerName }</option>
										<option value="0">--Select Name--</option>
											<c:forEach items="${customerList}" var="customerList"> 
										<option value="${customerList.txtCustID}">${customerList.txtCustName}</option>
											</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<!-- <div class="col-sm-1"></div> -->
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-3">
											<label>Date&nbsp;:- </label>
										</div>
										<div class="col-md-4">
										<input type="text" value="${deliveryChallan.date }" name="date" id="date" class="form-control" >
										</div>
									</div>
								</div>					
							</div>
						<br> 
						<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Billing&nbsp;Address:- </label>
										</div>
										<div class="col-md-3">
											<textarea rows="2" cols="25" name="billingAdd" id="billingAdd" class="form-control">${deliveryChallan.billingAdd }</textarea>
										</div>
									</div>
								</div>
								<!-- <div class="col-sm-1"></div> -->												
							</div>												
						<br>
								<div class="table-responsive" style="width: 70%;">
										<table id="tableID" class="table table-striped">
										<thead>
											<tr>
												<th align="center">Sr No</th>
												<th align="center">Product Id</th>
												<th align="center">Unit</th>
												<th align="center">Quantity</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${deliveryChallan.deliveryChallandetails}" var="deliveryChallandetails">
											<tr>
												<td><input type="text" name="deliveryChallandetails[${deliveryChallandetails.srNo-1}].srNo" value="${deliveryChallandetails.srNo}" id="deliveryChallandetails[${deliveryChallandetails.srNo-1}].srNo" style="width: 50px;text-align: right;" class="form-control" ></input></td>
												<td><select name="deliveryChallandetails[${deliveryChallandetails.srNo-1}].itemCode" id="deliveryChallandetails[${deliveryChallandetails.srNo-1}].itemCode" onchange="showDesc(this.value,this.id)" class="form-control" >
												<option value="">---Select Code---</option>
												<option value="${deliveryChallandetails.prodID}" id="${deliveryChallandetails.prodID}" style="display: none;">${deliveryChallandetails.itemCode}</option>
																								
												<c:forEach items="${deliProdList}" var="deliProdList">
													<option value="${deliProdList.productId }">${deliProdList.txtName }</option>
												</c:forEach>
													<script type="text/javascript">			
													var i=${deliveryChallandetails.srNo-1};	
													var selitem=document.getElementById("deliveryChallandetails["+i+"].itemCode");
													var ln=document.getElementById("deliveryChallandetails["+i+"].itemCode").length;													
													for ( var k = 0; k < ln; k++)
													{														
														var it1=document.getElementById("deliveryChallandetails["+i+"].itemCode").options[k].value;
														var it=document.getElementById("${deliveryChallandetails.prodID}").value;														
														if(it1==it)
															{															
															document.getElementById("deliveryChallandetails["+i+"].itemCode").options[k].selected=true;
															}														
													}
												</script>		
												</select></td>
												<td><input type="text" name="unit${deliveryChallandetails.srNo-1}" id="unit${deliveryChallandetails.srNo-1}" class="form-control" value="${deliveryChallandetails.unit}" readonly="readonly" style="width:80px;"></td>
												<td><input type="text" name="deliveryChallandetails[${deliveryChallandetails.srNo-1}].quantity"  id ="deliveryChallandetails[${deliveryChallandetails.srNo-1}].quantity" value="${deliveryChallandetails.quantity}" style="width: 80px;text-align: right;" class="form-control" ></input></td>
												<td> <input type="button" name="btndel${deliveryChallandetails.srNo-1}" id="btndel${deliveryChallandetails.srNo-1}"  value="-" onclick="delrow(this);" class="btn btn-danger"></td>

											</tr>		
											</c:forEach>										
											</tbody>
										</table>
										<div><input type="button" name="btnadd1" id="btnadd1" value="+ Add New Row" onclick="addRow();" class="btn btn-default btn-xs"></div>
									</div><br>							
									<div class="col-md-12">
									<input type="submit" value="Update" name="btn" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Update">		 						
									<a href="deliveryChallan.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Cancel"> Cancel</a>
									</div>												
						</div>
					</div>
					</form:form>
					</div>
					
	</div>
</div>	
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>								
</body>
</html>