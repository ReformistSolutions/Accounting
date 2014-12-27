<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@page import="java.text.SimpleDateFormat"%>
   <%@ page import="javax.servlet.*,java.text.*" %>
   <%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Purchase Enquiry</title>
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

<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

*{margin:0;padding:0;}

body{
  font-family:'Open Sans',sans-serif;
}
</style>
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
<script type="text/javascript">
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
	  		inputItem.onchange=function(){showDesc(this.value,this.id);checkProducts(this.id)};
	  		
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
 			 	inputItem.name = "purchasenquiryDetails["+counter+"].itemCode";
 			 	
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
	  document.getElementById("purchasenquiryDetails["+j+"].des").value=address.substring(0,index);    	
	  document.getElementById("purchasenquiryDetails["+j+"].unit").value=address.substring(index+1,address.length);
    }
  }
xmlhttp.open("GET","retrievePurDesc.do?productId="+str,true);
xmlhttp.send();
}
</script>

<script>
function checkProducts(id)
{
	var tbl = document.getElementById('tableID');
	var length = tbl.rows.length-1;
	var k=id.slice(8);
	alert("K="+k);
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
							document.getElementById("purchasenquiryDetails["+k+"].des").value = "";
							document.getElementById("unit"+k).value="";	
						}
				}
			}		
		}
	}
</script>
<style type="text/css">
.msg-succ{
color:green;
}
.msg-error{
color:red;
}
</style>
<script>
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
      alert("Vendor Name should not be blank");
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
function cancel()
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
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Purchase<small>&nbsp;Enquiry</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="purchaseEnquiry.do" data-toggle="tooltip" data-placement="left" title="Back" class="btn btn-primary btn-large"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
							<br> 
							<form:form action="addPurchaseEnquiry.do" cssClass="form-inline" name="frmPurchaseEnquiry" onsubmit="return validateForm()" modelAttribute="purchaseEnquiry" >
							<div class=col-md-12>
									<c:if test="${message==1}">                     
								<h4 class="msg-succ">
								Enquiry Added Succesfully.
								</h4> 
							</c:if>
							<c:if test="${message==0}">                     
								<h4 class="msg-error">
								Enquiry Not Added Succesfully.
								</h4> 
							</c:if>
							</div>
							<div class="col-md-12">
							<div class="panel panel-default">
							<div class="panel-body">
							<div class="row">
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-5">
											<form:label path="supplierName">Vendor&nbsp;Name&nbsp;: </form:label>
										</div>
										<div class="col-md-6">
											<%-- <form:input path="supplierName" cssClass="form-control"></form:input> --%>
											<form:select path="supplierName" cssClass="form-control"> 
												<option value="Select">---Select---</option> 
												<c:forEach items="${venderList}" var="venderList">
													<option value="${venderList.txtCustID}">${venderList.txtCustName}</option>													
											    </c:forEach>
											</form:select>								
										</div>
									</div>
								</div>	
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-4"> 
											<label>Enquiry&nbsp;No&nbsp;: </label>
										</div>
										<div class="col-md-8"> 
											<%-- <form:input path="enqID" cssClass="form-control" ></form:input> --%>   
											<input type="text" name="enqID" class="form-control" value="${enqID.enqID}" readonly="readonly" style="width: 100px;"/>
										</div>
									</div>
								</div>							
							</div><br>
							<div class="row">								
								<div class="col-md-5">
									<div class="row">
										<div class="col-md-5">
											<form:label path="enqID">Date&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<%
													DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
													Date date = new Date();
													String dt = dateFormat.format(date);
											%> 
											<input type="text" name="enqDate" id="dp1" class="form-control" value="<%=dt %>" >
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
												<th align="center">Sr No</th>
												<th align="center">Item Code</th>
												<th align="center">Description</th>
												<th align="center">Unit of Measure</th>
												<th align="center">Quantity</th>												
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="text" id="purchasenquiryDetails[0].srNo" name="purchasenquiryDetails[0].srNo" value="1"  class="form-control" style="width:50px;text-align: right;"></td>
												<td>												
    				        						<select name="purchasenquiryDetails[0].itemCode" id="itemCode0" class="form-control" style="width:150px" onchange="showDesc(this.value,this.id);checkProducts(this.id)">
													<option value="Select">---Select---</option>
												<c:forEach items="${productList}" var="productList">
													<option value="${productList.productId}">${productList.txtName}</option>
											    </c:forEach>
											        </select>
            									</td>
												<td><form:input path="purchasenquiryDetails[0].des" id="purchasenquiryDetails[0].des" cssClass="form-control"  ></form:input></td>
												<td><form:input path="purchasenquiryDetails[0].unit" id="purchasenquiryDetails[0].unit" cssClass="form-control" cssStyle="width:80px;text-align: right;" onkeypress="return isNumberKey(this)" /></td>
												<td><input type="text" name="purchasenquiryDetails[0].quantity" id="purchasenquiryDetails[0].quantity" class="form-control" style="width:80px;text-align: right;" onkeypress="return isNumberKey(this)"></td>											
												<td class="fnt"><input type="button" class="btn btn-danger" name="btndel0" id="btndel0" value="-" onclick="delrow(this);"></td>
											</tr>
											</tbody>
										</table>
										<div><input type="button" name="addRec" value="+ Add New Row" onClick="addRow()" class="btn btn-default btn-xs"></div>
							</div>
							<!-- </div> -->
							<br>
							 <div class="row">
									<div class="col-md-6">
					                    <div class="panel panel-default">
					                    <!--     <div class="panel-heading">
					                            Notes
					                        </div> -->
					                        <div class="panel-body">
					                            <ul class="nav nav-tabs">
					                                <li class="active"><a href="#home" data-toggle="tab">Terms and Condition</a>
					                                </li>
					                                <li><a href="#profile" data-toggle="tab">Private Notes</a>
					                                </li>
					                            </ul>
					                            <div class="tab-content">
					                                <div class="tab-pane fade in active" id="home">
					                                    <!-- <h4>Public Notes</h4> -->
					                                    <p></p>
					                                    <form:textarea rows="5" cols="30" path="pubNotes" id="pubNotes" cssClass="form-control"></form:textarea>
					                                </div> 
					                                <div class="tab-pane fade" id="profile">
					                                    <!-- <h4>Private Notes</h4> -->
					                                    <p></p>
					                                    <form:textarea rows="5" cols="30" path="priNotes" id="priNotes" cssClass="form-control"></form:textarea>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
							</div>																				
							<br>
							<div>
								<button type="submit" class="btn btn-primary" name="btn" data-toggle="tooltip" data-placement="top" title="Save" value="Save">Save</button>
								<a href="purchaseEnquiry.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Cancel"> Cancel</a>
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