<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page language="java"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- DYNAMIC ROW ADDITION FOR ISSUE FOR PRODUCTION -->
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
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
		 
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

		//alert("After Item");
		
		var thirdCell = row.insertCell(2);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "productList["+length+"].txtQuant1";
		inputQty.name = "productList["+length+"].txtQuant1";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		thirdCell.appendChild(inputQty);
		
		var fourthCell = row.insertCell(3);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel"+length;
		inputDelete.name = "btndel"+length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrow(this);};			
		fourthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('tableissueandreceive');
 		 var last = tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Quantity,btndel,prodId,next;		
		 if(last == 2)
			 {
			 	document.getElementById("productList["+length+"].itemCode").value="Select";
			 	document.getElementById("productList["+length+"].quantity").value="";
			 	
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
 				 	
	 			 	txtSrNo = document.getElementById("productList["+next+"].txtSrNo1");
	 			 	txtSrNo.id =  "productList["+counter+"].txtSrNo1";
	 			 	txtSrNo.name = "productList["+counter+"].txtSrNo1";	 			 				 	 				 
 				 	txtSrNo.value = txtSrNo.value-1 ;
 				 	
 				 	 				 	 			 	
 				 	ItemCode = document.getElementById("productList["+next+"].txtItem1");
 				 	ItemCode.id = "productList["+counter+"].txtItem1";
 				 	ItemCode.name = "productList["+counter+"].txtItem1";
 				 	
 				 	
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
</script>
<!-- DYNAMIC ROW FOR RECEIVE FOR SALES -->
<script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRowReceive() {

		

		var tbl = document.getElementById('tablereceive');
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
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
		 
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
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "productList["+length+"].txtQuant1";
		inputQty.name = "productList["+length+"].txtQuant1";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		thirdCell.appendChild(inputQty);
		
		var fourthCell = row.insertCell(3);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrowreceive(this);};			
		fourthCell.appendChild(inputDelete);
	
		i++;	
	}	 
	 function delrowreceive(obj)
	 {
		 var tbl = document.getElementById('tablereceive');
 		 var last =tbl.rows.length;
 		 var txtSrNo,ItemCode,Quantity,btndel,next;
		 if(last == 2)
			 {
			 	document.getElementById("productList["+length+"].itemCode").value="Select";
			 	document.getElementById("productList["+length+"].quantity").value="";
			 	
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
</script>
<!-- DYNAMIC ROW ADDITION FOR RECORD WASTAGE -->
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

		
		var fourthCell = row.insertCell(2);
		var inputavailqty = document.createElement("input");
		inputavailqty.type = 'text';
		inputavailqty.id = "recordWastageDetailsList["+length+"].availableQty";
		inputavailqty.name = "recordWastageDetailsList["+length+"].availableQty";		
		inputavailqty.style.width='110px';
		inputavailqty.className = "form-control";
		inputavailqty.style.textAlign="right";
		inputavailqty.readOnly=true;
		fourthCell.appendChild(inputavailqty);
		
		
		var thirdCell = row.insertCell(3);
		var inputRemark = document.createElement("input");
		inputRemark.type = 'text';
		inputRemark.id = "recordWastageDetailsList["+length+"].remark";
		inputRemark.name = "recordWastageDetailsList["+length+"].remark";		
		inputRemark.style.width='110px';
		inputRemark.className = "form-control";
		inputRemark.style.textAlign="right";
		thirdCell.appendChild(inputRemark);
		
		
		
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
	 function delrowWaste(obj)
	 {
		 var tbl = document.getElementById('tableWastage');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Remark,availableqty,Quantity,btndel,next;		
		 if(last == 2)
			 {
			 	document.getElementById("recordWastageDetailsList["+length+"].itemCode").value = "Select";
			 	document.getElementById("recordWastageDetailsList["+length+"].availableQty").value = "";
			 	document.getElementById("recordWastageDetailsList["+length+"].rmark").value = "";			 	
			 	document.getElementById("recordWastageDetailsList["+length+"].quantity").value = "";
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
 				 	
 			 	
 				 	availableqty = document.getElementById("recordWastageDetailsList["+next+"].availableQty");
 				 	availableqty.id =  "recordWastageDetailsList["+counter+"].availableQty";
 				 	availableqty.name = "recordWastageDetailsList["+counter+"].availableQty";
 				 	
 				 	Remark = document.getElementById("recordWastageDetailsList["+next+"].remark");
 				 	Remark.id =  "recordWastageDetailsList["+counter+"].remark";
 				 	Remark.name = "recordWastageDetailsList["+counter+"].remark"; 
 				 	
 				 	 
 			 	
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
</script>
<!-- <script type="text/javascript">
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
         inputSrNo.id = "recordWastageDetailsList["+length+"].txtSrNo1";/* "txtSrNo" + i; */    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
       //  alert("After Sr NO");
         
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="recordWastageDetailsList["+length+"].txtItem1";
		inputItem.name = "recordWastageDetailsList["+length+"].txtItem1";
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
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
		var fourthCell = row.insertCell(3);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "recordWastageDetailsList["+length+"].txtQuant1";
		inputQty.name = "recordWastageDetailsList["+length+"].txtQuant1";		
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
		inputDelete.onclick=function(){delrowWaste(this);};			
		fifthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrowWaste(obj)
	 {
		 var tbl = document.getElementById('tableWastage');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Remark,Quantity,btndel,next;		
		 if(last == 2)
			 {
			 	document.getElementById("recordWastageDetailsList["+length+"].itemCode").value = "Select";
			 	document.getElementById("recordWastageDetailsList["+length+"].rmark").value = "";
			 	document.getElementById("recordWastageDetailsList["+length+"].quantity").value = "";
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
</script> -->
<!-- DYNAMIC ROW ADDITION FOR RECORD TRANSFFERD -->

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
			//alert("OK="+desc);
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.className = "form-control";
		secondCell.appendChild(inputItem);

		//alert("After Item");
		
		
		var thirdCell = row.insertCell(2);
		var inputavailqty = document.createElement("input");
		inputavailqty.type = 'text';
		inputavailqty.id = "recordTransferredDetailsList["+length+"].availableqty";
		inputavailqty.name = "recordTransferredDetailsList["+length+"].availableqty";		
		inputavailqty.style.width='80px';
		inputavailqty.className = "form-control";
		inputavailqty.style.textAlign="right";
		//inputDesc.style.textAlign="centre";
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
		
		var fifthCell = row.insertCell(4);
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
		fifthCell.appendChild(inputDestWare);

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
	 function delrowTrans(obj)
	 {
		 var tbl = document.getElementById('tableTransfer');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,AvailQty,Quantity,DestWare,btndel,next;		
		 if(last == 2)
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
<!-- <script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRowTrans() {

		var tbl = document.getElementById('tableTransfer');
		var lastRow = tbl.rows.length; //changed last row to static
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		var j=length;
		j++;

		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";       
         inputSrNo.name = "recordTransferredDetailsList["+length+"].txtSrNo1";
         inputSrNo.id = "recordTransferredDetailsList["+length+"].txtSrNo1";/* "txtSrNo" + i; */    
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
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
		var newLength=length-1;
		var ln = document.getElementById("recordTransferredDetailsList["+newLength+"].txtItem1").length;
		
		for ( var k = 0; k < ln; k++)
		{
			var xVal = document.getElementById("recordTransferredDetailsList["+newLength+"].txtItem1").options[k].value;
			var xText = document.getElementById("recordTransferredDetailsList["+newLength+"].txtItem1").options[k].text;
			desc = document.getElementById("recordTransferredDetailsList["+newLength+"].txtItem1").options[k].label;
			//alert("OK="+desc);
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.className = "form-control";
		secondCell.appendChild(inputItem);

		//alert("After Item");
		
		var thirdCell = row.insertCell(2);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "recordTransferredDetailsList["+length+"].txtQuant1";
		inputQty.name = "recordTransferredDetailsList["+length+"].txtQuant1";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		thirdCell.appendChild(inputQty);
		
		var fourthCell = row.insertCell(3);
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
		fourthCell.appendChild(inputDestWare);

		var fifthCell = row.insertCell(4);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrowTrans(this);};			
		fifthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrowTrans(obj)
	 {
		 var tbl = document.getElementById('tableTransfer');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Quantity,DestWare,btndel,next;		
		 if(last == 2)
			 {
			 	ItemCode = document.getElementById("recordTransferredDetailsList["+length+"].itemCode");
			 	Quantity = document.getElementById("recordTransferredDetailsList["+length+"].quantity");
			 	DestWare = document.getElementById("recordTransferredDetailsList["+length+"].dWare");
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
 			 	
	 			 	txtSrNo = document.getElementById( "recordTransferredDetailsList["+next+"].txtSrNo1");
	 			 	txtSrNo.id =  "recordTransferredDetailsList["+counter+"].txtSrNo1";
	 			 	txtSrNo.name = "recordTransferredDetailsList["+counter+"].txtSrNo1";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 	
 				 	 			 	
 				 	ItemCode = document.getElementById("recordTransferredDetailsList["+next+"].txtItem1");
 				 	ItemCode.id = "recordTransferredDetailsList["+counter+"].txtItem1";
 				 	ItemCode.name = "recordTransferredDetailsList["+counter+"].txtItem1";
 				 	
 			 	 				 		 	
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
</script> -->
<!-- <!-- DYNAMIC ROW ADDITION FOR RECEIVE AGAINST PRODUCT -->

<script type="text/javascript">
//var i=0;
var j=1;

function assignRaw(obj) {

	var i=obj.slice(6);
	var tbl = document.getElementById("rawMaterialTable"+i);
	var lastRow = tbl.rows.length; 
	var row = tbl.insertRow(lastRow);
	var length=(tbl.rows.length)-2;	
//	alert("Length :"+length);
	
	var j=length;
	j++;

	 var firstCell = row.insertCell(0);
     var inputSrNo = document.createElement("input");
     inputSrNo.type = "text";       
     inputSrNo.name = "rawMaterialList["+i+length+"].srno";
     inputSrNo.id = "rawMaterialList["+i+length+"].srno";    
     inputSrNo.value=j;
     inputSrNo.style.width='50px';
     inputSrNo.className = "form-control";
     inputSrNo.style.textAlign="right";
     firstCell.appendChild(inputSrNo);
	
   
	var secondCell = row.insertCell(1);
	var inputItem = document.createElement("select");
	inputItem.type = "select";
	inputItem.id ="rawMaterialList["+i+length+"].rawMId";
	inputItem.name = "rawMaterialList["+i+length+"].rawMId";
	inputItem.onchange=function(){showRawMDesc(this.value,this.id);};
	
	 
	var newLength=length-1;
	//alert(" newLength :"+newLength);
	var ln = document.getElementById("rawMaterialList["+i+newLength+"].rawMId").length;
	//alert("Ln :"+ln);
	for ( var k = 0; k < ln; k++)

	{
		
		var xVal = document.getElementById("rawMaterialList["+i+newLength+"].rawMId").options[k].value;
		var xText = document.getElementById("rawMaterialList["+i+newLength+"].rawMId").options[k].text;
		desc = document.getElementById("rawMaterialList["+i+newLength+"].rawMId").options[k].label;
		
		var opt = document.createElement("option");
		opt.text = xText;
		opt.value = xVal;
		inputItem.add(opt, null);
	}
	inputItem.className = "form-control";
	secondCell.appendChild(inputItem);

	//alert("After Item");
	
	var descCell = row.insertCell(2);
	var inputdes = document.createElement("input");
	inputdes.type = 'text';
	inputdes.id = "rawMaterialList["+i+length+"].desc";
	inputdes.name = "rawMaterialList["+i+length+"].desc";		
	inputdes.style.width='100px';
	inputdes.className = "form-control";
	inputdes.style.textAlign="left";
	descCell.appendChild(inputdes);
	
	
	var avlCell = row.insertCell(3);
	var inputavl = document.createElement("input");
	inputavl.type = 'text';
	inputavl.id = "rawMaterialList["+i+length+"].avlqty";
	inputavl.name = "rawMaterialList["+i+length+"].avlqty";		
	inputavl.style.width='80px';
	inputavl.className = "form-control";
	inputavl.readOnly=true;
	inputavl.style.textAlign="right";
	avlCell.appendChild(inputavl);
	
	var areqtyCell = row.insertCell(4);
	var inputreq = document.createElement("input");
	inputreq.type = 'text';
	inputreq.id = "rawMaterialList["+i+length+"].reqty";
	inputreq.name = "rawMaterialList["+i+length+"].reqty";		
	inputreq.style.width='80px';
	inputreq.className = "form-control";
	inputreq.style.textAlign="right";
	areqtyCell.appendChild(inputreq);
	
	var thirdCell = row.insertCell(5);
	var inputQty = document.createElement("input");
	inputQty.type = 'text';
	inputQty.id = "rawMaterialList["+i+length+"].quantity";
	inputQty.name = "rawMaterialList["+i+length+"].quantity";		
	inputQty.style.width='80px';
	inputQty.className = "form-control";
	inputQty.style.textAlign="right";
	thirdCell.appendChild(inputQty);
	
	var fourthCell = row.insertCell(6);
	var inputDelete = document.createElement("input");
	inputDelete.type = 'button';
	inputDelete.id = "btndels"+i+length;
	inputDelete.name = "btndels"+i+length;
	inputDelete.value="-";
	inputDelete.className="btn btn-danger btn-xs";	
	inputDelete.onclick=function(){delassigedraw(this.id);};			
	fourthCell.appendChild(inputDelete);

	//
	var seventhCell = row.insertCell(7);
	var inputproductId= document.createElement("input");
	inputproductId.type = 'hidden';
	inputproductId.id = "rawMaterialList["+i+length+"].productId";
	inputproductId.name = "rawMaterialList["+i+length+"].productId";		
	inputproductId.style.width='80px';
	inputproductId.className = "form-control";
	inputproductId.style.textAlign="right";
	seventhCell.appendChild(inputproductId);
	//i++;

}	 
function delassigedraw(obj)
 {
	var counter1 = obj.slice(7);	
	var t=counter1.substring(0,1);
	var n=counter1.substring(1,2);	
	var tbl = document.getElementById('rawMaterialTable'+t);
	var last = (tbl.rows.length) - 1;	
	var txtSrNo,ItemCode,Quantity,desc,btndel,next,avlqty;		
	if(last == 1)
		{
		 	document.getElementById("rawMaterialList["+t+length+"].rawMId").options[0].selected=true;
		 	document.getElementById("rawMaterialList["+t+length+"].desc").value="";
		 	document.getElementById("rawMaterialList["+t+length+"].avlqty").value="";
		 	document.getElementById("rawMaterialList["+t+length+"].reqty").value="";
		 	document.getElementById("rawMaterialList["+t+length+"].quantity").value="";
		 }
	else
	 {
		 var current = window.event.srcElement;		
		 while ( (current = current.parentElement)  && current.tagName !="TR");
         current.parentElement.removeChild(current);
         var counter=n;
		 	 while(counter<last)
				 {
				 	//alert("in while counter :"+t+counter);
				 	next = counter;
				 	next++;
				 	
	 			 	txtSrNo = document.getElementById("rawMaterialList["+t+next+"].srno");
	 			 	txtSrNo.id =  "rawMaterialList["+t+counter+"].srno";
	 			 	txtSrNo.name = "rawMaterialList["+t+counter+"].srno";	 			 				 	 				 
					txtSrNo.value = txtSrNo.value-1 ;	
					
					//alert("After Sr No :"+txtSrNo.id);
				 	 				 	 			 	
				 	ItemCode = document.getElementById("rawMaterialList["+t+next+"].rawMId");
				 	ItemCode.id = "rawMaterialList["+t+counter+"].rawMId";
				 	ItemCode.name = "rawMaterialList["+t+counter+"].rawMId";		
				 	
				 	//alert("After ItemCode :"+ItemCode.id);
				 	
					desc = document.getElementById("rawMaterialList["+t+next+"].desc");
				 	desc.id = "rawMaterialList["+t+counter+"].desc";
				 	desc.name = "rawMaterialList["+t+counter+"].desc";
				 	
				 //	alert("After desc :"+desc.id);
				 
				 	avlqty = document.getElementById("rawMaterialList["+t+next+"].avlqty");
				 	avlqty.id = "rawMaterialList["+t+counter+"].avlqty";
				 	avlqty.name = "rawMaterialList["+counter+"].avlqty";
				 	
				 	var reqqty = document.getElementById("rawMaterialList["+t+next+"].reqty");
				 	reqqty.id = "rawMaterialList["+t+counter+"].reqty";
				 	reqqty.name = "rawMaterialList["+counter+"].reqty";
				 	
				 //	alert("After avlqty :"+avlqty.id);
				 	
				 	Quantity = document.getElementById("rawMaterialList["+t+next+"].quantity");
				 	Quantity.id = "rawMaterialList["+t+counter+"].quantity";
				 	Quantity.name = "rawMaterialList["+t+counter+"].quantity";
				 	
				 //	alert("After Quantity :"+Quantity.id);
				 	
				 	btndel = document.getElementById("btndels"+t+next);
	 			 	btndel.id = "btndels"+t+counter;
	 			 	btndel.name = "btndels"+t+counter;	
	 			 	
	 			 	var productId = document.getElementById("rawMaterialList["+t+next+"].productId");
	 			 	productId.id = "rawMaterialList["+t+counter+"].productId";
	 			 	productId.name = "rawMaterialList["+t+counter+"].productId";
	 			 	
	 			 //	alert("After btndel :" +btndel.id); 
			 		
					counter++; 			
			 }
	 }         
 }
</script>
<script>
function showRawMDesc(str,id)
{
//showQuantity(str,id);
var index1=id.indexOf("[");
var index2=id.indexOf("]");
var i=id.substring(index1+1,index2);
var i1=id.substring(index1+1,index2-1);
var pid=document.getElementById("productList["+i1+"].productId").value;
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("rawMaterialList["+i+"].desc").value=" ";
  	document.getElementById("rawMaterialList["+i+"].avlqty").value=" ";
  	document.getElementById("rawMaterialList["+i+"].reqty").value=" ";
  	document.getElementById("rawMaterialList["+i+"].quantity").value=" ";
  	document.getElementById("rawMaterialList["+i+"].productId").value=" ";
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
	  var desQty=xmlhttp.responseText; 
	  var index1=desQty.indexOf("^");
	  var index2=desQty.indexOf("~");
	  document.getElementById("rawMaterialList["+i+"].desc").value=desQty.substring(0,index1);
	  document.getElementById("rawMaterialList["+i+"].avlqty").value=desQty.substring(index2+1,desQty.length);
	  document.getElementById("rawMaterialList["+i+"].reqty").value=desQty.substring(index1+1,index2-1);
    }
  }
xmlhttp.open("GET","retrieveRMDetails.do?rmId="+str+"&productId="+pid,true);
xmlhttp.send();
}
</script>
<script>
function showProductId(str,id)
{
//showQuantity(str,id);
var index1=id.indexOf("[");
var index2=id.indexOf("]");
var i=id.substring(index1+1,index2);
var i1=id.substring(index1+1,index2-1);
var pid=document.getElementById("productList["+i1+"].productId").value;
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("rawMaterialList["+i+"].desc").value=" ";
  	document.getElementById("rawMaterialList["+i+"].avlqty").value=" ";
  	document.getElementById("rawMaterialList["+i+"].reqty").value=" ";
  	document.getElementById("rawMaterialList["+i+"].quantity").value=" ";
  	document.getElementById("rawMaterialList["+i+"].productId").value=" ";
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
	  document.getElementById("rawMaterialList["+i+"].productId").value=xmlhttp.responseText; 	  
    }
  }
xmlhttp.open("GET","retrieveProductId.do?productId="+pid,true);
xmlhttp.send();
}
</script>
<script>
function showProductDetailsI(str,id)
{
var index1=id.indexOf("[");
var index2=id.indexOf("]");
var i=id.substring(index1+1,index2);
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("productList["+i+"].desc").value=" ";  	
  	document.getElementById("productList["+i+"].quantity").value=" ";
  	document.getElementById("unit"+i).value="";
  	document.getElementById("assignRaw"+i).innerHTML="";
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
	  var prodDesQty=xmlhttp.responseText; 		  
	  var index=prodDesQty.indexOf("^");  
	  var index2=prodDesQty.indexOf("~");
	  document.getElementById("productList["+i+"].desc").value=prodDesQty.substring(0,index); 
	  document.getElementById("productList["+i+"].quantity").value=prodDesQty.substring(index+1,index2-2); 
      document.getElementById("unit"+i).value=prodDesQty.substring(index2+1,prodDesQty.length);
    }
  }
xmlhttp.open("GET","retrieveProductDetailsI.do?productId="+str,true);
xmlhttp.send();
}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Stock</title>
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
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
<script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();
             $('#dataTables-example4').dataTable();
             /* $('#dataTables-example5').dataTable(); */ 
         });
</script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>	
	<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {            	
                $('#dp1').datepicker({
                    format: "yyyy/mm/dd"
                });
                $('#dp2').datepicker({
                    format: "yyyy/mm/dd"
                });
                $('#dp3').datepicker({
                    format: "yyyy/mm/dd"
                });
                $('#dp4').datepicker({
                    format: "yyyy/mm/dd"
                });
               /*  $('#dp5').datepicker({
                    format: "yyyy/mm/dd"
                }); */
            });
            
            $( document).ready(function() {
             	  $('#dp1').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
             	    $(this).datepicker('hide');
             	});
             	});
             $( document).ready(function() {
             	  $('#dp2').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
             	    $(this).datepicker('hide');
             	});
             	});
             $( document).ready(function() {
              	  $('#dp3').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
              	    $(this).datepicker('hide');
              	});
              	});
              $( document).ready(function() {
              	  $('#dp4').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
              	    $(this).datepicker('hide');
              	});
              	});
             
    </script>    
    
