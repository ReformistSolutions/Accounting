
 <%@page language="java" import="java.sql.*"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sales Order</title>
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

<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>
<script type="text/javascript">
    hs.graphicsDir = 'highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>

<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"/>"  rel="stylesheet" type="text/css" />	
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
            	
                $('#date').datepicker({
                    format: "yyyy/mm/dd"
                });

                $('#ddate').datepicker({
                    format: "yyyy/mm/dd"
                });        
                
                $('input[type="checkbox"]').click(function(){
        			
        			if($(this).attr("value")=="applyDis"){        				
        				$("#showDis").toggle(800);
        				$("#showDis1").toggle(800);
        			}
        			if($(this).attr("value")=="tax"){
        				$("#showTax").toggle(800);	
        			}			
        		});
        		$('#addTax').click(function(){
        			$("#showAddTax").toggle(800);
        		});	
                
            });
            $( document ).ready(function() {
            	  $('#date').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
            $( document ).ready(function() {
            	  $('#ddate').datepicker({ format: "yyyy/mm/dd" }).on('changeDate', function(ev){
            	    $(this).datepicker('hide');
            	});
            	});
    </script>
    <script type="text/javascript">
function textAreaAdjust(o) {
    o.style.height = "1px";
    o.style.height = (25+o.scrollHeight)+"px";
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Order</title>
 <script>
function validateForm()
{  
	var srno = document.getElementById("productList[0].srNo").value;
	var itemCode = document.getElementById("itemCode0").value;
	var description = document.getElementById("productList[0].des").value;
	var qty = document.getElementById("productList[0].quantity").value;
	var up = document.getElementById("productList[0].unitPrice").value;
	var dis = document.getElementById("productList[0].discount").value;
	var taxTyp = document.getElementById("productList[0].taxType").value;
	 if(document.frmsalesorder.txtSOID.value=="")
    {
      alert("Sales order number Number Should not be Empty...");
      document.frmsalesorder.txtSOID.focus();
      return false;
    }
     else if(document.frmsalesorder.txtCName.value=="0")
    {
      alert("Customer Name should not be blank");
      document.frmsalesorder.txtCName.focus();
      return false;
    }
     
     else if(document.frmsalesorder.txtDate.value=="")
     {
       alert("Date field should not be blank");
       document.frmsalesorder.txtDate.focus();
       return false;
     }
     else if(document.frmsalesorder.txtDueDate.value=="")
     {
       alert(" Due Date field should not be blank");
       document.frmsalesorder.txtDueDate.focus();
       return false;
     }
     else if(document.frmsalesorder.txtBillAddr.value=="")
     {
       alert("Bill To Address field should not be blank");
       document.frmsalesorder.txtBillAddr.focus();
       return false;
     }
     else if(document.frmsalesorder.txtShipAddr.value=="")
     {
       alert("ship To Address field should not be blank");
       document.frmsalesorder.txtShipAddr.focus();
       return false;
     }
     else if(srno=="")
     {
       alert("Plz Enter Sr.No ....");
       //srno.focus();
       return false;
     }
     else if(itemCode=="0")
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
       alert("Plz Enter The Quantity.....");
       //qty.focus();
       return false;
     }
     else if(up=="")
     {
       alert("Plz Enter Unit Price.....");
       //qty.focus();
       return false;
     }
     
     else if(dis=="")
     {
       alert("Plz Enter Discount.....");
       //qty.focus();
       return false;
     }
     
     else if(taxTyp=="")
     {
       alert("Plz Select The Tax Type.....");
       //qty.focus();
       return false;
     }
     
     else if(document.frmsalesorder.txtCPONo.value=="")
     {
       alert("Customer Po No should not be blank");
       document.frmsalesorder.txtCPONo.focus();
       return false;
     }
     else if(document.frmsalesorder.txtTransCost.value=="")
     {
       alert("Charges field should not be blank");
       document.frmsalesorder.txtTransCost.focus();
       return false;
     }
     else if(document.frmsalesorder.txtpubNotes.value=="")
     {
       alert("Public notes should not be blank");
       document.frmsalesorder.txtpubNotes.focus();
       return false;
     }
     else if(document.frmsalesorder.txtpvtNotes.value=="")
     {
       alert("Private notes should not be blank");
       document.frmsalesorder.txtpvtNotes.focus();
       return false;
     }
     else if(document.frmsalesorder.txtsubtotal.value=="")
     {
       alert("Sub Total field should not be blank");
       document.frmsalesorder.txtsubtotal.focus();
       return false;
     }
     else if(document.frmsalesorder.txtVat.value=="")
     {
       alert("Vat field should not be blank");
       document.frmsalesorder.txtVat.focus();
       return false;
     }
     else if(document.frmsalesorder.txtSerTax.value=="")
     {
       alert("Service tax field should not be blank");
       document.frmsalesorder.txtSerTax.focus();
       return false;
     }
    
     else if(document.frmsalesorder.txtdiscount.value=="")
     {
       alert("Discount field should not be blank");
       document.frmsalesorder.txtdiscount.focus();
       return false;
     }
     
 }
</script>
<SCRIPT type="text/javascript">
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
 </SCRIPT>
<script type="text/javascript">
var i =1 ;
var j=1;

function addRow() {
	var tbl = document.getElementById('tableID');
	var lastRow = tbl.rows.length; 
	var row = tbl.insertRow(lastRow);
	var length=(tbl.rows.length)-2;
	var j=length;
	j++;

	 var firstCell = row.insertCell(0);
     var inputSrNo = document.createElement("input");
     inputSrNo.type = "text";       
     inputSrNo.name = "productList["+length+"].srNo";
     inputSrNo.id = "productList["+length+"].srNo";
     inputSrNo.value=j;
     inputSrNo.style.width='50px';
     inputSrNo.className = "form-control";
     inputSrNo.style.textAlign="right";
     firstCell.appendChild(inputSrNo);
	
     
     var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id = "itemCode"+length;
		inputItem.name = "productList["+length+"].itemCode";
		inputItem.className="form-control";
		inputItem.onchange=function(){showDesc(this.value,this.id);disQuantity(this.id);};
		
		var newLength=length-1;
		
		var ln = document.getElementById("itemCode"+newLength).length;
		var xVal=0;
		for ( var k = 0; k < ln; k++) 
		{
			xVal = document.getElementById("itemCode"+newLength).options[k].value;
			var xText = document.getElementById("itemCode"+newLength).options[k].text;
			desc = document.getElementById("itemCode"+newLength).options[k].label;
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
			
		}  		
		inputItem.style.width="120px";
		secondCell.appendChild(inputItem);
		
		
		var thirdCell=row.insertCell(2);
		var inputDes=document.createElement("input");
		inputDes.id="productList["+length+"].des" ;
		inputDes.type="text";
		inputDes.name="productList["+length+"].des" ;			
		inputDes.className="form-control";	
		inputDes.style.width="120px";
		thirdCell.appendChild(inputDes);
		
		
		var fourthCell=row.insertCell(3);
		var inputUnit=document.createElement("input");
		inputUnit.id="unit"+length;
		inputUnit.readOnly=true;
		inputUnit.className="form-control";	
		inputUnit.type="text";
		inputUnit.style.width="80px";
		fourthCell.appendChild(inputUnit);
		
		var fifthCell=row.insertCell(4);
		var lblQty=document.createElement("label");
		lblQty.id="showLable"+length;
		lblQty.type="label";			
		lblQty.style.color="red";
		fifthCell.appendChild(lblQty);
		
		var sixCell=row.insertCell(5);
		var inputQty=document.createElement("input");
		inputQty.id="productList["+length+"].quantity";
		inputQty.type="text";
		inputQty.name="productList["+length+"].quantity";		
		inputQty.className="form-control";
		inputQty.onblur=function(){calSubTotal(this.id);};
		inputQty.onkeypress=function(){return isNumberKey(this);};
		inputQty.style.width="80px";
		inputQty.style.textAlign="right";
		sixCell.appendChild(inputQty);
		
		var seventhCell=row.insertCell(6);
		var inputUnitPrice=document.createElement("input");
		inputUnitPrice.id="productList["+length+"].unitPrice";
		inputUnitPrice.type="text";
		inputUnitPrice.name="productList["+length+"].unitPrice";			
		inputUnitPrice.className="form-control";	
		inputUnitPrice.onblur=function(){calSubTotal(this.id);};
		inputUnitPrice.onkeypress=function(){return isNumberKey(this);};
		inputUnitPrice.style.width="80px";
		inputUnitPrice.style.textAlign="right";
		seventhCell.appendChild(inputUnitPrice);
		
		
		var eigthCell=row.insertCell(7);
		var inputTotal=document.createElement("input");
		inputTotal.id="productList["+length+"].itemTotal";
		inputTotal.type="text";
		inputTotal.name="productList["+length+"].itemTotal";			
		inputTotal.className="form-control";
		inputTotal.style.width="80px";
		inputTotal.style.textAlign="right";
		eigthCell.appendChild(inputTotal);
		
		var ningthCell=row.insertCell(8);
		var inputSubTotal=document.createElement("input");			
		inputSubTotal.type="hidden";
		inputSubTotal.id="productList["+length+"].exSubTotal";
		inputSubTotal.name="productList["+length+"].exSubTotal";	
		inputSubTotal.value="0.0";
		inputSubTotal.className="form-control";
		inputSubTotal.style.width="80px";			
		ningthCell.appendChild(inputSubTotal);
		
          var tengthCell = row.insertCell(9);
       	  var inputbutton1 = document.createElement("input");
	      inputbutton1.type = "button";
	      inputbutton1.name = "productList["+length+"].btndel";
	      inputbutton1.id = "productList["+length+"].btndel";       	
	      inputbutton1.value="-"; 		
	      inputbutton1.className="btn btn-danger";
	      inputbutton1.onclick=function(){delrow(this.id);};
	      tengthCell.appendChild(inputbutton1);
		
		
      } 
	   function delrow(obj)
		 {
		   var id = document.getElementById(obj).id;			
			var index1 = id.indexOf("[") + 1;			
			var index2 = id.indexOf("]");			
			var sr = id.slice(index1,index2);			
		   
		   		var tbl = document.getElementById('tableID');
	 		    var last = tbl.rows.length-1;	
	 		  
	 		   if(last == 1)
				 {
					document.getElementById("itemCode"+length).options[0].selected = true;
				 	document.getElementById("productList["+length+"].des").value = "";
				 	document.getElementById("unit"+length).value="";
					document.getElementById("showLable"+length).innerHTML="";
				 	document.getElementById("productList["+length+"].quantity").value = "";
				 	document.getElementById("productList["+length+"].unitPrice").value = "";
				 	document.getElementById("productList["+length+"].itemTotal").value = "";
				 	document.getElementById("productList["+length+"].exSubTotal").value = "0.0";
				 	document.getElementById("txtSubTotal").value = "0.0";
					document.getElementById("txtDisTotal").value = "0.0";
					document.getElementById("txtDiscount").value = "0.0";
					document.getElementById("txtTaxTotal").value = "0.0";
					document.getElementById("txtRoundOff").value = "0.0";
					document.getElementById("txtAmtPayble").value = "0.0";
				 }
			   else
			     {			
				   var current = window.event.srcElement;							 
				   while ( (current = current.parentElement)  && current.tagName !="TR");
		           current.parentElement.removeChild(current);	
	
	         	   j--;
	        
	               var counter = sr;
			    while(counter<last)
				 {
				next = counter;
			 	next++;
			 	var inputSrNo = document.getElementById("productList["+next+"].srNo");
			 	inputSrNo.id = "productList["+counter+"].srNo";
			 	inputSrNo.name =  "productList["+counter+"].srNo";
			 	inputSrNo.value =inputSrNo.value-1;
			 	
			 	var inputItem = document.getElementById("itemCode"+next);
			 	inputItem.id = "itemCode"+counter;
			 	inputItem.name = "productList["+counter+"].itemCode";
			 	
			    var inputDes = document.getElementById("productList["+next+"].des");
			    inputDes.id = "productList["+counter+"].des";
			    inputDes.name ="productList["+counter+"].des";
			    
			    var unit=document.getElementById("unit"+next);
				unit.id="unit"+counter;
			    
			   	var lblQty=document.getElementById("showLable"+next);
				lblQty.id="showLable"+counter;
				
			    var inputQuantity = document.getElementById("productList["+next+"].quantity");
			 	inputQuantity.id = "productList["+counter+"].quantity";
			 	inputQuantity.name ="productList["+counter+"].quantity";			 	
			
			 	
			 	var inputUnit = document.getElementById("productList["+next+"].unitPrice");
			 	inputUnit.id = "productList["+counter+"].unitPrice";
			 	inputUnit.name ="productList["+counter+"].unitPrice";
			 	
		
			 	var inputTotal = document.getElementById("productList["+next+"].itemTotal");
			 	inputTotal.id = "productList["+counter+"].itemTotal";
			 	inputTotal.name = "productList["+counter+"].itemTotal";	 		 	
			 
			 	
			 	var inputSubTotal = document.getElementById("productList["+next+"].exSubTotal");
			 	inputSubTotal.id = "productList["+counter+"].exSubTotal";
			 	inputSubTotal.name = "productList["+counter+"].exSubTotal";
			 	
			 	
			 	btndel = document.getElementById("productList["+next+"].btndel");
			 	btndel.id = "productList["+counter+"].btndel";
			 	btndel.name = "productList["+counter+"].btndel";
			 	
			 	counter++;
 			 }
		 }
	 }
	   function getId(gId)
	   {
	   	alert(gId);		
	   }
function calculateCharges()
{	
	
	var trans=document.getElementById("txtTransCost").value;	
	var exGTotal=document.getElementById("txtAmtPayble").value;
	var exTC=document.getElementById("hideTransCost").value;
	var dtot=(parseFloat(exGTotal)-parseFloat(exTC));
	var total=(parseFloat(dtot)+parseFloat(trans));
	document.getElementById("txtAmtPayble").value=total;
	document.getElementById("hideTransCost").value=document.getElementById("txtTransCost").value;

}
function checkTaxes()
{
	if(document.getElementById("applyTax").checked !=true)
	{
		document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value);
		 var tbl = document.getElementById("tableTax");	 
		 var length= ((tbl.rows.length)/2); 	
		 for(var i=1;i<=length;i++)
			 {
				 document.getElementById("taxList["+i+"].taxType").options[0].selected=true;
		    	 document.getElementById("taxList["+i+"].txtTaxValue").value="0.0";   
		    	 document.getElementById("taxList["+i+"].txtPrevTax").value="0.0";
		    	 document.getElementById("txtTaxTotal").value="0.0";
		    	 document.getElementById("taxList["+i+"].txtprevLinkTax").value="0.0";
		    	 document.getElementById("getTax"+i).innerHTML="";
		    	 document.getElementById("txtRoundOff").value="0.0";
			 }
		
	}
}
</script>
<script type="text/javascript">
    hs.graphicsDir = 'highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>
<script>
function checkProducts(id)
{
	
	var tbl = document.getElementById('tableID');
	var length = tbl.rows.length-1;
	var k=id.slice(8);
	var cuProduct=document.getElementById("itemCode"+k).value;
	for(var i=0;i<length;i++)
		{
		if(i!=k)
			{
			var exProduct=document.getElementById("itemCode"+i).value;
			if(cuProduct == exProduct)
				{
					alert("Please Select Different Product");
					document.getElementById("itemCode"+k).options[0].selected=true;					 
					var item=document.getElementById("itemCode"+k).value;					
					if(item == '')
						{
							document.getElementById("productList["+k+"].des").value = "";
							document.getElementById("unit"+k).value="";	
							document.getElementById("productList["+k+"].unitPrice").value = "";
							document.getElementById("showLable"+k).innerHTML = "";
						} 		 								
				}
			}		
		}
	}
</script>
<script>
function showDesc(str,id)
{
showUnitPrice(str,id);
showQuantity(str,id);
showMUnit(str,id);
var i=id.slice(8);
var xmlhttp;   
if (str=="")
  {
  	document.getElementById("productList["+i+"].des").value="";
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
    	document.getElementById("productList["+i+"].des").value=xmlhttp.responseText;
    	checkProducts(id);
    }
  }
xmlhttp.open("GET","retrieveDesc.do?productId="+str,true);
xmlhttp.send();
}
</script>
<script>
function showMUnit(str,id)
{

var i=id.slice(8);
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
    }
  }
