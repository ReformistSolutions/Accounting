<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Production</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/assets/css/jquery-ui.css" />" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/jquery-1.10.2.js" />" ></script>
<script src="<c:url value="/resources/js/bootstrap.js" />" ></script>
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
     <script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>
	<script src="<c:url value="/resources/assets/js/jquery-ui.min.js" />"> </script>		

<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>	
	<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                $('#dp1').datepicker({
                    format: "yyyy/mm/dd"
                });
            });
            $( document ).ready(function() {
          	  $('#dp1').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
          	    $(this).datepicker('hide');
          	});
          	});
          $( document ).ready(function() {
          	  $('#dp2').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
          	    $(this).datepicker('hide');
          	});
          	});
    </script>


<style type="text/css">
.msg-succ{
color:green;
}
.msg-error{
color:red;
}
</style>
<!-- <script>
function validateForm()
{  
	
	var srno = document.getElementById("purchasenquiryDetails[0].srNo").value;
	var itemCode = document.getElementById("itemCode0").value;
	var description = document.getElementById("purchasenquiryDetails[0].des").value;
	var qty = document.getElementById("purchasenquiryDetails[0].quantity").value;
	 if(document.frmPurchaseEnquiry.enqID.value=="")
    {
      alert("Enquiry Number Should not be Empty...");
      document.frmPurchaseEnquiry.enqID.focus();
      return false;
    }
     else if(document.frmPurchaseEnquiry.supplierName.value=="Select")
    {
      alert("Vender Name should not be blank");
      document.frmPurchaseEnquiry.supplierName.focus();
      return false;
    }
     else if(document.frmPurchaseEnquiry.enqDate.value=="")
     {
       alert("date should not be blank");
       document.frmPurchaseEnquiry.enqDate.focus();
       return false;
     }
	 
    else if(srno=="")
    {
      alert("Plz Enter Sr.No ....");
      //srno.focus();
      return false;
    }
    else if(itemCode=="Select")
    {
      alert("Plz select the Item Code ....");
      //itemCode.focus();
      return false;
    }
    else if(description=="")
    {
      alert("Description should not be empty.....");
      //des.focus();
      return false;
    }
    else if(qty=="")
    {
      alert("Plz Select The Quantity.....");
      //qty.focus();
      return false;
    }
    else if(document.getElementById("pubNotes").value=="")
    {
      alert("Public Note field should not be empty.....");
      //document.frmPurchaseEnquiry.pubNotes.focus();
      return false;
    }
    else if(document.getElementById("priNotes").value=="")
    {
      alert("Private Note field should not be empty.....");
      //document.frmPurchaseEnquiry.priNotes.focus();
      return false;
    }
    /* else
    {
  	  alert("Data Inserted Successfully....");
  	} */
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
 
 

 </SCRIPT>  -->
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
<script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script>
</head>
<body style="overflow-x: hidden;">

<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div id="container"> -->
		<%@ include file="innerHeader.jsp" %>
			<br>			
						<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Edit<small>&nbsp;Production&nbsp;Order</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<button name="back" class="btn btn-primary btn-large" onclick="backPage()"><i class="fa fa-reply"></i> Back</button>
			             	</div>
		             	</div>
		             	</div>
		             </div>
							<br> 
							<div class="col-md-12">
							<div class="panel">
						<div class="panel-body">
							<form:form action="updateProduction.do" cssClass="form-inline" name="frmProduction" onsubmit="return validateForm()" modelAttribute="production" >
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
																<c:choose>
																	<c:when test="${production.sorderId ==' '}">																	
																		<option value=" ">---Select---</option>																		
																	</c:when>
																	<c:otherwise>
																		<option value=" ">---Select---</option>	
																		<option value="${production.sorderId}" selected="selected">${production.sorderId}</option>												
																	</c:otherwise>
																</c:choose>
																<c:forEach items="${orderList}" var="orderList">
																<option value="${orderList.txtSOID}">${orderList.txtSOID}</option>
																</c:forEach>
															</select>
														</div>
														</div>
														</div>												
											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-2">
															<label>Date&nbsp;: </label>
														</div>
														<div class="col-md-5">
															<input type="text" name="prodDate" id="dp1" value="${production.prodDate}" class="form-control">
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
													<c:forEach items="${production.productList}" var="productList">
														<tr>
															<td><input name="productList[${productList.srNo-1}].srNo" id="productList[${productList.srNo-1}].srNo" type="text" value="${productList.srNo}" class="form-control" style="width: 50px; text-align: right;"></td>
															<%-- <td><input type="text" value="${productList.productId}" class="form-control"></td> --%>
															 <td>
															 	<select name="productList[${productList.srNo-1}].productId" id="productList[${productList.srNo-1}].productId" onchange="showProductDetailsI(this.value,this.id);" class="form-control">
															 	<option value=" ">----Select----</option> 
															 	<option value="${productList.productId}" selected="selected">${productList.productName}</option>
															 	<c:forEach items="${prodID}" var="prodID">
																	<option value="${prodID.productCode}">${prodID.txtName}</option>
																</c:forEach>
															 	</select>
															 </td> 
															<td><input name="productList[${productList.srNo-1}].desc" id="productList[${productList.srNo-1}].desc" value="${productList.desc}" class="form-control"></td> 
															<td><input name="productList[${productList.srNo-1}].quantity" id="productList[${productList.srNo-1}].quantity" value="${productList.quantity}" type="text" class="form-control" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
															<td><input name="unit${productList.srNo-1}" id="unit${productList.srNo-1}" type="text" class="form-control" value="${productList.unit}" readonly="readonly" style="width: 80px;"></td>
															<td>
																	<input type="button" name="addRec" value="Assign" id="showRaw${productList.srNo-1}" onclick="assignRowMaterial(this.id);" class="btn btn-default btn-xs">
																	<input type="button" name="btnDel${productList.srNo-1}" value="-" id="btnDel${productList.srNo-1}" onclick="deleteProduct(this.id)" class="btn btn-danger btn-xs">													
															</td>															
														</tr>													
														<tr> 
					<td id="assignRaw${productList.srNo-1}" colspan="6">
						<div class="table-responsive">
				<table  id="rawMaterialTable${productList.srNo-1}"  class="table table-striped">
					<thead>
						<tr>
							<th style="text-align: center;">Sr No</th>
							<th style="text-align: center;">Product</th>
							<th style="text-align: center;">Description</th>
							<th style="text-align: center;">Avl. Qty</th>
							<th style="text-align: center;">Rq. Qty Per ${productList.unit}</th>
							<th style="text-align: center;">Quantity</th>
							<th style="text-align: center;">Action</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${production.rawMaterialList}" var="rawMaterialList">	
					<c:choose>
						<c:when test="${productList.productId == rawMaterialList.productId}">									
						<tr>
							<td><input type="text" id="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].srno" name="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].srno" value="${rawMaterialList.srno}" class="form-control" style="width: 50px; text-align: right;"></td>
							<td>
								<select id="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].rawMId" name="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].rawMId" onchange="showRawMDesc(this.value,this.id);" class="form-control">
									<option value=" ">---select---</option>
									<option value="${rawMaterialList.rawMId}" selected="selected">${rawMaterialList.productName}</option>
									<c:forEach items="${rmList}" var="rmList">
										<option value="${rmList.productId}">${rmList.productName}</option>
									</c:forEach>
								</select>
							</td>
							<td><input id="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].desc" name="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].desc" value="${rawMaterialList.desc}" style="width: 120px;" class="form-control"></td>
							<td><input type="text" name="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].avlqty" id="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].avlqty" value="${rawMaterialList.avlqty}" class="form-control" readonly="readonly" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
							<td><input type="text" name="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].reqty" id="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].reqty" value="${rawMaterialList.reqty}" class="form-control" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
							<td><input type="text" name="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].quantity" id="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].quantity" value="${rawMaterialList.quantity}" class="form-control" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
							<td><input type="button" class="btn btn-danger btn-xs" name="btndels${productList.srNo-1}${rawMaterialList.srno-1}" id="btndels${productList.srNo-1}${rawMaterialList.srno-1}" value="-" onclick="delassigedraw(this.id);"></td>
							<td><input type="hidden" name="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].productId" id="rawMaterialList[${productList.srNo-1}${rawMaterialList.srno-1}].productId" value="${rawMaterialList.productId}" class="form-control" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
						</tr>	
						</c:when>
					</c:choose>						
					</c:forEach>
					</tbody>
				</table>	
				<input type="button" name="addRec${productList.srNo-1}" id="addRec${productList.srNo-1}" value="+ Add Raw Material" onClick="assignRaw(this.id);" class="btn btn-default btn-xs">
			</div>
															</td>
														</tr>
														</c:forEach>
													</tbody>
												</table>
												<c:choose>
													<c:when test="${production.sorderId ==' '}">
														<input type="button" name="addRaw" id="addRaw" value="+ Add Product" onClick="addProduct()" class="btn btn-default btn-xs">		
													</c:when>
												</c:choose>	
																																								
											</div>
											</div>
											 </div> 
											<br>
											<div>
												<button type="submit" class="btn btn-primary" name="btn" value="Save">Update</button>
												<button type="button" class="btn btn-primary" name="btn" onclick="backPage()">Cancel</button>
											</div>
											<br>
											</form:form>
											</div>
											</div>
											</div>
	</div>
<!-- 	</div> -->
	
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>