<!-- Issue for production -->
<script> 
function validateForm()
{
	var srno = document.getElementById("productList[0].txtSrNo1").value;
	var item = document.getElementById("productList[0].txtItem1").value;
	var qty = document.getElementById("productList[0].txtQuant1").value;
	
    if(document.frmissueForProduction.txtVNo.value=="")
    {
      alert("Voucher Number should not be blank");
      document.frmissueForProduction.txtVNo.focus();
      return false;
    }
     else if(document.frmissueForProduction.date.value=="")
    {
      alert("Date should not be blank");
      document.frmissueForProduction.date.focus();
      return false;
    } 
    else if(document.frmissueForProduction.selectWarehouse.value=="Select")
    {
      alert("Select Warehouse");
      document.frmissueForProduction.selectWarehouse.focus();
      return false;
    }
     else if(srno=="")
     {
       alert("Serial number should not be blank");
       srno.focus();
       return false;
     }
     else if(item=="Select")
     {
       alert("Select Product.");
       document.getElementById("productList[0].txtItem1").focus();
       return false;
     }
     else if(qty=="")
     {
       alert("Quantity should not be blank");
       document.getElementById("productList[0].txtQuant1").focus();
       return false;
     } 
     else if(document.frmissueForProduction.txtDetails.value=="")
     {
       alert("Details should not be blank");
       document.frmissueForProduction.txtDetails.focus();
       return false;
     }        
  }
