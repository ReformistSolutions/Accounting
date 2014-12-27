
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <script type="text/javascript">
	var i=1;
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
         inputSrNo.name = "journalDetails["+length+"].txtSrNo";
         inputSrNo.id = "journalDetails["+length+"].txtSrNo";/* "txtSrNo" + i; */    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
         firstCell.appendChild(inputSrNo);
		
                
		var secondCell = row.insertCell(1);
		var inputaccount = document.createElement("select");
		inputaccount.type = "select";
		inputaccount.id ="journalDetails["+length+"].txtAccountName";
		inputaccount.name = "journalDetails["+length+"].txtAccountName";
		
		var newLength=length-1;
		var ln = document.getElementById("journalDetails["+newLength+"].txtAccountName").length;
			
		
		for ( var k = 0; k < ln; k++)

		{
		
			var xVal = document.getElementById("journalDetails["+newLength+"].txtAccountName").options[k].value;
			var xText = document.getElementById("journalDetails["+newLength+"].txtAccountName").options[k].text;
			desc = document.getElementById("journalDetails["+newLength+"].txtAccountName").options[k].label;
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputaccount.add(opt, null);
		}
		inputaccount.className = "form-control";
		inputaccount.style.width="100px";
		secondCell.appendChild(inputaccount);

		var thirdCell = row.insertCell(2);
		var inputtype = document.createElement("select");
		inputtype.type = "select";
		inputtype.id ="journalDetails["+length+"].txtType";
		inputtype.name = "journalDetails["+length+"].txtType";
		
		var newLength=length-1;
		var ln = document.getElementById("journalDetails["+newLength+"].txtType").length;
			
		
		for ( var k = 0; k < ln; k++)

		{
		
			var xVal = document.getElementById("journalDetails["+newLength+"].txtType").options[k].value;
			var xText = document.getElementById("journalDetails["+newLength+"].txtType").options[k].text;
			desc = document.getElementById("journalDetails["+newLength+"].txtType").options[k].label;
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputtype.add(opt, null);
		}
		inputtype.className = "form-control";
		thirdCell.appendChild(inputtype);
		
		
		var fourthCell = row.insertCell(3);
		var inputAmt = document.createElement("input");
		inputAmt.type = 'text';
		inputAmt.onblur=function(){amount(this.id);};
		inputAmt.id = "journalDetails["+length+"].txtAmount";
		inputAmt.name = "journalDetails["+length+"].txtAmount";		
		inputAmt.style.width='80px';
		inputAmt.className = "form-control";
		inputAmt.style.textAlign="right";
		fourthCell.appendChild(inputAmt);
		
		
		
		var sixthCell = row.insertCell(4);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" +length;
		inputDelete.name = "btndel" +length;
		inputDelete.value="-";
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function(){delrow(this.id);};			
		sixthCell.appendChild(inputDelete);
	
		var fifthCell = row.insertCell(5);
		var inputhideamt = document.createElement("input");
		inputhideamt.type = 'hidden';
		inputhideamt.id = "hiddenAmount"+length;
		inputhideamt.name = "hiddenAmount"+length;		
		inputhideamt.style.width='80px';
		inputhideamt.value="0.0";
		inputhideamt.className = "form-control";
		inputhideamt.style.textAlign="right";
		fifthCell.appendChild(inputhideamt);
		i++;
	
	}	 
	 function delrow(obj)
	 {
		 var sr=obj.slice(6);
		 var accounttype=document.getElementById("journalDetails["+sr+"].txtType").value;
		 
		 if(accounttype=="C")
			 {
		 var amt = document.getElementById("journalDetails["+sr+"].txtAmount").value;	
			
			var prevcramt=document.getElementById("txtCreditAmount").value;
			
			var hideAmount=document.getElementById("hiddenAmount"+sr).value;
			
			var fcramt=(parseFloat(prevcramt)-parseFloat(hideAmount));
			
			document.getElementById("txtCreditAmount").value=fcramt.toFixed(2);
		}
		 
		 else if(accounttype=="D")
			 {
			 var amt = document.getElementById("journalDetails["+sr+"].txtAmount").value;	
				
				var prevdramt=document.getElementById("txtDebitAmount").value;
				
				var hideAmount=document.getElementById("hiddenAmount"+sr).value;
				
				var fdramt=(parseFloat(prevdramt)-parseFloat(hideAmount));
				
				document.getElementById("txtDebitAmount").value=fdramt.toFixed(2);
			 }
		 
		
		 var tbl = document.getElementById('tableID');
		 var last =tbl.rows.length;
 		
 		 var txtSrNo,Accountname,Type,Amount,Hideamount,btndel,next;		
		 if(last == 2)
			 {
			 	document.getElementById("journalDetails["+length+"].txtAccountName").value = "Select";
			 	document.getElementById("journalDetails["+length+"].txtType").value = "Select";
			 	document.getElementById("journalDetails["+length+"].txtAmount").value = "";
			 	document.getElementById("hiddenAmount"+length).value = "";
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
 			 	
	 			 	txtSrNo = document.getElementById( "journalDetails["+next+"].txtSrNo");
	 			 	txtSrNo.id =  "journalDetails["+counter+"].txtSrNo";
	 			 	txtSrNo.name = "journalDetails["+counter+"].txtSrNo";	 			 				 	 				 
 				 	txtSrNo.value =(txtSrNo.value)-1 ;
 				 	
 				 	 			 	
 				 	Accountname = document.getElementById("journalDetails["+next+"].txtAccountName");
 				 	Accountname.id = "journalDetails["+counter+"].txtAccountName";
 				 	Accountname.name = "journalDetails["+counter+"].txtAccountName";
 				 	
 			 	
 				 	Type = document.getElementById("journalDetails["+next+"].txtType");
 				 	Type.id =  "journalDetails["+counter+"].txtType";
 				 	Type.name = "journalDetails["+counter+"].txtType"; 
 			 	
 				 	Amount = document.getElementById("journalDetails["+next+"].txtAmount");
 				 	Amount.id = "journalDetails["+counter+"].txtAmount";
 				 	Amount.name = "journalDetails["+counter+"].txtAmount";
 				 	
 				 	
 				 	btndel = document.getElementById("btndel"+next);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
 			 	
	 			 	Hideamount = document.getElementById("hiddenAmount"+next);
 				 	Hideamount.id = "hiddenAmount"+counter;
 				 	Hideamount.name = "hiddenAmount"+counter;
 				  			 	
 					counter++; 							 	 			 
 			 }
		 } 		          
	 }
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>New Journal Entry</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accounts Chart</title>