xmlhttp.open("GET","retrieveMUnit.do?productId="+str,true);
xmlhttp.send();
}
</script>
<script>
function showQuantity(str,id)
{
var i=id.slice(8);
var xmlhttp;   
if (str=="")
  {
  	document.getElementById("showLable"+i).innerHTML="";
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
    document.getElementById("showLable"+i).innerHTML=xmlhttp.responseText;
    //alert("ID="+id);
    
    }
  }
xmlhttp.open("GET","retriveQuantity.do?productId="+str,true);
xmlhttp.send();
}
</script>
<script>
function showUnitPrice(str,id)
{
var i=id.slice(8);
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("productList["+i+"].unitPrice").value="";
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
	  document.getElementById("productList["+i+"].unitPrice").value=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","retrieveUnitPrice.do?productId="+str,true);
xmlhttp.send();
}
</script>
<script type="text/javascript">
function disQuantity(id)
{
	var i=id.slice(8);
	$(document).ready(function(){		
		if($(id).val()!='')
		{
			$('#showth').show(900);
			$("#showLable"+i).show(1000);
		}
	});
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
	document.getElementById("txtBillAddr").value=address.substring(0,index);    	
	document.getElementById("txtShipAddr").value=address.substring(index+1,address.length);  	
    } 
  }