</script>
<!-- Receive for sales -->


<!-- validation for transferred -->
<script>
function validateForm2()
{	
	var srno = document.getElementById("recordTransferredDetailsList[0].txtSrNo1").value;
	var item = document.getElementById("recordTransferredDetailsList[0].txtItem1").value;
	var qty2 = document.getElementById("recordTransferredDetailsList[0].txtQuant1").value;
	var withdraw = document.getElementById("recordTransferredDetailsList[0].destWarehouse1").value;
	
    if(document.frmrecordTransferred.txtVNo.value=="")
    {
      alert("Voucher Number should not be blank");
      document.frmrecordTransferred.txtVNo.focus();
      return false;
    }
    else if(document.frmrecordTransferred.date.value=="")
    {
      alert("Date should not be blank");
      document.frmrecordTransferred.date.focus();
      return false;
    } 
   	else if(document.frmRecordTransffered.selectWarehouse.value=="Select")
    {
      alert("Select Wearhouse");
      document.frmRecordTransffered.selectWarehouse.focus();
      return false;  
    }       
     else if(srno=="") 
     {
       alert("Serial number should not be blank");
       document.getElementById("recordTransferredDetailsList[0].txtSrNo1").focus();
       return false;
     }
     else if(item=="Select")
     {
       alert("Please Select Product");
       document.getElementById("recordTransferredDetailsList[0].txtItem1").focus();
       return false;
     }    
    else if(qty2=="")
     {
       alert("Quantity should not be blank");
       document.getElementById("recordTransferredDetailsList[0].txtQuant1").focus();
       return false;
     }
     else if(withdraw=="Select")
     {
       alert("Select Destination Wearhouse");
       document.getElementById("recordTransferredDetailsList[0].destWarehouse1").focus();
       return false;
     }
     else if(document.frmrecordTransferred.txtDetails.value=="")
     {
       alert("Details should not be blank");
       document.frmrecordTransferred.txtDetails.focus();
       return false;
     }
    
  }
