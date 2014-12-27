<%@page language="java" import="java.sql.*"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%> 

<html>
<head>
<title>Edit Customer</title>

<link rel="stylesheet" href="<core:url value="/resources/font-awesome/css/font-awesome.min.css" />" />

<link rel="stylesheet" href="<core:url value="/resources/ccc/jquery-ui.css" />">
<script src="<core:url value="/resources/ccc/jquery-1.9.1.js" />"></script>
<script src="<core:url value="/resources/ccc/jquery-ui.js" />"></script>
<link rel="stylesheet" type="text/css" href="<core:url value="/resources/highslide/highslide.css"/>" />
<script type="text/javascript" src="<core:url value="/resources/highslide/highslide-with-html.js" />"></script>

<link rel="stylesheet" href="<core:url value="/resources/css/table.css" />">
<script src="<core:url value="/resources/js/jquery-1.10.2.js" />"></script>
<script src="<core:url value="/resources/js/bootstrap.js" />"></script>


<link href="<core:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css">
    <link href="<core:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
    <link href="<core:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    <link href="<core:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
    <script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
    <script src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>" type="text/javascript"></script>

  
    <link rel="stylesheet" href="<core:url value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css"/>">
     <script src="<core:url value="/resources/assets/plugins/jquery-2.0.3.min.js"/>"></script>
     <script src="<core:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<core:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"/>"></script> 

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
         inputSrNo.name = "customerDetails["+length+"].txtSrNo";
         inputSrNo.id ="customerDetails["+length+"].txtSrNo";/* "txtSrNo" + i; */    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
       //  alert("After Sr NO");
         
		var secondCell = row.insertCell(1);
		var inputCustomerName = document.createElement("input");
		inputCustomerName.type = "text";
		inputCustomerName.id ="customerDetails["+length+"].txtName";
		inputCustomerName.name = "customerDetails["+length+"].txtName";
		inputCustomerName.style.width='50px';
		inputCustomerName.className = "form-control";
		inputCustomerName.style.textAlign="right";
        firstCell.appendChild(inputCustomerName);
		
		var thirdCell = row.insertCell(2);
		var inputCon = document.createElement("input");
		inputCon.type = 'text';
		inputCon.id = "txtCon" + i;
		inputCon.name= "txtCon" + i;	
		inputCon.className = "form-control";
		thirdCell.appendChild(inputCon);
		
		var thirdCell = row.insertCell(3);
		var inputMail = document.createElement("input");
		inputMail.type = 'text';
		inputMail.id = "customerDetails["+length+"].txtMail";
		inputMail.name= "customerDetails["+length+"].txtMail";	
		inputMail.className = "form-control";
		thirdCell.appendChild(inputMail);

		var fourthCell = row.insertCell(4);
		var inputDesg = document.createElement("input");
		inputDesg.type = 'text';
		inputDesg.id = "customerDetails["+length+"].txtDes";
		inputDesg.name = "customerDetails["+length+"].txtDes";		
		inputDesg.style.width='80px';
		inputDesg.className = "form-control";
		inputDesg.style.textAlign="right";
		fourthCell.appendChild(inputDesg);
		
		var fifthCell = row.insertCell(5);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-primary";	
		inputDelete.onclick=function(){delrow(this);};			
		fifthCell.appendChild(inputDelete);
	
				
		
		/* var fifthCell = row.insertCell(5);
		var inputgetId = document.createElement("input");//getId(this.id);
		inputgetId.type = 'button';
		inputgetId.id = "enquiryDetails["+length+"].srNo";
		inputgetId.name = "enquiryDetails["+length+"].srNo";
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
 		 var txtSrNo,Name,Con,Mail,Desg,btndel,next,getId;
		// alert("Last Before Delete"+last);
		 if(last == 1)
			 {
			 CustomerName = document.getElementById("customerDetails["+length+"].txtName");
			 	Con = document.getElementById("txtCon" + i);
			 	Mail = document.getElementById("customerDetails["+length+"].txtMail");	
			 	Desg = document.getElementById("customerDetails["+length+"].txtDes");	
			 	Name.value ="";
			 	Con.value = ""; 
			 	Mail.value = "";
			 	Desg.value="";
			 	
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
 			 	
	 			 	txtSrNo = document.getElementById( "customerDetails["+length+"].txtSrNo");	 			 	
	 			 	txtSrNo.id =  "customerDetails["+length+"].txtSrNo";
	 			 	txtSrNo.name = "customerDetails["+length+"].txtSrNo";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 //	alert("Sr NO="+(txtSrNo.value));
 				 	//srNo++;
 			 	
 				 	 CustomerName = document.getElementById("customerDetails["+length+"].txtName");
 				 	CustomerName.id = "customerDetails["+length+"].txtName";
 				 	CustomerName.name = "customerDetails["+length+"].txtName";
 				 	//ItemCode.name = "itemCode"+counter;
 				 	
 				 	Con = document.getElementById("txtCon" + i);
 				 	Con.id = "txtCon" + i;
 				 	Con.name = "txtCon" + i;
 				 	
 				 	
 				 	Mail = document.getElementById("customerDetails["+length+"].txtMail");
 				 	Mail.id =  "customerDetails["+length+"].txtMail";
 				 	Mail.name = "customerDetails["+length+"].txtMail";
 			 	
 				 	Desg = document.getElementById("customerDetails["+length+"].txtDes");
 				 	Desg.id =  "customerDetails["+length+"].txtDes";
 				 	Desg.name = "customerDetails["+length+"].txtDes";
 			 	
 				 	
 			
 				 	btndel = document.getElementById("btndel"+next);
 				 	//alert(btndel.id);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
	 			 	
	 			 	
 					counter++;
 							 	
 			 
 			 }
		 }
 		 
         
	 }
	 
	 /* function populatdes(obj)
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
	 } */
