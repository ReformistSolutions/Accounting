<%@page language="java"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Estimate</title>
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
	 if(document.frmSalesEstimate.txtEstID.value=="")
    {
      alert("Quotation  number Number Should not be Empty...");
      document.frmSalesEstimate.txtEstID.focus();
      return false;
    }
     else if(document.frmSalesEstimate.txtCutName.value=="0")
    {     
      alert("Customer Name should not be blank");
      document.frmSalesEstimate.txtCutName.focus();
      return false;
    }
     
     else if(document.frmSalesEstimate.txtDate.value=="")
     {
       alert("Date field should not be blank");
       document.frmSalesEstimate.txtDate.focus();
       return false;
     }
    
     else if(document.frmSalesEstimate.txtBillAddr.value=="")
     {
       alert("Bill To Address field should not be blank");
       document.frmSalesEstimate.txtBillAddr.focus();
       return false;
     }
     else if(document.frmSalesEstimate.txtShipAddr.value=="")
     {
       alert("ship To Address field should not be blank");
       document.frmSalesEstimate.txtShipAddr.focus();
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
     
     else if(document.frmSalesEstimate.txtpubNotes.value=="")
     {
       alert("Public notes should not be blank");
       document.frmSalesEstimate.txtpubNotes.focus();
       return false;
     }
     else if(document.frmSalesEstimate.txtpvtNotes.value=="")
     {
       alert("Private notes should not be blank");
       document.frmSalesEstimate.txtpvtNotes.focus();
       return false;
     }
     else if(document.frmSalesEstimate.txtsubtotal.value=="")
     {
       alert("Sub Total field should not be blank");
       document.frmSalesEstimate.txtsubtotal.focus();
       return false;
     }
     else if(document.frmSalesEstimate.txtVat.value=="")
     {
       alert("Vat field should not be blank");
       document.frmSalesEstimate.txtVat.focus();
       return false;
     }
     else if(document.frmSalesEstimate.txtSerTax.value=="")
     {
       alert("Service tax field should not be blank");
       document.frmSalesEstimate.txtSerTax.focus();
       return false;
     }
     else if(document.frmSalesEstimate.txtES.value=="")
     {
       alert(" Education Service tax field should not be blank");
       document.frmSalesEstimate.txtES.focus();
       return false;
     }
     else if(document.frmSalesEstimate.txtSEC.value=="")
     {
       alert("Secondary education Service tax field should not be blank");
       document.frmSalesEstimate.txtSEC.focus();
       return false;
     }
     else if(document.frmSalesEstimate.txtdiscount.value=="")
     {
       alert("Discount field should not be blank");
       document.frmSalesEstimate.txtdiscount.focus();
       return false;
     }
    
 } 