<link href="<c:url value="resources/css/bootstrap.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />"
	rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />"
	rel="stylesheet" type="text/css">

<script
	src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />"
	type="text/javascript"></script>
<script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
            
             
         });
    </script>
    <link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"
	rel="stylesheet" type="text/css" />
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

<!-- <script>
function validateForm()
{
    if(document.frmJournalEntry.txtVchrNo.value=="")
    {
      alert(" Voucher No should be blank");
      document.frmJournalEntry.txtVchrNo.focus();
      return false;
    }
     else if(document.frmJournalEntry.txtDate.value=="")
    {
      alert("Date should not be empty");
      document.frmJournalEntry.txtDate.focus();
      return false;
    }
     else if(document.frmJournalEntry.txtAccountGroup.value=="-1")
     {
       alert("Account Group should not be empty..");
       document.frmJournalEntry.txtAccountGroup.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtdebit1.value=="")
     {
       alert("Debit Amount should not be empty..");
       document.frmJournalEntry.txtdebit1.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtcredit1.value=="")
     {
       alert("Credit Amount should not be empty..");
       document.frmJournalEntry.txtcredit1.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtDescription.value=="")
     {
       alert("Description should not be empty..");
       document.frmJournalEntry.txtDescription.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtTag.value=="")
     {
       alert("Email Id should not be empty..");
       document.frmJournalEntry.txtTag.focus();
       return false;
     }
    else{
    	alert("Data Insert Successfully...");
    }
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

     
     if((keycode >= 65 && kecode <= 90) || (keycode >= 97 && keycode <= 122) || (keycode == 32))
     {
         return true;
     }
    else
    {
        return false;
      }

  return false;   
}
 function validateEmail(sEmail) {
	  var reEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

	  if(!sEmail.match(reEmail)) {
	    alert("Invalid email address");
	    return false;
	  }

	  return true;

	}
	 
 function getID(id)
 {
	alert("Id="+id);	 
 }
 
 </SCRIPT> -->
 
 <!-- <SCRIPT>
 function addvalue(obj)
 {
	 var id = document.getElementById(obj).id;
		var index1 = id.indexOf("[") + 1;
		var index2 = id.indexOf("]");
		var sr = id.slice(index1,index2);
	    var tbl = document.getElementById('tableID');
	    var length=sr;
	    
	    
	    var preHidden=document.getElementById("journalDetails["+length+"].hiddenAmount").value;
     var accType=document.getElementById("journalDetails["+length+"].txtType").value;
	 var checkval=document.getElementById("journalDetails["+length+"].txtAmount").value;
	 if(checkval==0)
		 {
		 alert("Amount Should Not Empty...");
		 }
	 else{
		 
	 if(accType=="0")
		 {
		  alert("Please select Account type");
		  document.getElementById("journalDetails["+length+"].txtAmount").value=0.0;
		 }
	 else if(accType=="Debit"){
		
		 var prevtotal=document.getElementById("journalDetails["+length+"].hiddenAmount").value;
		
		 var totalamountDr=document.getElementById("txtDebitAmount").value;
		 
		 var finamount=((parseFloat(totalamountDr)) -(parseFloat(prevtotal))) ;
		 
		 document.getElementById("journalDetails["+length+"].hiddenAmount").value=0.0;
		 
		 document.getElementById("txtDebitAmount").value=parseFloat(finamount);
		 var demp=document.getElementById("txtDebitAmount").value;
		 
		 var drValue=document.getElementById("journalDetails["+length+"].txtAmount").value;
		
		 document.getElementById("journalDetails["+length+"].hiddenAmount").value=parseFloat(drValue);
		 
		 var preHidden=document.getElementById("journalDetails["+length+"].hiddenAmount").value;
		 add=document.getElementById("txtDebitAmount").value;
		
		 document.getElementById("txtDebitAmount").value=parseFloat(preHidden)+parseFloat(add);
		 var total=document.getElementById("txtDebitAmount").value;
		
	     }
	 else{		 
		 
		 var prevtotal=document.getElementById("journalDetails["+length+"].hiddenAmount").value;
		 
		 var totalamountDr=document.getElementById("txtCreditAmount").value;
		 
		 var finamount=((parseFloat(totalamountDr))-(parseFloat(prevtotal))) ;
		 
		 document.getElementById("journalDetails["+length+"].hiddenAmount").value=0.0;
		 
		 document.getElementById("txtCreditAmount").value=parseFloat(finamount);
		 var demp=document.getElementById("txtDebitAmount").value;
		 //alert("After Added Value"+demp);
		 
		 var crValue=document.getElementById("journalDetails["+length+"].txtAmount").value;
		 document.getElementById("journalDetails["+length+"].hiddenAmount").value=parseFloat(crValue);
			
		 var prehiddcr=document.getElementById("journalDetails["+length+"].hiddenAmount").value;
		 var add1=document.getElementById("txtCreditAmount").value;
		 
		 document.getElementById("txtCreditAmount").value=parseFloat(prehiddcr)+parseFloat(add1);
		 var finaltotal=document.getElementById("txtCreditAmount").value;
			 }
	 }
		 
 }
 </SCRIPT> -->

