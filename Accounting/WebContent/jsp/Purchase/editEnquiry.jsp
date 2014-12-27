<%@page language="java" import="java.sql.*"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Purchase Enquiry</title>
<link rel="icon" href="<core:url value="/resources/images/favicon.ico" />" type="image/icon">
<link rel="icon" href="<core:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<core:url value="/resources/assets/css/jquery-ui.css" />" rel="stylesheet" type="text/css"/>
<link href="<core:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<core:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<core:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
<script src="<core:url value="/resources/js/jquery-1.10.2.js" />" ></script>
<script src="<core:url value="/resources/js/bootstrap.js" />" ></script>
<script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
     <script src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />"></script>
    <script src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>
	<script src="<core:url value="/resources/assets/js/jquery-ui.min.js" />"> </script>		

<link href="<core:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>	
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
<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>


<script type="text/javascript">
var i=1;
var j=1;
	function addRow() {


		var tbl = document.getElementById('tableID');
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
         inputSrNo.name = "purchasenquiryDetails["+length+"].srNo";
         inputSrNo.id = "purchasenquiryDetails["+length+"].srNo";/* "txtSrNo" + i; */    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
       //  alert("After Sr NO");
         
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="itemCode"+length;
		inputItem.name = "purchasenquiryDetails["+length+"].itemCode";
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
		 // alert("Before Len");
		var newLength=length-1;
		var ln = document.getElementById("itemCode"+newLength).length;
		//alert("Before For "+ln);	
		
		for ( var k = 0; k < ln; k++)

		{
			//alert("In For");
			var xVal = document.getElementById("itemCode"+newLength).options[k].value;
			var xText = document.getElementById("itemCode"+newLength).options[k].text;
			desc = document.getElementById("itemCode"+newLength).options[k].label;
			//alert("OK="+desc);
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.style.width="150px";
		inputItem.className = "form-control";
		secondCell.appendChild(inputItem);

		//alert("After Item");
		
		var thirdCell = row.insertCell(2);
		var inputDes = document.createElement("input");
		inputDes.type = 'text';
		inputDes.id ="purchasenquiryDetails["+length+"].des";
		inputDes.name="purchasenquiryDetails["+length+"].des";	
		inputDes.className = "form-control";
		thirdCell.appendChild(inputDes);

		var fourthCell=row.insertCell(3);
		var inputUnit=document.createElement("input");
		inputUnit.id="purchasenquiryDetails["+length+"].unit";
		inputUnit.type="text";
		inputUnit.name="purchasenquiryDetails["+length+"].unit";		
		inputUnit.className="form-control";
		
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
	
				
		
		/* var fifthCell = row.insertCell(5);
		var inputgetId = document.createElement("input");//getId(this.id);
		inputgetId.type = 'button';
		inputgetId.id = "purchasenquiryDetails["+length+"].srNo";
		inputgetId.name = "purchasenquiryDetails["+length+"].srNo";
		inputgetId.value="GetId";
		inputgetId.className="btn btn-primary";	
		inputgetId.onclick=function(){getId(this.id);};	  */
		
		fifthCell.appendChild(inputgetId);
		
		
		i++;
		  document.getElementById("hide").value=i;
		  //alert("hide:" +  document.getElementById("hide").value );
		
		
	}
	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('tableID');
 		 var last =(tbl.rows.length)-1;
 		 var txtSrNo,ItemCode,Des,Quantity,btndel,next,getId,unit;
		// alert("Last Before Delete"+last);
		 if(last == 1)
			 {
			 	ItemCode = document.getElementById("itemCode"+length);
			 	Des = document.getElementById("purchasenquiryDetails["+length+"].des");
			 	Quantity = document.getElementById("purchasenquiryDetails["+length+"].quantity");
			 	unit = document.getElementById("purchasenquiryDetails["+length+"].unit");
			 	ItemCode.value = 'select';
			 	Des.value = ""; 
			 	Quantity.value = "";
			 	unit.value="";
			 }
		 
		 else
		 {
			 var current = window.event.srcElement;				 		
			 while ( (current = current.parentElement)  && current.tagName !="TR");
       		 current.parentElement.removeChild(current);         
      			//  j--;       		
 			 var counter = obj.id.slice(6); 			
 			// alert("Counter="+counter);
      		
 			 while(counter<last)
 				 {
 				 	
 				 	//alert("Sr No="+srNo);
 				 	//alert("Last In While="+last);
 				 	next = counter;
 				 	next++;
 			 	
	 			 	txtSrNo = document.getElementById( "purchasenquiryDetails["+next+"].srNo");	 			 	
	 			 	txtSrNo.id =  "purchasenquiryDetails["+counter+"].srNo";
	 			 	txtSrNo.name = "purchasenquiryDetails["+counter+"].srNo";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 //	alert("Sr NO="+(txtSrNo.value));
 				 	//srNo++;
 			 	
 				 	var inputItem = document.getElementById("itemCode"+next);
 			 	inputItem.id = "itemCode"+counter;
 			 	inputItem.name = "itemCode"+counter;
 			 	
 				 	Des = document.getElementById("purchasenquiryDetails["+next+"].des");
 				 	Des.id =  "purchasenquiryDetails["+counter+"].des";
 				 	Des.name = "purchasenquiryDetails["+counter+"].des";
 			 	
 				 	Quantity = document.getElementById("purchasenquiryDetails["+next+"].quantity");
 				 	Quantity.id = "purchasenquiryDetails["+counter+"].quantity";
 				 	Quantity.name = "purchasenquiryDetails["+counter+"].quantity";
 				 	
 				 	unit = document.getElementById("purchasenquiryDetails["+next+"].unit");
 				 	unit.id = "purchasenquiryDetails["+counter+"].unit";
 				 	unit.name = "purchasenquiryDetails["+counter+"].unit";
 				 	//Quantity.name = "quantity"+counter;
 			 	
 			 	//btnadd = document.getElementById("btnadd"+next);
 			 	//btnadd.id = "btnadd" + counter;
 			 	//btnadd.name = "btnadd"+counter; 
 			 	
 				 	btndel = document.getElementById("btndel"+next);
 				 	//alert(btndel.id);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
	 			 	
	 			 	/* getId = document.getElementById("purchasenquiryDetails["+next+"].srNo");
 				 	//alert(getId.id);
 				 	getId.id = "purchasenquiryDetails["+counter+"].srNo";
 				 	getId.name = "purchasenquiryDetails["+counter+"].srNo";
 			 	
	 			 	 */
 					counter++;
 							 	
 			 
 			 }
		 }
 		 
         
	 }
	 
	 function populatdes(obj)
	 {
		// alert("Populatdes");
		 var index;
		 index= obj.id.slice(8);
		// alert("index"+index);
		 var des = document.getElementById("Des"+index);
		// alert("Des"+des.id);
		 if(obj.value=="select")
			{
				 des.value = "";
		 	}
		 else
			 {
		 		var desc = obj.value.split("-");
		 		//alert("code:"+desc[0]);
		 		//alert("des:"+desc[1]);
		 		des.value = desc[1];
		 		//obj.value = desc[0];
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

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">

function suc() {
	
    alert("Record Added Succesfully");
    //window.location.reload();
}
function unsuc() {
    alert("Record Not Added Succesfully");
    //window.location.reload();
}

function sucUpdate() {
	
    alert("Record Updated Succesfully");
}
function unsucUpdate() {
    alert("Record Not Updated Succesfully");
}
function confirmdelete()
{
	confirm("Do you Want to Delete The Record");		
}

function getId(gId)
{
	alert(gId);		
}

</script>

<script>
        $(document).ready(function(){ 
            $("submit").click(function(){
                var value=$("hideEnquiryID").val(); //it will get value of clicked button

                $("#txtCutName").load('GenerateQuotation.jsp?param='+value); //it will make ajax call to result.jsp by GET method
            });
        });
        </script>
 

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
    hs.graphicsDir = 'highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
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
	<!-- <div class="container"> -->
		<%@ include file="innerHeader.jsp" %>
<br>
	<input type="hidden" id="hide" name="hide1"> 
	<!-- <div class="container"> -->
					<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Edit<small>&nbsp;Enquiry</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="purchaseEnquiry.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div><br>	
		             <form:form action="updatePurchaseEnquiry.do" name="frmPurchaseEnquiry" onsubmit="return validateForm()" commandName="editEnquiry">
		      <div class="col-md-12">
							<div class="panel panel-default">
							<div class="panel-body">       	
			  <div class="row">
			  <div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<form:label path="supplierName">Vender&nbsp;Name&nbsp;: </form:label>
										</div>
										<div class="col-md-7">
											<%-- <form:input path="supplierName" cssClass="form-control"></form:input> --%>
											<form:select path="supplierName" cssClass="form-control" cssStyle="width:200px">  
												<option>${editEnquiry.supplierName}</option> 
												<option value="Select">---Select---</option>
												<core:forEach items="${venderList}" var="venderList">
													<option value="${venderList.txtCustID}">${venderList.txtCustName}</option>													
											    </core:forEach>
											</form:select>								
										</div>
									</div>
								</div>
			  					<div class="col-md-4">
									<div class="row">
										<div class="col-md-4">
											<form:label path="enqID">Enquiry&nbsp;No&nbsp;: </form:label>
										</div>
										<div class="col-md-8"> 
											<%-- <form:input path="enqID" cssClass="form-control" ></form:input> --%> 
											<form:input path="enqID" cssClass="form-control" readonly="true" cssStyle="width:100px"></form:input>
										</div>
									</div>
								</div>	
								
			</div>	<br>	
			<div class="row">								
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-5">
								<label>	Date:-</label>
							</div>
							<div class="col-md-5">
								<input type="text" name="enqDate" id="dp1" class="form-control" value="${editEnquiry.enqDate}"></input>
							</div>
						</div>
					</div>								
				</div>
						<br>
									<div class="table-responsive" style="width: 90%;">
										<table id="tableID" class="table table-striped">
										<thead>
											<tr>
												<th align="center">Sr No</th>
												<th align="center">Item Code</th>
												<th align="center">Description</th>
												<th align="center">Unit of Measure</th>
												<th align="center">Quantity</th>
												<th></th>
											</tr>
										</thead>
										<tbody>																									
										<core:forEach items="${editEnquiry.purchasenquiryDetails}" var="purchasenquiryDetails">										
				 				<tr>
												<td><input type="text" name="purchasenquiryDetails[${purchasenquiryDetails.srNo-1}].srNo" value="${purchasenquiryDetails.srNo }" id="purchasenquiryDetails[${purchasenquiryDetails.srNo-1}].srNo" style="width: 50px;text-align: right;" class="form-control" ></input></td>												
												<td><select name="purchasenquiryDetails[${purchasenquiryDetails.srNo-1}].itemCode" id="itemCode${purchasenquiryDetails.srNo-1}" onchange="showDesc(this.value,this.id)" class="form-control" style="width: 150px;"> 
												<option value="Select">---Select---</option>
												<option value="${purchasenquiryDetails.prodId}" selected="selected"> ${purchasenquiryDetails.itemCode} </option>
												<core:forEach items="${productList}" var="productList">
													<option value="${productList.productId}">${productList.txtName}</option>
											    </core:forEach>
												</select>
											</td>												
												<td><input type="text" name="purchasenquiryDetails[${purchasenquiryDetails.srNo-1}].des"  value="${purchasenquiryDetails.des}"  id="purchasenquiryDetails[${purchasenquiryDetails.srNo-1}].des" class="form-control"  ></input></td>
												<td><input type="text" name="purchasenquiryDetails[${purchasenquiryDetails.srNo-1}].unit"  value="${purchasenquiryDetails.unit}"  id="purchasenquiryDetails[${purchasenquiryDetails.srNo-1}].unit" class="form-control"  ></input></td>
												<td><input type="text" name="purchasenquiryDetails[${purchasenquiryDetails.srNo-1}].quantity"  value="${purchasenquiryDetails.quantity }"  id ="purchasenquiryDetails[${purchasenquiryDetails.srNo-1}].quantity" style="width: 80px;text-align: right;" class="form-control" ></input></td>
											
												<td> <input type="button" name="btndel${purchasenquiryDetails.srNo-1}" id="btndel${purchasenquiryDetails.srNo-1}"  value="-" onclick="delrow(this);" class="btn btn-danger"></td>
											</tr>
										</core:forEach>
											</tbody>
										</table>
										<div><input type="button" name="addRec" value="+ Add New Row" onClick="addRow()" class="btn btn-default btn-xs"></div>
									</div>
								<div>
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
					                            <div class="tab-content">
					                                <div class="tab-pane fade in active" id="home">
					                                    <!-- <h4>Public Notes</h4> -->
					                                    <p></p>
					                                    <form:textarea rows="5" cols="30" path="pubNotes" cssClass="form-control"></form:textarea>
					                                </div> 
					                                <div class="tab-pane fade" id="profile">
					                                    <!-- <h4>Private Notes</h4> -->
					                                    <p></p>
					                                    <form:textarea rows="5" cols="30" path="priNotes" cssClass="form-control"></form:textarea>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
							</div>	
							
				</div><br>
				<div>
								<input type="submit" value="Update" name="btn" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Update">
								<a href="purchaseEnquiry.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Cancel"> Cancel</a>
			</div>
		</div>
		</div>
		</div>
 <core:if test="${message==1}">                     
<h4 class="msg-succ">
Enquiry Updated Succesfully.
</h4>
</core:if>
<core:if test="${message==0}">                     
<h4 class="msg-error">
Enquiry Not Updated Succesfully.
</h4> 
</core:if>
 </form:form>
</div>	
<!-- </div> -->
<script src="<core:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>