</script>  
 <SCRIPT type=text/Javascript>
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

	   function addRow()
	    {		 
				var tbl = document.getElementById("tableID");
	       	     var lastRow = tbl.rows.length;
	        	 var row = tbl.insertRow(lastRow);
	        	 var length=(tbl.rows.length)-2;
		    	j=length;
	 		j++;
			
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
		  		inputItem.id = "itemCode"+length;
		  		inputItem.name = "productList["+length+"].itemCode";
		  		inputItem.className="form-control";
		  		inputItem.onchange=function(){showDesc(this.value,this.id);};
		  		var newLength=length-1;
		  		var ln = document.getElementById("itemCode"+newLength).length;
		  		var xVal=0;
		  		for ( var k = 0; k < ln; k++) 
		  		{
		  			xVal = document.getElementById("itemCode"+newLength).options[k].value;
		  			var xText = document.getElementById("itemCode"+newLength).options[k].text;
		  			desc = document.getElementById("itemCode"+newLength).options[k].label;
		  			//alert("OK="+desc);
		  			var opt = document.createElement("option");
		  			opt.text = xText;
		  			opt.value = xVal;
		  			inputItem.add(opt, null);
		  			
		  		}
		  		inputItem.style.width='100px';		  		
		  		secondCell.appendChild(inputItem);
				
		  		
				var thirdCell=row.insertCell(2);
				var inputDes=document.createElement("input");
				inputDes.id="productList["+length+"].des" ;
				inputDes.type="text";
				inputDes.name="productList["+length+"].des" ;			
				inputDes.className="form-control";				
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
				var inputQty=document.createElement("input");
				inputQty.id="productList["+length+"].quantity";
				inputQty.type="text";
				inputQty.name="productList["+length+"].quantity";		
				inputQty.className="form-control";
				inputQty.onblur=function(){calSubTotal(this.id);};
				inputQty.onkeypress=function(){return isNumberKey(this);};
				inputQty.style.width="80px";
				inputQty.style.textAlign="right";
				fifthCell.appendChild(inputQty);
				
				var sixCell=row.insertCell(5);
				var inputUnitPrice=document.createElement("input");
				inputUnitPrice.id="productList["+length+"].unitPrice";
				inputUnitPrice.type="text";
				inputUnitPrice.name="productList["+length+"].unitPrice";			
				inputUnitPrice.className="form-control";	
				inputUnitPrice.onblur=function(){calSubTotal(this.id);};
				inputUnitPrice.onkeypress=function(){return isNumberKey(this);};
				inputUnitPrice.style.width="80px";
				inputUnitPrice.style.textAlign="right";
				sixCell.appendChild(inputUnitPrice);
			  		
				var seventhCell=row.insertCell(6);
				var inputTotal=document.createElement("input");
				inputTotal.id="productList["+length+"].itemTotal";
				inputTotal.type="text";
				inputTotal.name="productList["+length+"].itemTotal";			
				inputTotal.className="form-control";
				inputTotal.style.width="80px";
				inputTotal.style.textAlign="right";
				seventhCell.appendChild(inputTotal);
				
				var eigthCell=row.insertCell(7);
				var inputSubTotal=document.createElement("input");			
				inputSubTotal.type="hidden";
				inputSubTotal.id="productList["+length+"].exSubTotal";
				inputSubTotal.name="productList["+length+"].exSubTotal";	
				inputSubTotal.value="0.0";
				inputSubTotal.className="form-control";
				inputSubTotal.style.width="80px";			
				eigthCell.appendChild(inputSubTotal);
				
		          var ningthCell = row.insertCell(8);
		       	  var inputbutton1 = document.createElement("input");
			      inputbutton1.type = "button";
			      inputbutton1.name = "productList["+length+"].btndel";
			      inputbutton1.id = "productList["+length+"].btndel";       	
			      inputbutton1.value="-"; 		
			      inputbutton1.className="btn btn-danger";
			      inputbutton1.onclick=function(){delrow(this.id);};
			      ningthCell.appendChild(inputbutton1);
				
		
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
	
	   function check()
	   {
		   alert("Check");
	   }

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
					if(item == ' ')
						{
							document.getElementById("productList["+k+"].des").value = "";
							document.getElementById("unit"+k).value="";	
							document.getElementById("productList["+k+"].unitPrice").value = "";
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
showMUnit(str,id);
var i=id.slice(8);
var xmlhttp;   
if (str==" ")
  {
	//alert("In If");
  	document.getElementById("productList["+i+"].des").value=" ";
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
  	document.getElementById("showLable"+i).innerHTML=" ";
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
	//var showLable=document.getElementById("showLable"+i);
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
function showEnq(str)
{	
var enq=document.getElementById("txtEnqNo");
var xmlhttp;   
if (str=="")
  {
  document.getElementById("txtEnqNo").innerHTML="Select";
  return;
  }
if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById(enq).value=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","retriveEnquiry.jsp?p="+str,true);
xmlhttp.send();
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
xmlhttp.open("GET","retriveAddress.do?customerId="+id,true);
xmlhttp.send();
}
</script>


<script>
$(function() {
$( "#tabs" ).tabs();
});

function getId(id)
{
 	alert("Id="+id);	
}

</script>
<script>
function goBack()
	{
		window.history.back();
	}
</script>
<script type="text/javascript">
var sAdd="";
function same(s)
{
	
	var add=document.frmSalesEstimate.txtBillAddr.value;		 
	if(s.checked)
		{	
		  sAdd= document.frmSalesEstimate.txtShipAddr.value;
		  document.frmSalesEstimate.txtShipAddr.value=add;		 
		}
	else
	{		
	  document.frmSalesEstimate.txtShipAddr.value= sAdd;	  
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
	
	var prevTot=document.getElementById("txtAmtPayble").value;	
	
	var fTot=(parseFloat(prevTot)-parseFloat(exSubTotal));	
	var finalTotal=(parseFloat(fTot)+parseFloat(subTotal));	
	
	document.getElementById("txtAmtPayble").value=finalTotal.toFixed(2);
	//document.getElementById("txtDisTotal").value=finalTotal.toFixed(2);
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
			 document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value);
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
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(preLTax)).toFixed(2);
	document.getElementById("taxList["+sr+"].txtprevLinkTax").value="0.0";
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
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound)+1;
			document.getElementById("txtRoundOff").value="+ "+parseFloat(finalRound).toFixed(2);
		}
	else
		{
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound);
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
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value);
		}
		else if(document.getElementById("radio2").checked == true)
		{			
			var discount = document.getElementById("txtDiscount").value;					
			var subTotal = document.getElementById("txtSubTotal").value;			
			var disAmt = parseFloat(subTotal) - parseFloat(discount);			
			document.getElementById("txtDisTotal").value= disAmt.toFixed(2);
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value);
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
						document.getElementById("txtAmtPayble").value= parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound)+1;
						document.getElementById("txtRoundOff").value="+ "+parseFloat(finalRound).toFixed(2);
					}
				else
					{
						document.getElementById("txtAmtPayble").value= parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound);
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
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value);
		}
		else if(document.getElementById("radio2").checked == true)
		{			
			var discount = document.getElementById("txtDiscount").value;					
			var subTotal = document.getElementById("txtSubTotal").value;			
			var disAmt = parseFloat(subTotal) - parseFloat(discount);			
			document.getElementById("txtDisTotal").value= disAmt.toFixed(2);
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value);
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
						document.getElementById("txtAmtPayble").value= parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound)+1;
						document.getElementById("txtRoundOff").value="+ "+parseFloat(finalRound).toFixed(2);
					}
				else
					{
						document.getElementById("txtAmtPayble").value= parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound);
						document.getElementById("txtRoundOff").value="- "+parseFloat(finalroundOfAmt).toFixed(2);
					} 
				
			 }
}	
function checkTaxes()
{
	if(document.getElementById("applyTax").checked !=true)
	{
		document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value);
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
function goBack()
	{
		window.history.back();
	}
</script>

<!-- <script type="text/javascript">

	$(document).ready(function	(){
		alert("ok");
		$('input[type="checkbox"]').click(function(){
			alert("ok");
			if($(this).attr("value")=="applyDis"){
				alert("ok"); 
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
</script> -->
<!-- <script>
function showServiceTax(str,obj)
{	
	//alert("In showServiceTax function 1");
	//alert("TD ID="+tdId);
	var id = document.getElementById(obj).id;
	//alert('id 2:'+id);
	var index1 = id.indexOf("[") + 1;
	//alert('index1:'+index1);
	var index2 = id.indexOf("]");
	//alert('index2:'+index2);
	var sr = id.slice(index1,index2);
	//alert("sr="+sr);
	var xx = document.getElementById("taxList["+sr+"].taxType");
	var seltext = xx.options[xx.selectedIndex].text;
	//alert("seltext="+seltext);
	var tax = seltext.slice(0,11);
	//alert("tax="+tax);
var xmlhttp;
if (str=="")
  {	
  	document.getElementById("taxList["+sr+"].taxType").innerHTML="";  	
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
		//alert("In Ready State");
	    document.getElementById("serviceTax").value=xmlhttp.responseText;
	    var mm = document.getElementById("serviceTax").value;
		//alert("mm 3"+mm);
	//	alert("Calling Linked Tax Function 4");
		//alert("TD ID="+sr);
		showLinkedTax(mm,obj,sr);
		//alert("After calling Linked Tax 13");
	  	//cal(obj);
    }
  }
xmlhttp.open("GET","retriveSerTaxID.do?taxName="+tax,true);
xmlhttp.send();

}
</script> -->

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
        inputTaxValue.style.width='150px';
        inputTaxValue.style.textAlign="right";
        inputTaxValue.value="0.0";
       inputTaxValue.onblur=function(){getvalue(this.value);};
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
		  
		
		  var fithCell = row.insertCell(4);
		  var inputPrevLinkTax = document.createElement("input");
		  inputPrevLinkTax.type = "hidden";
		  inputPrevLinkTax.name = "taxList["+length+"].txtprevLinkTax";
		  inputPrevLinkTax.id = "taxList["+length+"].txtprevLinkTax"; 	
		  inputPrevLinkTax.value="0.0"; 		
		  inputPrevLinkTax.className="form-control";	
		  fithCell.appendChild(inputPrevLinkTax);
	      
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
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound)+1;
			document.getElementById("txtRoundOff").value="+ "+parseFloat(finalRound).toFixed(2);
		}
	else
		{
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound);
			document.getElementById("txtRoundOff").value="- "+parseFloat(finalroundOfAmt).toFixed(2);
		}   
	
	var tbl = document.getElementById("tableTax");
    var last = tbl.rows.length;
    if(last==2)
   	{
    	var length1= ((tbl.rows.length)/2);
    	 document.getElementById("taxList["+length1+"].taxType").options[0].selected=true;
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
						return false;
					}
				}			 
			}		
}
</script>
</head>
<body style="overflow-x:hidden;">
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
			             		<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Estimate</small>          
			             	</ol>			             
			             </div>
			              <div class="col-md-2 pull right" >
			             	<div>
			             		<button name="back" class="btn btn-primary" onclick="goBack()" data-toggle="tooltip" data-placement="left" title="Back"><i class="fa fa-reply"></i> Back</button>
			             	</div>
			             </div>
			             </div>
			             </div>
			      </div><br>