xmlhttp.open("GET","retriveAddress.do?customerId="+str,true);
xmlhttp.send();
}
</script>

<script>
function goBack() {	
    window.history.back();
}
</script>
<script type="text/javascript">
var sAdd="";
function same(s)
{
	
	var add=document.frmsalesorder.txtBillAddr.value;		 
	if(s.checked)
		{		
		  sAdd=document.frmsalesorder.txtShipAddr.value;
		  document.frmsalesorder.txtShipAddr.value=add;		 
		}
	else
	{		
	  document.frmsalesorder.txtShipAddr.value= sAdd;	  
	}
	
}
</script>
<script type="text/javascript">
function calSubTotal(obj)
{	
	var id = document.getElementById(obj).id;	
	var index1 = id.indexOf("[") + 1;	
	var index2 = id.indexOf("]");	
	var sr = id.slice(index1,index2);	
	
	var qty = document.getElementById("productList["+sr+"].quantity").value;	
	var up = document.getElementById("productList["+sr+"].unitPrice").value;
	var exSubTotal=document.getElementById("productList["+sr+"].exSubTotal").value;
	
	var subTotal=qty*up;
	document.getElementById("productList["+sr+"].itemTotal").value = subTotal.toFixed(2);	
	document.getElementById("productList["+sr+"].exSubTotal").value = subTotal.toFixed(2);
	
	var prevTot=document.getElementById("txtSubTotal").value;	
	
	var fTot=(parseFloat(prevTot)-parseFloat(exSubTotal));	
	var finalTotal=(parseFloat(fTot)+parseFloat(subTotal));	
	
	document.getElementById("txtSubTotal").value=finalTotal.toFixed(2);
	document.getElementById("txtDisTotal").value=finalTotal.toFixed(2);
}
</script>
<script type="text/javascript">
function checkDis()
{	
	if(document.getElementById("applyDis").checked !=true)
		{
			 document.getElementById("txtDisTotal").value=document.getElementById("txtSubTotal").value;
			 document.getElementById('radio1').checked = false;
			 document.getElementById('radio2').checked = false;
			 document.getElementById("txtDiscount").value="0.0";
			 document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value);
		}

			
}
</script>
<script type="text/javascript">
function cal(obj)
{			
	var id = document.getElementById(obj).id;	
	var index1 = id.indexOf("[") + 1;	
	var index2 = id.indexOf("]");
	var sr = id.slice(index1,index2);
	
	var taxType = document.getElementById("taxList["+sr+"].taxType");
	var selvalue = taxType.options[taxType.selectedIndex].value;
	var index=0;	
	for(var i=0;i<=selvalue.length;i++)
		{
		  index=selvalue.indexOf("^");		
		}	
	var taxRate=selvalue.substring(0,index); 
	
	var discountedTotal = document.getElementById("txtDisTotal").value;	
	var taxAmt = (discountedTotal * taxRate) / 100;
	document.getElementById("taxList["+sr+"].txtTaxValue").value = taxAmt.toFixed(2);	
		
	var prevTaxAmt=document.getElementById("taxList["+sr+"].txtPrevTax").value;
	document.getElementById("txtTaxTotal").value=((parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(prevTaxAmt))+parseFloat(taxAmt));
	document.getElementById("taxList["+sr+"].txtPrevTax").value = taxAmt.toFixed(2);
	
	var preLTax=document.getElementById("taxList["+sr+"].txtprevLinkTax").value;
	document.getElementById("taxList["+sr+"].txtprevLinkTax").value="0.0";
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(preLTax)).toFixed(2);

	 	var taxRateCnt = document.getElementById("linkTCnt"+sr).value;
	if(taxRateCnt==0)
		{		
		   document.getElementById("getTax"+sr).innerHTML="";		 	
		}
	
	else
		{	
		for(var i=1;i<=taxRateCnt;i++)
			{ 	
				var linkedTaxRate = document.getElementById("serLTax"+i).value;
				var calSerTax=document.getElementById("taxList["+sr+"].txtTaxValue").value;
				var lTax=(calSerTax * linkedTaxRate) /100;				
				var serLinkedTax=document.getElementById("linkedTaxList["+i+"].serLinkedTax");
				serLinkedTax.value=lTax.toFixed(2);					
				serLinkedTax.id="linkedTax"+sr+""+i;	
				document.getElementById("taxList["+sr+"].txtprevLinkTax").value=(parseFloat(document.getElementById("taxList["+sr+"].txtprevLinkTax").value)+parseFloat(lTax)).toFixed(2);
				document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(lTax)).toFixed(2);
			
			}
		}
	
	var taxTotal=document.getElementById("txtTaxTotal").value;
	var index=taxTotal.indexOf(".");	
	var froundOfAmt=taxTotal.substring(index+1,taxTotal.length); 
	var taxTotalRound=taxTotal.substring(0,index); 
	var finalroundOfAmt=(froundOfAmt/100).toFixed(2);
	var finalRound=1-finalroundOfAmt;
	 if(froundOfAmt>50)
		{
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound)+1;
			document.getElementById("txtRoundOff").value="+ "+parseFloat(finalRound).toFixed(2);
		}
	else
		{
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound);
			document.getElementById("txtRoundOff").value="- "+parseFloat(finalroundOfAmt).toFixed(2);
		} 
}
</script>
<script type="text/javascript">
function calDis()
{	
		if(document.getElementById("radio1").checked == true)
		{			
			var discount = document.getElementById("txtDiscount").value;		
			var subTotal = document.getElementById("txtSubTotal").value;			
			var disAmt = (subTotal * discount) / 100;			
			var total = parseFloat(subTotal) - parseFloat(disAmt);			
			document.getElementById("txtDisTotal").value = total.toFixed(2);
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value);
		}
		else if(document.getElementById("radio2").checked == true)
		{			
			var discount = document.getElementById("txtDiscount").value;					
			var subTotal = document.getElementById("txtSubTotal").value;			
			var disAmt = parseFloat(subTotal) - parseFloat(discount);			
			document.getElementById("txtDisTotal").value= disAmt.toFixed(2);
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value);
		}
		 var tbl = document.getElementById("tableTax");	    
		 var length= ((tbl.rows.length)/2); 
		
		 for(var k=1;k<=length;k++)
			 {
			 var taxType = document.getElementById("taxList["+k+"].taxType");
				var selvalue = taxType.options[taxType.selectedIndex].value;
				var index=0;	
				for(var i=0;i<=selvalue.length;i++)
					{
					  index=selvalue.indexOf("^");		
					}	
				var taxRate=selvalue.substring(0,index); 
				
				var discountedTotal = document.getElementById("txtDisTotal").value;	
				var taxAmt = (discountedTotal * taxRate) / 100;
				document.getElementById("taxList["+k+"].txtTaxValue").value = taxAmt.toFixed(2);	
					
				var prevTaxAmt=document.getElementById("taxList["+k+"].txtPrevTax").value;
				document.getElementById("txtTaxTotal").value=((parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(prevTaxAmt))+parseFloat(taxAmt));
				document.getElementById("taxList["+k+"].txtPrevTax").value = taxAmt.toFixed(2);
				
				var preLTax=document.getElementById("taxList["+k+"].txtprevLinkTax").value;
				document.getElementById("taxList["+k+"].txtprevLinkTax").value="0.0";
				document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(preLTax)).toFixed(2);

				var taxRateCnt = document.getElementById("linkTCnt"+k).value;
				if(taxRateCnt==0)
					{		
					   document.getElementById("getTax"+k).innerHTML="";		 	
					}				
				else
					{	
					for(var i=1;i<=taxRateCnt;i++)
						{ 
						var linkedTaxRate = document.getElementById("serLTax"+i).value;						
						var calSerTax=document.getElementById("taxList["+k+"].txtTaxValue").value;							
						var lTax=(calSerTax * linkedTaxRate) /100;					
						var serLinkedTax=document.getElementById("linkedTaxList["+i+"].serLinkedTax");
						if(serLinkedTax != null)
							{
							serLinkedTax.value=lTax.toFixed(2);								
							serLinkedTax.id="linkedTax"+k+""+i;	
							document.getElementById("taxList["+k+"].txtprevLinkTax").value=(parseFloat(document.getElementById("taxList["+k+"].txtprevLinkTax").value)+parseFloat(lTax)).toFixed(2);
							document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(lTax)).toFixed(2);
						
							}
						else
							{
							document.getElementById("linkedTax"+k+""+i).value=lTax.toFixed(2);															
							document.getElementById("taxList["+k+"].txtprevLinkTax").value=(parseFloat(document.getElementById("taxList["+k+"].txtprevLinkTax").value)+parseFloat(lTax)).toFixed(2);
							document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(lTax)).toFixed(2);
							
							}
						}
					}
				
				var taxTotal=document.getElementById("txtTaxTotal").value;
				var index=taxTotal.indexOf(".");	
				var froundOfAmt=taxTotal.substring(index+1,taxTotal.length); 
				var taxTotalRound=taxTotal.substring(0,index); 
				var finalroundOfAmt=(froundOfAmt/100).toFixed(2);
				var finalRound=1-finalroundOfAmt;
				 if(froundOfAmt>50)
					{
						document.getElementById("txtAmtPayble").value= parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound)+1;
						document.getElementById("txtRoundOff").value="+ "+parseFloat(finalRound).toFixed(2);
					}
				else
					{
						document.getElementById("txtAmtPayble").value= parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound);
						document.getElementById("txtRoundOff").value="- "+parseFloat(finalroundOfAmt).toFixed(2);
					} 
				
			 }
		
		
}	
function calDis1()
{	
		if(document.getElementById("radio1").checked == true)
		{			
			var discount = document.getElementById("txtDiscount").value;		
			var subTotal = document.getElementById("txtSubTotal").value;			
			var disAmt = (subTotal * discount) / 100;			
			var total = parseFloat(subTotal) - parseFloat(disAmt);			
			document.getElementById("txtDisTotal").value = total.toFixed(2);
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value);
		}
		else if(document.getElementById("radio2").checked == true)
		{			
			var discount = document.getElementById("txtDiscount").value;					
			var subTotal = document.getElementById("txtSubTotal").value;			
			var disAmt = parseFloat(subTotal) - parseFloat(discount);			
			document.getElementById("txtDisTotal").value= disAmt.toFixed(2);
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value);
		}
		 var tbl = document.getElementById("tableTax");	    
		 var length= ((tbl.rows.length)/2); 		
		 for(var k=1;k<=length;k++)
			 {
			 var taxType = document.getElementById("taxList["+k+"].taxType");
				var selvalue = taxType.options[taxType.selectedIndex].value;
				var index=0;	
				for(var i=0;i<=selvalue.length;i++)
					{
					  index=selvalue.indexOf("^");		
					}	
				var taxRate=selvalue.substring(0,index); 
				
				var discountedTotal = document.getElementById("txtDisTotal").value;	
				var taxAmt = (discountedTotal * taxRate) / 100;
				document.getElementById("taxList["+k+"].txtTaxValue").value = taxAmt.toFixed(2);	
					
				var prevTaxAmt=document.getElementById("taxList["+k+"].txtPrevTax").value;
				document.getElementById("txtTaxTotal").value=((parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(prevTaxAmt))+parseFloat(taxAmt));
				document.getElementById("taxList["+k+"].txtPrevTax").value = taxAmt.toFixed(2);
				
				var preLTax=document.getElementById("taxList["+k+"].txtprevLinkTax").value;
				document.getElementById("taxList["+k+"].txtprevLinkTax").value="0.0";
				document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(preLTax)).toFixed(2);

				var taxRateCnt = document.getElementById("linkTCnt"+k).value;
				if(taxRateCnt==0)
					{		
					   document.getElementById("getTax"+k).innerHTML="";		 	
					}				
				else
					{	
					for(var i=1;i<=taxRateCnt;i++)
						{ 					
							var linkedTaxRate = document.getElementById("serLTax"+i).value;						
							var calSerTax=document.getElementById("taxList["+k+"].txtTaxValue").value;							
							var lTax=(calSerTax * linkedTaxRate) /100;					
							var serLinkedTax=document.getElementById("linkedTaxList["+i+"].serLinkedTax");
							if(serLinkedTax != null)
								{
								serLinkedTax.value=lTax.toFixed(2);								
								serLinkedTax.id="linkedTax"+k+""+i;	
								document.getElementById("taxList["+k+"].txtprevLinkTax").value=(parseFloat(document.getElementById("taxList["+k+"].txtprevLinkTax").value)+parseFloat(lTax)).toFixed(2);
								document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(lTax)).toFixed(2);
							
								}
							else
								{
								document.getElementById("linkedTax"+k+""+i).value=lTax.toFixed(2);															
								document.getElementById("taxList["+k+"].txtprevLinkTax").value=(parseFloat(document.getElementById("taxList["+k+"].txtprevLinkTax").value)+parseFloat(lTax)).toFixed(2);
								document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(lTax)).toFixed(2);
								
								}
						}
					}
				
				var taxTotal=document.getElementById("txtTaxTotal").value;
				var index=taxTotal.indexOf(".");	
				var froundOfAmt=taxTotal.substring(index+1,taxTotal.length); 
				var taxTotalRound=taxTotal.substring(0,index); 
				var finalroundOfAmt=(froundOfAmt/100).toFixed(2);
				var finalRound=1-finalroundOfAmt;
				 if(froundOfAmt>50)
					{
						document.getElementById("txtAmtPayble").value= parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound)+1;
						document.getElementById("txtRoundOff").value="+ "+parseFloat(finalRound).toFixed(2);
					}
				else
					{
						document.getElementById("txtAmtPayble").value= parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound);
						document.getElementById("txtRoundOff").value="- "+parseFloat(finalroundOfAmt).toFixed(2);
					} 
				
			 }
}	
</script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#radio1').click(function(){
			if($('#txtDiscout').val()=='')
				{					
					$('#txtDiscout').css('border','1px solid red');
					$("#txtDiscout").attr("placeholder", "Please Enter Discount");
				}
		});
		$('#txtDiscout').change(function(){
			$('#txtDiscout').css('border','');
		});
		$('#radio2').click(function(){
			if($('#txtDiscout').val()=='')
				{					
					$('#txtDiscout').css('border','1px solid red');
					$("#txtDiscout").attr("placeholder", "Please Enter Discount");
				}
		});
		$('#txtDiscout').change(function(){
			$('#txtDiscout').css('border','');
		});	
	});		
