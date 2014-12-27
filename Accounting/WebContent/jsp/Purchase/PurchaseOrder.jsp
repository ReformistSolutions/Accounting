<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.text.SimpleDateFormat"%>
   <%@ page import="javax.servlet.*,java.text.*" %>
   <%@page import="java.util.*"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Purchase Order</title>
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
<link href="<c:url value="/resources/css/stylesheet-pure-css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>
<script>
function textAreaAdjust(o) {
    o.style.height = "1px";
    o.style.height = (25+o.scrollHeight)+"px";
}
</script>

<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#dp1').datepicker({
                    format: "yyyy/mm/dd"
                });

                $('#dp2').datepicker({
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
<script type="text/javascript">
var i =1 ;
var j=1;

	   function addRow()
	    {		 
				var tbl = document.getElementById("tableID");
	       	     var lastRow = tbl.rows.length;
	        	 //var i= lastRow - 1;
	        	 var row = tbl.insertRow(lastRow);
	        	 var length=(tbl.rows.length)-2;
		    	//alert("Length="+length);
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
		  		//var test=("txtItem1" + i).value;	
		  		inputItem.onchange=function(){showDesc(this.value,this.id);showUnitPrice(this.value,this.id);disQuantity(this.id);};
		  		
		  		var newLength=length-1;
		  		
		  		var ln = document.getElementById("itemCode"+newLength).length;
		  		//alert("New Length="+newLength);
		  		var xVal=0;
		  		for ( var k = 0; k < ln; k++) 
		  		{
		  			//alert("In for="+ln);
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

				var unitCell=row.insertCell(3);
				var inputunit=document.createElement("input");
				inputunit.id="productList["+length+"].unit" ;
				inputunit.type="text";
				inputunit.name="productList["+length+"].unit" ;			
				inputunit.className="form-control";			
				inputunit.style.width="80px";
				inputunit.readOnly= true;
				unitCell.appendChild(inputunit);
				
				var fourthCell=row.insertCell(4);
				var inputQty=document.createElement("input");
				inputQty.id="productList["+length+"].quantity";
				inputQty.type="text";
				inputQty.name="productList["+length+"].quantity";		
				inputQty.className="form-control";
				inputQty.onblur=function(){calSubTotal(this.id);};
				inputQty.onkeypress=function(){return isNumberKey(this);};
				inputQty.style.width="80px";
				inputQty.style.textAlign="right";
				fourthCell.appendChild(inputQty);
				
				var fifthCell=row.insertCell(5);
				var inputUnitPrice=document.createElement("input");
				inputUnitPrice.id="productList["+length+"].unitPrice";
				inputUnitPrice.type="text";
				inputUnitPrice.name="productList["+length+"].unitPrice";			
				inputUnitPrice.className="form-control";	
				inputUnitPrice.onblur=function(){calSubTotal(this.id);};
				inputUnitPrice.onkeypress=function(){return isNumberKey(this);};
				inputUnitPrice.style.width="80px";
				inputUnitPrice.style.textAlign="right";
				fifthCell.appendChild(inputUnitPrice);
				
			
			  		
				var sixCell=row.insertCell(6);
				var inputTotal=document.createElement("input");
				inputTotal.id="productList["+length+"].itemTotal";
				inputTotal.type="text";
				inputTotal.name="productList["+length+"].itemTotal";			
				inputTotal.className="form-control";
				inputTotal.style.width="80px";
				inputTotal.style.textAlign="right";
				sixCell.appendChild(inputTotal);
				
				  var eigthCell = row.insertCell(7);
		       	  var inputbutton1 = document.createElement("input");
			      inputbutton1.type = "button";
			      inputbutton1.name = "productList["+length+"].btndel";
			      inputbutton1.id = "productList["+length+"].btndel";       	
			      inputbutton1.value="-"; 		
			      inputbutton1.className="btn btn-danger";
			      inputbutton1.onclick=function(){delrow(this.id);};
			      eigthCell.appendChild(inputbutton1);
				
					
					var seventhCell=row.insertCell(8);
					var inputSubTotal=document.createElement("input");			
					inputSubTotal.type="hidden";
					inputSubTotal.id="productList["+length+"].exSubTotal";
					inputSubTotal.name="productList["+length+"].exSubTotal";	
					inputSubTotal.value="0.0";
					inputSubTotal.className="form-control";
					inputSubTotal.style.width="80px";			
					seventhCell.appendChild(inputSubTotal);
		
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
				 	document.getElementById("productList["+length+"].unit").value = "";
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
	             // alert("Counter Before While="+counter);
			    while(counter<last)
				 {
				next = counter;
			 	next++;
			 	//alert("Counter In While="+counter);
			 	var inputSrNo = document.getElementById("productList["+next+"].srNo");
			 	inputSrNo.id = "productList["+counter+"].srNo";
			 	inputSrNo.name =  "productList["+counter+"].srNo";
			 	inputSrNo.value =inputSrNo.value-1;
			 	
			// 	alert("Sr No="+inputSrNo.value );
			 	
			 	var inputItem = document.getElementById("itemCode"+next);
			 	inputItem.id = "itemCode"+counter;
			 	inputItem.name = "productList["+counter+"].itemCode";
			 	
			 //	alert("After Item COde");
			 	
			    var inputDes = document.getElementById("productList["+next+"].des");
			    inputDes.id = "productList["+counter+"].des";
			    inputDes.name ="productList["+counter+"].des";
			    
			 //   alert("After Des");
			    var inputunit = document.getElementById("productList["+next+"].unit");
			    inputunit.id = "productList["+counter+"].unit";
			    inputunit.name ="productList["+counter+"].unit";
			    
			 
				
			    var inputQuantity = document.getElementById("productList["+next+"].quantity");
			 	inputQuantity.id = "productList["+counter+"].quantity";
			 	inputQuantity.name ="productList["+counter+"].quantity";
			 	
			 //	alert("After inputQuantity");
			 	
			 	var inputUnit = document.getElementById("productList["+next+"].unitPrice");
			 	inputUnit.id = "productList["+counter+"].unitPrice";
			 	inputUnit.name ="productList["+counter+"].unitPrice";
			 
			 	
			 	var inputTotal = document.getElementById("productList["+next+"].itemTotal");
			 	inputTotal.id = "productList["+counter+"].itemTotal";
			 	inputTotal.name = "productList["+counter+"].itemTotal";	 			 	
			 	 
			 	
			 	
			 	var inputSubTotal = document.getElementById("productList["+next+"].exSubTotal");
			 	inputSubTotal.id = "productList["+counter+"].exSubTotal";
			 	inputSubTotal.name = "productList["+counter+"].exSubTotal";
			 	
			 	//alert("After inputSubTotal");
			 	
			 	btndel = document.getElementById("productList["+next+"].btndel");
			 	btndel.id = "productList["+counter+"].btndel";
			 	btndel.name = "productList["+counter+"].btndel";
			 	
			 	counter++;							 	
 			 
 			 } 			   				
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
	if(document.getElementById("applyTax").checked !=true)
	{
		document.getElementById("txtAmtPayble").value=finalTotal.toFixed(2);
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
	//alert("In Cal");	
	var id = document.getElementById(obj).id;	
	var index1 = id.indexOf("[") + 1;	
	var index2 = id.indexOf("]");
	var sr = id.slice(index1,index2);
	
	var taxType = document.getElementById("taxList["+sr+"].taxType");
	var selvalue = taxType.options[taxType.selectedIndex].value;
	//var selTax = taxType.options[taxType.selectedIndex].text;
	var index=0;	
	for(var i=0;i<=selvalue.length;i++)
		{
		  index=selvalue.indexOf("^");		
		}	
	var taxRate=selvalue.substring(0,index); 
	
	var discountedTotal = document.getElementById("txtDisTotal").value;	
	var taxAmt = (discountedTotal * taxRate) / 100;
	document.getElementById("taxList["+sr+"].txtTaxValue").value = taxAmt.toFixed(2);	
		
	/* document.getElementById("taxList["+sr+"].txtprevTaxType").value=selTax; */
	var prevTaxAmt=document.getElementById("taxList["+sr+"].txtPrevTax").value;
	//alert("prev Tax Amt :"+prevTaxAmt);
	document.getElementById("txtTaxTotal").value=((parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(prevTaxAmt))+parseFloat(taxAmt));
	document.getElementById("taxList["+sr+"].txtPrevTax").value = taxAmt.toFixed(2);
	//alert("sr :"+sr);	
	
	var preLTax=document.getElementById("taxList["+sr+"].txtprevLinkTax").value;
	//alert("Prev Linked Tax :"+preLTax);
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(preLTax)).toFixed(2);
	document.getElementById("taxList["+sr+"].txtprevLinkTax").value="0.0";
		//var taxRateCnt = document.getElementById("linkTCnt"+sr).value;
		//alert("Tax Rate counter="+taxRateCnt);
	 	var taxRateCnt = document.getElementById("linkTCnt"+sr).value;
		//alert("Tax Rate counter="+taxRateCnt);
	if(taxRateCnt==0)
		{		
		   document.getElementById("getTax"+sr).innerHTML="";		 	
		}
	
	else
		{	
		for(var i=1;i<=taxRateCnt;i++)
			{ 	   
				var linkedTaxRate = document.getElementById("serLTax"+i).value;
				//alert("linkedTaxAmt 14 = "+linkedTaxRate);
				var calSerTax=document.getElementById("taxList["+sr+"].txtTaxValue").value;
				var lTax=(calSerTax * linkedTaxRate) /100;				
				var serLinkedTax=document.getElementById("linkedTaxList["+i+"].serLinkedTax");
				serLinkedTax.value=lTax.toFixed(2);					
				serLinkedTax.id="linkedTax"+sr+""+i;
				//alert("serLinkedTax.id :"+serLinkedTax.id);		
				document.getElementById("taxList["+sr+"].txtprevLinkTax").value=(parseFloat(document.getElementById("taxList["+sr+"].txtprevLinkTax").value)+parseFloat(lTax)).toFixed(2);
				document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(lTax)).toFixed(2);
			
			}
		}
	
	var taxTotal=document.getElementById("txtTaxTotal").value;
	//alert("Total Tax :"+taxTotal);
	var index=taxTotal.indexOf(".");	
	var froundOfAmt=taxTotal.substring(index+1,taxTotal.length); 
	var taxTotalRound=taxTotal.substring(0,index); 
	//alert("taxTotalRound :"+taxTotalRound);	 
	var finalroundOfAmt=(froundOfAmt/100).toFixed(2);
	//alert("finalroundOfAmt :"+finalroundOfAmt);	
	var finalRound=1-finalroundOfAmt;
	//alert("finalRound :"+finalRound);	 
	 if(froundOfAmt>50)
		{
		  //  alert("In B's A");
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound)+1;
			document.getElementById("txtRoundOff").value="+ "+parseFloat(finalRound).toFixed(2);
		}
	else
		{
		// alert("In B's B");
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound);
			document.getElementById("txtRoundOff").value="- "+parseFloat(finalroundOfAmt).toFixed(2);
		}   
	//alert("After For IF");
	 
}
</script>
<script type="text/javascript">
function calDis()
{	
		
		 var tbl = document.getElementById("tableTax");	    
		 var length= ((tbl.rows.length)/2); 
		
		 for(var k=1;k<=length;k++)
			 {
			 if(document.getElementById("radio1").checked == true)
				{			
					var discount = document.getElementById("txtDiscount").value;		
					var subTotal = document.getElementById("txtSubTotal").value;			
					var disAmt = (subTotal * discount) / 100;			
					var total = parseFloat(subTotal) - parseFloat(disAmt);			
					document.getElementById("txtDisTotal").value = total.toFixed(2);
					document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value) + parseFloat(document.getElementById("taxList["+k+"].txtTaxValue").value) + parseFloat(document.getElementById("taxList["+k+"].txtprevLinkTax").value);
				}
				else if(document.getElementById("radio2").checked == true)
				{			
					var discount = document.getElementById("txtDiscount").value;					
					var subTotal = document.getElementById("txtSubTotal").value;			
					var disAmt = parseFloat(subTotal) - parseFloat(discount);			
					document.getElementById("txtDisTotal").value= disAmt.toFixed(2);
					document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value) + parseFloat(document.getElementById("taxList["+k+"].txtTaxValue").value) + parseFloat(document.getElementById("taxList["+k+"].txtprevLinkTax").value);
				}
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
		/* if(document.getElementById("radio1").checked == true)
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
		} */
		 var tbl = document.getElementById("tableTax");	    
		 var length= ((tbl.rows.length)/2); 	
		 
		 for(var k=1;k<=length;k++)
			 {
			 if(document.getElementById("radio1").checked == true)
				{			
					var discount = document.getElementById("txtDiscount").value;		
					var subTotal = document.getElementById("txtSubTotal").value;			
					var disAmt = (subTotal * discount) / 100;			
					var total = parseFloat(subTotal) - parseFloat(disAmt);			
					document.getElementById("txtDisTotal").value = total.toFixed(2);
					document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value) + parseFloat(document.getElementById("taxList["+k+"].txtTaxValue").value) + parseFloat(document.getElementById("taxList["+k+"].txtprevLinkTax").value);
				}
				else if(document.getElementById("radio2").checked == true)
				{			
					var discount = document.getElementById("txtDiscount").value;					
					var subTotal = document.getElementById("txtSubTotal").value;			
					var disAmt = parseFloat(subTotal) - parseFloat(discount);			
					document.getElementById("txtDisTotal").value= disAmt.toFixed(2);
					document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value) + parseFloat(document.getElementById("taxList["+k+"].txtTaxValue").value) + parseFloat(document.getElementById("taxList["+k+"].txtprevLinkTax").value);
				}
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
function validateForm()
{
	var srno = document.getElementById("productList[0].srNo").value;
	var itemCode = document.getElementById("itemCode0").value;
	var description = document.getElementById("productList[0].des").value;
	var quantity = document.getElementById("productList[0].quantity").value;
	var unitprice = document.getElementById("productList[0].unitPrice").value;
	var dis = document.getElementById("productList[0].discount").value;
	var tax = document.getElementById("productList[0].taxType").value;
	var total = document.getElementById("productList[0].itemTotal").value;
	
    if(document.frmPurchaseOrder.selSupplierName.value=="Select")
    {
      alert("Plz Select the Supplier name...");
      document.frmPurchaseOrder.selSupplierName.focus();
      return false;
    }
    
    else if(document.frmPurchaseOrder.txtPurchaseOrdNo.value=="")
    {
      alert("Purchase Order No Should not be Empty...");
      document.frmPurchaseOrder.txtPurchaseOrdNo.focus();
      return false;
    }
   
    else if(document.frmPurchaseOrder.txtPurcaseDate.value=="")
      {
          alert("Date field Should not be empty....");
          document.frmPurchaseOrder.txtPurcaseDate.focus();
          return false;
        }
    else if(document.frmPurchaseOrder.txtDueDate.value=="")
    {
        alert("Date field Should not be empty....");
        document.frmPurchaseOrder.txtDueDate.focus();
        return false;
      }
 
    
    else if(document.frmPurchaseOrder. txtAreaAddress.value=="")
    {
        alert("Address Should not be Empty....");
        document.frmPurchaseOrder. txtAreaAddress.focus();
        return false;
      }
    else if(srno=="")
    {
      alert("Plz Enter the Sr No.....");
      srno.focus();
      return false;
    }
    else if(itemCode=="Select")
    {
      alert("Plz Select The Item.....");
      //itemCode.focus();
      return false;
    }
    else if(description=="")
    {
      alert("Description field should not be empty.....");
      //description.focus();
      return false;
    }
    else if(quantity=="")
    {
      alert("Plz enter The Quantity.....");
      //qty.focus();
      return false;
    }
    else if(unitprice=="")
    {
      alert("Plz Enter The UnitPrice.....");
      //up.focus();
      return false;
    }
    else if(dis=="")
    {
      alert("Plz Enter The Discount.....");
      //dis.focus();
      return false;
    }
    else if(tax=="")
    {
      alert("Tax field should not be empty....");
      //tax.focus();
      return false;
    }
    else if(total=="")
    {
      alert("Total field should not be empty....");
      //total.focus();
      return false;
    }
    else if(document.frmPurchaseOrder.txtPubNotes.value=="")
    {
      alert("Public Note field should not be empty.....");
      document.frmPurchaseOrder.txtPubNotes.focus();
      return false;
    }
   
    else if(document.frmPurchaseOrder.txtVat.value=="")
    {
      alert("vat Should not be Empty...");
      document.frmPurchaseOrder.txtVat.focus();
      return false;
    }
    else if(document.frmPurchaseOrder.txtServiceTax.value=="")
    {
      alert("Service tax Should not be Empty...");
      document.frmPurchaseOrder.txtServiceTax.focus();
      return false;
    }
    else if(document.frmPurchaseOrder.txtEducation.value=="")
    {
      alert("Education tax Should not be Empty...");
      document.frmPurchaseOrder.txtEducation.focus();
      return false;
    }
    else if(document.frmPurchaseOrder.txtSecondHigherEduFee.value=="")
    {
      alert("Secondary education tax Should not be Empty...");
      document.frmPurchaseOrder.txtSecondHigherEduFee.focus();
      return false;
    }
    else if(document.frmPurchaseOrder.txtDiscount.value=="")
    {
      alert("Discount field Should not be Empty...");
      document.frmPurchaseOrder.txtDiscount.focus();
      return false;
    }
    else if(document.frmPurchaseOrder.txtTransportation.value=="")
    {
      alert("Trnsport cost  Should not be Empty...");
      document.frmPurchaseOrder.txtTransportation.focus();
      return false;
    }
    else if(document.frmPurchaseOrder.txtTotal.value=="")
    {
      alert("Grand Total Should not be Empty...");
      document.frmPurchaseOrder.txtTotal.focus();
      return false;
    }
    else if(document.frmPurchaseOrder.txtPvtNotes.value=="")
    {
      alert("Private Note field should not be empty.....");
      document.frmPurchaseOrder.txtPvtNotes.focus();
      return false;
    }
    else if(document.frmPurchaseOrder.txtSubtotal.value=="")
    {
      alert("Sub Total tax Should not be Empty...");
      document.frmPurchaseOrder.txtSubtotal.focus();
      return false;
    }
  
  }
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
function showUnitPrice(str,id)
{
var i=id.slice(8);
var xmlhttp;   
if (str=="")
  {
  	document.getElementById("itemCode"+i).innerHTML="";
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
xmlhttp.open("GET","retrievePurUnitPrice.do?productId="+str,true);
xmlhttp.send();
}
</script>
<script type="text/javascript">
function calculate(obj)
{
		//alert("in cal");
		//var fg=0;
		//var ln = document.getElementById("productList[0].taxType").length;
		//var optArrayTax = new Array(ln);
		//var xVal = 0;
		var id = document.getElementById(obj).id;
		//alert('id:'+id);
		var index1 = id.indexOf("[") + 1;
		//alert('index1:'+index1);
		var index2 = id.indexOf("]");
		//alert('index2:'+index2);
		var sr = id.slice(index1,index2);
		//alert('sr:'+sr);
		
		var qty = document.getElementById("productList["+sr+"].quantity").value;
		//alert('qty:'+qty);
		var up = document.getElementById("productList["+sr+"].unitPrice").value;
		//alert('up'+up);
		var discount = document.getElementById("productList["+sr+"].discount").value;
		var d = discount;
		
		var taxType = document.getElementById("productList["+sr+"].taxType");
			
		
		var seltext = taxType.options[taxType.selectedIndex].text;
		//alert('seltext:'+seltext);
		var selvalue = taxType.options[taxType.selectedIndex].value;
		if(qty!= '' && up != '' && d != '')
		{
				
				var cal = qty * up;
				var subTotal = qty * up;
				discount = (cal * discount) / 100;
				//alert('discount:'+discount);
				cal = cal - discount;
				var taxAmt = (cal * selvalue) / 100;
				//alert('taxAmt'+taxAmt);
				cal = cal + taxAmt;
				//alert('cal'+cal);
				document.getElementById("productList["+sr+"].itemTotal").value = cal.toFixed(2);
				
				var prevtaxtyp = document.getElementById("productList["+sr+"].taxtyp").value;
				//alert('prevtaxtyp'+prevtaxtyp);
				var prevtaxamt = document.getElementById("productList["+sr+"].taxAmt").value;				
				//alert('prevtaxamt: '+prevtaxamt);				
				var prevdiscount = document.getElementById("productList["+sr+"].taxDiscount").value;
				//alert("prevDiscount="+prevdiscount);
				var prevSubtotal = document.getElementById("productList["+sr+"].subTotal").value;
				//alert("prevSubTotal="+prevSubtotal);
				
				document.getElementById("txtSubTotal").value= (((parseFloat(subTotal))+(parseFloat(document.getElementById("txtSubTotal").value))) - parseFloat(prevSubtotal)).toFixed(2);
				document.getElementById("txtDiscout").value= (((parseFloat(discount))+(parseFloat(document.getElementById("txtDiscout").value))) - parseFloat(prevdiscount)).toFixed(2);
				if (prevtaxtyp.slice(0,3) != seltext.slice(0,3)) 
				{
					//alert('Previous tax calculation');
					//alert('prevtaxtyp: '+prevtaxtyp);
					//alert('seltext:'+seltext);
					if(seltext.slice(0,3) == "No ")
						{
							if(prevtaxtyp.slice(0,3) == "Ser")
								{
									document.getElementById("txtServiceTax").value = (((parseFloat(document.getElementById("txtServiceTax").value))) - (parseFloat(prevtaxamt))).toFixed(2);
									
								}
							if(prevtaxtyp.slice(0,3) == "VAT")
							{
								document.getElementById("txtVat").value = (((parseFloat(document.getElementById("txtVat").value))) - (parseFloat(prevtaxamt))).toFixed(2);								   
							}
						}
					else
						{
							if(seltext.slice(0,3) == "VAT")
								{
									//alert('In VAT');
									if(prevtaxtyp.slice(0,3) == "Ser")
									{
										document.getElementById("txtServiceTax").value = (((parseFloat(document.getElementById("txtServiceTax").value))) - (parseFloat(prevtaxamt))).toFixed(2);								   
										document.getElementById("txtVat").value = (((parseFloat(document.getElementById("txtVat").value))) + (parseFloat(taxAmt))).toFixed(2);
									}									
									else
									{
										document.getElementById("txtVat").value = (((parseFloat(document.getElementById("txtVat").value))) + (parseFloat(taxAmt))).toFixed(2);
									}
								}
							else
								{
									//alert('In SER');
									if(prevtaxtyp.slice(0,3) == "VAT")
									{
										document.getElementById("txtVat").value = (((parseFloat(document.getElementById("txtVat").value))) - (parseFloat(prevtaxamt))).toFixed(2);								   
										document.getElementById("txtServiceTax").value = (((parseFloat(document.getElementById("txtServiceTax").value))) + (parseFloat(taxAmt))).toFixed(2);
									}
									else
									{
										document.getElementById("txtServiceTax").value = (((parseFloat(document.getElementById("txtServiceTax").value))) + (parseFloat(taxAmt))).toFixed(2);								   
									}								
								}																
						}										
					document.getElementById("productList["+sr+"].taxtyp").value = seltext;
					//alert('taxAmtdec'+taxAmt);
					
					document.getElementById("productList["+sr+"].taxAmt").value = taxAmt.toFixed(2);
				}
				//alert('discountdec:'+discount);
				document.getElementById("productList["+sr+"].taxDiscount").value = discount;
				//alert('subtotaldec:'+subTotal);
				document.getElementById("productList["+sr+"].subTotal").value = subTotal;
				document.getElementById("productList["+sr+"].itemTotal").value = cal.toFixed(2);
				var subTotal=0.0;
				var dicTotal=0.0;
				var mainTotal=0.0;
				
			 	//for(var v=0;v<calArrayTax.length;v++ )
				//{	
				 //alert(optArrayTax[v]+"="+calArrayTax[v]);
				//	if(calArrayTax[v]==null)
				//		{
						
				//		}
			//		else
			//			{
					//	alert(optArrayTax[v].substring(0,3));
				//			if(optArrayTax[v].substring(0,3)=="VAT")
					//			{
				//					document.getElementById("txtVat").value=calArrayTax[v].toFixed(2);
									//mainTotal=Float.parseFloat(mainTotal)+Float.parseFloat(calArrayTax[v]);
			//					}
			//				if(optArrayTax[v].substring(0,3)=="Ser")
		//					{
			//					document.getElementById("txtServiceTax").value=calArrayTax[v].toFixed(2);		
								//mainTotal=Float.parseFloat(mainTotal)+Float.parseFloat(calArrayTax[v]);
				//			} 
						
				//		}
				//document.getElementById("txtVat").value="calArrayTax[v].toFixed(2)";
				//	document.getElementById("txtServiceTax").value=calArrayTax[v].toFixed(2);
				 ///alert(optArrayTax[v]+"="+calArrayTax[v]);
		//	}
		//	 alert("Main Total="+mainTotal);
	//	document.getElementById("txtSubTotal").value=subTotal.toFixed(2);
	//	document.getElementById("txtDiscout").value=dicTotal.toFixed(2);
	//	mainTotal=Float.parseFloat(mainTotal)+Float.parseFloat(subTotal);
		
		//mainTotal=Float.parseFloat(mainTotal)-Float.parseFloat(dicTotal);
		//alert("Main Total=00");
		/* var txtVat=document.getElementById("txtVat").value;
		var txtDiscout=document.getElementById("txtDiscout").value;
		var txtSubTotal=document.getElementById("txtSubTotal").value;
		var txtServiceTax=document.getElementById("txtServiceTax").value;
		 */		 
	document.getElementById("txtTotal").value=((parseFloat(document.getElementById("txtVat").value)+parseFloat(document.getElementById("txtSubTotal").value)+parseFloat(document.getElementById("txtServiceTax").value))-parseFloat(document.getElementById("txtDiscout").value)).toFixed(2);
		
	  }		
		
	}
</script> 
<script>
function showDesc(str,id)
{
var i=id.slice(8);
var xmlhttp;   
if (str=="")
  {
  	document.getElementById("itemCode"+i).innerHTML="";
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
	  var j=id.slice(8);
	  document.getElementById("productList["+j+"].des").value=address.substring(0,index);    	
	  document.getElementById("productList["+j+"].unit").value=address.substring(index+1,address.length);
    }
  }
xmlhttp.open("GET","retrievePurDesc.do?productId="+str,true);
xmlhttp.send();
}
</script>
<script>
function showAdd(str,id)
{	
var xmlhttp;   
if (str=="")
  {
  	document.getElementById("selSupplierName").innerHTML="";  
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
	  //document.getElementById("txtAreaAddress").value=xmlhttp.responseText;
	document.getElementById("txtAreaAddress").value=address.substring(0,index);    	
	//document.getElementById("txtAreaShipto").value=address.substring(index+1,address.length);
	    }
  }
