<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Issue for production</title>
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
    <style>p {word-spacing: 20px}</style>
<!-- DYNAMIC ROW ADDITION FOR ISSUE FOR PRODUCTION AND RECEIVE FOR SALES-->
 <script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRow() {

		var tbl = document.getElementById('tableissueandreceive');
		var lastRow = tbl.rows.length; 
	
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		
		var j=length;
		j++;

		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";       
         inputSrNo.name = "productList["+length+"].txtSrNo1";
         inputSrNo.id = "productList["+length+"].txtSrNo1";    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
         
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="productList["+length+"].txtItem1";
		inputItem.name = "productList["+length+"].txtItem1";
		inputItem.onchange=function(){showDesc2(this.value,this.id);};		
		var newLength=length-1;
		var ln = document.getElementById("productList["+newLength+"].txtItem1").length;	
		
		for ( var k = 0; k < ln; k++)

		{
			var xVal = document.getElementById("productList["+newLength+"].txtItem1").options[k].value;
			var xText = document.getElementById("productList["+newLength+"].txtItem1").options[k].text;
			desc = document.getElementById("productList["+newLength+"].txtItem1").options[k].label;
			
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
		inputavailqty.id = "productList["+length+"].availableqty";
		inputavailqty.name = "productList["+length+"].availableqty";		
		inputavailqty.style.width='80px';
		inputavailqty.className = "form-control";
		//inputDesc.style.textAlign="centre";
		inputavailqty.readOnly=true;
		thirdCell.appendChild(inputavailqty);
		
		
		var fourthCell = row.insertCell(3);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "productList["+length+"].txtQuant1";
		inputQty.name = "productList["+length+"].txtQuant1";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		inputQty.onblur=function(){getid(this.id);};
		inputQty.onblur=function(){checkqtydetails(this.value,this.id);};
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
	
		i++;
	
	}	 
	function getid(id)
	{
		alert("id="+id);
	}
	
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('tableissueandreceive');
 		 var last =(tbl.rows.length)-1;
 		 
 		 var txtSrNo,ItemCode,AvailableQty,Quantity,btndel,next;		
		 if(last == 1)
			 {
			 	ItemCode = document.getElementById("productList["+length+"].itemCode");
			 	AvailableQty=document.getElementById("productList["+length+"].availableqty");
			 	Quantity = document.getElementById("productList["+length+"].quantity");			 	
			 	ItemCode.value = 'select';
			 	AvailableQty.value="";
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
 			 	
	 			 	txtSrNo = document.getElementById( "productList["+next+"].txtSrNo1");
	 			 	txtSrNo.id =  "productList["+counter+"].txtSrNo1";
	 			 	txtSrNo.name = "productList["+counter+"].txtSrNo1";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 	
 				 	 			 	
 				 	ItemCode = document.getElementById("productList["+next+"].txtItem1");
 				 	ItemCode.id = "productList["+counter+"].txtItem1";
 				 	ItemCode.name = "productList["+counter+"].txtItem1";
 				 	
 				 	
 				 	AvailableQty = document.getElementById("productList["+next+"].availableqty");
 				 	AvailableQty.id = "productList["+counter+"].availableqty";
 				 	AvailableQty.name = "productList["+counter+"].availableqty";
 				 	
 				 	Quantity = document.getElementById("productList["+next+"].txtQuant1");
 				 	Quantity.id = "productList["+counter+"].txtQuant1";
 				 	Quantity.name = "productList["+counter+"].txtQuant1";
 				  			 	
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 	
 					counter++;
 							 	
 			 
 			 }
		 }
 		 
         
	 }
	 
	 function populatdes(obj)
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
function showDesc2(str,id)
{
var index1=id.indexOf("[");
var index2=id.indexOf("]");
var i=id.substring(index1+1,index2);
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("productList["+i+"].availableqty").value="";
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
	 
	  document.getElementById("productList["+i+"].availableqty").value=xmlhttp.responseText;    	
    }
  }
xmlhttp.open("GET","retriveAvailableQty.do?productId="+str,true);
xmlhttp.send();
}
</script>
<script>
function checkqtydetails(str,id)
{
	var index1=id.indexOf("[");
	var index2=id.indexOf("]");
	var i=id.substring(index1+1,index2);
	
	var availableqty=document.getElementById("productList["+i+"].availableqty").value;
	var currentqty=document.getElementById("productList["+i+"].txtQuant1").value;

	
	
	if(parseFloat(currentqty) > parseFloat(availableqty))
		{
		alert("current Qty not greater than available qty");
		document.getElementById("productList[0].txtQuant1").focus();
		document.getElementById("productList[0].txtQuant1").value="";
		return false;
		}
	
	}