<!-- <script>
function validateForm()
{ 
	var srno = document.getElementById("journalDetails[0].txtSrNo").value;
	var accNo = document.getElementById("journalDetails[0].txtAccountName").value;
	//var type = document.getElementById("journalDetails[0].txtType").value;
	//var txtAmt = document.getElementById("journalDetails[0].txtAmount").value;
	
	 
    if(document.frmJournalEntry.txtjourid.value=="")
    {
      alert(" Journal Id should Not be blank....");
      document.frmJournalEntry.txtjourid.focus();
      return false;
    }
     else if(document.frmJournalEntry.txtDate.value=="")
    {
      alert("Date should not be empty....");
      document.frmJournalEntry.txtDate.focus();
      return false;
    }
     else if(document.frmJournalEntry.txtSource.value=="0")
     {
       alert("Source should not be empty....");
       document.frmJournalEntry.txtSource.focus();
       return false;
     }
          
    else if(srno=="")
    {
      alert("Plz Enter Sr.No ....");
      //srno.focus();
      return false;
    }
    else if(accNo=="0")
    {
      alert("Plz select the Account Name ....");
      //itemCode.focus();
      return false;
    }
   /*  else if(txtType=="0")
    {
    	  alert("Plz select the Type..");
          //itemCode.focus();
          return false;
    } */
    
   /*  else if(txtAmount >="0")
    	{
    	alert("Amount should not be empty..");
        //document.frmJournalEntry.txtCreditAmount.focus();
        return false;
    	} */
  
     else if(document.frmJournalEntry.txtCreditAmount.value <=0)
     {
       alert("Credit Amount should not be empty..");
       document.frmJournalEntry.txtCreditAmount.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtDebitAmount.value <=0)
     {
       alert("Debit Amount should not be empty..");
       document.frmJournalEntry.txtDebitAmount.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtDescription.value=="")
     {
       alert("Description should not be empty..");
       document.frmJournalEntry.txtDescription.focus();
       return false;
     }
     else if(document.frmJournalEntry.txtDebitAmount.value != document.frmJournalEntry.txtCreditAmount.value)
     {
    	 alert("Debit And Credit Value Should Not Match.....!!!");
    	 return false;
     }
    else
     {
    	alert("Data Insert Successfully...");
    	return true;
     }
}
</script> -->