</script>
<script type="text/javascript">
function showalert()
{
	$(document).ready(function(){		
		
		if($('#txtDiscout').val()!='')
		{
			$('#showLable').toggle(1000);
		}
		$('#radio1').click(function(){
			$('#showLable').hide(1000);
		});
		$('#radio2').click(function(){
			$('#showLable').hide(1000);
		});
		
	});
}
</script>
<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>
<script>
function showLinkedTax(str,obj)
{
	if(!(checkTax(obj)))
	{
	var index=0;
	var taxValue=str; 	
	
	for(var i=0;i<=taxValue.length;i++)
	  {
	  	index=taxValue.indexOf("^");		
	  }	
	var taxId=taxValue.substring(index+1,taxValue.length);  
	
	var id = document.getElementById(obj).id;	
	var index1 = id.indexOf("[") + 1;	
	var index2 = id.indexOf("]");	
	var sr = id.slice(index1,index2);
	
	var xmlhttp;
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
		 			 document.getElementById("getTax"+sr).innerHTML="";
					 var abc =  xmlhttp.responseText ;
					 var innerDiv = document.createElement("div");	
					 innerDiv.innerHTML = abc;			
					 document.getElementById("getTax"+sr).appendChild(innerDiv);		
					// alert("Before Cal :");
					 cal(obj);
				}
 		} 
	xmlhttp.open("GET","retriveSLinkedTax.do?taxId="+taxId+"&cnt="+sr+"",true);
	xmlhttp.send();
}
}
</script>

