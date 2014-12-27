
<%@page language="java"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Incoming Enquiry(Sales)</title>
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
<script>
$(function() {
$( "#tabs" ).tabs();
});
</script>
<script>
function validateForm()
{  
	
	var srno = document.getElementById("enquiryDetails[0].srNo").value;
	var itemCode = document.getElementById("itemCode0").value;
	var description = document.getElementById("enquiryDetails[0].des").value;
	var qty = document.getElementById("enquiryDetails[0].quantity").value;
	 if(document.frmSalesEnquiry.txtEnqId.value=="")
    {
      alert("Enquiry Number Should not be Empty...");
      document.frmSalesEnquiry.txtEnqId.focus();
      return false;
    }
     else if(document.frmSalesEnquiry.txtCutName.value=="0")
    {
      alert("Customer Name should not be blank");
      document.frmSalesEnquiry.txtCutName.focus();
      return false;
    }
     else if(document.frmSalesEnquiry.txtDate.value=="")
     {
       alert("date should not be blank");
       document.frmSalesEnquiry.txtDate.focus();
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
      alert("Plz Select The Quantity.....");
      //qty.focus();
      return false;
    }
    else if(document.getElementById("txtPubNotes").value=="")
    {
      alert("Public Note field should not be empty.....");
      //document.frmSalesEnquiry.pubNotes.focus();
      return false;
    }
    else if(document.getElementById("txtPvtNotes").value=="")
    {
      alert("Private Note field should not be empty.....");
      //document.frmSalesEnquiry.priNotes.focus();
      return false;
    }
    /* else
    {
  	  alert("Data Inserted Successfully....");
  	} */
}    
</script>
 <script type="text/javascript">
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
         inputSrNo.name = "enquiryDetails["+length+"].srNo";
         inputSrNo.id = "enquiryDetails["+length+"].srNo";
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="itemCode"+length;
		inputItem.name = "enquiryDetails["+length+"].itemCode";
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
		
		var newLength=length-1;
		var ln = document.getElementById("itemCode"+newLength).length;
		for ( var k = 0; k < ln; k++)
		{
			var xVal = document.getElementById("itemCode"+newLength).options[k].value;
			var xText = document.getElementById("itemCode"+newLength).options[k].text;
			desc = document.getElementById("itemCode"+newLength).options[k].label;
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.className = "form-control";
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		secondCell.appendChild(inputItem);

		var thirdCell = row.insertCell(2);
		var inputDes = document.createElement("input");
		inputDes.type = 'text';
		inputDes.id ="enquiryDetails["+length+"].des";
		inputDes.name="enquiryDetails["+length+"].des";	
		inputDes.className = "form-control";
		thirdCell.appendChild(inputDes);
		
		var fourthCell = row.insertCell(3);
		var inputUnit = document.createElement("input");
		inputUnit.type = 'text';
		inputUnit.id ="unit"+length;
		inputUnit.name="unit"+length;
		inputUnit.style.width='80px';
		inputUnit.className = "form-control";
		inputUnit.readOnly=true;
		inputUnit.style.textAlign="center";
		fourthCell.appendChild(inputUnit);

		var fifthCell = row.insertCell(4);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.id = "enquiryDetails["+length+"].quantity";
		inputQty.name = "enquiryDetails["+length+"].quantity";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		fifthCell.appendChild(inputQty);
		
		var sixthCell = row.insertCell(5);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrow(this);};			
		sixthCell.appendChild(inputDelete);
	
	
	
	}	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('tableID');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Des,Quantity,btndel,next;		
		 if(last == 2)
			 {
			 	ItemCode = document.getElementById("itemCode"+length);
			 	Des = document.getElementById("enquiryDetails["+length+"].des");
			 	document.getElementById("unit"+length).value="";
			 	Quantity = document.getElementById("enquiryDetails["+length+"].quantity");			 	
			 	ItemCode.options[0].selected = true;
			 	Des.value = ""; 
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
 			 	
	 			 	txtSrNo = document.getElementById( "enquiryDetails["+next+"].srNo");
	 			 	txtSrNo.id =  "enquiryDetails["+counter+"].srNo";
	 			 	txtSrNo.name = "enquiryDetails["+counter+"].srNo";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 	
 				 	 			 	
 				 	ItemCode = document.getElementById("itemCode"+next);
 				 	ItemCode.id = "itemCode"+counter;
 				 	ItemCode.name = "enquiryDetails["+counter+"].itemCode";
 				 	
 			 	
 				 	Des = document.getElementById("enquiryDetails["+next+"].des");
 				 	Des.id =  "enquiryDetails["+counter+"].des";
 				 	Des.name = "enquiryDetails["+counter+"].des";
 				 	
 				 	var unit = document.getElementById("unit"+next);
 				 	unit.id =  "unit"+counter;
 				 	unit.name =  "unit"+counter;
 			 	
 				 	Quantity = document.getElementById("enquiryDetails["+next+"].quantity");
 				 	Quantity.id = "enquiryDetails["+counter+"].quantity";
 				 	Quantity.name = "enquiryDetails["+counter+"].quantity";
 				  			 	
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 	
 					counter++;
 							 	
 			 }
		 }
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
					if(item == '')
						{
							document.getElementById("enquiryDetails["+k+"].des").value = "";
							document.getElementById("unit"+k).value="";	
						}
 		 								
				}
			}		
		}
	}