<br>
<div class="col-md-12">
	<form:form action="addEstimate.do" method="post" modelAttribute="salesEstimate" name="frmSalesEstimate" onsubmit="return validateForm()"> 
		<div class="panel panel-default">
		<div class="panel-body">
						<div class="row">
					<div class="col-md-2">		
								<label>Customer&nbsp;Name:</label>
							</div>
							<div class="col-md-3">
							<input type="hidden" name="txtCutName" id="txtCutName" value="${salesEstimate.custID}" >
							<input type="text" value="${salesEstimate.txtCutName}" id="${salesEstimate.custID}" autofocus="autofocus" onfocus="retriveAdd(this.value,this.id)" readonly="readonly" class="form-control">
							
										
					</div>
					<div class="col-md-2">
								<label>Estimate&nbsp;No:</label>									
							</div>
							<div class="col-md-3">
								<form:input cssStyle="width:55%" path="txtEstID" readonly="true" cssClass="form-control"></form:input>
								<input type="hidden" name="txtEnqNo" value="${salesEstimate.txtEnqNo}">
							</div>
					</div>
					<br>
						<div class="row">
							
							<%
								DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
						     	Date date = new Date();	     
						     	String dt=dateFormat.format(date);
							%>
							<div class="col-md-2">
							<label>Date:-</label>									
						</div>
						<div class="col-md-4">
							<input type="text" id="date" style="width:50%" value="<%=dt %>" name="txtDate" class="form-control"></input>
						</div>
						</div>
						<br>
						<br>
							<br>
				<div class="row">
				<div class="col-md-12">
			
				<div class="row">
					<div class="col-md-2">
					<form:label path="txtBillAddr" cssStyle="vertical-align: top;">Billing to :</form:label>
					</div>
					<div class="col-md-3">					
					<form:textarea rows="2" cols="30"  cssStyle="resize:none;" onkeyup="textAreaAdjust(this)" cssClass="form-control" path="txtBillAddr" id="txtBillAddr"></form:textarea>
					</div>				
				<div class="col-md-4">
					<form:label path="" cssStyle="vertical-align: top;">Ship&nbsp;to(Same as Billing)&nbsp;:</form:label>
					<input type="checkbox" id="chkYes" name="chkYes" onclick="same(this)" style="vertical-align: top">
				</div>
				<div class="col-md-3">						 		      			      				
					<form:textarea rows="2" cols="25" cssClass="form-control" onkeyup="textAreaAdjust(this)" path="txtShipAddr" id="txtShipAddr"></form:textarea>
				</div>
			</div> 
		</div>
	</div>	<br>			
					<div class="table-responsive">
						<table id="tableID" class="table table-striped">		
								<tr>
									<th>Sr No</th>
									<th>Product</th>
									<th>Description</th>
									<th>M.Unit</th>
									<th>Quantity</th>
									<th>Unit Price(INR)</th>
									<!-- <th>Discount</th>
									<th>Tax</th> -->
									<th>Total(INR)</th>
									<th></th><th></th>
								</tr>								
							<c:forEach items="${salesEstimate.productList}" var="prodList">
								<tr>
									<td><input type="text" value="${prodList.srNo}" readonly="readonly" id="productList[${prodList.srNo-1}].srNo" name="productList[${prodList.srNo-1}].srNo" value="1"  class="form-control" style="width:50px;text-align: right;"></td>

									<td><!-- estimateList -->
            						<select name="productList[${prodList.srNo-1}].itemCode" readonly="true" id="itemCode${prodList.srNo-1}" class="form-control" style="width:100px" onchange="showDesc(this.value,this.id);">
										<option value=" ">---Select---</option>		
										<option value="${prodList.prodId }" id="${prodList.prodId }">${prodList.itemCode}</option>
																				
												<c:forEach items="${productList}" var="productList">
													<option value="${productList.productId }">${productList.txtName }</option>
												</c:forEach>
												 <script type="text/javascript">			
													var i=${prodList.srNo-1};												
													var selitem=document.getElementById("itemCode"+i);
													var ln=document.getElementById("itemCode"+i).length;													
													for ( var k = 0; k < ln; k++)
													{														
														var it1=document.getElementById("itemCode"+i).options[k].value;
														var it=document.getElementById("${prodList.prodId}").value;														
														if(it1==it)
															{															
															document.getElementById("itemCode"+i).options[k].selected=true;
															}														
													}
												</script>	
									</select>
            					</td>	
									<td><input type="text" name="productList[${prodList.srNo-1}].des" readonly="readonly" id="productList[${prodList.srNo-1}].des" value="${prodList.des}" class="form-control"></td>
									<td><input type="text" name="unit${prodList.srNo-1}"  id="unit${prodList.srNo-1}" value="${prodList.unit}" class="form-control" readonly="readonly" style="width:80px;"></td>
									<td><input type="text" name="productList[${prodList.srNo-1}].quantity" readonly="readonly" id="productList[${prodList.srNo-1}].quantity" value="${prodList.quantity}" onkeypress="return isNumberKey(this)" onblur="calSubTotal(this.id)" class="form-control" style="width:80px;text-align: right;"></td>
									<td><input type="text" name="productList[${prodList.srNo-1}].unitPrice"	id="productList[${prodList.srNo-1}].unitPrice" value="${prodList.unitPrice}" onkeypress="return isNumberKey(this)" autofocus="autofocus" onfocus="calSubTotal(this.id)" onblur="calSubTotal(this.id)" class="form-control" style="width:80px;text-align: right;"></td>
									<td><input type="text" name="productList[${prodList.srNo-1}].itemTotal" id="productList[${prodList.srNo-1}].itemTotal" value="${prodList.itemTotal}" class="form-control" style="width:80px;text-align: right;"></td>
									<td><input type="hidden" name="productList[${prodList.srNo-1}].exSubTotal" id="productList[${prodList.srNo-1}].exSubTotal" class="form-control" value="0.0" style="width:80px;text-align: right;"></td>
									
									<td><input type="button" class="btn btn-danger" name="productList[${prodList.srNo-1}].btndel" id="productList[${prodList.srNo-1}].btndel" value="-" onclick="delrow(this.id);"></td>
								</tr>		</c:forEach>					
							</table> 
							<input type="button" name="addRec" value="+ Add New Row" onClick="addRow()" class="btn btn-default btn-xs">
						</div>
						<br>
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
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
                        		<form:textarea path="txtpubNotes" readonly="true" cssClass="form-control" cols="40" rows="5"/>
                        	</div>
                        	<div class="tab-pane fade" id="profile">
                        		<p></p> 
                        		<form:textarea path="txtpvtNotes" cssClass="form-control" cols="40" rows="5"/>
                        	</div>
                        </div>
					</div>
				</div>
			</div>		
			<div class="col-md-6">	
					<div class="col-md-2"></div>
					<div class="col-md-5">
						<label>Amount Payable:</label>
					</div>	
					<div class="col-md-5">						
						<input type="text" name="txtAmtPayble" readonly="readonly" id="txtAmtPayble" class="form-control" value="${salesEstimate.txtAmtPayble}" onkeypress="return isNumberKey(this)"></input>
				</div> 
			</div>
						
			<%-- 		<div class="col-md-7">
				<div class="row">
				<div class="col-md-12">
					<div class="col-md-3"></div>
					<div class="col-md-4">
						<label>Sub Total : </label>
					</div>
					<div class="col-md-5">
						<input type="text" name="txtSubTotal" readonly="readonly" id="txtSubTotal"  class="form-control" value="0.0" onkeypress="return isNumberKey(this)"></input>
					</div>
				</div>
				</div> 
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
				<div style="height: 5px;"></div>
				<div class="row">
				<div class="col-md-12">
				<div class="col-md-3"></div>
					<div class="col-md-4">
						<label>Total : </label>
					</div>
					<div class="col-md-5">
						<input type="text" name="txtDisTotal" readonly="readonly" id="txtDisTotal" class="form-control" value="0.0" onkeypress="return isNumberKey(this)"></input>
					</div>
				</div>
				</div>	
				<div style="height: 5px;"></div>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-3">
						<div class="row">
							<input type="checkbox" name="applyTax" id="applyTax" value="tax" onclick="checkTaxes();" /><label>&nbsp;Apply&nbsp;Tax</label>
						</div>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-5"></div>
					</div>
				</div>
				<div id="showTax" style="display: none;">
					
				<div><input type="button" name="addRec" value="+ Add New Row" onclick="addTax();" class="btn btn-default btn-xs"></div>