<script type="text/javascript">
var i =1 ;
var j=1;
function addTax()
{
	 var tbl = document.getElementById("tableTax");
     var lastRow = tbl.rows.length;
	 var row = tbl.insertRow(lastRow);
	 var length= ((tbl.rows.length+1)/2);
	 
 	var firstCell=row.insertCell(0);
	var inputTax = document.createElement("select");
	inputTax.type = "select";
	inputTax.id="taxList["+length+"].taxType";
	inputTax.name="taxList["+length+"].taxType";
	inputTax.className="form-control";
	inputTax.style.width='150px'; 
		var ln = document.getElementById("taxList[1].taxType").length;
		var xVal=0;
		for ( var k = 0; k < ln; k++)
		{
			 xVal = document.getElementById("taxList[1].taxType").options[k].value;
			var xText = document.getElementById("taxList[1].taxType").options[k].text;
			desc = document.getElementById("taxList[1].taxType").options[k].label;		  			
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputTax.add(opt, null);
		}
		inputTax.onchange=function(){showLinkedTax(this.value,this.id);};
		firstCell.appendChild(inputTax);
		
		var secondCell = row.insertCell(1);
        var inputTaxValue = document.createElement("input");
        inputTaxValue.type = "text";
        inputTaxValue.name = "taxList["+length+"].txtTaxValue";
        inputTaxValue.id ="taxList["+length+"].txtTaxValue";       
        inputTaxValue.className="form-control";
        inputTaxValue.style.width='130px';
        inputTaxValue.style.textAlign="right";
        inputTaxValue.value="0.0";
        secondCell.appendChild(inputTaxValue);
        
        var thrnCell = row.insertCell(2);
		var inputbutton1 = document.createElement("input");
	      inputbutton1.type = "button";
	      inputbutton1.name = "taxList["+length+"].btndel";
	      inputbutton1.id = "taxList["+length+"].btndel"; 	
	      inputbutton1.value="-"; 		
	      inputbutton1.className="btn btn-danger btn-xs";
	      inputbutton1.onclick=function(){delTax(this.id);};
	      thrnCell.appendChild(inputbutton1);
	      
	      var fourthCell = row.insertCell(3);
		  var inputPrevTax = document.createElement("input");
		  inputPrevTax.type = "hidden";
		  inputPrevTax.name = "taxList["+length+"].txtPrevTax";
		  inputPrevTax.id = "taxList["+length+"].txtPrevTax"; 	
		  inputPrevTax.value="0.0"; 		
		  inputPrevTax.className="form-control";
		  fourthCell.appendChild(inputPrevTax);
		  fourthCell.style.display = "none";
		  
		  
		  var fithCell = row.insertCell(4);
		  var inputPrevLinkTax = document.createElement("input");
		  inputPrevLinkTax.type = "hidden";
		  inputPrevLinkTax.name = "taxList["+length+"].txtprevLinkTax";
		  inputPrevLinkTax.id = "taxList["+length+"].txtprevLinkTax"; 	
		  inputPrevLinkTax.value="0.0"; 		
		  inputPrevLinkTax.className="form-control";
		  fithCell.appendChild(inputPrevLinkTax);
		  fithCell.style.display = "none";
	      
	      var tbln = document.getElementById("tableTax");
	      var lastRow = tbl.rows.length;	      
	      var row1 = tbln.insertRow(lastRow);	     
	      var linkedTD = row1.insertCell(0);
	      var linkedTax = document.createElement("id");
	      linkedTax.id = "getTax"+length;
	      linkedTD.colSpan = 5;
	 	  linkedTD.appendChild(linkedTax);
	     
	      
}
function getvalue(value)
{
	alert("value :"+value);
	}
