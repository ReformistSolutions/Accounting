<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Received Against Product</title>
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
    <style>p {word-spacing: 20px}</style>
    <script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script>
    <script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRowAgainstProd() {

	//	alert("Add row ");

		var tbl = document.getElementById('tblrecagain');
		var lastRow = tbl.rows.length; //changed last row to static
		//alert("add lastRow:"+lastRow);
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		//alert("Length="+length);
		var j=length;
		j++;

		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";       
         inputSrNo.name = "receiveAgainstProductList["+length+"].txtSrNo1";
         inputSrNo.id = "receiveAgainstProductList["+length+"].txtSrNo1";/* "txtSrNo" + i; */    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
       //  alert("After Sr NO");
         
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="receiveAgainstProductList["+length+"].txtItem1";
		inputItem.name = "receiveAgainstProductList["+length+"].txtItem1";
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
		 // alert("Before Len");
		var newLength=length-1;
		var ln = document.getElementById("receiveAgainstProductList["+newLength+"].txtItem1").length;
		//alert("Before For "+ln);	
		
		for ( var k = 0; k < ln; k++)

		{
			//alert("In For");
			var xVal = document.getElementById("receiveAgainstProductList["+newLength+"].txtItem1").options[k].value;
			var xText = document.getElementById("receiveAgainstProductList["+newLength+"].txtItem1").options[k].text;
			desc = document.getElementById("receiveAgainstProductList["+newLength+"].txtItem1").options[k].label;
			//alert("OK="+desc);
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.className = "form-control";
		secondCell.appendChild(inputItem);

		//alert("After Item");
		var thridCell = row.insertCell(2);
		var inputWarehouse = document.createElement("select");
		inputWarehouse.type = "select";
		inputWarehouse.id = "receiveAgainstProductList["+length+"].selectWarehouse";
		inputWarehouse.name = "receiveAgainstProductList["+length+"].selectWarehouse";
		inputWarehouse.onchange=function(){showDesc(this.value,this.id);};		
		 // alert("Before Len");
		var newLength=length-1;
		var ln = document.getElementById("receiveAgainstProductList["+newLength+"].selectWarehouse").length;
		//alert("Before For "+ln);			
		for ( var k = 0; k < ln; k++)
		{
			//alert("In For");
			var xVal = document.getElementById("receiveAgainstProductList["+newLength+"].selectWarehouse").options[k].value;
			var xText = document.getElementById("receiveAgainstProductList["+newLength+"].selectWarehouse").options[k].text;
			desc = document.getElementById("receiveAgainstProductList["+newLength+"].selectWarehouse").options[k].label;
			//alert("OK="+desc);
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputWarehouse.add(opt, null);
		}
		inputWarehouse.className = "form-control";
		thridCell.appendChild(inputWarehouse);
		
		
		
		var qtyCell = row.insertCell(3);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "receiveAgainstProductList["+length+"].txtQuant1";
		inputQty.name = "receiveAgainstProductList["+length+"].txtQuant1";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		qtyCell.appendChild(inputQty);
		
		var fourthCell = row.insertCell(4);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrowAgainstProd(this);};			
		fourthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrowAgainstProd(obj)
	 {
		 var tbl = document.getElementById('tblrecagain');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Quantity,DestWare,btndel,next;		
		 if(last == 2)
			 {
			 	ItemCode = document.getElementById("receiveAgainstProductList["+length+"].itemCode");
			 	DestWare = document.getElementById("recordTransferredDetailsList["+length+"].selectWarehouse");
			 	Quantity = document.getElementById("receiveAgainstProductList["+length+"].quantity");
			 	
			 	ItemCode.value = 'select';
			 	DestWare.value = 'select';
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
 			 		
	 			 	txtSrNo = document.getElementById( "receiveAgainstProductList["+next+"].txtSrNo1");
	 			 	txtSrNo.id =  "receiveAgainstProductList["+counter+"].txtSrNo1";
	 			 	txtSrNo.name = "receiveAgainstProductList["+counter+"].txtSrNo1";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 	
 				 	 			 	
 				 	ItemCode = document.getElementById("receiveAgainstProductList["+next+"].txtItem1");
 				 	ItemCode.id = "receiveAgainstProductList["+counter+"].txtItem1";
 				 	ItemCode.name = "receiveAgainstProductList["+counter+"].txtItem1";
 				 	 				 	
 				 	DestWare = document.getElementById("receiveAgainstProductList["+next+"].selectWarehouse");
 				 	DestWare.id = "receiveAgainstProductList["+counter+"].selectWarehouse";
 				 	DestWare.name = "receiveAgainstProductList["+counter+"].selectWarehouse";

 				 	Quantity = document.getElementById("receiveAgainstProductList["+next+"].txtQuant1");
 				 	Quantity.id = "receiveAgainstProductList["+counter+"].txtQuant1";
 				 	Quantity.name = "receiveAgainstProductList["+counter+"].txtQuant1";
 				 	
 				 	
 				 
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 	
 					counter++;
 				 }
		 }
 		 
         
	 }
	 
	 function populatdesAgainstProd(obj)
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
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Edit&nbsp;Received&nbsp;Against&nbsp;Product<small></small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
					<button name="back" class="btn btn-primary btn-large" onclick="backPage()"><i class="fa fa-reply"></i> Back</button>	
		         </div>
			</div>
		</div>