<script>
function amount(obj)
{
	var id = document.getElementById(obj).id;	
	var index1 = id.indexOf("[") + 1;	
	var index2 = id.indexOf("]");
	
	var sr = id.slice(index1,index2);
	
	
    var amt=0;
    var ftotalcramt=0;
    var ftotaldramt=0;
    
	var accounttype=document.getElementById("journalDetails["+sr+"].txtType").value;
	if(accounttype=="C"){
		amt = document.getElementById("journalDetails["+sr+"].txtAmount").value;
		
		var prevcramt=document.getElementById("txtCreditAmount").value;
		
		var hideAmount=document.getElementById("hiddenAmount"+sr).value;
		
		var fcramt=(parseFloat(prevcramt)-parseFloat(hideAmount));
		
	    ftotalcramt=(parseFloat(fcramt)+parseFloat(amt));
	    
		document.getElementById("txtCreditAmount").value=amt;
		
		document.getElementById("txtCreditAmount").value=ftotalcramt.toFixed(2);
		document.getElementById("hiddenAmount"+sr).value=amt;
		
	}
	else if(accounttype=="D"){
		amt = document.getElementById("journalDetails["+sr+"].txtAmount").value;
		
		var prevdramt=document.getElementById("txtDebitAmount").value;
		
		var hideAmount=document.getElementById("hiddenAmount"+sr).value;
		
		var fdramt=(parseFloat(prevdramt)-parseFloat(hideAmount));
		 ftotaldramt=(parseFloat(fdramt)+parseFloat(amt));
	    
		document.getElementById("txtDebitAmount").value=amt;
		
		document.getElementById("txtDebitAmount").value=ftotaldramt.toFixed(2);
		document.getElementById("hiddenAmount"+sr).value=amt;
	}
	
}
</script>
<script>
function countValue()
{
	var drAmount=document.getElementById("txtDebitAmount").value;
	var crAmount=document.getElementById("txtCreditAmount").value;
	//alert("DR"+drAmount);
	//alert("CR"+crAmount);
	if(drAmount == crAmount)
		{
		//alert("Value match");
		return true;
		
		}
	else
		{
		//alert("Credit and Debit Amount Should Not be Match");
		return false;
		 document.frmJournalEntry.txtDebitAmount.focus();
		 document.frmJournalEntry.txtCreditAmount.focus();
		}
}
</script>
<script>
	function back() {
		window.history.back();

	}
</script>
<script type="text/javascript">
function validateAmt()
{
	var debitAmt = document.getElementById("txtDebitAmount").value;
	var creditAmt = document.getElementById("txtCreditAmount").value;
	if(creditAmt != debitAmt)
	{
		alert("Credit and Debit amount not match.");
		document.frmJournalEntry.txtjourid.focus();
		//document.frmJournalEntry.txtDebitAmount.focus();
		return false;
	}
	else
	{
		return true;
	}
}
</script>
</head>
<body>
	<div id="wrapper">
		<%@include file="../header.jsp"%>
		<div class="container">
			<%@include file="innerHeader.jsp"%> 
			<form:form action="newJournalHead.do" cssClass="form-inline" modelAttribute="newJournal" name="frmJournalEntry" onsubmit="return validateAmt();">
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small><i
											class="fa fa-2x fa-table"></i></small>&nbsp;New Journal Entry</li>
								</ul>
							</div>
							<div class="col-md-2">
								<a href="newJournalHead.do" class="btn btn-primary btn-large"> Back</a>
							</div>
						</div>
					</div>
				</div>
				<div>
				<c:if test="${message==1}">  
				<h4 class="msg-succ">
Journal Added Succesfully.
</h4>      
</c:if>

<c:if test="${message==0}">                     
<h4 class="msg-error">
     totalcreditamount and totaldebitamount should not be match.
</h4> 