function delTax(obj)
{
	var id = document.getElementById(obj).id;
	var index1 = id.indexOf("[") + 1;
	var index2 = id.indexOf("]");
	var sr = id.slice(index1,index2);
	
	var prevTaxAmt=document.getElementById("taxList["+sr+"].txtPrevTax").value;
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(prevTaxAmt)).toFixed(2);
	
	
	var preLTax=document.getElementById("taxList["+sr+"].txtprevLinkTax").value;
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(preLTax)).toFixed(2);
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(preLTax)).toFixed(2);
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(preLTax)).toFixed(2);
	
	var taxTotal=document.getElementById("txtTaxTotal").value;
	var index=taxTotal.indexOf(".");	
	var froundOfAmt=taxTotal.substring(index+1,taxTotal.length); 
	var taxTotalRound=taxTotal.substring(0,index); 
	var finalroundOfAmt=(froundOfAmt/100).toFixed(2);
	var finalRound=1-finalroundOfAmt;
	 if(froundOfAmt>50)
		{
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound)+1;
			document.getElementById("txtRoundOff").value="+ "+parseFloat(finalRound).toFixed(2);
		}
	else
		{
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtTransCost").value)+parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound);
			document.getElementById("txtRoundOff").value="- "+parseFloat(finalroundOfAmt).toFixed(2);
		}   
	
	var tbl = document.getElementById("tableTax");
    var last = tbl.rows.length;
    if(last==2)
   	{
    	var length1= ((tbl.rows.length)/2);
    	 document.getElementById("taxList["+length1+"].taxType").options[1].selected=true;
    	 document.getElementById("taxList["+length1+"].txtTaxValue").value="0.0";   
    	 document.getElementById("taxList["+length1+"].txtPrevTax").value="0.0";
    	 document.getElementById("txtTaxTotal").value="0.0";
    	 document.getElementById("taxList["+length1+"].txtprevLinkTax").value="0.0";
    	 document.getElementById("getTax"+sr).innerHTML="";
    	
   	}
    else
    {
    var current = window.event.srcElement;	
	while ( (current = current.parentElement)  && current.tagName !="TR");   
    current.parentElement.removeChild(current); 
   var del = ((sr-2)+parseInt(sr));
   document.getElementById("tableTax").deleteRow(del);
   
	    var counter = sr;
	    while(counter<((parseInt(last/2))+1))
		{
			next = parseInt(counter)+1;
	 		
	 		var inputTax = document.getElementById("taxList["+next+"].taxType");
	 		inputTax.id = "taxList["+counter+"].taxType";
	 		inputTax.name = "taxList["+counter+"].taxType";
		 	
	 		var inputTaxValue = document.getElementById("taxList["+next+"].txtTaxValue");
	 		inputTaxValue.id = "taxList["+counter+"].txtTaxValue";
	 		inputTaxValue.name =  "taxList["+counter+"].txtTaxValue";
		 	
		 	
		 	btndel = document.getElementById("taxList["+next+"].btndel");
			btndel.id = "taxList["+counter+"].btndel";
			btndel.name = "taxList["+counter+"].btndel";
			
			var inputPrevTax = document.getElementById("taxList["+next+"].txtPrevTax");
			inputPrevTax.id = "taxList["+counter+"].txtPrevTax";
			inputPrevTax.name =  "taxList["+counter+"].txtPrevTax";
			
			
			var inputPrevLinkTax = document.getElementById("taxList["+next+"].txtprevLinkTax");
			inputPrevLinkTax.id = "taxList["+counter+"].txtprevLinkTax";
			inputPrevLinkTax.name =  "taxList["+counter+"].txtprevLinkTax";
			
			var linkedTax=document.getElementById("getTax"+next);
			linkedTax.id = "getTax" + counter;	 
			
		 	counter++;
		} 
    }    
}
function checkTax(obj)
{
	    var id = document.getElementById(obj).id;	   
		var index1 = id.indexOf("[") + 1;		
		var index2 = id.indexOf("]");		
		var sr = id.slice(index1,index2);	
		
		var tbl = document.getElementById("tableTax");     
	    var length= ((tbl.rows.length)/2);	  	    
		for(var i=1;i<=length;i++)
			{
			if(i!=sr)
				{
				  var currenTax=document.getElementById("taxList["+sr+"].taxType").options[document.getElementById("taxList["+sr+"].taxType").selectedIndex].text;
				  var exTax=document.getElementById("taxList["+i+"].taxType").options[document.getElementById("taxList["+i+"].taxType").selectedIndex].text;
				if((currenTax.substring(0,8))==(exTax.substring(0,8)))
					{
						 alert("Please Select Different Tax");
						 document.getElementById("taxList["+sr+"].txtTaxValue").value="0.0";   
				    	 document.getElementById("taxList["+sr+"].txtPrevTax").value="0.0";				    	
				    	 document.getElementById("taxList["+sr+"].txtprevLinkTax").value="0.0";
				    	 document.getElementById("getTax"+sr).innerHTML="";
				    	 document.getElementById("taxList["+sr+"].taxType").options[0].selected=true;
						 return true;
					}
				else
					{
						//return false;
					}
				}			 
			}		
}
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
<!-- <div class="container"> -->
<%@ include file="innerHeader.jsp" %>
<br>
<div class="col-md-12">	   
<div class="panel panel-default">      
		<div class="panel-body">     
	           <div class="col-md-10">	            		
			         <ol class="breadcrumb">
			             <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Order</small>          
			         </ol>			             
			   </div>
			              <div class="col-md-2 pull right" >
			             	<div>
			             		<a href="salesOrder.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back">  Back</a>
			             	</div>
			             </div>
	</div>
	</div>	
	 </div>            
	<br>
	<div class="col-md-12">
		<div class="panel panel-default">
		<div class="panel-body">
		<form:form action="updateOrder.do" method="post" cssClass="form-inline" commandName="salesOrder" name="frmsalesorder" onsubmit="return validateForm()">
							<div class="row">
								
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">	
							
								<label>Customer&nbsp;Name:</label>
								</div>
										<div class="col-md-3">
								<%-- <form:input path="txtCName" id="txtCName" cssClass="form-control"></form:input> --%>
								<select name="txtCName" id="txtCName" onchange="retriveAdd(this.value,this.id)" class="form-control">
										<option value="${salesOrder.custId}">${salesOrder.txtCName}</option>
										<option value="0">--Select Name--</option>
											<c:forEach items="${customerList}" var="customerList"> 
										<option value="${customerList.txtCustID}">${customerList.txtCustName}</option>
											</c:forEach>
										</select>
									
								
								</div>		
									</div>		
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-3">		
								<label>Order&nbsp;No:</label>
								</div>				
										<div class="col-md-3">
								<form:input path="txtSOID" cssStyle="width:100px;" readonly="true" cssClass="form-control"></form:input>
								</div>
									</div>		 
								</div>
							</div>
							<br>
							<div class="row">
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-3">
								<label >Date:</label>
								</div>
					<div class="col-md-3">
								<input type="text" id="date" value="${salesOrder.txtDate}" name="txtDate" class="form-control"></input>
						</div>
				</div>			
			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-4">
					<label>Delivery Date:</label>
					</div>
					<div class="col-md-3">
								<input type="text" id="ddate"  value="${salesOrder.txtDueDate}" name="txtDueDate" class="form-control"></input>
					</div>
				</div>
			</div>
		</div>
			<br>
			<div class="row">
			<div class="col-md-5">
				<div class="row">
				<div class="col-md-4">
					<label style="vertical-align: top">Billing To:</label>
				</div>
				<div class="col-md-2">	
					<form:textarea rows="2" cssStyle="resize:none;" onkeyup="textAreaAdjust(this)" cols="25" path="txtBillAddr" cssClass="form-control"></form:textarea>
				</div>
				</div>
			</div>
			<div class="col-md-6">
			<div class="row">
				<div class="col-md-6">
					<label style="vertical-align: top">Ship To(Same as Bill):</label>
					<input type="checkbox" id="chkYes" name="chkYes" onclick="same(this)" style="vertical-align: top"></checkbox>
				</div>
				<div class="col-md-3">						 		      			      				
					<form:textarea rows="2" cssStyle="resize:none;" onkeyup="textAreaAdjust(this)" cols="25" path="txtShipAddr" cssClass="form-control"></form:textarea>
				</div>
			</div> 
		</div>			
		</div><br>	<div class="row">
		<div class="table-responsive">
						<table id="tableID" class="table table-striped">		
								<tr>
									<th>Sr No</th>
									<th>Product</th>
									<th>Description</th>
									<th>M.Unit</th>
									<th><label id="showth">A.Qty</label></th>
									<th>Quantity</th>
									<th>Unit Price(INR)</th>									
									<th>Total(INR)</th><th></th><th></th>
								</tr>								
								<c:forEach items="${salesOrder.productList}" var="productList">
								<tr>
									<td><input type="text" name="productList[${productList.srNo-1}].srNo" value="${productList.srNo}" id="productList[${productList.srNo-1}].srNo" style="width: 50px;text-align: right;" class="form-control" ></input></td>
												
												<td><select name="productList[${productList.srNo-1}].itemCode" id="itemCode${productList.srNo-1}" style="width:120px;" onchange="showDesc(this.value,this.id);disQuantity(this.id);" class="form-control" >
														<option value="">---Select---</option>		
														<option value="${productList.prodId}" id="${productList.prodId}" style="display: none;"> ${productList.itemCode} </option>
																									
																																					
													<c:forEach items="${orderList}" var="orderList">
														<option value="${orderList.productId }">${orderList.txtName }</option> 													
													</c:forEach>
													 <script type="text/javascript">			
													var i=${productList.srNo-1};												
													var selitem=document.getElementById("itemCode"+i);
													var ln=document.getElementById("itemCode"+i).length;													
													for ( var k = 0; k < ln; k++)
													{														
														var it1=document.getElementById("itemCode"+i).options[k].value;
														var it=document.getElementById("${productList.prodId}").value;														
														if(it1==it)
															{															
															document.getElementById("itemCode"+i).options[k].selected=true;
															}														
													}
												</script>								
												</select>
												
											</td>
												
									<td><input type="text" name="productList[${productList.srNo-1}].des" id="productList[${productList.srNo-1}].des" value="${productList.des}" class="form-control" style="width:120px;"></td>
									<td><input type="text" name="unit${productList.srNo-1}" id="unit${productList.srNo-1}" value="${productList.unit}" class="form-control" readonly="readonly" style="width:80px;"></td>
									<td valign="middle"><label id="showLable${productList.srNo-1}" style="color: red;font-size: 15;font-style: normal;">${productList.aQty}</label></td>
									<td><input type="text" name="productList[${productList.srNo-1}].quantity" id="productList[${productList.srNo-1}].quantity" value="${productList.quantity}" onkeypress="return isNumberKey(this)" onblur="calSubTotal(this.id)" class="form-control" style="width:80px;text-align: right;"></td>
									<td><input type="text" name="productList[${productList.srNo-1}].unitPrice"	id="productList[${productList.srNo-1}].unitPrice" value="${productList.unitPrice}" onkeypress="return isNumberKey(this)" onblur="calSubTotal(this.id)" class="form-control" style="width:80px;text-align: right;"></td>
									<td><input type="text" name="productList[${productList.srNo-1}].itemTotal" id="productList[${productList.srNo-1}].itemTotal" class="form-control" value="${productList.itemTotal}" style="width:80px;text-align: right;"></td>
									<td><input type="hidden" name="productList[${productList.srNo-1}].exSubTotal" id="productList[${productList.srNo-1}].exSubTotal" class="form-control" value="${productList.itemTotal}" style="width:80px;text-align: right;"></td>
									<td><input type="button" class="btn btn-danger" name="productList[${productList.srNo-1}].btndel" id="productList[${productList.srNo-1}].btndel" value="-" onclick="delrow(this.id);"></td>
								</tr>	</c:forEach>						
							</table> 
							<input type="button" name="addRec" value="+ Add New Row" onClick="addRow()" class="btn btn-default btn-xs">
						</div></div><br>	
						<div class="row">
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-5">
								<label>Customer PO No:</label>
							</div>
							<div class="col-md-4">
								<form:input path="txtCPONo" cssClass="form-control"></form:input>
							</div>
						</div>
					</div>
					<div class="col-md-6 pull right">
						<div class="row">
							<div class="col-md-4">
								<label>Charges:	</label>
							</div>
							<div class="col-md-4">
								<form:input path="txtTransCost" cssClass="form-control" id="txtTransCost" cssStyle="width:180px;" onkeypress="return isNumberKey(this)" onblur="calculateCharges();"></form:input>
								<input type="hidden" name="hideTransCost" class="form-control" id="hideTransCost" value="${salesOrder.txtTransCost}" style="width:180px;">
							</div>
						</div>
					</div>
				</div>
						
						<%-- <div>
										<label>Customer PO No:-</label>
										<form:input path="txtCPONo" cssClass="form-control"></form:input>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<label>Charges:-	</label>									
										
										<form:input path="txtTransCost" cssClass="form-control" id="txtTransCost" cssStyle="width:180px;" onblur="calculateCharges();"></form:input>
						</div> --%><br>		
					<div class="row">
					<div class="col-md-5">
				<div class="panel panel-default" style="padding: 1;">
					<div class="panel-body">
						<ul class="nav nav-tabs">
                            <li class="active"><a href="#home" data-toggle="tab">Terms and Condition</a>
                            </li>
                            <li><a href="#profile" data-toggle="tab">Private Notes</a>
                            </li>
                        </ul>
                        <div class="tab-content" style="padding: 1;">
                        	<div class="tab-pane fade in active" id="home">
                        		<p></p>
                        		<form:textarea path="txtpubNotes" cssClass="form-control" cols="30" rows="5"/>
                        	</div>
                        	<div class="tab-pane fade" id="profile">
                        		<p></p> 
                        		<form:textarea path="txtpvtNotes" cssClass="form-control" cols="30" rows="5"/>
                        	</div>
                        </div>
					</div>
				</div>
			</div>
				<div class="col-md-7">
				<div class="row">
				<div class="col-md-12">
					<div class="col-md-3"></div>
					<div class="col-md-4">
						<label>Sub Total : </label>
					</div>
					<div class="col-md-5">
						<input type="text" name="txtSubTotal" readonly="readonly" id="txtSubTotal" class="form-control" value="${ salesOrder.txtSubTotal}" onkeypress="return isNumberKey(this)"></input>
					</div>
				</div>
				</div> 				
				<c:choose>
				<c:when test="${salesOrder.radio != 'null'}">
				<div style="height: 5px;"></div>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-4">
						<div class="row">
							<input type="checkbox" name="applyDis" id="applyDis" value="applyDis" checked="checked"  onclick="checkDis()"/><label>&nbsp;Apply&nbsp;Discount</label>
						</div>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-5"></div>
					</div>
				</div>	
				<div class="row"  id="showDis">
				<div class="col-md-12">
					<div class="col-md-4">
						<div class="row">						
						<c:choose>
						<c:when test="${salesOrder.radio=='per'}">
							<input id="radio1" type="radio" name="radio" value="per" checked="checked" onclick="calDis1();"><label>&nbsp;%&nbsp;</label>
							<input id="radio2" type="radio" name="radio" value="amt" onclick="calDis1();"><label>&nbsp;Amount&nbsp;</label>
						</c:when>
						<c:otherwise>
							 <input id="radio1" type="radio" name="radio" value="per" onclick="calDis1();"><label>&nbsp;%&nbsp;</label>
							 <input id="radio2" type="radio" name="radio" value="amt" checked="checked" onclick="calDis1();"><label>&nbsp;Amount&nbsp;</label>
						</c:otherwise>
						</c:choose>							
						 <label id="showLable" style="display: none;"><font size="1" color="red">Please&nbsp;Select&nbsp;Discount&nbsp;Type</font></label>
						</div> 
						</div>
					<div class="col-md-3">
						<label>Discount : </label>
					</div>
					<div class="col-md-5">
						<input type="text" name="txtDiscount" id="txtDiscount" value="${ salesOrder.txtDiscount}" class="form-control" onkeypress="return isNumberKey(this)" onblur="calDis();"></input>
					</div>					
					<br>
				</div>				
				</div>
			</c:when>
			<c:otherwise>
				<div style="height: 5px;"></div>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-4">
						<div class="row">
							<input type="checkbox" name="applyDis" id="applyDis" value="applyDis"  onclick="checkDis()"/><label>&nbsp;Apply&nbsp;Discount</label>
						</div>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-5"></div>
					</div>
				</div>	
					<div class="row" style="display: none;"  id="showDis">
					<div class="col-md-12">
					<div class="col-md-3">
						<div class="row">
	        					<input id="radio1" type="radio" name="radio" value="per" onclick="calDis1();"><label>&nbsp;%&nbsp;</label>
						        <input id="radio2" type="radio" name="radio" value="amt" onclick="calDis1();"><label>&nbsp;Amount&nbsp;</label>							
							<label id="showLable" style="display: none;"><font size="1" color="red">Please&nbsp;Select&nbsp;Discount&nbsp;Type</font></label>
						</div> 
						</div>
					<div class="col-md-4">
						<label>Discount : </label>
					</div>
					<div class="col-md-5">
						<input type="text" name="txtDiscount" id="txtDiscount" value="0.0" class="form-control" onkeypress="return isNumberKey(this)" onblur="calDis();"></input>
					</div>					
					<br>
				</div>				
				</div>		
			</c:otherwise>
		</c:choose>
				<div style="height: 5px;"></div>
				<div class="row">
				<div class="col-md-12">
				<div class="col-md-4"></div>
					<div class="col-md-3">
						<label>Total : </label>
					</div>
					<div class="col-md-5">
						<input type="text" name="txtDisTotal" readonly="readonly" id="txtDisTotal" class="form-control" value="${ salesOrder.txtDisTotal}" onkeypress="return isNumberKey(this)"></input>
					</div>
				</div>
				</div>	
	<c:choose>
	<c:when test="${bln!='blank'}">
				<div style="height: 5px;"></div>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-3">
						<div class="row">
							<input type="checkbox" name="applyTax" id="applyTax" value="tax" onclick="checkTaxes()" checked="checked"/><label>&nbsp;Apply&nbsp;Tax</label>
						</div>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-5"></div>
					</div>
				</div>