</div>
<div class="col-lg-12">
                    <div class="panel panel-default">                       
                        <div class="panel-body">
						<form:form action="updateRecivedAgastProd.do" method="post" cssClass="form-inline" modelAttribute="editreceiveAgainProd"  name="frmreceiveAgainstProduct" onsubmit="return validateForm1()" >
						<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-4">  
											<form:input path="txtVNo" id="txtVNo" cssStyle="width: 100px;" cssClass="form-control" readonly="true"></form:input>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher Date:-</label>
										</div>
										<div class="col-md-7">
											<input type="date" name="date" class="form-control" style="width: 160px;" value="${editreceiveAgainProd.date}"/>								
										</div>
									</div>
								</div>								
							</div><br>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-4"> 
											<label>Purchase&nbsp;ID:-</label>
										</div>
										<div class="col-md-4">  
											<select name="txtpurNo" class="form-control" style="width: 100px;">
											<option value="${editreceiveAgainProd.txtpurNo}">${editreceiveAgainProd.txtpurNo}</option>
														<option>----Select----</option>
														<c:forEach items="${orderList}" var="orderList">
															<option value="${orderList.txtPurchaseOrdNo}">${orderList.txtPurchaseOrdNo}</option>
														</c:forEach>
													</select>
										</div>
									</div>
								</div>																
							</div><br>												
												<div class="table-responsive" style="width: 70%;">	
						         				<table id="tblrecagain" class="table table-striped">
						        					<tr>
											        		<th align="center">Sr No</th>
											        		<th align="center">Product</th>   
											        		<th align="center">Warehouse</th>	        		
											        		<th align="center">Quantity</th>	<th></th> 				        		
						        					</tr>						        			
						        					<c:forEach items="${editreceiveAgainProd.receiveAgainstProductList}" var="productList">		
						         					<tr>
						         						<td>
						         						<input name="receiveAgainstProductList[${productList.txtSrNo1-1}].txtSrNo1" id="receiveAgainstProductList[${productList.txtSrNo1-1}].txtSrNo1" class="form-control" style="width: 50px;text-align: right;" onkeypress="return isNumberKey(this)" value="${productList.txtSrNo1}"/>
						         						</td>            					
						            					<td>
						            						<select name="receiveAgainstProductList[${productList.txtSrNo1-1}].txtItem1" id="receiveAgainstProductList[${productList.txtSrNo1-1}].txtItem1" onchange="showDesc(this.value,this.id)" class="form-control">
															<option value="${productList.prodId}">${productList.txtItem1}</option>
															<option>----Select----</option> 
															  <c:forEach items="${prodID}" var="prodID">
                            								 <option value="${prodID.productCode}">${prodID.txtName}</option>
                                 							 </c:forEach>
															 </select>
						            					</td>
						            					<td>
						            						<select name="receiveAgainstProductList[${productList.txtSrNo1-1}].selectWarehouse" id="receiveAgainstProductList[${productList.txtSrNo1-1}].selectWarehouse" onchange="showDesc(this.value,this.id)" class="form-control">
															<option value="${productList.wID}">${productList.selectWarehouse}</option>
															<option>----Select----</option>
															<c:forEach items="${warehouseRet}" var="warehouseRet">
																	<option value="${warehouseRet.warehousrID}">${warehouseRet.wareHouseName}</option>
															</c:forEach>	
															 </select>
						            					</td>
						            					<td>
						            						<input name="receiveAgainstProductList[${productList.txtSrNo1-1}].txtQuant1" id="receiveAgainstProductList[${productList.txtSrNo1-1}].txtQuant1" value="${productList.txtQuant1}" class="form-control" style="text-align: right;width: 110px;" onkeypress="return isNumberKey(this)"/>
						            					</td>
						            					<td class="fnt"><input type="button" id="btndel${productList.txtSrNo1-1}" name="btndel${productList.txtSrNo1-1}" class="btn btn-danger" value="-" onclick="delrowAgainstProd(this);"></td>
						           					 </tr>
						           					 </c:forEach>						           					 
						         			 </table> 
						         			 <input type="button" name="addRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRowAgainstProd()">
						         			 </div>						         			 
						         			 <br>
													<div>							
														<label>Details</label>	
													</div>
													<div>
														<textarea rows="4" cols="50" name="txtDetails" class="form-control" style="width:400px;">${editreceiveAgainProd.txtDetails}</textarea>	
													</div>
											<br><br>
											<div>
						  					<input type="submit" value="Update" name="btn" class="btn btn-primary">
						  					<input type="reset" name="btn" value="Cancel" class="btn btn-primary">
						  				
							  			</div>
						</form:form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>