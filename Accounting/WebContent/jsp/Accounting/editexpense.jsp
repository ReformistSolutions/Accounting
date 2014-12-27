<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();             
         });
</script>

<script type="text/javascript">
	var i=1;
	var j=1;
	
	function addRowWaste() {

		

		var tbl = document.getElementById('expense');
		var lastRow = tbl.rows.length; //changed last row to static
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		var j=length;
		j++;

		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";       
         inputSrNo.name = "expenseDetailsList["+length+"].txtSrNo1";
         inputSrNo.id = "expenseDetailsList["+length+"].txtSrNo1";    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
         
		var secondCell = row.insertCell(1);
		var inputItem = document.createElement("select");
		inputItem.type = "select";
		inputItem.id ="expenseDetailsList["+length+"].txttype";
		inputItem.name = "expenseDetailsList["+length+"].txttype";
		inputItem.onchange=function(){showDesc(this.value,this.id);};
		
		var newLength=length-1;
		var ln = document.getElementById("expenseDetailsList["+newLength+"].txttype").length;
		
		for ( var k = 0; k < ln; k++)

		{
			var xVal = document.getElementById("expenseDetailsList["+newLength+"].txttype").options[k].value;
			var xText = document.getElementById("expenseDetailsList["+newLength+"].txttype").options[k].text;
			desc = document.getElementById("expenseDetailsList["+newLength+"].txttype").options[k].label;
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputItem.add(opt, null);
		}
		inputItem.className = "form-control";
		secondCell.appendChild(inputItem);

		var thirdCell = row.insertCell(2);
		var inputRemark = document.createElement("input");
		inputRemark.type = 'text';
		inputRemark.id = "expenseDetailsList["+length+"].remark";
		inputRemark.name = "expenseDetailsList["+length+"].remark";		
		inputRemark.style.width='110px';
		inputRemark.className = "form-control";
		inputRemark.style.textAlign="right";
		thirdCell.appendChild(inputRemark);
		var fourthCell = row.insertCell(3);
		var inputQty = document.createElement("input");
		inputQty.type = 'text';
		inputQty.onblur=function(){calSubTotal(this.id);};
		inputQty.id = "expenseDetailsList["+length+"].txtamount";
		inputQty.name = "expenseDetailsList["+length+"].txtamount";		
		inputQty.style.width='80px';
		inputQty.className = "form-control";
		inputQty.style.textAlign="right";
		fourthCell.appendChild(inputQty);
		
		var fifthCell = row.insertCell(4);
		var inputExamt = document.createElement("input");
		inputExamt.type = 'hidden';
		inputExamt.id = "txtexamount"+length;
		inputExamt.name = "txtexamount"+length;		
		inputExamt.style.width='80px';
		inputExamt.value="0.0";
		inputExamt.className = "form-control";
		inputExamt.style.textAlign="right";
		fifthCell.appendChild(inputExamt);
		
		var sixthCell = row.insertCell(5);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrowWaste(this.id);};			
		sixthCell.appendChild(inputDelete);
	
		i++;
	
	}	 
	 function delrowWaste(obj)
	 {
		 var sr=obj.slice(6);
		 alert(sr);
		 var amt = document.getElementById("expenseDetailsList["+sr+"].txtamount").value;	
			alert("Amt :"+amt);
			var prevTot=document.getElementById("txttotal").value;	
			alert("pTot:"+prevTot);
			var exAmount=document.getElementById("txtexamount"+sr).value;
			alert("Ex Amt"+exAmount);
			var fTot=(parseFloat(prevTot)-parseFloat(exAmount));
			alert("fTot :"+fTot);
			document.getElementById("txttotal").value=fTot.toFixed(2);
			
		 var tbl = document.getElementById('expense');
 		 var last =tbl.rows.length;
 		 
 		 var txtSrNo,ItemCode,Remark,Quantity,Examount,btndel,next;		
		 if(last == 2)
			 {
			 	document.getElementById("expenseDetailsList["+length+"].expensetype").value = "Select";
			 	document.getElementById("expenseDetailsList["+length+"].rmark").value = "";
			 	document.getElementById("expenseDetailsList["+length+"].amount").value = "";
			 	document.getElementById("txtexamount"+length).value = "";
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
 			 	
	 			 	txtSrNo = document.getElementById( "expenseDetailsList["+next+"].txtSrNo1");
	 			 	txtSrNo.id =  "expenseDetailsList["+counter+"].txtSrNo1";
	 			 	txtSrNo.name = "expenseDetailsList["+counter+"].txtSrNo1";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 	
 				 	 			 	
 				 	ItemCode = document.getElementById("expenseDetailsList["+next+"].txttype");
 				 	ItemCode.id = "expenseDetailsList["+counter+"].txttype";
 				 	ItemCode.name = "expenseDetailsList["+counter+"].txttype";
 				 	
 			 	
 				 	Remark = document.getElementById("expenseDetailsList["+next+"].remark");
 				 	Remark.id =  "expenseDetailsList["+counter+"].remark";
 				 	Remark.name = "expenseDetailsList["+counter+"].remark"; 
 			 	
 				 	Quantity = document.getElementById("expenseDetailsList["+next+"].txtamount");
 				 	Quantity.id = "expenseDetailsList["+counter+"].txtamount";
 				 	Quantity.name = "expenseDetailsList["+counter+"].txtamount";
 				 	
 				 	Examount = document.getElementById("txtexamount"+next);
 				 	Examount.id = "txtexamount"+counter;
 				 	Examount.name = "txtexamount"+counter;
 				  			 	
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 	
 					counter++; 							 	 			 
 			 }
		 } 		          
	 }
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create New Expense</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>

 
             	<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"  rel="stylesheet" type="text/css"/>	
	<script type="text/javascript">
            $(document).ready(function () {            	
                $('#dp1').datepicker({
                    format: "yyyy-mm-dd"
                });
                
                $( document).ready(function() {
                 	  $('#dp1').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
                 	    $(this).datepicker('hide');
                 	});
                 	});
            });
             	</script>