</script>
</head>
<body style="overflow-x: hidden;"> 
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<div class="page-wrapper">	
<%@include file="innerHeader.jsp"%>
	<input type="hidden" id="hide" name="hide1" value="0"> <br>
			<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-10">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Edit&nbsp;Issue&nbsp;For&nbsp;Production<small></small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
					<button name="back" class="btn btn-primary btn-large" onclick="backPage()"><i class="fa fa-reply"></i> Back</button>	
		         </div>
			</div>
		</div>
</div>
<form:form action="updateissueForProduct.do" method="post" cssClass="form-inline" commandName="editIssueForProduction"  name="frmissueForProduction">
<div class="col-md-12">
<div class="panel panel-default">                       
                        <div class="panel-body">
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
										<input type="text" id="dp1" name="date" value="${editIssueForProduction.date}" class="form-control" style="width: 160px;" />
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
											<form:select path="selectWarehouse" readonly="true" cssClass="form-control" cssStyle="width: 150px;">
												<option value="${editIssueForProduction.wearehouseID }">${editIssueForProduction.selectWarehouse}</option>
												<option>----Select----</option>
												<c:forEach items="${wareID}" var="wareID">
                            			 			<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
                                 		 		</c:forEach>		
									</form:select>
										</div>
									</div>
								</div>																
							</div><br>								
								<div class="table-responsive" style="width: 70%;">	
						         				<table id="tableissueandreceive" class="table table-striped">        					         					
						        					<tr>
											        		<th align="center">Sr No</th>
											        		<th align="center">Product</th>     
											        		<th align="center">Available Qty</th>   							        		
											        		<th align="center">Quantity</th><th></th>  					        		
						        					</tr>      		
						        							<c:forEach items="${editIssueForProduction.productList}" var="productList">	
						         					<tr>
						         						<td>
					         						<input type="text" name="productList[${productList.txtSrNo1-1}].txtSrNo1" id="productList[${productList.txtSrNo1-1}].txtSrNo1" class="form-control" style="width: 50px;text-align: right;" onkeypress="return isNumberKey(this)" value="${productList.txtSrNo1}"/>
						         						</td>            					
						            					<td>
						            						<select name="productList[${productList.txtSrNo1-1}].txtItem1" id="productList[${productList.txtSrNo1-1}].txtItem1" onchange="showDesc2(this.value,this.id);" class="form-control">
															<option value="${productList.itemID}">${productList.txtItem1}</option>
															<option>----Select----</option>
															<c:forEach items="${prodID}" var="prodID">
                            								 <option value="${prodID.productCode}">${prodID.txtName}</option>
                                 							 </c:forEach>															
															</select>
						            					</td>          
						            					<td><input type="text" name="productList[${productList.txtSrNo1-1}].availableqty" value="${productList.availableqty}" id="productList[${productList.txtSrNo1-1}].availableqty"  class="form-control" style="text-align: right; width: 80px;" readonly="readonly" onkeypress="return isNumberKey(this);" /></td> 				
						            					<td> 
						            						<input type="text" name="productList[${productList.txtSrNo1-1}].txtQuant1" value="${productList.txtQuant1}" id="productList[${productList.txtSrNo1-1}].txtQuant1" onchange="checkqtydetails(this.value,this.id);" class="form-control" style="text-align: right;width: 80px;" onkeypress="return isNumberKey(this)"/>
						            					</td>
						            					
						            					<td class="fnt"><input type="button" id="btndel${productList.txtSrNo1-1}" name="btndel${productList.txtSrNo1-1}" class="btn btn-danger" value="-" onclick="delrow(this)"/></td>       		
						           					 </tr>
						           					
						           					 </c:forEach>
						         			 </table> 
						         			 <input type="button" name="addRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRow()">
						          </div><br>			
													<div>							
														<label>Details</label>	
													</div>
													<div>
														<textarea name="txtDetails" rows="4" cols="50" class="form-control" style="width: 400px;">${editIssueForProduction.txtDetails}</textarea>	
													</div>
											<br><br>											
						    		<div>						  				
						  					<button type="submit" class="btn btn-primary" name="btn" value="UPDATE">UPDATE</button>
								            <button type="reset" class="btn btn-primary" name="btn">CLEAR</button>
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
	<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>

</body>
</html>