</script>
<!-- Wastage -->
<script>
function validateForm3()
{
	var srno = document.getElementById("recordWastageDetailsList[0].txtSrNo1").value;
	var item = document.getElementById("recordWastageDetailsList[0].txtItem1").value;
	var remark = document.getElementById("recordWastageDetailsList[0].remark").value;
	var qty = document.getElementById("recordWastageDetailsList[0].txtQuant1").value;
    if(document.frmrecordWastage.txtVNo.value=="")
    {
      alert("Voucher Number should not be blank");
      document.frmrecordWastage.txtVNo.focus();
      return false;
    }
    else if(document.frmrecordWastage.date.value=="")
    {
      alert("Date should not be blank");
      document.frmrecordWastage.date.focus();
      return false;
    } 
    else if(document.frmrecordWastage.selectWarehouse.value=="Select")
    {
      alert("Select Wearhouse");
      document.frmrecordWastage.selectWarehouse.focus();
      return false;
    }
     else if(srno=="")
     {
       alert("Serial number should not be blank");
       document.getElementById("recordWastageDetailsList[0].txtSrNo1").focus();
       return false;
     }
     else if(item=="Select")
     {
       alert("Please Select the Product");
       document.getElementById("recordWastageDetailsList[0].txtItem1").focus();
       return false;
     }
     else if(remark=="")
     {
       alert("Remark should not be blank");
       document.getElementById("recordWastageDetailsList[0].remark").focus();
       return false;
     }
    else if(qty=="")
     {
       alert("Quantity should not be blank");
       document.getElementById("recordWastageDetailsList[0].txtQuant1").focus();
       return false;
     }
     else if(document.frmrecordWastage.txtDetails.value=="")
     {
       alert("Details should not be blank");
       document.frmrecordWastage.txtDetails.focus();
       return false;
     }            
  }
</script>


<!-- <script type="text/javascript">
function showAssignRawM()
{
	 $("#showRaw").click(function()
		{		 
				$("#tableID").toggle();
		});
}
</script> -->


 <SCRIPT language=Javascript>
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
<script type="text/javascript">
function backPage()
{
	window.history.back();
}
function getid(id)
{
	alert(id);
}
</script>

<script type="text/javascript">
function showProductDetails()
{
	var orderID = document.getElementById("sorderId").value; 
	
	var xmlhttp;
	if (window.XMLHttpRequest) 
	{
		xmlhttp = new XMLHttpRequest();
	} 
	else 
	{
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
		{
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
			{
				document.getElementById("showProducts").innerHTML = xmlhttp.responseText;
			}
		}
	}
	xmlhttp.open("GET", "retriveproductDetails.do?orderID=" + orderID , true);
	xmlhttp.send();
}
</script>
<!-- <script type="text/javascript">
function showDetails(obj)
{
	 alert("in ");
	 var sr = obj.slice(7);
	 alert("sr="+sr);
	 var tableID = document.getElementById("detailsID");
	 alert(tableID);
	 var tdID = document.getElementById("assignRaw"+sr);
	 alert("tdID="+tdID);
	 //tableID.style.display = "";
	 var newtable = document.createElement("input");
	 var ftr = document.createElement("tr");
	 newtable.appendChild(ftr);
	 tdID.appendChild(newtable);
	 /* $("#showRaw").click(function()
		{		 
				$("#tableID").toggle();
		}); */
}
</script>
 -->
<script type="text/javascript">
function addProduct() 
{
	 var tbl = document.getElementById("productTable");	
     var lastRow = tbl.rows.length;
	 var row = tbl.insertRow(lastRow);
	 var length= ((tbl.rows.length)/2)-1; 	 
	// alert("Length :"+length);
	 var j=length+1;
	 
	 var firstCell = row.insertCell(0);
     var inputSrNo = document.createElement("input");
     inputSrNo.type = "text";
     inputSrNo.name = "productList["+length+"].srNo";
     inputSrNo.id ="productList["+length+"].srNo";	  
     inputSrNo.value=j;
     inputSrNo.className="form-control";
     inputSrNo.style.width='50px';
     inputSrNo.style.textAlign="right";
     firstCell.appendChild(inputSrNo);       
    
   
     var secondCell = row.insertCell(1);
 	 var inputItem = document.createElement("select");
 	 inputItem.type = "select";
 	 inputItem.id = "productList["+length+"].productId";
 	 inputItem.name = "productList["+length+"].productId";
 	 inputItem.className="form-control";
 	 inputItem.onchange=function(){showProductDetailsI(this.value,this.id);};
 		
 	 var newLength=length-1;
 	 var ln = document.getElementById("productList["+newLength+"].productId").length;
 	 var xVal=0;
 	 for ( var k = 0; k < ln; k++) 
 	 {
 		xVal = document.getElementById("productList["+newLength+"].productId").options[k].value;
 		var xText = document.getElementById("productList["+newLength+"].productId").options[k].text;
 		desc = document.getElementById("productList["+newLength+"].productId").options[k].label;
 		var opt = document.createElement("option");
 		opt.text = xText;
 		opt.value = xVal;
 		inputItem.add(opt, null); 			
 	 }  		
 	 secondCell.appendChild(inputItem);
	
	 var thirdCell=row.insertCell(2);
	 var inputDes=document.createElement("input");
	 inputDes.id="productList["+length+"].desc" ;
	 inputDes.type="text";
	 inputDes.name="productList["+length+"].desc" ;			
	 inputDes.className="form-control";		
	 thirdCell.appendChild(inputDes);
		
	 var fourthCell=row.insertCell(3);
	 var inputQty=document.createElement("input");
	 inputQty.id="productList["+length+"].quantity";
	 inputQty.type="text";
	 inputQty.name="productList["+length+"].quantity";		
	 inputQty.className="form-control";
	 inputQty.onkeypress=function(){return isNumberKey(this);};
	 inputQty.style.width="80px";
	 inputQty.style.textAlign="right";
	 fourthCell.appendChild(inputQty);
	 
	 var unitCell=row.insertCell(4);
	 var inputunit=document.createElement("input");
	 inputunit.id="unit"+length;
	 inputunit.type="text";
	 inputunit.name="unit"+length;		
	 inputunit.className="form-control";
	 inputunit.onkeypress=function(){return isNumberKey(this);};
	 inputunit.style.width="80px";
	 inputunit.readOnly=true;
	 //inputunit.style.textAlign="right";
	 unitCell.appendChild(inputunit);
        
	 var fifthCell = row.insertCell(5);
	 var inputbutton1 = document.createElement("input");
	 inputbutton1.type = "button";
	 inputbutton1.name = "showRaw"+length;
	 inputbutton1.id = "showRaw"+length; 	
	 inputbutton1.value="Assign"; 		
	 inputbutton1.className="btn btn-default btn-xs";	
	 inputbutton1.onclick=function(){assignRowMaterial(this.id);};
		     
	
	 var inputbutton2 = document.createElement("input");
	 inputbutton2.type = "button";
	 inputbutton2.name = "btnDel"+length;
	 inputbutton2.id = "btnDel"+length; 	
	 inputbutton2.value="-"; 		
	 inputbutton2.className="btn btn-danger btn-xs";
	 inputbutton2.onclick=function(){deleteProduct(this.id);};
	 fifthCell.appendChild(inputbutton1);
	// fifthCell.innerHTML+="&nbsp;";
	 fifthCell.appendChild(inputbutton2);
	      
	 var tbln = document.getElementById("productTable");
	 var lastRow1 = tbln.rows.length;	      
	 var row1 = tbln.insertRow(lastRow1);	     
	 var linkedTD = row1.insertCell(0);
	 var linkedTax = document.createElement("td");
	 //linkedTax.type="text";
	 linkedTax.id = "assignRaw"+length;
	 linkedTD.colSpan = 6;
	 linkedTax.value=linkedTax.id+" "+row1.rowIndex;
	// alert("linkedTax.id :"+linkedTax.id);
	 linkedTD.appendChild(linkedTax);
}	 
function deleteProduct(id)
{
	var counter = id.slice(6);
	var sr=counter;
	var tbl = document.getElementById("productTable");	   
	var last= ((tbl.rows.length+1)/2)-1; 	
	var length=last-1;
	
	 if(last == 1)
	 {
		document.getElementById("productList["+length+"].productId").options[0].selected = true;
	 	document.getElementById("productList["+length+"].desc").value = "";	 	
		document.getElementById("assignRaw"+length).innerHTML="";
	 	document.getElementById("productList["+length+"].quantity").value = "";	 	
	 	document.getElementById("unit"+length).value="";
	 }
   else
     {	
	  	
	    
	   	var del = (((parseInt(sr)+parseInt(sr))+2)/2);		   
	   	var finalDel=parseInt(del)+parseInt(del);	
	   	document.getElementById("productTable").deleteRow(finalDel); 
	   
	   var current = window.event.srcElement;
	    while ( (current = current.parentElement)  && current.tagName !="TR"); 
	    current.parentElement.removeChild(current); 
	   	
	    var cnt = counter;	   
	   
	    while(cnt<last)
		{
			next = parseInt(cnt)+1;
	 		
	 		var inputSrNo = document.getElementById("productList["+next+"].srNo");
		 	inputSrNo.id = "productList["+cnt+"].srNo";
		 	inputSrNo.name =  "productList["+cnt+"].srNo";
		 	inputSrNo.value =inputSrNo.value-1;
		 	
		 	var inputItem = document.getElementById("productList["+next+"].productId");
		 	inputItem.id = "productList["+cnt+"].productId";
		 	inputItem.name = "productList["+cnt+"].productId";
		 	
		    var inputDes = document.getElementById("productList["+next+"].desc");
		    inputDes.id = "productList["+cnt+"].desc";
		    inputDes.name ="productList["+cnt+"].desc";
		    
		    var inputquantity = document.getElementById("productList["+next+"].quantity");
		    inputquantity.id = "productList["+cnt+"].quantity";
		    inputquantity.name ="productList["+cnt+"].quantity";
		    
		    var unit = document.getElementById("unit"+next);
		    unit.id = "unit" + cnt;
		    unit.name ="unit" + cnt;
		    
		    var inputbtnAdd = document.getElementById("showRaw"+next);
		    inputbtnAdd.id = "showRaw" + cnt;
		    inputbtnAdd.name ="showRaw" + cnt;
		    
		    var inputqbtnDel = document.getElementById("btnDel"+next);
		    inputqbtnDel.id = "btnDel" + cnt;
		    inputqbtnDel.name ="btnDel" + cnt;
	 		
			var linkedTax=document.getElementById("assignRaw"+next);
			linkedTax.id = "assignRaw" + cnt;	
			
		 	cnt++;
		} 
     }
     
}
 </script>
 <script type="text/javascript">