xmlhttp.open("GET","retrivePurAdd.do?venderId="+str,true);
xmlhttp.send();
}
</script>
<script>
function showBankNo(str,id)
{	
var xmlhttp;   
if (str=="")
  {
  	document.getElementById("selSupplierName").innerHTML="";  
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
	document.getElementById("bankAcNo").value=xmlhttp.responseText;    	
	    }
  }
xmlhttp.open("GET","retriveBankAcNo.do?venderId="+str,true);
xmlhttp.send();
}
</script>
<!-- 
<script type="text/javascript">
function calculateDate()
{
	var x=2;
	var due = document.frm1.calduedate.value;
	//alert("date="+due);
	var currDate  = new Date(due);
  	var currDay   = currDate.getDate();
  	var currMonth = currDate.getMonth() + x;
  	var currYear  = currDate.getFullYear();
  	currDateStr = currMonth + "/" + currDay + "/" + currYear;
  	document.frm1.duedate.value = currDateStr;
  	
	/* var CurrentDate = new Date(due);
	CurrentDate.setMonth(CurrentDate.getMonth() + x);
	document.frm1.duedate.value = CurrentDate; */
}
</script>
 -->
 <script>
function showLinkedTax(str,obj)
{
<%-- 	alert("In Retrive Count :"+<%=count%>); --%>
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
	 //var i= lastRow - 1;
	 var row = tbl.insertRow(lastRow);
	 var length= ((tbl.rows.length+1)/2);
	// alert("Length="+length);
 	
 	 
 	var firstCell=row.insertCell(0);
	var inputTax = document.createElement("select");
	inputTax.type = "select";
	inputTax.id="taxList["+length+"].taxType";
	inputTax.name="taxList["+length+"].taxType";
	inputTax.className="form-control";
	inputTax.style.width='170px'; 
	//var newLength=(tbl.rows.length)-4;
//	alert("New Length="+newLength);
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
		inputTax.onchange=function(){showLinkedTax(this.value,this.id);checkTax(this.id);};/*onchange="showServiceTax(this.value,this.id,'0');"  */
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
	      //taxList[1].txtPrevTax taxList[1].txtprevTaxType
	      
	      var fourthCell = row.insertCell(3);
		  var inputPrevTax = document.createElement("input");
		  inputPrevTax.type = "hidden";
		  inputPrevTax.name = "taxList["+length+"].txtPrevTax";
		  inputPrevTax.id = "taxList["+length+"].txtPrevTax"; 	
		  inputPrevTax.value="0.0"; 		
		  inputPrevTax.className="form-control";
		  
		  inputPrevTax.onblur=function(){getvalue(this.value);};
		  fourthCell.appendChild(inputPrevTax);
		  fourthCell.style.display = "none";
		 /*  var fithCell = row.insertCell(4);
		  var inputPrevTaxType = document.createElement("input");
		  inputPrevTaxType.type = "text";
		  inputPrevTaxType.name = "taxList["+length+"].txtprevTaxType";
		  inputPrevTaxType.id = "taxList["+length+"].txtprevTaxType"; 	
		  inputPrevTaxType.value="No Tax @ 0.0"; 		
		  inputPrevTaxType.className="form-control";
		  inputPrevTaxType.onblur=function(){getvalue(this.value);};
		  fithCell.appendChild(inputPrevTaxType); */
		  
		  var fithCell = row.insertCell(4);
		  var inputPrevLinkTax = document.createElement("input");
		  inputPrevLinkTax.type = "hidden";
		  inputPrevLinkTax.name = "taxList["+length+"].txtprevLinkTax";
		  inputPrevLinkTax.id = "taxList["+length+"].txtprevLinkTax"; 	
		  inputPrevLinkTax.value="0.0"; 		
		  inputPrevLinkTax.className="form-control";
		  
		  inputPrevLinkTax.onblur=function(){getvalue(this.value);};
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
   // alert("id="+id);
	var index1 = id.indexOf("[") + 1;
	//alert("index1="+index1);
	var index2 = id.indexOf("]");
	//alert("index2="+index2);
	var sr = id.slice(index1,index2);
	//alert("sr="+sr);
	//alert("in del");
	
	var prevTaxAmt=document.getElementById("taxList["+sr+"].txtPrevTax").value;
	//alert("prev Tax Amt :"+prevTaxAmt);
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(prevTaxAmt)).toFixed(2);
	
	
	var preLTax=document.getElementById("taxList["+sr+"].txtprevLinkTax").value;
	//alert("Prev Linked Tax :"+preLTax);
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(preLTax)).toFixed(2);
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)+parseFloat(preLTax)).toFixed(2);
	document.getElementById("txtTaxTotal").value=(parseFloat(document.getElementById("txtTaxTotal").value)-parseFloat(preLTax)).toFixed(2);
	
	var taxTotal=document.getElementById("txtTaxTotal").value;
	//alert("Total Tax :"+taxTotal);
	var index=taxTotal.indexOf(".");	
	var froundOfAmt=taxTotal.substring(index+1,taxTotal.length); 
	var taxTotalRound=taxTotal.substring(0,index); 
	//alert("taxTotalRound :"+taxTotalRound);	 
	var finalroundOfAmt=(froundOfAmt/100).toFixed(2);
	//alert("finalroundOfAmt :"+finalroundOfAmt);	
	var finalRound=1-finalroundOfAmt;
	//alert("finalRound :"+finalRound);	 
	 if(froundOfAmt>50)
		{
		  //  alert("In B's A");
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound)+1;
			document.getElementById("txtRoundOff").value="+ "+parseFloat(finalRound).toFixed(2);
		}
	else
		{
		// alert("In B's B");
			document.getElementById("txtAmtPayble").value=parseFloat(document.getElementById("txtDisTotal").value)+parseFloat(taxTotalRound);
			document.getElementById("txtRoundOff").value="- "+parseFloat(finalroundOfAmt).toFixed(2);
		}   
	
	var tbl = document.getElementById("tableTax");
    var last = tbl.rows.length;
   // alert("last="+last);
    if(last==2)
   	{
    	var length1= ((tbl.rows.length)/2);
    	//alert("In Delete"+length);
    	 document.getElementById("taxList["+length1+"].taxType").options[0].selected=true;
    	 document.getElementById("taxList["+length1+"].txtTaxValue").value="0.0";   
    	 document.getElementById("taxList["+length1+"].txtPrevTax").value="0.0";
    	/*  document.getElementById("taxList["+length1+"].txtprevTaxType").value="No Tax @ 0.0"; */
    	 document.getElementById("taxList["+length1+"].txtprevLinkTax").value="0.0";
    	 document.getElementById("getTax"+sr).innerHTML="";
    	
   	}
    else
    {
    	
    /* var gettax=document.getElementById("getTax"+sr);
    alert("Get Tax="+gettax);  */
    var current = window.event.srcElement;		
    
	while ( (current = current.parentElement)  && current.tagName !="TR");   
    current.parentElement.removeChild(current);    
   // gettax.parentElement.removeChild(gettax);
   var del = ((sr-2)+parseInt(sr));
  // alert("DEL:" +del);
   
   document.getElementById("tableTax").deleteRow(del);
   
    
      
//	j--;
	    var counter = sr;
	   // alert("Counter Before While= "+counter+" Last:"+last/2);
	    while(counter<((parseInt(last/2))+1))
		{
	    	//alert("In while");
			next = parseInt(counter)+1;
			//alert("Counter in while "+counter);
	 		//next++;
	 		//alert("Next="+next);	 		
	 		
	 		var inputTax = document.getElementById("taxList["+next+"].taxType");
	 		inputTax.id = "taxList["+counter+"].taxType";
	 		inputTax.name = "taxList["+counter+"].taxType";
		 	//alert("After TaxType="+inputTax.id);
		 	
	 		var inputTaxValue = document.getElementById("taxList["+next+"].txtTaxValue");
	 		inputTaxValue.id = "taxList["+counter+"].txtTaxValue";
	 		inputTaxValue.name =  "taxList["+counter+"].txtTaxValue";	 
		 	//alert("After Tax Value="+inputTaxValue.id);	 	
		 	
		 	
		 	btndel = document.getElementById("taxList["+next+"].btndel");
			btndel.id = "taxList["+counter+"].btndel";
			btndel.name = "taxList["+counter+"].btndel";
			//alert("After Delete="+btndel.id);
			//alert("Counter="+counter); 			
			
			var inputPrevTax = document.getElementById("taxList["+next+"].txtPrevTax");
			inputPrevTax.id = "taxList["+counter+"].txtPrevTax";
			inputPrevTax.name =  "taxList["+counter+"].txtPrevTax";
			
			
			/* var inputPrevTaxType = document.getElementById("taxList["+next+"].txtprevTaxType");
			inputPrevTaxType.id = "taxList["+counter+"].txtprevTaxType";
			inputPrevTaxType.name =  "taxList["+counter+"].txtprevTaxType"; */
			
			
			var inputPrevLinkTax = document.getElementById("taxList["+next+"].txtprevLinkTax");
			inputPrevLinkTax.id = "taxList["+counter+"].txtprevLinkTax";
			inputPrevLinkTax.name =  "taxList["+counter+"].txtprevLinkTax";
			
			var linkedTax=document.getElementById("getTax"+next);
			//alert("Linked Tax TD="+linkedTax.id);
			linkedTax.id = "getTax" + counter;
			//alert("In Delete gettax="+linkedTax.id);	 
			
		 	counter++;
		 	//alert("After get tax counter="+counter);
		} 
    }    
}
function checkTax(obj)
{
	var i=1;
	    var id = document.getElementById(obj).id;	   
		var index1 = id.indexOf("[") + 1;		
		var index2 = id.indexOf("]");		
		var sr = id.slice(index1,index2);
		
		var tbl = document.getElementById("tableTax");
	    var length= ((tbl.rows.length)/2);
		for(i=1;i<=length;i++)
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

function getid(id)
{
	alert("Id "+id);
}
</script>
<script type="text/javascript">
function backPage()
{
	window.history.back();
}
function cancel()
{
	window.history.back();
}
</script>

</head>
<body style="overflow-x: hidden;">
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/bootstrap.js"></script>
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<!-- <div id="container"> -->
		<%@ include file="innerHeader.jsp" %>  
	
	<input type="hidden" name="hide" id="hidden" />
		<!-- <div class="container">  -->
		<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Purchase<small>&nbsp;Order</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="purchaseOrder.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
		<br>
		<form:form action="addPurchaseOrder.do" onsubmit="return validateForm()" name="frmPurchaseOrder" cssClass="form-inline" modelAttribute="purchaseOrder">
		<%-- <div class="col-md-12">
			<c:if test="${message==1}">                     
								<h4 class="msg-succ">
								Order Added Succesfully. 
								</h4> 
							</c:if>
							<c:if test="${message==0}">                     
								<h4 class="msg-error">
								Order Not Added Succesfully.
								</h4> 
							</c:if>
		</div> --%>
							<div class="col-md-12">
							<div class="panel panel-default">
							<div class="panel-body">
		<div class="row">
		<div class="col-md-6">
				<div class="row">
					<div class="col-md-4">
						<form:label path="selSupplierName">Vendor Name:</form:label>						
					</div> 
					<div class="col-md-3">
						<form:select path="selSupplierName" id="selSupplierName" cssClass="form-control" onchange="showAdd(this.value,this.id);showBankNo(this.value,this.id);"> 
							<option value="Select">---Select---</option> 
							<c:forEach items="${venderList}" var="venderList">
								<option value="${venderList.txtCustID}">${venderList.txtCustName} </option>													
						    </c:forEach>
						</form:select> 	
						<!-- <input type="text" name="bankAcNo"> -->
						<form:hidden path="bankAcNo"></form:hidden>
					</div>
				</div>						
			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-4">
					<form:label path="txtPurchaseOrdNo">Order&nbsp;No&nbsp;:</form:label>
					</div>				
					<div class="col-md-3">
					<input type="text" name="txtPurchaseOrdNo" class="form-control" readonly="readonly" style="width: 100px;" value="${orderId.txtPurchaseOrdNo}">
					</div>
				</div>		 
			</div>
			
		</div><br>
		<div class="row">
			<div class="col-md-6">
						<div class="row">
					<div class="col-md-4">
						<form:label path="txtPurcaseDate"> Date : </form:label>
					</div>
					<div class="col-md-3">
					<%
													DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
													Date date = new Date();
													String dt = dateFormat.format(date);
											%> 
						<input type="text" id="dp1" value="<%=dt %>" name="txtPurcaseDate" class="form-control" onchange="calculateDate()"/>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-4">
						<form:label cssStyle="vertical-align; top;" path="txtAreaAddress" >Due Date : </form:label>
					</div>
					<div class="col-md-3">
						<input type="text" id="dp2" name="txtDueDate" class="form-control" />
					</div>
				</div>
			</div>
		</div><br>
		<div class="row">
			<div class="col-md-6">
				<div class="row">
				<div class="col-md-4">
					<form:label cssStyle="vertical-align; top;" path="txtAreaAddress">Billing&nbsp;Address&nbsp;: </form:label>
				</div>
				<div class="col-md-3">
					<form:textarea path="txtAreaAddress" rows="2" cols="25" cssClass="form-control" onkeyup="textAreaAdjust(this)" style="overflow:hidden"></form:textarea>
				</div>
				</div>
			</div>			
		</div><br>
		<div class="table-responsive" style="width: 90%;"> 	
			<table class="table table-striped" id="tableID">
				<thead>
					<tr>
						<th>Sr No</th>
						<th>Item Name</th>
						<th>Description</th>
						<th>M.Unit</th>
						<th>Quantity</th>
						<th>Unit Price(INR)</th>
						<th>Total(INR)</th>
					</tr>
				</thead>
				<tbody>
				<%-- <c:forEach items="${purchaseOrder.productList}" var="pList"> --%>
					<tr>
						<td><input type="text" id="productList[0].srNo" name="productList[0].srNo" value="1"  class="form-control" style="width:50px;text-align: right;"></td>
						<td>
            						<select name="productList[0].itemCode" id="itemCode0" style="width:100px" class="form-control"  onchange="showDesc(this.value,this.id);showUnitPrice(this.value,this.id);">
									<%-- <option>${pList.itemCode}</option> --%>
									<option value="Select">----Select----</option>
												<c:forEach items="${productList}" var="productList">													
													<option value="${productList.productId}">${productList.txtName}</option>													
											    </c:forEach>				
							        </select>							        
            					</td>
									<td><input type="text" name="productList[0].des" id="productList[0].des" class="form-control"></td>
									<td><input type="text" name="productList[0].unit" readonly="readonly" id="productList[0].unit" class="form-control" style="width:80px;"></td>
									<td><input type="text" name="productList[0].quantity" id="productList[0].quantity" onkeypress="return isNumberKey(this)" onblur="calSubTotal(this.id)" class="form-control" style="width:80px;text-align: right;"></td>
									<td><input type="text" name="productList[0].unitPrice"	id="productList[0].unitPrice" onkeypress="return isNumberKey(this)" onblur="calSubTotal(this.id)" class="form-control" style="width:80px;text-align: right;"></td>
									<td><input type="text" name="productList[0].itemTotal" id="productList[0].itemTotal" class="form-control" style="width:80px;text-align: right;"></td>
									<td><input type="button" class="btn btn-danger" name="productList[0].btndel" id="productList[0].btndel" value="-" onclick="delrow(this.id);"></td>
								<td><input type="hidden" name="productList[0].exSubTotal" id="productList[0].exSubTotal" class="form-control" value="0.0" style="width:80px;text-align: right;"></td>
									
								</tr>							
							</table> 
							<input type="button" name="addRec" value="+ Add New Row" onClick="addRow()" class="btn btn-default btn-xs">
						</div><br>
		<div class="row">
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel-body">
						<ul class="nav nav-tabs">
                            <li class="active"><a href="#home" data-toggle="tab">Terms and Condition</a>
                            </li>
                            <li><a href="#profile" data-toggle="tab">Private Notes</a>
                            </li>
    	                    </ul>
                        <div class="tab-content">
                        	<div class="tab-pane fade in active" id="home">
                        		<p></p>
                        		<form:textarea path="txtPubNotes" cssClass="form-control" cols="28" rows="5"/>
                        	</div>
                        	<div class="tab-pane fade" id="profile">
                        		<p></p> 
                        		<form:textarea path="txtPvtNotes" cssClass="form-control" cols="28" rows="5"/>
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
						<!-- <div><input type="checkbox" name="ckhPer" id="ckhPer" onclick="calDis();">&nbsp;%&nbsp;
						<input type="checkbox" name="ckhAmount" id="ckhAmount" onclick="calDis();">&nbsp;Amount&nbsp;</div> -->
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
							<input type="checkbox" name="applyTax" id="applyTax" onclick="checkTaxes()" value="tax" /><label>&nbsp;Apply&nbsp;Tax</label>
						</div>
						</div>
						<div class="col-md-4"></div>
						<div class="col-md-5"></div>
					</div>
				</div>
				<div id="showTax" style="display: none;">
				<div><input type="button" name="addRec" value="+ Add New Row" onclick="addTax();" class="btn btn-default btn-xs"></div>

<div class="table-responsive" style="float: right;">
<table class="table" id="tableTax">
<tbody>
<tr>
<td> 
<select name="taxList[1].taxType" id="taxList[1].taxType" style="width:170px;" class="form-control" onchange="showLinkedTax(this.value,this.id);"> <!-- cal(this.id);showLinkedTax(this.value,this.id); -->
<option value="---Select---">---Select---</option>
<c:forEach items="${taxList}" var="taxList1">
<option value="${taxList1.taxRate}^${taxList1.taxId}">${taxList1.taxName}&nbsp;@&nbsp;${taxList1.taxRate}</option>
</c:forEach>
</select>
</td>
       	<!-- <td width="25px"></td> -->
<td><input type="text" id="taxList[1].txtTaxValue" name="taxList[1].txtTaxValue" value="0.0" style="width:130px;text-align:right;" class="form-control"  /></td>
<td><input type="button" class="btn btn-danger btn-xs" name="taxList[1].btndel" id="taxList[1].btndel" value="-" onclick="delTax(this.id)"></td>
<td style="display: none;"><input type="hidden" id="taxList[1].txtPrevTax" name="taxList[1].txtPrevTax" value="0.0" class="form-control" onblur="getvalue(this.value)"/></td>
<!-- <td><input type="text" id="taxList[1].txtprevTaxType" name="taxList[1].txtprevTaxType" value="No Tax @ 0.0" class="form-control" onblur="getvalue(this.value)"/></td> -->
<td style="display: none;"><input type="hidden" id="taxList[1].txtprevLinkTax" name="taxList[1].txtprevLinkTax" value="0.0" class="form-control" onblur="getvalue(this.value)" /></td>

<tr><td colspan="5" id="getTax1" ></td></tr>
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
						<label>Amount&nbsp;Payable&nbsp;: </label>
					</div>	
					<div class="col-md-5">
						<!-- <input type="text" name="txtamtPayable" value="0.0" id="txtamtPayable" class="form-control"/> -->
						<input type="text" name="txtAmtPayble" readonly="readonly" id="txtAmtPayble" class="form-control" value="0.0" onkeypress="return isNumberKey(this)"></input>
					</div>
				</div>
				</div>
									
			</div>
			</div>	
		<!-- </div> --><br>			
		<div class="col-md-12">			
				<button type="submit" class="btn btn-primary" name="btn" value="Save" data-toggle="tooltip" data-placement="top" title="Save">Save</button> 
				<a href="purchaseOrder.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Cancel"> Cancel</a>			
		</div>
		</div>
		</div>
		</div>
	</form:form>
</div>
<!-- </div> -->
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>