</script>

<script>
function showCust()
{
	//var xmlhttp;
//if (str=="")
 // {
 // document.getElementById("txtHint").innerHTML="";
 // return;
 // }
//if (window.XMLHttpRequest)
 // {// code for IE7+, Firefox, Chrome, Opera, Safari
 // xmlhttp=new XMLHttpRequest();
 // }
//else
 // {// code for IE6, IE5
 // xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
 // }
//xmlhttp.onreadystatechange=function()
//  {
 /// if (xmlhttp.readyState==4 && xmlhttp.status==200)
   // {
    //document.getElementById("enqr").innerHTML=xmlhttp.responseText;
    //}
 //xmlhttp.open("GET","retriveEnquiryId.jsp?custID="+str,true);
//xmlhttp.send();
//}
// alert("show Enquiry");
 

  
function navigate(){
   // window.location = '/GenerateQuotation.jsp';
	//window.transfer("GenerateQuotation.jsp");
	document.location.href("GenerateQuotation.jsp");
}

</script>

<script>
<!-- function showDesc(str,id)
{alert("showDesc="+id);
	var srNo=id.slice(8);
	alert("showDesc="+str);
//alert(srNo);
srNo="Des"+srNo;

	//alert("ok");
var xmlhttp;   
if (str=="")
  {
  document.getElementById("ItemCode1").innerHTML="";
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
    document.getElementById(srNo).value=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","retrieveDesc.jsp?q="+str,true);
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
                var value=$("hideCustID").val(); //it will get value of clicked button

                $("#txtCutName").load('GenerateQuotation.jsp?param='+value); //it will make ajax call to result.jsp by GET method
            });
        });
        </script>
 
<!-- <link rel="stylesheet" href="ccc/demo.css"> -->





<script type="text/javascript">
    hs.graphicsDir = 'highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>


</head>
<body>
<div id="wrapper">
<%@ include file="../header.jsp" %>
	<div class="container">
		<%@ include file="innerHeader.jsp" %>
