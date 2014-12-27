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
<!-- <script type="text/javascript">
var i =1 ;
var j=1;

	   function addRow()
	    {		   
		   //alert("in row");
				var tbl = document.getElementById("tableID");
	       	     var lastRow = tbl.rows.length;
	        	 //var i= lastRow - 1;
	        	 var row = tbl.insertRow(lastRow);
	        	 var length=(tbl.rows.length)-2;
		    	//alert("Length="+length);
	 		j++;
			
	 		 var firstCell = row.insertCell(0);
	          var inputSrNo = document.createElement("input");
	          inputSrNo.type = "text";
	          inputSrNo.name = "purchasenquiryDetails["+length+"].srNo";
	          inputSrNo.id ="purchasenquiryDetails["+length+"].srNo";	  
	          inputSrNo.value=j;
	          inputSrNo.className="form-control";
	          inputSrNo.style.width='50px';
	          inputSrNo.style.textAlign="right";
	          firstCell.appendChild(inputSrNo);
	            
	        
	        var secondCell = row.insertCell(1);
	  		var inputItem = document.createElement("select");
	  		inputItem.type = "select";
	  		inputItem.id = "itemCode"+length;
	  		inputItem.name = "purchasenquiryDetails["+length+"].itemCode";	  		
	  		inputItem.className="form-control";
	  		//var test=("txtItem1" + i).value;	
	  		inputItem.onchange=function(){showDesc(this.value,this.id);};
	  		
	  		//var newLength=length;
	  		var newLength=length-1;
			var ln = document.getElementById("itemCode"+newLength).length;
	  		//alert("New Length="+newLength);
	  		var xVal=0;
	  		for ( var k = 0; k < ln; k++) 
	  		{
	  			//alert("In for="+ln);
	  			var xVal = document.getElementById("itemCode"+newLength).options[k].value;
				var xText = document.getElementById("itemCode"+newLength).options[k].text;
				desc = document.getElementById("itemCode"+newLength).options[k].label;
	  			//alert("OK="+desc);
	  			var opt = document.createElement("option");
	  			opt.text = xText;
	  			opt.value = xVal;
	  			inputItem.add(opt, null);
	  			
	  		}
	  		inputItem.style.width='150px';
	  		secondCell.appendChild(inputItem);
			
			var thirdCell=row.insertCell(2);
			var inputDes=document.createElement("input");
			inputDes.id="purchasenquiryDetails["+length+"].des" ;
			inputDes.type="text";
			inputDes.name="purchasenquiryDetails["+length+"].des" ;
			inputDes.className="form-control";
			thirdCell.appendChild(inputDes);

			var fourthCell=row.insertCell(3);
			var inputUnit=document.createElement("input");
			inputUnit.id="purchasenquiryDetails["+length+"].unit";
			inputUnit.type="text";
			inputUnit.name="purchasenquiryDetails["+length+"].unit";		
			inputUnit.className="form-control";
			inputUnit.style.width="80px";
			inputUnit.style.textAlign="right";
			fourthCell.appendChild(inputUnit);
			
			var fiftCell=row.insertCell(4);
			var inputQty=document.createElement("input");
			inputQty.id="purchasenquiryDetails["+length+"].quantity";
			inputQty.type="text";
			inputQty.name="purchasenquiryDetails["+length+"].quantity";		
			inputQty.className="form-control";
			inputQty.style.width="80px";
			inputQty.style.textAlign="right";
			fiftCell.appendChild(inputQty);
			
			
	          var sixCell=row.insertCell(5);
	       	  var inputbutton1 = document.createElement("input");
		      inputbutton1.type = "button";
		      inputbutton1.name = "btndel"+i;
		      inputbutton1.id = "btndel"+i;       	
		      inputbutton1.value="-"; 		
		      inputbutton1.className="btn btn-danger";
		      inputbutton1.onclick=function(){delrow(this);};
		      sixCell.appendChild(inputbutton1);
				
				 i++;
		
      } 
	   function delrow(obj)
		 {
		   		var tbl = document.getElementById('tableID');
	 		    var last = tbl.rows.length;	
	 		    //alert("Last="+last);
	 		    if(last == 2)
				 {
					document.getElementById("itemCode"+length).value ="Select";
				 	document.getElementById("purchasenquiryDetails["+length+"].des").value = "";
				 	document.getElementById("purchasenquiryDetails["+length+"].unit").value = "";
				 	document.getElementById("purchasenquiryDetails["+length+"].quantity").value = "";
				 }
			   else
			     {			
				   var current = window.event.srcElement;							 
				   while ( (current = current.parentElement)  && current.tagName !="TR");
		           current.parentElement.removeChild(current);	
	
	         	   j--;
	        
	               var counter = obj.id.slice(6);
	               //alert("Counter Before While="+counter);
 			    while(counter<last)
 				 {
 				next = counter;
 			 	next++;
 			 	//alert("Counter In While="+counter);
 			 	var inputSrNo = document.getElementById("purchasenquiryDetails["+next+"].srNo");
 			 	inputSrNo.id = "purchasenquiryDetails["+counter+"].srNo";
 			 	inputSrNo.name =  "purchasenquiryDetails["+counter+"].srNo";
 			 	inputSrNo.value =inputSrNo.value-1;
 			 	//alert("Sr No="+inputSrNo.value );
 			 	
 			 	var inputItem = document.getElementById("itemCode"+next);
 			 	inputItem.id = "itemCode"+counter;
 			 	inputItem.name = "itemCode"+counter;
 			 	
 			    var inputDes = document.getElementById("purchasenquiryDetails["+next+"].des");
 			    inputDes.id = "purchasenquiryDetails["+counter+"].des";
 			    inputDes.name ="purchasenquiryDetails["+counter+"].des";
 			    
 			   var inputUnit = document.getElementById("purchasenquiryDetails["+next+"].unit");
			 	inputUnit.id = "purchasenquiryDetails["+counter+"].unit";
			 	inputUnit.name ="purchasenquiryDetails["+counter+"].unit";
 			    
 			    var inputQuantity = document.getElementById("purchasenquiryDetails["+next+"].quantity");
 			 	inputQuantity.id = "purchasenquiryDetails["+counter+"].quantity";
 			 	inputQuantity.name ="purchasenquiryDetails["+counter+"].quantity";
 			 	
 			 	
 			 	 			 	
 			 	btndel = document.getElementById("btndel"+next);
 			 	btndel.id = "btndel"+counter;
 			 	btndel.name = "btndel"+counter;
 			 	
 			 	counter++;
 							 	
 			 
 			 }
		 }   
	 }	
	 