<div id="showTax">					
<div><input type="button" name="addRec" value="+ Add New Row" onclick="addTax();" class="btn btn-default btn-xs"></div>
<div class="col-md-5"></div>
<div class="table-responsive pull-right"> 
<table class="table" id="tableTax" style="width: 50px">
<tbody>

	
<%int cnt=1; %>
<c:forEach items="${salesOrder.taxList}" var="taxDetailsList">
<tr>
<td>
<select name="taxList[<%=cnt%>].taxType" id="taxList[<%=cnt%>].taxType" style="width:150px;" class="form-control" onchange="showLinkedTax(this.value,this.id);"> 
<option value="0">---Select---</option> 
<option value="${taxDetailsList.taxRate}^${taxDetailsList.taxId}" selected="selected">${taxDetailsList.taxType}&nbsp;@&nbsp;${taxDetailsList.taxRate}</option>
<c:forEach items="${taxList}" var="taxList">
 <option value="${taxList.taxRate}^${taxList.taxId}">${taxList.taxName}&nbsp;@&nbsp;${taxList.taxRate}</option>
</c:forEach>
</select>
</td>
<td><input type="text" id="taxList[<%=cnt%>].txtTaxValue" name="taxList[<%=cnt%>].txtTaxValue" value="${taxDetailsList.txtTaxValue}" style="width:130px;text-align:right;" class="form-control"  /></td>
<td><input type="button" class="btn btn-danger btn-xs" name="taxList[<%=cnt%>].btndel" id="taxList[<%=cnt%>].btndel" value="-" onclick="delTax(this.id)"></td>
<td style="display: none;"><input type="hidden" id="taxList[<%=cnt%>].txtPrevTax" name="taxList[<%=cnt%>].txtPrevTax" value="${taxDetailsList.txtTaxValue}" class="form-control"/></td><!--  onblur="getvalue(this.value)" -->
<td style="display: none;"><input type="hidden" id="taxList[<%=cnt%>].txtprevLinkTax" name="taxList[<%=cnt%>].txtprevLinkTax" value="${taxDetailsList.txtprevLinkTax}" class="form-control"/></td>