<div class="table-responsive">  <!-- style="padding-left: 250px" -->
<form:hidden path="serviceTax" id="serviceTax" ></form:hidden>
<table class="table" id="tableTax" style="width: 50px">
<tbody>

<tr>

<!-- <td width="190px"></td> -->
<td>

<select name="taxList[1].taxType" id="taxList[1].taxType" style="width:150px;" class="form-control" onchange="showLinkedTax(this.value,this.id);"> <!-- cal(this.id);showLinkedTax(this.value,this.id); -->
<option value="0">---Select---</option>
<c:forEach items="${taxList}" var="taxList">
<option value="${taxList.taxRate}^${taxList.taxId}">${taxList.taxName}&nbsp;@&nbsp;${taxList.taxRate}</option>
</c:forEach>
</select>
</td>
       	<!-- <td width="25px"></td> -->
<td><input type="text" id="taxList[1].txtTaxValue" name="taxList[1].txtTaxValue" value="0.0" style="width:150px;text-align:right;" class="form-control"  /></td>
<td><input type="button" class="btn btn-danger btn-xs" name="taxList[1].btndel" id="taxList[1].btndel" value="-" onclick="delTax(this.id)"></td>
<td><input type="hidden" id="taxList[1].txtPrevTax" name="taxList[1].txtPrevTax" value="0.0" class="form-control" onblur="getvalue(this.value)"/></td>
<!-- <td><input type="text" id="taxList[1].txtprevTaxType" name="taxList[1].txtprevTaxType" value="No Tax @ 0.0" class="form-control" onblur="getvalue(this.value)"/></td> -->
<td><input type="hidden" id="taxList[1].txtprevLinkTax" name="taxList[1].txtprevLinkTax" value="0.0" class="form-control" onblur="getvalue(this.value)" /></td>