<script type="text/javascript">
function backPage()
{
	window.history.back();
}
</script>
<script type="text/javascript">
function calSubTotal(obj)
{	
	var id = document.getElementById(obj).id;	
	var index1 = id.indexOf("[") + 1;	
	var index2 = id.indexOf("]");	
	var sr = id.slice(index1,index2);	
	
	var amt=document.getElementById("expenseDetailsList["+sr+"].txtamount").value;
	var prevTot=document.getElementById("txttotal").value;	
	
	var exAmount=document.getElementById("txtexamount"+sr).value; 
	
	var fTot=(parseFloat(prevTot)-parseFloat(exAmount));
	
	var ftotal=(parseFloat(fTot)+parseFloat(amt));     
	
	
	document.getElementById("txttotal").value=ftotal.toFixed(2);
	document.getElementById("txtexamount"+sr).value=amt;
}
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@include file="../header.jsp" %>
<div class="page-wrapper">	
<%@include file="innerHeader.jsp"%><br>
<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-10">
					<ul class="breadcrumb">
						 <li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;Create&nbsp;Expense<small></small>
		         	</ul>
		         </div>
		         <div class="col-md-2">
					<a href="createexpense.do" class="btn btn-primary btn-large"> Back</a>	
		         </div>
			</div>
		</div>