<br><form:form action="editCustomer.do"  commandName="customerEnquiry">
	<input type="hidden" id="hide" name="hide1"> 
	<div class="container">
					<div class="row">	         	            		       		
			            	<ol class="breadcrumb">
			             		<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Sales<small>&nbsp;Customer</small>          
			             </ol>	
			      </div><br>		
			  <div class="row">
			  	<div class="col-md-12">		
			  	<div class="col-md-10"> 
					<div class="col-md-2">
				    	 <label>Customer Name:-</label>
				    </div>
					<div class="col-md-3">								
						 <form:input path="txtCustName" cssClass="form-control"  cssStyle="width:100px;" readonly="readonly"></form:input>
					</div>						
			
					<div class="col-md-3">
						<label>Customer ID:-</label>				
					</div>
					<div class="col-md-3">			
						<form:input path="txtCustID" id="txtCustID" cssClass="form-control" cssStyle="width:150px;"  onkeypress="return AllowCharacters(this);"></form:input>
					</div>
					</div>	  	
				</div>
			</div>	<br>	
					<div class="row">								
								<div class="col-md-3">
									<div class="row">
										<div class="col-md-4">
							<label>	Date:-</label>
							</div>
										<div class="col-md-8">
							<input type="date" name="txtDate"style="width: 150px;" class="form-control" value="${addNewCustomer.txtDate}"></input>  
							</div>
									</div>
								</div>								
							</div>	<br>		
									<div class="table-responsive" style="width: 70%;">
										<table id="tableID" class="table table-striped">
										<thead>
											<tr>
												<td align="center">Sr No</td>
												<td align="center">Customer name</td>
												<td align="center">Con</td>
												<td align="center">Mail</td>
												<td align="center">Desg</td>
												<td></td>

											</tr>
										</thead>
										<tbody>
									
									
										
										<c:forEach items="${addNewCustomer.CustomerDetails}" var="CustomerDetails">
										
				 				<tr>

												<td><input type="text" name="CustomerDetails[${CustomerDetails.SrNo-1}].SrNo" value="${CustomerDetails.SrNo}" id="CustomerDetails[${CustomerDetails.SrNo-1}].SrNo" style="width: 50px;text-align: right;" class="form-control" ></input></td>
												
												<td><input type="text" name="CustomerDetails[${CustomerDetails.SrNo-1}].CustomerName" id="CustomerDetails[${CustomerDetails.SrNo-1}].CustomerName" class="form-control" >
												
											</td>
												<td><input type="text" name="CustomerDetails[${CustomerDetails.SrNo-1}].Con"  value="${CustomerDetails.con }"  id="CustomerDetails[${CustomerDetails.SrNo-1}].con" class="form-control"  ></input></td>
												<td><input type="text" name="CustomerDetails[${CustomerDetails.SrNo-1}].Mail"  value="${CustomerDetails.mail }"  id="CustomerDetails[${CustomerDetails.SrNo-1}].Mail" class="form-control"  ></input></td>
												<td><input type="text" name="CustomerDetails[${CustomerDetails.SrNo-1}].Desg"  value="${CustomerDetails.des }"  id ="CustomerDetails[${CustomerDetails.SrNo-1}].Desg" style="width: 80px;text-align: right;" class="form-control" ></input></td>
											
												<td> <input type="button" name="btndel${CustomerDetails.SrNo-1}" id="btndel${CustomerDetails.SrNo-1}"  value="-" onclick="delrow(this);" class="btn btn-primary"></td>
										
											</tr>
										</c:forEach>
										
											<%-- <tr>

												<td><input type="text" name="enquiryDetails[i].srNo" value="${enquiryDetails}" id="enquiryDetails[i].srNo" style="width: 50px;text-align: right;" class="form-control" ></input></td>
												
												<td><select name="enquiryDetails[i].itemCode" id="enquiryDetails[i].itemCode" onchange="showDesc(this.value,this.id)" class="form-control" >
												<option value="select">Select Code</option>
													<option value="CP001">Steel Cap</option>
													<option value="ST001">Steel Rod</option>	
													<option value="SW001">Screw</option>
													<option value="TP001">Taps</option>
														

												</select></td>
												
												<td><input type="text" name="enquiryDetails[i].des" id="enquiryDetails[i].des" class="form-control"  ></input></td>
												<td><input type="text" name="enquiryDetails[i].quantity" id ="enquiryDetails[i].quantity" style="width: 80px;text-align: right;" class="form-control" ></input></td>
												<td> <input type="button" name="btndel0" id="btndel0"  value="-" onclick="delrow(this);" class="btn btn-primary"></td>

											</tr>		 --%>									
											</tbody>
										</table>
										<div><input type="button" name="btnadd1" id="btnadd1" value="+" onclick="addRow();" class="btn btn-primary"></div>
									</div>
								<div>
								<br>
					<%-- <div id="tabs" style="height: 170px;">
						<ul>
							<li><a href="#tabs-1"><label>Public Notes</label></a></li>
							<li><a href="#tabs-2"><label>Private Notes</label></a></li>
							
							</ul>
							<div id="tabs-1" align="left" style="width:265px;">
							
							<b>Public Notes</b>
							<form:textarea rows="4" cols="25" path="txtPubNotes"></form:textarea>							
							
							</div>
							<div id="tabs-2" align="left" style="width:265px;">
							
							<b>Private Notes</b>
							<form:textarea rows="4" cols="25" path="txtPvtNotes"></form:textarea>
							
							</div>
							</div>		 --%>
							<%-- 
							 <div class="row">
									<div class="col-md-6">
					                    <div class="panel panel-default">
					                    <!--     <div class="panel-heading">
					                            Notes
					                        </div> -->
					                        <div class="panel-body">
					                            <ul class="nav nav-tabs">
					                                <li class="active"><a href="#home" data-toggle="tab">Public Notes</a>
					                                </li>
					                                <li><a href="#profile" data-toggle="tab">Private Notes</a>
					                                </li>
					                            </ul>
					                            <div class="tab-content">
					                                <div class="tab-pane fade in active" id="home">
					                                    <!-- <h4>Public Notes</h4> -->
					                                    <p></p>
					                                    <form:textarea rows="3" cols="25" path="txtPubNotes" cssClass="form-control"></form:textarea>
					                                </div> 
					                                <div class="tab-pane fade" id="profile">
					                                    <!-- <h4>Private Notes</h4> -->
					                                    <p></p>
					                                    <form:textarea rows="3" cols="25" path="txtPvtNotes" cssClass="form-control"></form:textarea>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
							</div>--%>	
							
				</div><br> 
				<div>
								<!-- <button name="btn" class="btn btn-primary"><i class="fa fa-floppy-o"></i>&nbsp;Save</button>
							 -->	 <input type="submit" value="Update" name="btn" class="btn btn-primary">		 						
								<input type="reset" value="Clear" name="btn" class="btn btn-primary">
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
</div>

</body>
</html>