</script>

<script>
function showDesc(str,id)
{
showMUnit(str,id);
var i=id.slice(8);
var xmlhttp;   
if (str==" ")
  {
  	document.getElementById("enquiryDetails["+i+"].des").innerHTML="";
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
    	document.getElementById("enquiryDetails["+i+"].des").value=xmlhttp.responseText;    	
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
  	document.getElementById("unit"+i).innerHTML="";
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
    	//alert("Fetched");
    }
  }
xmlhttp.open("GET","retrieveMUnit.do?productId="+str,true);
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


</script>

<script>
        $(document).ready(function(){ 
            $("submit").click(function(){
                var value=$("hideEnquiryID").val(); //it will get value of clicked button

                $("#txtCutName").load('GenerateQuotation.jsp?param='+value); //it will make ajax call to result.jsp by GET method
            });
        });
        </script>
 
<!-- <link rel="stylesheet" href="ccc/demo.css"> -->



<script>
function goBack()
{
	window.history.back();
}
</script>


<script type="text/javascript">
    hs.graphicsDir = 'highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>


</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<div class="container">
		<%@ include file="innerHeader.jsp" %>
			
				<!-- <div class="container"> -->
					<div class="col-md-12">
						<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-10">
						<ul class="breadcrumb">
							<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Enquiry</small>
		             	</ul>
		             	</div>
			             	<div class="col-md-2">
			             	<a href="enquiry.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="left" title="Back"> Back</a>
			             	</div>
		             	</div>
		             	</div>
		             </div>
				<br>		
				
				<div class="col-md-12">
				<form:form action="addEnquiry.do" name="frmSalesEnquiry" commandName="salesEnquiry" onsubmit="return validateForm()">
							<div class="panel panel-default">
							<div class="panel-body">
				
			  <div class="row">
			  	
				<div class="col-md-6">		
			  	<div class="row">
					<div class="col-md-4">
						<label>Customer Name:-</label>				
					</div>
					<div class="col-md-5">
					<select name="txtCutName" id="txtCutName" class="form-control">
						<option value="0">---Select Name---</option>						
						<c:forEach items="${customerList}" var="customerList"> 
						<option value="${customerList.txtCustID}">${customerList.txtCustName}</option>
						</c:forEach>
					</select>			
						<%-- <form:input path="txtCutName" id="txtCutName" cssClass="form-control" cssStyle="width:150px;"  onkeypress="return AllowCharacters(this);"></form:input> --%>
					</div>
				</div>
				</div>	
				<div class="col-md-6">		
			  	<div class="row"> 
					<div class="col-md-4">
				    	 <label>Enquiry No:-</label>
				    </div>
					<div class="col-md-8">								
						 <form:input path="txtEnqId" id="txtEnqId" cssClass="form-control"  cssStyle="width:100px;" readonly="true"></form:input>
					</div>						
				</div>		
				</div>  	
			</div>	
						<%
						DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
				     	Date date = new Date();	     
				     	String dt=dateFormat.format(date);
					%>			
					<br>	
					<div class="row">								
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-4">
											<label>Date&nbsp;:- </label>
										</div>
										<div class="col-md-5">
											<input type="text" id="date" value="<%=dt%>" name="txtDate" id="txtDate" class="form-control" >
										</div>
									</div>
								</div>								
							</div>						
						<!-- <div class="col-md-12">
							<div class="col-md-3">
								<label>	Date:-</label>
							</div>
							<div class="col-md-9">
								<input type="date" name="txtDate" class="form-control" style=""></input>
							</div>  
						</div> -->	<br>
									<div class="table-responsive" style="width: 80%;">
										<table id="tableID" class="table table-striped">
										<thead>
											<tr>
												<td align="center">Sr No</td>
												<td align="center">Item Code</td>
												<td align="center">Description</td>
												<td align="center">Unit</td>
												<td align="center">Quantity</td>
												<td></td>

											</tr>
										</thead>
										<tbody>
											<tr>

												<td><input type="text" name="enquiryDetails[0].srNo" value="1" id="enquiryDetails[0].srNo" style="width: 50px;text-align: right;" class="form-control" ></input></td>
												
												<td><select name="enquiryDetails[0].itemCode" id="itemCode0" onchange="showDesc(this.value,this.id);" class="form-control" >
												<option value="">---Select Code---</option>
												<!-- productList -->
												<c:forEach items="${productList}" var="productList">
													<option value="${productList.productId }">${productList.txtName }</option>
													</c:forEach>
													
												</select></td>
											
												<td><form:input path="enquiryDetails[0].des" id="enquiryDetails[0].des" cssClass="form-control"  ></form:input></td>
												<td><input type="text" id="unit0" class="form-control" readonly="readonly" style="text-align: center;width: 80px;"></td>
												<td><input type="text" name="enquiryDetails[0].quantity" id ="enquiryDetails[0].quantity" style="width: 80px;text-align: right;" class="form-control" ></input></td>
												<td> <input type="button" name="btndel0" id="btndel0"  value="-" onclick="delrow(this);" class="btn btn-danger"></td>

											</tr>											
											</tbody>
										</table>
										<div><input type="button" name="btnadd1" id="btnadd1" value="+ Add New Row" onclick="addRow();" class="btn btn-default btn-xs"></div>
									</div>
								<div>
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
					                                    <form:textarea rows="3" cols="25" path="txtPubNotes" id="txtPubNotes" cssClass="form-control"></form:textarea>
					                                </div> 
					                                <div class="tab-pane fade" id="profile">
					                                    <!-- <h4>Private Notes</h4> -->
					                                    <p></p>
					                                    <form:textarea rows="3" cols="25" path="txtPvtNotes" id="txtPvtNotes" cssClass="form-control"></form:textarea>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
							</div>
				</div><br>
				<div>
				<input type="submit" value="Save" data-toggle="tooltip" data-placement="top" title="Save" name="btn" class="btn btn-primary"> 		 						
				<a href="enquiry.do" class="btn btn-primary btn-large" data-toggle="tooltip" data-placement="top" title="Cancel"> Cancel</a>
			</div>	
		<!-- </div>	 -->
 <c:if test="${message==1}">                     
<h4 class="msg-succ">
<script>
	alert("Enquiry Added");
</script>
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error">
<script>
	alert("Enquiry Not Added");
</script>
</h4> 
</c:if>
            
     </div>
     </div>
     </form:form>
     </div>

</div>	
</div>
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js"/>"></script>
</body>
</html>