</div>
<form:form action="updateexpense.do" method="post" cssClass="form-inline" modelAttribute="ExpenseView" name="frmwarehouse"> 
<div class="col-md-12">
<div class="panel panel-default">                       
<div class="panel-body">
						<div class="row">
								<div class="col-md-6">
								<div class="row">
										<div class="col-md-5"> 
								<label>Expense ID:</label>
								</div>
								<div class="col-md-5"> 
								<form:input path="expid" id="expid" readonly="true"  class="form-control"></form:input>
								</div>
								</div>
								</div>
								</div><br>
							<div class="row">
								<div class="col-md-6">
								
									<div class="row">
										<div class="col-md-5"> 
											<label>Paid&nbsp;From&nbsp;Account:-</label>
										</div>
										<div class="col-md-5">  
											<select name="paidfrom" id="paidfrom" class="form-control" >
											
											<option value="${ExpenseView.paidfrom}">${ExpenseView.paidfrmaccno}</option>
											
											<c:forEach items="${expenselist1}" var="expenselist1">									
										               <option value="${expenselist1.txtNewAccNo}">${expenselist1.txtAccountName}</option>
									                        </c:forEach>
											</select>
											
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-5">
											<label>Expense Date:-</label>
										</div>
										<div class="col-md-5">  
															 <input type="text" id="dp1" value="${ExpenseView.expdate}" name="expdate" class="form-control" style="width: 160px;" />								
									</div>
								</div>								
							</div>
							</div><br>
												
					<div class="table-responsive" style="width: 70%;">
						<table id="expense" class="table table-striped">
							<tr>
								                            <th align="center">Sr No</th>
															<th align="center">Type Of Expense</th>
															<th align="center">Description</th>
															<th align="center">Amount</th>
															<th></th>
							</tr>
							                              <c:forEach items="${ExpenseView.expenseDetailsList}" var="expenseDetailsList">
										<tr>
							                             <td><input type="text" name="expenseDetailsList[${expenseDetailsList.txtSrNo1-1}].txtSrNo1" value="${expenseDetailsList.txtSrNo1 }" id="expenseDetailsList[${expenseDetailsList.txtSrNo1-1 }].txtSrNo1" class="form-control" style="width: 50px; text-align: right;" onkeypress="return isNumberKey(this)" value="1" /></td>
															<td><select name="expenseDetailsList[${expenseDetailsList.txtSrNo1-1}].txttype" id="expenseDetailsList[${expenseDetailsList.txtSrNo1-1}].txttype" onchange="showDesc(this.value,this.id)" class="form-control">
																	<option value="${expenseDetailsList.txttype}">${expenseDetailsList.typefrmaccno}</option>
																	<option value="Select">----Select----</option>
																	<c:forEach items="${expenselist}" var="expenselist">									
										                            <option value="${expenselist.txtNewAccNo}">${expenselist.txtAccountName}</option>
									                                 </c:forEach>
															</select></td>															
															<td><input type="text" name="expenseDetailsList[${expenseDetailsList.txtSrNo1-1}].remark" value="${expenseDetailsList.remark}" id="expenseDetailsList[${expenseDetailsList.txtSrNo1-1}].remark" class="form-control" style="text-align: right; width: 110px;" /></td>
															<td><input type="text" name="expenseDetailsList[${expenseDetailsList.txtSrNo1-1}].txtamount" value="${expenseDetailsList.txtamount}" id="expenseDetailsList[${expenseDetailsList.txtSrNo1-1}].txtamount" class="form-control" style="text-align: right; width: 80px;" onblur="calSubTotal(this.id)" /></td>
															<td><input type="hidden" name="txtexamount${expenseDetailsList.txtSrNo1-1}" id="txtexamount${expenseDetailsList.txtSrNo1-1}" value="${expenseDetailsList.txtamount}" class="form-control" style="text-align: right; width: 80px;"/></td>
															<td class="fnt"><input type="button" id="btndel${expenseDetailsList.txtSrNo1-1}" name="btndel${expenseDetailsList.txtSrNo1-1}" class="btn btn-danger" value="-" onclick="delrowWaste(this);"></td>
														</tr>
                                                     </c:forEach>
													</table>
													<input type="button" name="addWasteRec" class="btn btn-default btn-xs" value="+ Add New Row" onclick="addRowWaste()">
												</div>
												<br>
												<div>
												<br>
												<label>Total:</label>
												</div>
												<div Class="Col-md-5">
											    <div>
												<form:input path="txttotal" cssClass="form-control"></form:input>
												</div>
												</div><br>
												
												
												<div>
													<label>Narration</label>
												</div>
												<div>
													<textarea name="narration" rows="4" cols="35 value="" class="form-control" >${ExpenseView.narration}</textarea>
												</div>
												<br>
												<br>
												<div>
													<button type="submit" class="btn btn-primary" name="btn"
														value="Update">Update</button>
													<a href="createexpense.do" class="btn btn-primary btn-large"> Cancel</a>

												</div>
												</div>
												</div>
												</div>
											</form:form>

</div>
</div>
<script src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
</body>
</html>