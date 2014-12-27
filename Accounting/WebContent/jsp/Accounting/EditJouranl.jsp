<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	var i=2;
	var j=1;
	
	function addRow() {
			
		
		var tbl = document.getElementById('tableID');
		var lastRow = tbl.rows.length; //changed last row to static
		//alert("add lastRow:"+lastRow);
		var row = tbl.insertRow(lastRow);
		var length=(tbl.rows.length)-2;
		//alert("Length="+length);
		j=length+1;

		 var firstCell = row.insertCell(0);
         var inputSrNo = document.createElement("input");
         inputSrNo.type = "text";       
         inputSrNo.name = "journalDetails["+length+"].txtSrNo";
         inputSrNo.id = "journalDetails["+length+"].txtSrNo";/* "txtSrNo" + i; */    
         inputSrNo.value=j;
         inputSrNo.style.width='50px';
         inputSrNo.className = "form-control";
         inputSrNo.style.textAlign="right";
       //  inputSrNo.onblur=function(){getId(this.id);};
         firstCell.appendChild(inputSrNo);
		
		

		 var secondCell = row.insertCell(1);
         var inputAccountName= document.createElement("select");
         inputAccountName.type = "select";
         inputAccountName.name = "journalDetails["+length+"].txtAccountName";
         inputAccountName.id = "journalDetails["+length+"].txtAccountName";  
         
         inputAccountName.className="form-control";
         inputAccountName.style.textAlign="right";
        // inputAccountName.onblur=function(){getId(this.id);}
        var newLength=length-1;
        //alert("New Length="+newLength);
  		var ln = document.getElementById("journalDetails["+newLength+"].txtAccountName").length;
  		//alert("Before For Select AC Length "+ln);	
  		
  		for ( var k = 0; k <ln; k++)
  		{
  			//alert("In For AC Length="+ln);
  			var xVal = document.getElementById("journalDetails["+newLength+"].txtAccountName").options[k].value;
  			//alert("OK xVal="+xVal);
  			var xText = document.getElementById("journalDetails["+newLength+"].txtAccountName").options[k].text;
  			//alert("OK xText="+xText);
  			desc = document.getElementById("journalDetails["+newLength+"].txtAccountName").options[k].label;
  			//alert("OK="+desc);
  			var opt = document.createElement("option");
  			opt.text = xText;
  			opt.value = xVal;
  			inputAccountName.add(opt, null);
  		} 
  		secondCell.appendChild(inputAccountName);
		
        //alert("After Name Length="+length); txtcredithidden
        var thirdCell = row.insertCell(2);
 		var inputType = document.createElement("input");
 		inputType.type = "input";
 		inputType.id ="journalDetails["+length+"].txtCreditBal";
 		inputType.name = "journalDetails["+length+"].txtCreditBal";
 		//inputType.onchange=function(){showDesc(this.value,this.id);};
 		inputType.onblur=function(){addAmountCredit(this.id);};
 		
 		
 		inputType.className = "form-control";
 		thirdCell.appendChild(inputType);
         
		var fourthCell = row.insertCell(3);
		var inputAmount = document.createElement("input");
		inputAmount.type = 'text';
		inputAmount.id = "journalDetails["+length+"].txtAmount";
		inputAmount.name ="journalDetails["+length+"].txtAmount";
		inputAmount.className="form-control";
		inputAmount.style.textAlign="right";
		inputAmount.onblur=function(){addAmountDebit(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		fourthCell.appendChild(inputAmount);
		
		//inputType.className = "form-control";
		 //forthCell.appendChild(inputType);
		
		 
		var fifthCell = row.insertCell(4);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "journalDetails["+length+"].btndel";
		inputDelete.name = "journalDetails["+length+"].btndel";
		inputDelete.value="-";	
		inputDelete.className="btn btn-danger";	
		inputDelete.onclick=function()
		{delrow(this.id);};
		fifthCell.appendChild(inputDelete);	
		
		var sixthCell = row.insertCell(5);
		var inputCrHidden = document.createElement("input");
		inputCrHidden.type = 'hidden';
		inputCrHidden.id = "journalDetails["+length+"].txtcredithidden";
		inputCrHidden.name ="journalDetails["+length+"].txtcredithidden";
		inputCrHidden.className="form-control";
		inputCrHidden.style.textAlign="right";
		inputCrHidden.value="0.0";
		//inputCrHidden.onblur=function(){addAmountCredit(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		sixthCell.appendChild(inputCrHidden);  
		
		var seventhCell = row.insertCell(6);
		var inputDrHidden = document.createElement("input");
		inputDrHidden.type = 'hidden';
		inputDrHidden.id = "journalDetails["+length+"].txtdebithidden";
		inputDrHidden.name ="journalDetails["+length+"].txtdebithidden";
		inputDrHidden.className="form-control";
		inputDrHidden.style.textAlign="right";
		inputDrHidden.value="0.0";
		//inputDrHidden.onblur=function(){addAmountDebit();};
		//inputAmount.onblur=function(){getId(this.id);}
		seventhCell.appendChild(inputDrHidden);  
	}
	function delrow(obj)
	 {
     	/*  var tbl = document.getElementById('tableID');
		 var last =(tbl.rows.length)-1;	 */
		  
		    var id = document.getElementById(obj).id;
			//alert('id:'+id);
			var index1 = id.indexOf("[") + 1;
			//alert('index1:'+index1);
			var index2 = id.indexOf("]");
			//alert('index2:'+index2);
			var sr = id.slice(index1,index2);
		    var length=sr; 
	 	    
		    //alert("Leghth"+length);
		    
		    var prevtot1=document.getElementById("txtCreditAmt").value;
		    alert("Total Value"+prevtot1);

		    var prevtot11=document.getElementById("txtdebitAmt").value;
		    alert("Total Value"+prevtot11);
		    
		    
		    
		    var prevHid=document.getElementById("journalDetails["+length+"].txtcredithidden").value;
		    alert("Prevoius Debit Value" +prevHid);
		    
		    var minusCredit=parseFloat(prevtot1)-parseFloat(prevHid);
		    alert("After Minus Value IS"+minusCredit);
		    document.getElementById("txtCreditAmt").value=parseFloat(minusCredit);
		    
		    var prevDrHidden=document.getElementById("journalDetails["+length+"].txtdebithidden").value;
		    alert("Prevoius Credit Value"+prevDrHidden);
     	    var minusDebit=parseFloat(prevtot11)-parseFloat(prevDrHidden);
       	    document.getElementById("txtdebitAmt").value=parseFloat(minusDebit);
		    
		    var tbl = document.getElementById('tableID');
	   		//alert(tbl);
	        var last = tbl.rows.length;
		    
		    var txtSrNo,AccountName,Type,Amount,btndel,next,crHidden,drHidden;		
		 if(last ==2)
			 {
			 
			 AccountName = document.getElementById("journalDetails["+length+"].txtAccountName");
			 Type = document.getElementById("journalDetails["+length+"].txtCreditBal");
			 Amount = document.getElementById("journalDetails["+length+"].txtAmount");	
			 crHidden=document.getElementById("journalDetails["+length+"].txtcredithidden");	
			 drHidden=document.getElementById("journalDetails["+length+"].txtdebithidden");
			 
			 AccountName.value = 'select';
			 Type.value=""; 
			 Amount.value="";
			 crHidden.value="";
			 drHidden.value="";
			 
			 }	
		 
		 else
		 {
			 var current = window.event.srcElement;		
			 while ((current = current.parentElement)  && current.tagName !="TR");
      		 current.parentElement.removeChild(current);
        
     		  j--;      		
              var counter = sr;
              //alert("Counter Before While="+counter);
			    while(counter<last)
			    {
				 	next = counter;
				 	next++;
			 	
				 	txtSrNo = document.getElementById( "journalDetails["+next+"].txtSrNo");
				 	txtSrNo.id =  "journalDetails["+counter+"].txtSrNo";
				 	txtSrNo.name = "journalDetails["+counter+"].txtSrNo";	 			 				 	 				 
				 	txtSrNo.value =(txtSrNo.value)-1 ;
			
				 	txtAccountName = document.getElementById("journalDetails["+next+"].txtAccountName");
				 	txtAccountName.id =  "journalDetails["+counter+"].txtAccountName";
				 	txtAccountName.name = "journalDetails["+counter+"].txtAccountName"; 			 	
				 	
				 	//alert("Afte Account name=");
				 	
				 	type = document.getElementById("journalDetails["+next+"].txtCreditBal");
				 	type.id =  "journalDetails["+counter+"].txtCreditBal";
				 	type.name = "journalDetails["+counter+"].txtCreditBal"; 		 	
				 	
				 	//alert("Afte Account type=");
				 	
				 	txtAmount = document.getElementById("journalDetails["+next+"].txtAmount");
				 	txtAmount.id = "journalDetails["+counter+"].txtAmount";
				 	txtAmount.name = "journalDetails["+counter+"].txtAmount";
				  			 	
				 	//alert("Afte Account amount=");
				 	
				 	txtcredithidden = document.getElementById("journalDetails["+next+"].txtcredithidden");
				 	txtcredithidden.id = "journalDetails["+counter+"].txtcredithidden";
				 	txtcredithidden.name = "journalDetails["+counter+"].txtcredithidden";
				 	
				 	txtdebithidden = document.getElementById("journalDetails["+next+"].txtdebithidden");
				 	txtdebithidden.id = "journalDetails["+counter+"].txtdebithidden";
				 	txtdebithidden.name = "journalDetails["+counter+"].txtdebithidden";
				 	
				 	btndel = document.getElementById("journalDetails["+next+"].btndel");
				 	//alert("Afte Account button="+btndel.id);
	 			 	btndel.id = "journalDetails["+counter+"].btndel";
	 			 	btndel.name = "journalDetails["+counter+"].btndel";
	 			 	
	 			 	//alert("Afte Account button id="+btndel.id);
	 			 	
					counter++;
						//	alert("Counter="+counter); 	 
			 }
		 }
	 } 
	
	function getId(id)
	{
		alert("Id="+id);
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

<script>
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
 
 </SCRIPT>
 
 <script>
 function addAmountCredit(obj)
 {
	    var id = document.getElementById(obj).id;
		//alert('id:'+id);
		var index1 = id.indexOf("[") + 1;
		//alert('index1:'+index1);
		var index2 = id.indexOf("]");
		//alert('index2:'+index2);
		var sr = id.slice(index1,index2);
	    //var tbl = document.getElementById('tableID');
	    var length=sr;
	    
	    var emptyval1=0.0;
	    document.getElementById("journalDetails["+length+"].txtAmount").value=emptyval1;
	    
	    var prevtot11=document.getElementById("journalDetails["+length+"].txtdebithidden").value;
	    //alert("Prevoius Debit Value" +prevtot11);
	     
	    
	    var debitTotal=document.getElementById("txtdebitAmt").value;
	    //alert("Cr Total Value"+debitTotal);
	    
	    var minTotalCr=((parseFloat(debitTotal)) - (parseFloat(prevtot11)));
	    //alert(minTotalCr);
	    document.getElementById("journalDetails["+length+"].txtdebithidden").value=0.0;
	    var temp=document.getElementById("journalDetails["+length+"].txtdebithidden").value;
	    //alert("Debit Hidden"+temp);
	     
	    //document.getElementById("journalDetails["+length+"].txtdebithidden").value=0.0;
	    document.getElementById("txtdebitAmt").value=parseFloat(minTotalCr);
	    
	    //var emptyval=0.0;
	    //document.getElementById("journalDetails["+length+"].txtAmount").value=emptyval;
	    
	  	var txtFirstNumberValue = document.getElementById("journalDetails["+length+"].txtCreditBal").value;
	  	//alert ("First Value"+txtFirstNumberValue);	 	  
	  	
	  	
	    var prevtot=document.getElementById("journalDetails["+length+"].txtcredithidden").value;
	  	 
	    
	     var finaltotal=document.getElementById("txtCreditAmt").value;
	    
	    	//alert("exTot="+finaltotal);
	    	document.getElementById("journalDetails["+length+"].txtcredithidden").value=txtFirstNumberValue;
	    
	    	var tot=((parseFloat(finaltotal))-(parseFloat(prevtot)));
	    
	     //alert("dtot="+tot);
	    
	     document.getElementById("txtCreditAmt").value=((parseFloat(tot))+(parseFloat(txtFirstNumberValue))); 
	    
	    
 }
 </script>
 <script>
 function addAmountDebit(obj)
 {
	 var id = document.getElementById(obj).id;
		//alert('id:'+id);
		var index1 = id.indexOf("[") + 1;
		//alert('index1:'+index1);
		var index2 = id.indexOf("]");
		//alert('index2:'+index2);
		var sr = id.slice(index1,index2);
	    //var tbl = document.getElementById('tableID');
	    var length=sr;

	    
	    var emptyval=0.0;
	    document.getElementById("journalDetails["+length+"].txtCreditBal").value=emptyval;
	    var prevtot1=document.getElementById("journalDetails["+length+"].txtcredithidden").value;
	    //alert("Prevoius Cedit Value"+prevtot1);
	    var creditTotal=document.getElementById("txtCreditAmt").value;
	    //alert("Cr Total Value"+creditTotal);
	    
	    var minTotalCr=((parseFloat(creditTotal)) -(parseFloat(prevtot1))) ;
	    //alert(minTotalCr);
	    
	    document.getElementById("journalDetails["+length+"].txtcredithidden").value=0.0;
	    var temp=document.getElementById("journalDetails["+length+"].txtcredithidden").value;
	    //alert("Credit Value"+temp);
	    
	    
	    document.getElementById("txtCreditAmt").value=parseFloat(minTotalCr);
	    
	    
	  	var txtFirstNumberValue = document.getElementById("journalDetails["+length+"].txtAmount").value;
	  	//alert ("First Value"+txtFirstNumberValue);	 	  
	  	
	    var prevtot=document.getElementById("journalDetails["+length+"].txtdebithidden").value;
	  	 
	    
	    var finaltotal=document.getElementById("txtdebitAmt").value;
	    
	    	//alert("exTot="+finaltotal);
	    document.getElementById("journalDetails["+length+"].txtdebithidden").value=txtFirstNumberValue;
	    
	    var tot=((parseFloat(finaltotal))-(parseFloat(prevtot)));
	    
	    //alert("dtot="+tot);
	    
	     document.getElementById("txtdebitAmt").value=((parseFloat(tot))+(parseFloat(txtFirstNumberValue)));    
 }
 </script>
 
 <script>
 function compareValue()
 {
	 
	 var creditTotal=document.getElementById("txtCreditAmt").value;
	 alert("Credit Balance"+creditTotal);
	 var debitTotal=document.getElementById("txtdebitAmt").value;
	 alert("Debit Balance"+debitTotal);
	 
	 if(creditTotal == debitTotal)
		 {
		 alert("Debit And Credit Value is Match");
		 }
	 else
	     {
		 alert("Debit And Credit Value not Match");
	     }
 }
 </script>
 <script>
	function back() {
		window.history.back();

	}
</script>
</head>
<body style="overflow-x: hidden;">
<div id="wrapper">
	<%@include file="../header.jsp"%>
<!-- 	<div class="container"> -->
		<%@include file="innerHeader.jsp"%>
    	
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
								<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
							</div>
						</div>
					</div>
				</div>
				<form:form action="updateJouranl.do" cssClass="form-inline" modelAttribute="editJournal" name="frmJournalEntry" onsubmit="return validateForm()">
				<br>
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
						<div class="row">
							<div class="col-md-5">
								<label style="width:100px">Voucher No: </label>
								<form:input path="txtjourid" cssClass="form-control"
									readonly="true"></form:input>
							</div>	
							<div class="col-md-5">					
								<label style="width:103px">Date : </label>
								<input type="date" name="txtDate" class="form-control" value="${editJournal.txtDate}"></input>
                           </div>
							</div>
							<br>
							<br>
							<div class="row">
					        <div class="col-md-5">
								<label style="width: 100px;">Source :</label>
							<form:select path="txtSource" cssClass="form-control">
									<option>${editJournal.txtSource}</option>
									<option>----Select----</option>
									<option>Sales</option>
									<option>Purchase</option>
									<option>Credit</option>
									<option>Debit</option>
								</form:select>
								</div>							
							</div>
							<br>
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover" style="width: 70%;" id="tableID">
									<thead>
										<tr>
											<th>Sr No :</th>
											<th style="width: 600px;">Account Name*</th>
											<th>Credit</th>
											<th>Debit</th>
											<!-- <th>Debit Hidden</th> -->
											<th>Action</th> 
										</tr>
									</thead>
									<tbody>
											<c:forEach items="${editJournal.journalDetails}" var="journalDetails">
										<tr>
											<td><input type="text" class="form-control" name="journalDetails[${journalDetails.txtSrNo-1}].txtSrNo" id="journalDetails[${journalDetails.txtSrNo-1}].txtSrNo" value="${journalDetails.txtSrNo}" style="width: 50px; text-align: right;"></input></td>
											<td>
												<!-- <input class="form-control" name="journalDetails[0].txtAccountName" id="journalDetails[0].txtAccountName"style="text-align: right;"></input> -->
												
												<select name="journalDetails[${journalDetails.txtSrNo-1}].txtAccountName" id="journalDetails[${journalDetails.txtSrNo-1}].txtAccountName" class="form-control">
													
													<option value="${journalDetails.accno}">${journalDetails.txtAccountName}</option>
													<option value="Select">--Select Name--</option>
													<c:forEach items="${accountlist}" var="accountlist">
													<option value="${accountlist.txtNewAccNo}">${accountlist.txtAccountName}</option>
													</c:forEach>
												</select>

											</td>
											<td><input type="text" name="journalDetails[${journalDetails.txtSrNo-1}].txtCreditBal" id="journalDetails[${journalDetails.txtSrNo-1}].txtCreditBal" value="${journalDetails.txtCreditBal}" onchange="showDesc(this.value,this.id)" class="form-control" onblur="addAmountCredit(this.id)"></input>
											</td>
											
											<td><input type="text" class="form-control" name="journalDetails[${journalDetails.txtSrNo-1}].txtAmount" id="journalDetails[${journalDetails.txtSrNo-1}].txtAmount" value="${journalDetails.txtAmount}" style="text-align: right;" onblur="addAmountDebit(this.id)" onkeypress=""></input> 
											</td>
											
											<td><input type="button" value="-" name="journalDetails[${journalDetails.txtSrNo-1}].btndel" id="journalDetails[${journalDetails.txtSrNo-1}].btndel" class="btn btn-danger" onclick="delrow(this.id)"></td>
										    <td><input type="hidden" name="journalDetails[${journalDetails.txtSrNo-1}].txtcredithidden" id="journalDetails[${journalDetails.txtSrNo-1}].txtcredithidden" value="${journalDetails.txtcredithidden}" /></td>
										    <td><input type="hidden" name="journalDetails[${journalDetails.txtSrNo-1}].txtdebithidden" id="journalDetails[${journalDetails.txtSrNo-1}].txtdebithidden" value="${journalDetails.txtdebithidden}" class="form-control"/></td>
										
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="btn-group">
									<input type="button" name="btnadd1" id="btnadd1" value="+ Add New Row" onclick="addRow()" class="btn btn-default btn-xs">

								</div><hr>
								<div class="row">
							   <div class="col-md-5">
									<label>Credit Amount : </label>
								<%--  <form:input path="txtreceptid" cssClass="form-control"></form:input> --%>
								<form:input path="txtCreditAmt" cssClass="form-control" readonly="true"></form:input>
								</div>
								
								<div class="col-md-5">
								<label style="width:100px ">Debit Amount: </label>
								<%--  <form:input path="txtVchrNo" cssClass="form-control"></form:input> --%>
								<form:input path="txtdebitAmt" cssClass="form-control" readonly="true"></form:input>
								</div>
								</div>
								
								<div class="page-header"></div>
								<div class="row first-column">
									<div class="col-md-4">
										<div class="row">
											<div class="col-md-4">
												<label>Description: </label>
												<form:textarea onkeypress="return AllowCharacters(this);" path="txtDescription" rows="4" cols="35" cssClass="form-control"></form:textarea>
											</div>
										</div>
									</div>

								</div>
								<br>

								<div class="row">
									<div class="col-md-3"></div>
									<div>
										<button id="submit" name="btn" value="Save" class="btn btn-primary" onclick="compareValue()">Save</button>
										<button id="reset" name="btn" value="Cancel" class="btn btn-primary">Cancel</button>
									</div>
								</div>
								<%-- <c:if test="${message==1}">
									<h4 class="msg-succ">
										<script>
										alert("Journal Entry Recorded Successfuly");
									    </script>
									</h4>
								</c:if>
								<c:if test="${message==0}">
									<h4 class="msg-error">
										<script>
											alert("Journal Entry Not Recorded"  );
										</script>
									</h4>
								</c:if> --%>
								
							</div>
						</div>
					</div>
				</div>

			</form:form>

		</div>
	<!-- </div> -->
</body>
</html>