</c:if>

				</div>
				<br>
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
						<div class="row">
							<div class="col-md-5">
								<label style="width:100px">Journal Id: </label>
								<form:input path="txtjourid" cssClass="form-control"
									readonly="true"></form:input>
							</div>	
							<div class="col-md-5">					
								<label style="width:103px">Date : </label> 
								<input type="text" id="dp1" name="txtDate" class="form-control" style="width: 160px;" />
																
								
								<!-- <input type="date" name="txtDate"
									class="form-control"></input> -->

							</div>
							</div>

							<br>
								<div class="row">
							   <div class="col-md-5">
								<label style="width:100px">Source : </label>
								
								<form:select path="txtSource" cssClass="form-control">
									<option value="0">----Select----</option>
									<option>Sales</option>
									<option>Purchase</option>
									<option>C</option>
									<option>D</option>
								</form:select>
								
								</div>	
								</div>		
															
							</div>
							<br>
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									style="width: 70%;" id="tableID">
									<thead>
										<tr>
											<th>Sr No :</th>
											<th>Account Name</th>
											<th>Type</th>
											<th>Amount</th>
											<th>Action</th>
											
										</tr>
									</thead>
									<tbody>

										<tr>
											<td><input class="form-control" name="journalDetails[0].txtSrNo" id="journalDetails[0].txtSrNo" value="1" style="width: 50px; text-align: right;"></input></td>
											<td>
												<!-- <input class="form-control" name="journalDetails[0].txtAccountName" id="journalDetails[0].txtAccountName"style="text-align: right;"></input> -->
												<form:select path="journalDetails[0].txtAccountName" id="journalDetails[0].txtAccountName" cssClass="form-control" cssStyle="width:100px;">
													<option value="0">--Select Name--</option>
													<c:forEach items="${accountlist}" var="accountlist">
													<option value="${accountlist.txtNewAccNo}">${accountlist.txtAccountName}</option>
													</c:forEach>
												</form:select>

											</td>
											<td><select name="journalDetails[0].txtType" id="journalDetails[0].txtType"	onchange="showDesc(this.value,this.id)" class="form-control">
													<option value="0">--Select--</option>
													<option value="D">Debit</option>
													<option value="C">Credit</option>
											</select></td>
											<td><input class="form-control"	name="journalDetails[0].txtAmount" id="journalDetails[0].txtAmount"  style="text-align: right; width: 80px;" onblur="amount(this.id)"></input></td>
											
											<td><input type="button" class="btn btn-danger" name="btndel0" id="btndel0" value="-" onclick="delrow(this.id);"></td>
											<td><input type="hidden" class="form-control"	name="hiddenAmount0" id="hiddenAmount0" value="0" style="text-align: right;"></input></td>
										</tr>
									</tbody>
								</table>
								
								<div class="btn-group">
									<input type="button" name="btnadd1" id="btnadd1" value="+ Add New Row" onclick="addRow()" class="btn btn-default btn-xs">

								</div><hr>
								<div class="row">
							<div class="col-md-5">
							 <label style="width:100px">Total Credit : </label>
								<form:input path="txtCreditAmount" id="txtCreditAmount" cssClass="form-control" readonly="true"></form:input>
								</div>
								<div class="col-md-5">
								<label style="width:100px">Total Debit : </label>
								<form:input path="txtDebitAmount" id="txtDebitAmount" cssClass="form-control" readonly="true"></form:input>
							 </div>
							<br>
							</div><br>
							<%-- <div class="row">
							<div class="col-md-5">
							 <label style="width:100px">Total : </label>
								<form:input path="txtTotal" cssClass="form-control" readonly="true"></form:input>
								</div>
								<div class="col-md-5">
								<label style="width:100px">Total Debit : </label>
								<form:input path="txtDebitAmount" cssClass="form-control" readonly="true"></form:input>
							 </div>
							<br>
							</div> --%>
							</div>
								<div class="page-header"></div>
								<div class="row first-column">
									<div class="col-md-4">
										<div class="row">
											<div class="col-md-4">
												<label>Description: </label>
												<form:textarea path="txtDescription" rows="4" cols="35" cssClass="form-control"></form:textarea>
											</div>
										</div>
									</div>

								</div><br>
								<center>
							<div class="row">
							    <div class="col-md-5">
	<input type="submit" name="btn" value="Save" class="btn btn-primary">
 	<!-- <button id="submit" name="btn" value="Save" class="btn btn-primary">Save</button> -->
 <a href="newJournalHead.do" class="btn btn-primary btn-large"> Cancel</a>
							    </div>
							</div>
								</center>
								
								<div class="row first-column">
									<div class="col-md-4">
										<div class="row">
											<div class="col-md-4">
												&nbsp;&nbsp;
										
												
											</div>
										</div>
									</div>

								</div>
									<br>
								
								
							</div>
						</div>
				
</form:form>					
				</div>

		</div>
		<script
		src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>
		
</body>
</html>