<c:choose>
	<c:when test="${taxDetailsList.counter !='0'}">
		<tr>
<td colspan="5" id="getTax<%=cnt%>">
<div id="linkedDiv">
<%int count=1; %>
	<c:forEach items="${salesOrder.linkedTaxList}" var="linkedTaxList">
		<div>
			<label>${linkedTaxList.linkedTaxName}&nbsp;@&nbsp;${linkedTaxList.linkedTaxRate}%&nbsp;:</label>
		</div>
		<div>	
			<input type="hidden" style="width: 40px;" id="serLTax<%=count%>" value="${linkedTaxList.linkedTaxRate}"/>	
			<input type="hidden" style="width: 40px;" name="linkedTaxList[<%=count%>].linkedTaxId" id="linkedTaxList[<%=count%>].linkedTaxId" value="${linkedTaxList.linkedTaxId}"/>	
			<input type="hidden" style="width: 40px;" name="linkedTaxList[<%=count%>].mTaxID" id="linkedTaxList[<%=count%>].mTaxID" value="${linkedTaxList.mTaxID}"/>	
			<input type="text" name="linkedTaxList[<%=count%>].serLinkedTax" readonly="readonly" id="linkedTaxList[<%=count%>].serLinkedTax" value="${linkedTaxList.serLinkedTax}" class="form-control" onkeypress="return isNumberKey(this)"></input>			
		</div>
		<%count++;%>
	</c:forEach>
		<input type="hidden" value="${taxDetailsList.counter}" id="linkTCnt<%=cnt%>">		
	</div>
</td>
</tr>
		
	</c:when>
	<c:otherwise>
	<tr><td colspan="5" id="getTax<%=cnt%>"></td></tr>		
	</c:otherwise>
</c:choose>

</tr>
<%cnt++;%>	
</c:forEach>

	
</tbody>
</table>
</div>
				</div>	
</c:when>
	<c:otherwise>
	<div style="height: 5px;"></div>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-3">
						<div class="row">
							<input type="checkbox" name="applyTax" id="applyTax" value="tax" onclick="checkTaxes();"/><label>&nbsp;Apply&nbsp;Tax</label>
						</div>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-5"></div>
					</div>
				</div>
<div id="showTax" style="display: none;">					
<div><input type="button" name="addRec" value="+ Add New Row" onclick="addTax();" class="btn btn-default btn-xs"></div>
<div class="col-md-5"></div>
<div class="table-responsive pull-right"> 
<table class="table" id="tableTax" style="width: 50px">
<tbody>

<tr>
<td>

<select title="" name="taxList[1].taxType" id="taxList[1].taxType" style="width:150px;" class="form-control" onchange="showLinkedTax(this.value,this.id);"> <!-- cal(this.id);showLinkedTax(this.value,this.id); -->
<option value="0">---Select---</option> 
<c:forEach items="${taxList}" var="taxList">
<option value="${taxList.taxRate}^${taxList.taxId}">${taxList.taxName}&nbsp;@&nbsp;${taxList.taxRate}</option>
</c:forEach>
        	 </select>
       	</td>
       	<!-- <td width="25px"></td> -->
<td><input type="text" id="taxList[1].txtTaxValue" name="taxList[1].txtTaxValue" value="0.0" style="width:130px;text-align:right;" class="form-control"  /></td>
<td><input type="button" class="btn btn-danger btn-xs" name="taxList[1].btndel" id="taxList[1].btndel" value="-" onclick="delTax(this.id)"></td>
<td style="display: none;"><input type="hidden" id="taxList[1].txtPrevTax" name="taxList[1].txtPrevTax" value="0.0" class="form-control"/></td><!--  onblur="getvalue(this.value)" -->
<td style="display: none;"><input type="hidden" id="taxList[1].txtprevLinkTax" name="taxList[1].txtprevLinkTax" value="0.0" class="form-control" /></td>

<tr><td colspan="5" id="getTax1"></td></tr>

</tr>
</tbody>
</table>
</div>				
				</div>	
	</c:otherwise>
</c:choose>
				<div style="height: 5px;"></div>
				<div class="row">
				<div class="col-md-12">
				<div class="col-md-3"></div>
					<div class="col-md-4">
					
						<label>Round Off : </label>
					</div>
					<div class="col-md-5">
						<input type="hidden" name="txtTaxTotal" value="${salesOrder.txtTaxTotal}" id="txtTaxTotal" class="form-control"/>
						<input type="text" name="txtRoundOff" value="${salesOrder.txtRoundOff}" readonly="readonly" id="txtRoundOff" class="form-control" onkeypress="return isNumberKey(this)"></input>
					</div>
				</div>
				</div>
				<div style="height: 5px;"></div>
				<div class="row">
				<div class="col-md-12"> 
				<div class="col-md-3"></div>
					<div class="col-md-4">
						<label>Amount&nbsp;Payable&nbsp;: </label>
					</div>	
					<div class="col-md-5">
						<!-- <input type="text" name="txtamtPayable" value="0.0" id="txtamtPayable" class="form-control"/> -->
						<input type="text" name="txtAmtPayble" readonly="readonly" id="txtAmtPayble" class="form-control" value="${salesOrder.txtAmtPayble}" onkeypress="return isNumberKey(this)"></input>
					</div>
				</div>
				</div>
									
			</div>
				</div>
							<div class="col-md-12">
						        	<input type="submit" value="Update" name="btn" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Update">									 
									<a href="salesOrder.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Cancel"> Cancel</a>
							
							</div>
				
			</form:form>
		</div>	
<c:if test="${message==1}">                      
<h4 class="msg-succ">
Order Updated Succesfully.
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
Order Not Updated Succesfully.
</h4> 
</c:if>								
	</div>
</div>
</div>


<!-- </div> -->
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>
</body>
</html>