<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRow() {

		

		var tbl = document.getElementById('tableID');
		var lastRow = tbl.rows.length; 
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		
		
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
		inputDelete.className="btn btn-primary";	
		inputDelete.onclick=function(){delrow(this);};			
		fourthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('tableID');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Quantity,btndel,next;		
		 if(last == 2)
			 {
			 	ItemCode = document.getElementById("productList["+length+"].itemCode");
			 	
			 	Quantity = document.getElementById("productList["+length+"].quantity");			 	
			 	ItemCode.value = 'select';
			 	
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


<script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRow() {

		

		var tbl = document.getElementById('tableID');
		var lastRow = tbl.rows.length; 
		
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		
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
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "recordWastageDetailsList["+length+"].txtQuant1";
		inputQty.name = "recordWastageDetailsList["+length+"].txtQuant1";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		thirdCell.appendChild(inputQty);
		
		var fourthCell = row.insertCell(3);
		var inputRemark = document.createElement("input");
		inputRemark.type = 'text';
		inputRemark.id ="recordWastageDetailsList["+length+"].remark";
		inputRemark.name="recordWastageDetailsList["+length+"].remark";	
		inputRemark.className = "form-control";
		fourthCell.appendChild(inputRemark); 
		
		
				
		var fifthCell = row.insertCell(4);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-primary";	
		inputDelete.onclick=function(){delrow(this);};			
		fifthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('tableID');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Remark,Quantity,btndel,next;		
		 if(last == 2)
			 {
			 	ItemCode = document.getElementById("recordWastageDetailsList["+length+"].itemCode");
			 	Remark = document.getElementById("recordWastageDetailsList["+length+"].remark");
			 	Quantity = document.getElementById("recordWastageDetailsList["+length+"].quantity");	

			 	ItemCode.value = 'select';
			 	Remark.value="";
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
 
<!-- DYNAMIC ROW ADDITION FOR RECORD TRANSFFERD -->
 <script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRow() {

		

		var tbl = document.getElementById('tableID');
		var lastRow = tbl.rows.length; 
		
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		
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
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
		
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
		var inputDestWarehouse = document.createElement("input");
		inputDestWarehouse.type = 'text';
		inputDestWarehouse.id ="recordTransferredDetailsList["+length+"].destWarehouse1";
		inputDestWarehouse.name="recordTransferredDetailsList["+length+"].destWarehouse1";	
		inputDestWarehouse.className = "form-control";
		fourthCell.appendChild(inputDestWarehouse);
		
		var fifthCell = row.insertCell(4);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-primary";	
		inputDelete.onclick=function(){delrow(this);};			
		fifthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('tableID');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Quantity,DestWareHouse,btndel,next;		
		 if(last == 2)
			 {
			 	ItemCode = document.getElementById("recordTransferredDetailsList["+length+"].itemCode");
			 	DestWareHouse = document.getElementById("recordTransferredDetailsList["+length+"].DestWareHouse");
			 	Quantity = document.getElementById("recordTransferredDetailsList["+length+"].quantity");			 	
			 	ItemCode.value = 'select';
			 	DestWareHouse.value = ""; 
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
 				 	
 				 	DestWareHouse = document.getElementById("enquiryDetails["+next+"].destWareHouse");
 				 	DestWareHouse.id =  "recordTransferredDetailsList["+counter+"].destWareHouse";
 				 	DestWareHouse.name = "recordTransferredDetailsList["+counter+"].destWareHouse"; 
 				  			 	
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

<script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Stock</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
    <link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <link rel="stylesheet" href="../assets/css/theme.css" />
    <link rel="stylesheet" href="../assets/css/MoneAdmin.css" />
    <link rel="stylesheet" href="../assets/plugins/Font-Awesome/css/font-awesome.css" />
        <link href="../assets/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <script src="../assets/plugins/jquery-2.0.3.min.js"></script>
     <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src="../assets/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="../assets/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" ></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();
             $('#dataTables-example4').dataTable();
         });
    </script>
  <!--    <script> 
function validateForm()
{
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
     else if(document.frmissueForProduction.txtSrNo1.value=="")
     {
       alert("Serial number should not be blank");
       document.frmissueForProduction.txtSrNo1.focus();
       return false;
     } 
    /*  else if(document.frmanageStock.txtItem1.value=="")
     {
       alert("Product should not be blank");
       document.frmanageStock.txtItem1.focus();
       return false;
     }  */
     else if(document.frmissueForProduction.txtQuant1.value=="")
     {
       alert("Quantity should not be blank");
       document.frmissueForProduction.txtQuant1.focus();
       return false;
     } 
     else if(document.frmissueForProduction.txtDetails.value=="")
     {
       alert("Details should not be blank");
       document.frmissueForProduction.txtDetails.focus();
       return false;
     }
        
    else
      {
    	  alert("Data Inserted Successfully....");
    	}
    
  }
</script>

     <script> 
function validateForm1()
{
    if(document.frmreceiveforSales.txtVNo.value=="")
    {
      alert("Voucher Number should not be blank");
      document.frmreceiveforSales.txtVNo.focus();
      return false;
    }
     else if(document.frmreceiveforSales.date.value=="")
    {
      alert("Date should not be blank");
      document.frmreceiveforSales.date.focus();
      return false;
    } 
     else if(document.frmreceiveforSales.txtSrNo1.value=="")
     {
       alert("Serial number should not be blank");
       document.frmreceiveforSales.txtSrNo1.focus();
       return false;
     } 
    /*  else if(document.frmanageStock.txtItem1.value=="")
     {
       alert("Product should not be blank");
       document.frmanageStock.txtItem1.focus();
       return false;
     }  */
     else if(document.frmreceiveforSales.txtQuant1.value=="")
     {
       alert("Quantity should not be blank");
       document.frmreceiveforSales.txtQuant1.focus();
       return false;
     } 
     else if(document.frmreceiveforSales.txtDetails.value=="")
     {
       alert("Details should not be blank");
       document.frmreceiveforSales.txtDetails.focus();
       return false;
     }
        
    else
      {
    	  alert("Data Inserted Successfully....");
    	}
    
  }
</script>

validation for transferred
<script>
function validateForm2()
{
    if(document.frmrecordTransferred.txtVNo.value=="")
    {
      alert("Voucher Number should not be blank");
      document.frmrecordTransferred.txtVNo.focus();
      return false;
    }
   /*  else if(document.frmRecordTransffered.selectWarehouse.value=="")
    {
      alert("Select Wearhouse");
      document.frmRecordTransffered.selectWarehouse.focus();
      return false;
    }  */
     else if(document.frmrecordTransferred.date.value=="")
    {
      alert("Date should not be blank");
      document.frmrecordTransferred.date.focus();
      return false;
    } 
     else if(document.frmrecordTransferred.txtSrNo1.value=="")
     {
       alert("Serial number should not be blank");
       document.frmrecordTransferred.txtSrNo1.focus();
       return false;
     } 
    else if(document.frmrecordTransferred.txtQuant1.value=="")
     {
       alert("Quantity should not be blank");
       document.frmrecordTransferred.txtQuant1.focus();
       return false;
     } 
     /* else if(document.frmRecordTransffered.txtDWare1.value=="")
     {
       alert("Select Destination Wearhouse");
       document.frmRecordTransffered.txtDWare1.focus();
       return false;
     } */
     else if(document.frmrecordTransferred.txtDetails.value=="")
     {
       alert("Details should not be blank");
       document.frmrecordTransferred.txtDetails.focus();
       return false;
     }
        
    else
      {
    	  alert("Data Inserted Successfully....");
    	}
    
  }
</script>
<script>
function validateForm3()
{
    if(document.frmrecordWastage.txtVNo.value=="")
    {
      alert("Voucher Number should not be blank");
      document.frmrecordWastage.txtVNo.focus();
      return false;
    }
    /* else if(document.frmrecordWastage.selectWarehouse.value=="")
    {
      alert("Select Wearhouse");
      document.frmrecordWastage.selectWarehouse.focus();
      return false;
    }  */
     else if(document.frmrecordWastage.date.value=="")
    {
      alert("Date should not be blank");
      document.frmrecordWastage.date.focus();
      return false;
    } 
     else if(document.frmrecordWastage.txtSrNo1.value=="")
     {
       alert("Serial number should not be blank");
       document.frmrecordWastage.txtSrNo1.focus();
       return false;
     } 
    else if(document.frmrecordWastage.txtQuant1.value=="")
     {
       alert("Quantity should not be blank");
       document.frmrecordWastage.txtQuant1.focus();
       return false;
     } 
     /* else if(document.frmrecordWastage.txtDWare1.value=="")
     {
       alert("Select Destination Wearhouse");
       document.frmrecordWastage.txtDWare1.focus();
       return false;
     } */
     else if(document.frmrecordWastage.txtDetails.value=="")
     {
       alert("Details should not be blank");
       document.frmrecordWastage.txtDetails.focus();
       return false;
     }
        
    else
      {
    	  alert("Data Inserted Successfully....");
    	}
    
  }
</script>
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
  </script> -->
    
</head>	
<body style="overflow-x: hidden;"> 
<div id="wrapper">
<%@include file="../header.jsp" %>
<!-- <div class="container">	 -->						
	
<br>			
	<div class="page-header">
  			<h2><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Manage<small>&nbsp;Stock</small></h2>
		</div>		
<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab"><i class="icon-th-list "></i>Issue For Production</a></li>
                                <li><a href="#tab2" data-toggle="tab"><i class="icon-signout "></i>  Receive for Sales</a></li>
                                <li><a href="#tab3" data-toggle="tab"><i class="icon-truck"></i>  Record Wastage</a></li>
                                  <li><a href="#tab4" data-toggle="tab"><i class="icon-signout"></i> Record Transferred</a></li>
                            </ul>
           <div class="tab-content">
           
             <div class="tab-pane fade in active" id="tab1">
                <div class="col-md-12">
                    <div class="panel panel-default">                       
                        <div class="panel-body">
						<form:form action="updateIssueForProduction.do" method="post" cssClass="form-inline" commandName="editIssueForProduction"  name="frmissueForProduction" onsubmit="return validateForm()" >
													
								<div>
									<label>Voucher No:-</label>
									<input type="text" name="txtVNo" value="${editIssueForProduction.txtVNo }" id="txtVNo" style="width: 100px;" class="form-control"  />
									
									<label>Voucher Date:-</label>
									<input type="date" name="date" value="${editIssueForProduction.date }" class="form-control" style="width:160px;" />
									
								    <label>Warehouse:-</label>
									<select name="selectWarehouse" class="form-control" style="width: 150px;">
									<option>${editIssueForProduction.selectWarehouse }</option>
										<option>----Select----</option>
										<option value="WH001">New</option>	
										<option value="WH002">Pune</option>					
									</select>		
								</div><br><br><br>
								<div class="table-responsive" style="width: 70%;">	
						         				<table id="tableID" class="table table-striped">        					         					
						        					<tr>
											        		<th align="center">Sr No</th>
											        		<th align="center">Product</th>        							        		
											        		<th align="center">Quantity</th><th></th>  					        		
						        					</tr>   
						        					<c:forEach items="${editIssueForProduction.productList}" var="productList"></c:forEach>   					
						         					<tr>
						         						<td>
						         						<input type="text" name="productList[0].txtSrNo1" value="${productList.txtSrNo1}" id="productList[0].txtSrNo1" class="form-control" style="width: 50px;text-align: right;" onkeypress="return isNumberKey(this)"/>
						         						</td>            					
						            					<td>
						            						<select name="productList[0].txtItem1" id="productList[0].txtItem1" onchange="showDesc(this.value,this.id)" class="form-control">
															<option>${productList.txtItem1}</option>
															<option>----Select----</option>
															<option value="ST001">Product1</option>	
															<option value="ST002">Product2</option>
															<option value="ST003">Product3</option>	
															</select>
						            					</td>           				
						            					<td> 
						            						<input type="text" name="productList[0].txtQuant1" value="${productList.txtQuant1}" id="productList[0].txtQuant1"  class="form-control" style="text-align: right;width: 110px;" onkeypress="return isNumberKey(this)"/>
						            					</td>
						            					
						            					<td class="fnt"><input type="button" id="btndel1" name="btndel1" class="btn btn-primary" value="-" onclick="delrow(this);"/></td>       		
						           					 </tr>
						           					 
						         			 </table> 
						         			 <input type="button" name="addRec" class="btn btn-primary" value="Add" onclick="addRow()">
						          </div><br>			
													<div>							
														<label>Details</label>	
													</div>
													<div>
														<textarea name="txtDetails" rows="4" cols="50" class="form-control" style="width: 400px;">${editIssueForProduction.txtDetails }</textarea>	
													</div>
											<br><br>
											
						    		<div>
						  				
						  					<button type="submit" class="btn btn-primary" name="btn" value="Save">SAVE</button>
								            <button type="reset" class="btn btn-primary" name="btn">CLEAR</button>
						  				
						  			</div>
			</form:form>
                        </div>
                    </div>
                </div>
             </div>
	           <div class="tab-pane fade" id="tab2">
	               <div class="col-md-12">
                    <div class="panel panel-default">                       
                        <div class="panel-body">
						<form:form action="receiveforSales.do" method="post" cssClass="form-inline" commandName="receiveforSales"  name="frmreceiveforSales" onsubmit="return validateForm1()" >
						
								<div>
									<label>Voucher No:-</label>
									<input name="txtVNo" id="txtVNo" style="width: 100px;" class="form-control" onkeypress="return isNumberKey(this)"/>
									<label>Voucher Date:-</label>
									<input type="date" name="date" class="form-control" style="width:160px;" />
									<label>Warehouse:-</label>
									<select name="selectWarehouse" class="form-control" style="width: 150px;">
										<option>----Select----</option>
										<option value="WH001">New</option>	
										<option value="WH002">Pune</option>					
									</select>		
								</div><br><br><br>
																
								
							<div class="table-responsive" style="width: 70%;">	
						         				<table id="tableID" class="table table-striped">
						        					<tr>
											        		<th align="center">Sr No</th>
											        		<th align="center">Product</th>        							        		
											        		<th align="center">Quantity</th>	<th></th> 				        		
						        					</tr>						        					
						         					<tr>
						         						<td>
						         						<input name="productList[0].txtSrNo1" id="productList[0].txtSrNo1" class="form-control" style="width: 50px;text-align: right;" onkeypress="return isNumberKey(this)" />
						         						</td>            					
						            					<td>
						            						<select name="productList[0].txtItem1" id="productList[0].txtItem1" onchange="showDesc(this.value,this.id)" class="form-control">
															<option>----Select----</option>
															<option value="ST001">Product1</option>	
															<option value="ST002">Product2</option>
															<option value="ST003">Product3</option>	
															 </select>
						            					</td>           				
						            					<td> 
						            						<input name="productList[0].txtQuant1" id="productList[0].txtQuant1"  class="form-control" style="text-align: right;width: 110px;" onkeypress="return isNumberKey(this)"/>
						            					</td>
						            					
						            					<td class="fnt"><input type="button" id="btndel1" name="btndel1" class="btn btn-primary" value="-" onclick="delrow(this);"></td>
											        		
						           					 </tr>
						           					 
						         			 </table> 
						         			 
						         			 <input type="button" name="addRec" class="btn btn-primary" value="Add" onClick="addRow()">
						          		 </div><br>
													<div>							
														<label>Details</label>	
													</div>
													<div>
														<textarea rows="4" cols="50" path="txtDetails" class="form-control" style="width:400px;"></textarea>	
													</div>
											<br><br>
											
						    		<div>
						  					<input type="submit" value="Save" name="btn" class="btn btn-primary">
						  					<input type="reset" name="btn" value="Cancel" class="btn btn-primary">
						  				
						  				
						  					
							  			</div> 
			
						</form:form>
</div>							
</div>
					
                        </div>
                    </div>
              
	         
             <div class="tab-pane fade" id="tab3">
                 <div class="col-md-12">
                    <div class="panel panel-default">                       
                        <div class="panel-body">
<form:form action="recordWastage.do" method="post" cssClass="form-inline" commandName="recordWastage"  name="frmrecordWastage" onsubmit="return validateForm3()" >
		
		
		
		<div>
			<label>Voucher No:-</label>
			<input name="txtVNo" id="txtVNo" style="width: 100px;" class="form-control" onkeypress="return isNumberKey(this)"/>
			
			<label>Voucher Date:-</label>
			<input type="date" name="date" class="form-control" style="width:160px;" />
			
		    <label>Warehouse:-</label>
			<select name="selectWarehouse" class="form-control" style="width: 150px;">
				<option>----Select----</option>
				<option value="WH001">New</option>	
				<option value="WH002">Pune</option>					
			</select>		
		</div><br><br><br>
										
		
	<div class="table-responsive" style="width: 100%;">	
        		
         				<table id="tableID3" class="table table-striped">        					         					
        					<tr>
					        		<th align="center">Sr No</th>
					        		<th align="center">Product</th> 
					        		 <th align="center">Remark</th>      							        		
					        		<th align="center">Quantity</th><th></th>  					        		
        					</tr>      					
         					<tr>
         						<td>
         						<input name="recordWastageDetailsList[0].txtSrNo1" id="recordWastageDetailsList[0].txtSrNo1" class="form-control" style="width: 50px;text-align: right;" onkeypress="return isNumberKey(this)"/>
         						</td>            					
            					<td>
            						<select name="recordWastageDetailsList[0].txtItem1" id="recordWastageDetailsList[0].txtItem1" onchange="showDesc(this.value,this.id)" class="form-control">
									<option>----Select----</option>
									<option value="ST001">Product1</option>	
									<option value="ST002">Product2</option>
									<option value="ST003">Product3</option>	
									</select>
            					</td>           				
            					
            					<td> 
            						<input name="recordWastageDetailsList[0].remark" id="recordWastageDetailsList[0].remark"  class="form-control" style="text-align: right;width: 110px;"/>
            					</td>
            					<td> 
            						<input name="recordWastageDetailsList[0].txtQuant1" id="recordWastageDetailsList[0].txtQuant1"  class="form-control" style="text-align: right;width: 110px;"/>
            					</td>
            					
            					
            					<td class="fnt"><input type="button" id="btndel1" name="btndel1" class="btn btn-primary" value="-" onclick="delrow(this);"></td>
					        		
           					 </tr>
           					 
         			 </table> 
         			 <input type="button" name="addRec" class="btn btn-primary" value="Add" onclick="addRow()">
          		 </div><br>
							<div>							
								<label>Details</label>
							</div>
							<div>
								<textarea rows="4" cols="50" name="txtDetails" class="form-control" style="width: 400px;"></textarea>	
							</div>
					<br><br>
					
    		<div>
  					<input type="submit" value="Save" name="btn" class="btn btn-primary">
  					
  					<input type="submit" name="btn" value="Cancel" class="btn btn-primary">
  					
  				
  			</div> 
		
</form:form>
                        </div>
                    </div>
                </div>
            </div>
            
            
     <div class="tab-pane fade" id="tab4">
	               <div class="col-md-12">
                    <div class="panel panel-default">                       
                        <div class="panel-body">
						<form:form action="recordTransferred.do" method="post" cssClass="form-inline" commandName="recordTransferred"  name="frmrecordTransferred" onsubmit="return validateForm1()" >
						
								
								<div>
									<label>Voucher No:-</label>
									<input name="txtVNo" id="txtVNo" style="width: 100px;" class="form-control" onkeypress="return isNumberKey(this)"/>
									
									<label>Voucher Date:-</label>
									<input type="date" name="date" class="form-control" style="width:160px;" />
									<label>Warehouse:-</label>
									<select name="selectWarehouse" class="form-control" style="width: 150px;">
										<option>----Select----</option>
										<option value="WH001">New</option>	
										<option value="WH002">Pune</option>					
									</select>		
								</div><br><br><br>
																
								
							<div class="table-responsive" style="width: 70%;">	
						         				<table id="tableID" class="table table-striped">
						        					<tr>
											        		<th align="center">Sr No</th>
											        		<th align="center">Product</th>        							        		
											        		<th align="center">Quantity</th>
											        		<th align="center">Destination Warehouse</th>	<th></th> 				        		
						        					</tr>						        					
						         					<tr>
						         						<td>
						         						<input name="recordTransferredDetailsList[0].txtSrNo1" id="recordTransferredDetailsList[0].txtSrNo1" class="form-control" style="width: 50px;text-align: right;" onkeypress="return isNumberKey(this)" />
						         						</td>            					
						            					<td>
						            						<select name="recordTransferredDetailsList[0].txtItem1" id="recordTransferredDetailsList[0].txtItem1" onchange="showDesc(this.value,this.id)" class="form-control">
															<option>----Select----</option>
															<option value="ST001">Product1</option>	
															<option value="ST002">Product2</option>
															<option value="ST003">Product3</option>	
															</select>
						            					</td>           				
						            					<td> 
						            						<input name="recordTransferredDetailsList[0].txtQuant1" id="recordTransferredDetailsList[0].txtQuant1"  class="form-control" style="text-align: right;width: 110px;" onkeypress="return isNumberKey(this)"/>
						            					</td>
						            					<td>
						            						<select name="recordTransferredDetailsList[0].destWarehouse1" id="recordTransferredDetailsList[0].destWarehouse1" onchange="showDesc(this.value,this.id)" class="form-control">
															<option>----Select----</option>
															<option>Mumbai</option>	
															<option>Pune</option>
															<option>Banglore</option>	
															</select>
						            					</td>  
						            					<td class="fnt"><input type="button" id="btndel1" name="btndel1" class="btn btn-primary" value="-" onclick="delrow(this);"></td>
											        		
						           					 </tr>
						           					 
						         			 </table> 
						         			 
						         			 <input type="button" name="addRec" class="btn btn-primary" value="Add" onClick="addRow()">
						          		 </div><br>
													<div>							
														<label>Details</label>	
													</div>
													<div>
														<textarea rows="4" cols="50" name="txtDetails" class="form-control" style="width:400px;"></textarea>	
													</div>
											<br><br>
											
						    		<div>
						  					<input type="submit" value="UPDATE" name="btn" class="btn btn-primary">
						  					<input type="reset" name="btn" value="Cancel" class="btn btn-primary">
						  				
						  			</div> 
							
<c:if test="${Message==1}">       
<h4 class="msg-succ">
<script>
alert("Record Added");
</script>
</h4> 
</c:if>
<c:if test="${Message==0}">                     
<h4 class="msg-error">
<script>
alert("Record Not Added");
</script>
</h4> 
</c:if>
						</form:form>
</div>							
</div>
					
                        </div>
                    </div>
            
            
            
            
            
			
           </div>
        </div>
     </div>
</div>
</div>
<!-- </div> -->

</body>
</html>