</script> -->

<!-- <script>
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
	  document.getElementById("purchasenquiryDetails["+j+"].des").value=address.substring(0,index);    	
	  document.getElementById("purchasenquiryDetails["+j+"].unit").value=address.substring(index+1,address.length);
    }
  }
xmlhttp.open("GET","retrievePurDesc.do?productId="+str,true);
xmlhttp.send();
}
</script>
 -->

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
					
					<!-- <div class="container">		 -->		<br>			
						<div class="col-md-12">
						<div class="panel">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;New<small>&nbsp;Production</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<button name="back" class="btn btn-primary btn-large" onclick="backPage()"><i class="fa fa-reply"></i> Back</button>
			             	</div>
		             	</div>
		             	</div>
		             </div>
							<br> 
							<form:form action="production.do" cssClass="form-inline" name="frmProduction" onsubmit="return validateForm()" modelAttribute="production" >							
							<div class="col-md-12">
							<div class="panel">
							<div class="panel-body">
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-4"> 
											<label>Production&nbsp;order ID&nbsp;: </label>
										</div>
										<div class="col-md-8">    
											<input type="text" name="productionID" class="form-control"  readonly="readonly" style="width: 100px;"/>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-5">
											<label>Sales&nbsp;order ID&nbsp;: </label>
										</div>
										<div class="col-md-7">
											<select name="sorderId" class="form-control">
												<option>---Select---</option>
											</select>							
										</div>
									</div>
								</div>								
							</div><br>
							<div class="row">								
								<div class="col-md-4">
									<div class="row">
										<div class="col-md-4">
											<label>Date&nbsp;: </label>
										</div>
										<div class="col-md-8">
											<input type="text" name="prodDate" id="dp1" class="form-control" >
										</div>
									</div>
								</div>																			
							</div>	
							<br>	
							<!-- <div class="row"> -->													
							<div class="table-responsive" style="width: 60px;">
										<table id="tableID" class="table table-striped">
										<thead>
											<tr>
												<td align="center">Sr No</td>
												<td align="center">Product</td>
												<td align="center">Description</td>
												<td align="center">Quantity</td>												
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="text" id="purchasenquiryDetails[0].srNo" name="purchasenquiryDetails[0].srNo" value="1"  class="form-control" style="width:50px;text-align: right;"></td>
												<td>												
    				        						<select name="purchasenquiryDetails[0].itemCode" id="itemCode0" class="form-control" style="width:150px" onchange="showDesc(this.value,this.id)">
													<option value="Select">---Select---</option>
												<c:forEach items="${productList}" var="productList">
													<option value="${productList.productId}">${productList.txtName}</option>
											    </c:forEach>
											        </select>
            									</td>
												<td><form:input path="purchasenquiryDetails[0].des" id="purchasenquiryDetails[0].des" cssClass="form-control"  ></form:input></td>
												<td><input type="text" name="purchasenquiryDetails[0].quantity" id="purchasenquiryDetails[0].quantity" class="form-control" style="width:80px;text-align: right;" onkeypress="return isNumberKey(this)"></td>											
												<td class="fnt"><input type="button" class="btn btn-danger" name="btndel0" id="btndel0" value="-" onclick="delrow(this);"></td>
											</tr>
											</tbody>
										</table>
										<div><input type="button" name="addRec" value="+ Add New Row" onClick="addRow()" class="btn btn-default btn-xs"></div>
							</div>
							<!-- </div> -->
							<br>
							<div>
								<button type="submit" class="btn btn-primary" name="btn" value="Save">SAVE</button>
								<button type="reset" class="btn btn-primary" name="btn">CLEAR</button>
							</div>
							<br>
					</div>
					</div>
					</div>	
					</form:form>
	</div>
	<!-- </div> -->
	
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>