$(function()
        {
            $("#tableId tr td").live("click",function()
            {
    
    //consol.log("??????????????????????????????");
                   alert($(this).html());
    //$(this).text()

            });
        });

</script> 
<!--assignRowMaterial(this.id)  -->
<script type="text/javascript">
function assignRowMaterial(obj)
{
	var i=obj.slice(7);
	var productId = document.getElementById("productList["+i+"].productId").value; 		
	var qty = document.getElementById("productList["+i+"].quantity").value;	
	var unit = document.getElementById("unit"+i).value;
	var xmlhttp;
	if (window.XMLHttpRequest) 
	{
		xmlhttp = new XMLHttpRequest();
	} 
	else 
	{
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
		{
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
			{
				document.getElementById("assignRaw"+i).innerHTML = xmlhttp.responseText;
			}
		}
	}
	xmlhttp.open("GET", "retriveRawMaterial.do?productId=" + productId+"&cnt="+i+"&qty="+qty+"&unit="+unit , true);
	xmlhttp.send();
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
<!-- <script>
function checkProduct(str,id)
{
var index1=id.indexOf("[");
var index2=id.indexOf("]");
var i=id.substring(index1+1,index2);
var wid = document.getElementById("recordTransferredDetailsList["+i+"].destWarehouse1").value;
alert(wid);
var prodID = document.getElementById("recordTransferredDetailsList["+i+"].txtItem1").value;
alert(prodID);
var xmlhttp;   
if (str==" ")
  {
  	//document.getElementById("recordTransferredDetailsList["+i+"].availableqty").value="";
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
	 	
	  var cnt = xmlhttp.responseText;
		getCount(cnt);
    }
  }
xmlhttp.open("GET", "checkAvlProduct.do?productId=" + prodID + "&wID="+ wid+ "", true);
/* xmlhttp.open("GET","retriveTransAvailableQty.do?productId="+str+"wID="+wid,true); */
xmlhttp.send();
}
</script> -->
<script type="text/javascript">
function checkProduct(str,id)
{
	
		var index1=id.indexOf("[");
		var index2=id.indexOf("]");
		var i=id.substring(index1+1,index2);		
		var wid = document.getElementById("recordTransferredDetailsList["+i+"].destWarehouse1").value;
		var prodID = document.getElementById("recordTransferredDetailsList["+i+"].txtItem1").value;
		var xmlhttp;
		if (window.XMLHttpRequest) 
		{
			xmlhttp = new XMLHttpRequest();
		} 
		else 
		{
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
			{
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
				{
					var cnt = xmlhttp.responseText;
					if(cnt==0)
					{
						alert("Opps..!Selected Product is not Avaialabe in Destination Warehouse.");
						document.getElementById("recordTransferredDetailsList["+i+"].destWarehouse1").options[0].selected = true;
					}
				}
			}
		}
		xmlhttp.open("GET", "checkAvlProduct.do?prodID=" + prodID + "&wid="+ wid,true);
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
 	if(parseFloat(currentqty) > parseFloat(availableqty))
		{
		alert("Current Quantity not Greater than Available Quantity");
		document.getElementById("recordTransferredDetailsList["+i+"].txtQuant1").focus();
		document.getElementById("recordTransferredDetailsList["+i+"].txtQuant1").value="";
		return false;
		}
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
		alert("Current Quantity not Greater than Aavailable Quantity");
		document.getElementById("recordWastageDetailsList["+i+"].txtQuant1").focus();
		document.getElementById("recordWastageDetailsList["+i+"].txtQuant1").value="";
		return false;
		}
	}
</script>
</head>
<body style="overflow-x: hidden;"> 
	<div id="wrapper">
		<%@include file="../header.jsp"%>		
		<div class="page-wrapper">
		<%@include file="innerHeader.jsp"%>
			<br>			
			<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-10">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Manage<small>&nbsp;Stock</small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
					<a href="inventory.do" class="btn btn-primary btn-large"> Back</a>	
		         </div>
			</div>
		</div>