<tr><td colspan="5" id="getTax1"></td></tr>

</tr>
</tbody>
</table>
</div>
				</div>	
				<div style="height: 5px;"></div>
				<div class="row">
				<div class="col-md-12">
				<div class="col-md-3"></div>
					<div class="col-md-4">
					
						<label>Round Off : </label>
					</div>
					<div class="col-md-5">
						<input type="hidden" name="txtTaxTotal" value="0.0" id="txtTaxTotal" class="form-control"/>
						<input type="text" name="txtRoundOff" value="0.0" readonly="readonly" id="txtRoundOff" class="form-control" onkeypress="return isNumberKey(this)"></input>
					</div>
				</div>
				</div>
				<div style="height: 5px;"></div>
				<div class="row">
				<div class="col-md-12"> 
				<div class="col-md-3"></div>
					<div class="col-md-4">
						<label>Amount Payable : </label>
					</div>	
					<div class="col-md-5">
						<!-- <input type="text" name="txtamtPayable" value="0.0" id="txtamtPayable" class="form-control"/> -->
						<input type="text" name="txtAmtPayble" readonly="readonly" id="txtAmtPayble" class="form-control" value="0.0" onkeypress="return isNumberKey(this)"></input>
					</div>
				</div>
				</div>
									
			</div> --%>
	</div><br>
				<div class="col-md-12">
					<input type="submit" value="Save" name="btn" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Save">									 
					<button type="button" onclick="goBack()" class="btn btn-primary" name="btn" data-toggle="tooltip" data-placement="top" title="Cancel">Cancel</button>
							
				</div>

							
<c:if test="${message==1}">                     
	<script>
		alert("Estimate Added Succesfully.");
	</script>
</c:if>
<c:if test="${message==0}">                     
	<script>
		alert("Estimate Not Added Succesfully.");
	</script>
</c:if>									

</div>
</div>
</form:form>
</div>
</div>
<!-- </div> -->
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>
</body>
</html>