</div><br>
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
					<div class="alert alert-danger" role="alert" id="failure">Current Quantity not Greater than Aavailable Quantity</div>
					</div>
					<script type="text/javascript">
					$(document).ready(function() 
					{
						
						$(".tab4").addClass('active');
						 
						$('#failure').fadeOut(4000, function(){
						});	
					});
					</script>
					</c:if>
					<c:if test="${count==0}">
					<div class="col-md-12">
					<div class="alert alert-danger" role="alert" id="failure">Opps..!Selected Product not Avaialabe in Destination Warehouse.</div>
					</div>
					<script type="text/javascript">	
					$('#failure').fadeOut(4000, function(){
					});
					</script>
					</c:if>
					<br>
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<ul class="nav nav-tabs">
							<!-- <li class="active"><a href="#tab1" data-toggle="tab"><i class="icon-th-list "></i>Issue For Production</a></li> 
							<li><a href="#tab2" data-toggle="tab"><i class="icon-signout "></i> Receive for Sales</a></li> -->
							<li class="tab1"><a href="#tab1" data-toggle="tab" ><i class="icon-th-list "></i>Production Order</a></li>
							<li class="tab3"><a href="#tab3" data-toggle="tab" ><i class="icon-truck"></i> Record Wastage</a></li>
							<li class="tab4"><a href="#tab4" data-toggle="tab" ><i class="icon-signout"></i> Stock Transfer</a></li>
							<!-- <li><a href="#tab5" data-toggle="tab"><i class="icon-signout"></i> Receive against Production</a></li> -->
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="tab1">								
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="col-md-12">
										<form:form action="addProduction.do" cssClass="form-inline" name="frmProduction" onsubmit="return validateForm()" modelAttribute="production" >
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Production&nbsp;order ID&nbsp;: </label>
														</div>
														<div class="col-md-4"> 		 
															
															<%-- <form:input path="productionID" cssClass="form-control" readonly="true"/> --%>
															<input type="text" name="productionID" value="${production.productionID}" class="form-control" readonly="readonly"	style="width: 100px;" /> 
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-5">
															<label>Sales&nbsp;order ID&nbsp;: </label>
														</div>
														<div class="col-md-7">
															<select name="sorderId" class="form-control" id="sorderId" onchange="showProductDetails();">																
																<option value=" ">---Select---</option>
																<c:forEach items="${orderList}" var="orderList">
																<option value="${orderList.txtSOID}">${orderList.txtSOID}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
											</div>
											<br>
												<%
													DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
											     	Date date = new Date();	     
											     	String dt=dateFormat.format(date);
												%>	
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-2">
															<label>Date&nbsp;: </label>
														</div>
														<div class="col-md-5">
															<input type="text" name="prodDate" id="dp1" value="<%=dt%>" class="form-control">
														</div>
													</div>
												</div>
											</div>
											<br>
											<div id="showProducts">
												<div class="row">
											<div class="table-responsive">
												<table id="productTable"  class="table table-striped">
													<thead>
														<tr>
															<th style="text-align: center;">Sr No</th>
															<th style="text-align: center;">Product</th>
															<th style="text-align: center;">Description</th>
															<th style="text-align: center;">Quantity</th>
															<th style="text-align: center;">Unit</th>
															<th style="text-align: center;">Action</th>
														</tr>
													</thead>												
													<tbody>
														<tr>
															<td><input name="productList[0].srNo" id="productList[0].srNo" type="text" value="1" class="form-control" style="width: 50px; text-align: right;"></td>
															<%-- <td><input type="text" value="${productList.productId}" class="form-control"></td> --%>
															 <td>
															 	<select name="productList[0].productId" id="productList[0].productId" onchange="showProductDetailsI(this.value,this.id);" class="form-control">
															 	<option value=" ">----Select----</option> 
															 	<c:forEach items="${prodID}" var="prodID">
																	<option value="${prodID.productCode}">${prodID.txtName}</option>
																</c:forEach>
															 	</select>
															 </td> 
															<td><input name="productList[0].desc" id="productList[0].desc" class="form-control"></td> 
															<td><input name="productList[0].quantity" id="productList[0].quantity" type="text" class="form-control" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
															<td><input name="unit0" id="unit0" type="text" class="form-control" readonly="readonly" style="width: 80px;"></td>
															<td>
																	<input type="button" name="addRec" value="Assign" id="showRaw0" onclick="assignRowMaterial(this.id);" class="btn btn-default btn-xs">
																	<input type="button" name="btnDel0" value="-" id="btnDel0" onclick="deleteProduct(this.id)" class="btn btn-danger btn-xs">													
															</td>															
														</tr>													
														<tr> 
															<td id="assignRaw0" colspan="6">
																
															</td>
														</tr>
														
													</tbody>
												</table>	
												<input type="button" name="addRaw" id="addRaw" value="+ Add Product" onClick="addProduct()" class="btn btn-default btn-xs">																												
											</div>
											</div>
											</div>
											<br>
											<div>
												<button type="submit" class="btn btn-primary" name="btn" value="Save">Save</button>
												<a href="inventory.do" class="btn btn-primary btn-large"> Cancel</a>
											</div>
											<br>
											</form:form>
										</div>
									</div>
								</div>
							</div>
							<%-- <div class="tab-pane fade in active" id="tab1">								
									<div class="panel panel-default">
										<div class="panel-body">
										<div class="col-md-12">
											<form:form action="issueForProduction.do" method="post" cssClass="form-inline" commandName="issueForProduction" name="frmissueForProduction" onsubmit="return validateForm()"> 
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-4">  
											<form:input path="txtVNo" id="txtVNo" readonly="true" cssStyle="width: 100px;" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher Date:-</label>
										</div>
										<div class="col-md-7">
											<input type="text" id="dp1" name="date" class="form-control" style="width: 160px;" />								
										</div>
									</div>
								</div>								
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Warehouse:-</label>
										</div>
										<div class="col-md-4">  
											<select name="selectWarehouse" class="form-control" style="width: 150px;">
												<option value="Select">---Select---</option>
												<c:forEach items="${wareID}" var="wareID">
													<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>	
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Sales&nbsp;Order&nbsp;ID:-</label>
										</div>
										<div class="col-md-6">
												<select name="selectSalesorderid" class="form-control" style="width: 150px;">										
												<option value="Select">---Select---</option>
												<c:forEach items="${orderList}" var="orderList">
															<option value="${orderList.txtSOID}">${orderList.txtSOID}</option>
														</c:forEach>
												</select>		
										</div>
									</div>
								</div>																	
							</div><br>							
					<div class="table-responsive"><center>
						<table id="tableissueandreceive" class="table table-striped">
							<tr>
								<th align="center">Sr No</th>
								<th align="center">Product</th>
								<th align="center">Quantity</th>
								<th></th>
							</tr>
							<tr>
								<td><input type="text" name="productList[0].txtSrNo1" id="productList[0].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" onkeypress="return isNumberKey(this)" value="1" /></td>
								<td><form:select path="productList[0].txtItem1" id="productList[0].txtItem1" onchange="showDesc(this.value,this.id)" cssClass="form-control">
										<option value="Select">----Select----</option>
										<c:forEach items="${prodID}" var="prodID">
											<option value="${prodID.productCode}">${prodID.txtName}</option>
										</c:forEach>
									</form:select>
								</td>
								<td><input type="text" name="productList[0].txtQuant1" id="productList[0].txtQuant1" class="form-control" style="text-align: right; width: 80px;" onkeypress="return isNumberKey(this);" /></td>
								<td><input type="button" id="btndel0" name="btndel0" class="btn btn-danger" value="-" onclick="delrow(this);" /></td>
								
							</tr>
						</table></center>
						<input type="button" name="addRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRow()">
					</div>
				<br>
												<div>
													<label>Details</label>
												</div>
												<div>
													<textarea name="txtDetails" rows="4" cols="50"
														class="form-control" style="width: 400px;"></textarea>
												</div>
												<br>
												<br>
												<div>
													<!-- <a href="inventory.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a> -->
													<button type="submit" class="btn btn-primary" name="btn"
														value="Save">SAVE</button>
													<button type="reset" class="btn btn-primary" name="btn">CLEAR</button>

												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div> --%>
							<div class="tab-pane fade" id="tab2">								
									<div class="panel panel-default">
										<div class="panel-body">
										<div class="col-md-12">											
							<form:form action="receiveforSales.do" method="post" cssClass="form-inline" commandName="receiveforSales" name="frmreceiveforSales" onsubmit="return validateForm1()">
								<%-- <div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-4">  
											<form:input path="txtVNo" id="txtVNo" readonly="true" cssStyle="width: 100px;" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher Date:-</label>
										</div>
										<div class="col-md-7">
											<input type="text" id="dp2" name="date" class="form-control" style="width: 160px;" />								
										</div>
									</div>
								</div>								
							</div><br> --%>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Voucher Date:-</label>
										</div>
										<div class="col-md-4">  
											<input type="text" id="dp2" name="date" class="form-control" style="width: 160px;" />
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-7">
											<form:input path="txtVNo" id="txtVNo" readonly="true" cssStyle="width: 100px;" cssClass="form-control"></form:input>								
										</div>
									</div>
								</div>								
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Warehouse:-</label>
										</div>
										<div class="col-md-4">  
											<select name="selectWarehouse" class="form-control" style="width: 150px;">										
												<option value="Select">---Select---</option>
												<c:forEach items="${wareID}" var="wareID">
													<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
																						
							</div><br>								
							<div class="table-responsive">	<center>
								<table id="tablereceive" class="table table-striped">
									<tr>
										<th align="center">Sr No</th>
										<th align="center">Product</th>
										<th align="center">Quantity</th>
										<th></th>
									</tr>
									<tr>
										<td><input name="productList[0].txtSrNo1" id="productList[0].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" onkeypress="return isNumberKey(this)" value="1" /></td>
										<td><select name="productList[0].txtItem1" id="productList[0].txtItem1" class="form-control"> 
												<option value="Select">----Select----</option>
												<c:forEach items="${prodID}" var="prodID">
													<option value="${prodID.productCode}">${prodID.txtName}</option>
												</c:forEach>
										</select></td>
										<td><input name="productList[0].txtQuant1" id="productList[0].txtQuant1" class="form-control" style="text-align: right; width: 80px;" onkeypress="return isNumberKey(this)" /></td>
										<td class="fnt"><input type="button" id="btndel0" name="btndel0" class="btn btn-danger" value="-" onclick="delrowreceive(this);"></td>
									</tr>
								</table></center>
								<input type="button" name="addReceiveRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRowReceive()">
							</div>
												<br>
												<div>
													<label>Details</label>
												</div>
												<div>
													<textarea rows="4" cols="50" Name="txtDetails"
														class="form-control" style="width: 400px;"></textarea>
												</div>
												<br>
												<br>

												<div>
													<!-- 						    		<a href="inventory.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
 -->
													<input type="submit" value="Save" name="btn"
														class="btn btn-primary"> 
														<a href="inventory.do" class="btn btn-primary btn-large"> Cancel</a>

												</div>

											</form:form>
										</div>
									</div>

								</div>
							</div>

							<div class="tab-pane fade" id="tab3">								
									<div class="panel panel-default">
										<div class="panel-body">
										<div class="col-md-12">
											<form:form action="recordWastage.do" method="post" cssClass="form-inline" commandName="recordWastage" name="frmrecordWastage" onsubmit="return validateForm3()">
										<div class="row">
								<div class="col-md-6">
									<%-- <div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-4">  
											<form:input path="txtVNo" id="txtVNo" readonly="true" cssStyle="width: 100px;" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher Date:-</label>
										</div>
										<div class="col-md-7">
											<input type="text" id="dp3" name="date" class="form-control" style="width: 160px;" />								
										</div>
									</div>
								</div>								
							</div><br> --%>
							<div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;Date:-</label>
										</div>
										<div class="col-md-4">  
											<input type="text" id="dp3" name="date" class="form-control" style="width: 160px;" />
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-7">
											<form:input path="txtVNo" id="txtVNo" readonly="true" cssStyle="width: 100px;" cssClass="form-control"></form:input>								
										</div>
									</div>
								</div>								
							</div><br>
							
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Warehouse:-</label>
										</div>
										<div class="col-md-4">
											<select name="selectWarehouse" id="wastageWarehouse" class="form-control" onchange="showWasteProduct();" style="width: 150px;">										
												<option value="Select">---Select---</option>
												<c:forEach items="${wareID}" var="wareID">
													<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>																
							</div><br>
												<div class="table-responsive">
												<center>
													<table id="tableWastage" class="table table-striped">
														<tr>
															<th align="center">Sr No</th>
															<th align="center">Product</th>
															<th align="center">Available Qty</th>
															<th align="center">Remark</th>															
															<th align="center">Quantity</th>
															<th></th>
														</tr>
														<tr>
															<td><input name="recordWastageDetailsList[0].txtSrNo1" id="recordWastageDetailsList[0].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" onkeypress="return isNumberKey(this)" value="1" /></td>
															
															 <td id="showWastage"><select name="recordWastageDetailsList[0].txtItem1" id="recordWastageDetailsList[0].txtItem1" onchange="showWastageQuntity(this.value,this.id);" class="form-control">
																	<option value="Select">----Select----</option>
																	<c:forEach items="${prodID}" var="prodID">
																		<option value="${prodID.productCode}">${prodID.txtName}</option>
																	</c:forEach>
															</select></td> 															
															<td><input name="recordWastageDetailsList[0].availableQty" id="recordWastageDetailsList[0].availableQty" readonly="readonly" class="form-control" style="text-align: right; width: 110px;" /></td>
															<td><input name="recordWastageDetailsList[0].remark" id="recordWastageDetailsList[0].remark" class="form-control" style="text-align: right; width: 110px;" /></td>	
															<td><input name="recordWastageDetailsList[0].txtQuant1" id="recordWastageDetailsList[0].txtQuant1" onchange="checkwasteqtydetails(this.value,this.id);"class="form-control" style="text-align: right; width: 80px;" /></td>
															<td class="fnt"><input type="button" id="btndel0" name="btndel0" class="btn btn-danger" value="-" onclick="delrowWaste(this);"></td>
														</tr>

													</table></center>
													<input type="button" name="addWasteRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRowWaste()">
												</div>
												<br>
												<div>
													<label>Details</label>
												</div>
												<div>
													<textarea rows="4" cols="50" name="txtDetails"
														class="form-control" style="width: 400px;"></textarea>
												</div>
												<br>
												<br>

												<div>
													<input type="submit" value="Save" name="btn"
														class="btn btn-primary"> 
														<a href="inventory.do" class="btn btn-primary btn-large"> Cancel</a>
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>
							<%-- <div class="tab-pane fade" id="tab3">								
									<div class="panel panel-default">
										<div class="panel-body">
										<div class="col-md-12">
											<form:form action="recordWastage.do" method="post" cssClass="form-inline" commandName="recordWastage" name="frmrecordWastage" onsubmit="return validateForm3()">
										<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-4">  
											<form:input path="txtVNo" id="txtVNo" readonly="true" cssStyle="width: 100px;" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher Date:-</label>
										</div>
										<div class="col-md-7">
											<input type="text" id="dp3" name="date" class="form-control" style="width: 160px;" />								
										</div>
									</div>
								</div>								
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Warehouse:-</label>
										</div>
										<div class="col-md-4">
											<select name="selectWarehouse" class="form-control" style="width: 150px;">										
												<option value="Select">---Select---</option>
												<c:forEach items="${wareID}" var="wareID">
													<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>																
							</div><br>
												<div class="table-responsive">
												<center>
													<table id="tableWastage" class="table table-striped">
														<tr>
															<th align="center">Sr No</th>
															<th align="center">Product</th>
															<th align="center">Remark</th>
															<th align="center">Quantity</th>
															<th></th>
														</tr>
														<tr>
															<td><input name="recordWastageDetailsList[0].txtSrNo1" id="recordWastageDetailsList[0].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" onkeypress="return isNumberKey(this)" value="1" /></td>
															<td><select name="recordWastageDetailsList[0].txtItem1" id="recordWastageDetailsList[0].txtItem1" onchange="showDesc(this.value,this.id)" class="form-control">
																	<option value="Select">----Select----</option>
																	<c:forEach items="${prodID}" var="prodID">
																		<option value="${prodID.productCode}">${prodID.txtName}</option>
																	</c:forEach>
															</select></td>															
															<td><input name="recordWastageDetailsList[0].remark" id="recordWastageDetailsList[0].remark" class="form-control" style="text-align: right; width: 110px;" /></td>
															<td><input name="recordWastageDetailsList[0].txtQuant1" id="recordWastageDetailsList[0].txtQuant1" class="form-control" style="text-align: right; width: 80px;" /></td>
															<td class="fnt"><input type="button" id="btndel0" name="btndel0" class="btn btn-danger" value="-" onclick="delrowWaste(this);"></td>
														</tr>

													</table></center>
													<input type="button" name="addWasteRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRowWaste()">
												</div>
												<br>
												<div>
													<label>Details</label>
												</div>
												<div>
													<textarea rows="4" cols="50" name="txtDetails"
														class="form-control" style="width: 400px;"></textarea>
												</div>
												<br>
												<br>

												<div>
													<input type="submit" value="Save" name="btn"
														class="btn btn-primary"> <input type="submit"
														name="btn" value="Cancel" class="btn btn-primary">
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>		 --%>					
							
							<div class="tab-pane fade" id="tab4">								
									<div class="panel panel-default">
										<div class="panel-body">
										<div class="col-md-12">
											<form:form action="recordTransferred.do" method="post" cssClass="form-inline" commandName="recordTransferred" name="frmrecordTransferred" onsubmit="return validateForm2()">
												<%-- <div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-4">  
											<form:input path="txtVNo" id="txtVNo" readonly="true" cssStyle="width: 100px;" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher Date:-</label>
										</div>
										<div class="col-md-7">
											<input type="text" id="dp4" name="date" class="form-control" style="width: 160px;" />								
										</div>
									</div>
								</div>								
							</div><br> --%>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;Date:-</label>
										</div>
										<div class="col-md-4">  
											<input type="text" id="dp4" name="date" class="form-control" style="width: 160px;" />
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-7">
											<form:input path="txtVNo" id="txtVNo" readonly="true" cssStyle="width: 100px;" cssClass="form-control"></form:input>								
										</div>
									</div>
								</div>								
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Warehouse:-</label>
										</div>
										<div class="col-md-4"> 
											<select name="selectWarehouse" id="selectWarehouse" onchange="showProduct();" class="form-control" style="width: 150px;">
												<option value="Select">---Select---</option>
												<c:forEach items="${wareID}" var="wareID">
													<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>																
							</div><br>
												<div class="table-responsive"><center>
													<table id="tableTransfer" class="table table-striped">
														<tr>
															<th align="center">Sr No</th>
															<th align="center">Product</th>
															<th align="center">Available Qty</th>
															<th align="center">Quantity</th>
															<th align="center">Destination Warehouse</th>
															<th></th>
														</tr>
														<tr>
															<td><input name="recordTransferredDetailsList[0].txtSrNo1" id="recordTransferredDetailsList[0].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" onkeypress="return isNumberKey(this)" value="1" /></td>
															<td id="show"><select name="recordTransferredDetailsList[0].txtItem1" id="recordTransferredDetailsList[0].txtItem1"  onchange="showQuntity(this.value,this.id);" class="form-control">
																	<option value="Select">----Select----</option>
																	<c:forEach items="${prodID}" var="prodID">
																		<option value="${prodID.productCode}">${prodID.txtName}</option> 
																	</c:forEach>
															</select></td>
															<td><input type="text" name="recordTransferredDetailsList[0].availableqty" id="recordTransferredDetailsList[0].availableqty" class="form-control" style="text-align: right; width: 80px;" readonly="readonly" onkeypress="return isNumberKey(this);" /></td>
															<td><input name="recordTransferredDetailsList[0].txtQuant1" id="recordTransferredDetailsList[0].txtQuant1" onchange="checkAvailqty(this.value,this.id);" class="form-control"  style="text-align: right; width: 80px;" onkeypress="return isNumberKey(this)" /></td>
															<td><select name="recordTransferredDetailsList[0].destWarehouse1" id="recordTransferredDetailsList[0].destWarehouse1" onchange="checkProduct(this.value,this.id);" class="form-control">
																	<option value="Select">----Select----</option>
																	<c:forEach items="${wareID}" var="wareID">
																		<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
																	</c:forEach>
															</select></td>
															<td class="fnt"><input type="button" id="btndel0" name="btndel0" class="btn btn-danger" value="-" onclick="delrowTrans(this);"></td>
														</tr>
													</table></center>
													<input type="button" name="addTransRec"
														class="btn btn-default btn-xs" value="+ Add New Row"
														onclick="addRowTrans()">
													<!-- <input type="button" name="addRec" class="btn btn-primary" value="Add" onClick="addRowTrans()"> -->
												</div>
												<br>
												<div>
													<label>Details</label>
												</div>
												<div>
													<textarea rows="4" cols="50" name="txtDetails"
														class="form-control" style="width: 400px;"></textarea>
												</div>
												<br>
												<br>
												<div>
													<input type="submit" value="Save" name="btn"
														class="btn btn-primary"> 
														<a href="inventory.do" class="btn btn-primary btn-large"> Cancel</a>
												</div>

											</form:form>
										</div>
									</div>
								</div>
							</div>
							<%-- <div class="tab-pane fade" id="tab4">								
									<div class="panel panel-default">
										<div class="panel-body">
										<div class="col-md-12">
											<form:form action="recordTransferred.do" method="post" cssClass="form-inline" commandName="recordTransferred" name="frmrecordTransferred" onsubmit="return validateForm2()">
												<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Voucher&nbsp;No:-</label>
										</div>
										<div class="col-md-4">  
											<form:input path="txtVNo" id="txtVNo" readonly="true" cssStyle="width: 100px;" cssClass="form-control"></form:input>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Voucher Date:-</label>
										</div>
										<div class="col-md-7">
											<input type="text" id="dp4" name="date" class="form-control" style="width: 160px;" />								
										</div>
									</div>
								</div>								
							</div><br>
							<div class="row">
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4"> 
											<label>Warehouse:-</label>
										</div>
										<div class="col-md-4">
											<select name="selectWarehouse" class="form-control" style="width: 150px;">										
												<option value="Select">---Select---</option>
												<c:forEach items="${wareID}" var="wareID">
													<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>																
							</div><br>
												
												<div class="table-responsive"><center>
													<table id="tableTransfer" class="table table-striped">
														<tr>
															<th align="center">Sr No</th>
															<th align="center">Product</th>
															<th align="center">Quantity</th>
															<th align="center">Destination Warehouse</th>
															<th></th>
														</tr>
														<tr>
															<td><input name="recordTransferredDetailsList[0].txtSrNo1" id="recordTransferredDetailsList[0].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" onkeypress="return isNumberKey(this)" value="1" /></td>
															<td><select name="recordTransferredDetailsList[0].txtItem1" id="recordTransferredDetailsList[0].txtItem1"  class="form-control">
																	<option value="Select">----Select----</option>
																	<c:forEach items="${prodID}" var="prodID">
																		<option value="${prodID.productCode}">${prodID.txtName}</option>
																	</c:forEach>
															</select></td>
															<td><input name="recordTransferredDetailsList[0].txtQuant1" id="recordTransferredDetailsList[0].txtQuant1" class="form-control" style="text-align: right; width: 80px;" onkeypress="return isNumberKey(this)" /></td>
															<td><select name="recordTransferredDetailsList[0].destWarehouse1" id="recordTransferredDetailsList[0].destWarehouse1" onchange="showDesc(this.value,this.id)" class="form-control">
																	<option value="Select">----Select----</option>
																	<c:forEach items="${wareID}" var="wareID">
																		<option value="${wareID.warehousrID}">${wareID.wareHouseName}</option>
																	</c:forEach>
															</select></td>
															<td class="fnt"><input type="button" id="btndel0" name="btndel0" class="btn btn-danger" value="-" onclick="delrowTrans(this);"></td>
														</tr>
													</table></center>
													<input type="button" name="addTransRec"
														class="btn btn-default btn-xs" value="+ Add New Row"
														onclick="addRowTrans()">
													<!-- <input type="button" name="addRec" class="btn btn-primary" value="Add" onClick="addRowTrans()"> -->
												</div>
												<br>
												<div>
													<label>Details</label>
												</div>
												<div>
													<textarea rows="4" cols="50" name="txtDetails"
														class="form-control" style="width: 400px;"></textarea>
												</div>
												<br>
												<br>
												<div>
													<input type="submit" value="Save" name="btn"
														class="btn btn-primary"> <input type="reset"
														name="btn" value="Cancel" class="btn btn-primary">
												</div>

											</form:form>
										</div>
									</div>
								</div>
							</div> --%>
							


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>