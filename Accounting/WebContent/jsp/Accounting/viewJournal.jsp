
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
         
         
         
         
		
        //alert("After Name Length="+length);
        var thirdCell = row.insertCell(2);
 		var inputType = document.createElement("select");
 		inputType.type = "select";
 		inputType.id ="journalDetails["+length+"].txtType";
 		inputType.name = "journalDetails["+length+"].txtType";
 		//inputType.onchange=function(){showDesc(this.value,this.id);};
 		
 		//alert("After type="+inputAccount.id);
 		
 		  //alert("Before Len"); 
 		var newLength=length-1;
 		var ln = document.getElementById("journalDetails["+newLength+"].txtType").length;
 		//alert("Before For "+ln);	
 		
 		for ( var k = 0; k < ln; k++)

 		{
 			//alert("In For");
 			var xVal = document.getElementById("journalDetails["+newLength+"].txtType").options[k].value;
 			var xText = document.getElementById("journalDetails["+newLength+"].txtType").options[k].text;
 			desc = document.getElementById("journalDetails["+newLength+"].txtType").options[k].label;
 			//alert("OK="+desc);
 			var opt = document.createElement("option");
 			opt.text = xText;
 			opt.value = xVal;
 			inputType.add(opt, null);
 		}
 		
 		inputType.className = "form-control";
 		thirdCell.appendChild(inputType);
         
		var fourthCell = row.insertCell(3);
		var inputAmount = document.createElement("input");
		inputAmount.type = 'text';
		inputAmount.id = "journalDetails["+length+"].txtAmount";
		inputAmount.name ="journalDetails["+length+"].txtAmount";
		inputAmount.className="form-control";
		inputAmount.style.textAlign="right";
		inputAmount.onblur=function(){addvalue(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		fourthCell.appendChild(inputAmount);
		
		var fifthCell = row.insertCell(4);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" + length;
		inputDelete.name = "btndel" + length;
		inputDelete.value="-";	
		inputDelete.className="btn btn-primary";
		
		inputDelete.onclick=function(){delrow(this);};
		fifthCell.appendChild(inputDelete);
		//hiddenAmount
		
		inputType.className = "form-control";
 		thirdCell.appendChild(inputType);
         
		var sixthCell = row.insertCell(5);
		var inputAmthidden = document.createElement("input");
		inputAmthidden.type = 'text';
		inputAmthidden.id = "journalDetails["+length+"].hiddenAmount";
		inputAmthidden.name ="journalDetails["+length+"].hiddenAmount";
		inputAmthidden.className="form-control";
		inputAmthidden.style.textAlign="right";
		//inputAmthidden.onblur=function(){addvalue(this.id);};
		//inputAmount.onblur=function(){getId(this.id);}
		sixthCell.appendChild(inputAmthidden);
		
	}
	function delrow(obj)
	 {
		 var tbl = document.getElementById('tableID');
		  var last =(tbl.rows.length)-1;		/*  var last=(tbl.rows.length); */
	// alert("Last="+last);
		 var txtSrNo,AccountName,Type,Amount,btndel,next;		
		 if(last ==1)
			 {
			 AccountName = document.getElementById("journalDetails["+length+"].txtAccountName");
			 Type = document.getElementById("journalDetails["+length+"].txtType");
			 Amount = document.getElementById("journalDetails["+length+"].txtAmount");
			 hideAmount=document.getElementById("journalDetails["+length+"].hiddenAmount");
			 
			 AccountName.value = 'select';
			 Type.value = "select"; 
			 Amount.value = "";
			 hideAmount.value="";	
			 }		 
		 else
		 {
			 var current = window.event.srcElement;				 
		
			 while ( (current = current.parentElement)  && current.tagName !="TR");
      		 current.parentElement.removeChild(current);
        
     		  j--;      		
			 var counter = obj.id.slice(6);
			//alert("Counter"+counter);
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
				 	
				 	var type = document.getElementById("journalDetails["+next+"].txtType");
				 	type.id =  "journalDetails["+counter+"].txtType";
				 	type.name = "journalDetails["+counter+"].txtType"; 		 	
				 	
				 	//alert("Afte Account type=");
				 	
				 	txtAmount = document.getElementById("journalDetails["+next+"].txtAmount");
				 	txtAmount.id = "journalDetails["+counter+"].txtAmount";
				 	txtAmount.name = "journalDetails["+counter+"].txtAmount";
				  			 	
				 	hiddenAmount = document.getElementById("journalDetails["+next+"].hiddenAmount");
				 	hiddenAmount.id = "journalDetails["+counter+"].hiddenAmount";
				 	hiddenAmount.name = "journalDetails["+counter+"].hiddenAmount";
				 	//alert("Afte Account amount=");
				 	
				 	btndel = document.getElementById("btndel"+next);
				 	//alert("Afte Account button="+btndel.id);
	 			 	btndel.id = "btndel"+counter;
	 			 	btndel.name = "btndel"+counter;
	 			 	
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
 
 <SCRIPT>
 function addvalue(obj)
 {
	 var id = document.getElementById(obj).id;
		alert('id:'+id);
		var index1 = id.indexOf("[") + 1;
		alert('index1:'+index1);
		var index2 = id.indexOf("]");
		alert('index2:'+index2);
		var sr = id.slice(index1,index2);
	    var tbl = document.getElementById('tableID');
	    var length=sr;
	    
	    
	    var preHidden=document.getElementById("journalDetails["+length+"].hiddenAmount").value;
		 alert("Hidden Amount is"+preHidden);
	 //var accType = document.getElementById("journalDetails[0].txtType").value;
     var accType=document.getElementById("journalDetails["+length+"].txtType").value;
	 alert("Debit Or Credit Amount"+accType);
	 if(accType=="0")
		 {
		  alert("Please select Account type");
		  }
	 else if(accType=="Debit"){
		  
		 alert(length);
		 var drValue=document.getElementById("journalDetails["+length+"].txtAmount").value;
		 alert(length);
		 alert("Debit value="+drValue);
		
		 document.getElementById("journalDetails["+length+"].hiddenAmount").value=parseFloat(drValue);
		 var preHidden=document.getElementById("journalDetails["+length+"].hiddenAmount").value;
		 alert("Hidden Amount is"+preHidden);
		 //var ad="0.0";
		 var ad=document.getElementById("txtDebitAmount").value;
		 alert("Debit value added in debit="+ad);
		 add=document.getElementById("txtDebitAmount").value;
		 alert("Previous Total is"+add);
		 document.getElementById("txtDebitAmount").value=parseFloat(preHidden)+parseFloat(add);
		 
		 var total=document.getElementById("txtDebitAmount").value;
		 alert("Total Amount"+total);
	     }
	 else{		 
		 alert(length);
		 var crValue=document.getElementById("journalDetails["+length+"].txtAmount").value;
		 alert(length);
		 alert("Hidden Credit="+crValue);
		 document.getElementById("journalDetails["+length+"].hiddenAmount").value=parseFloat(crValue);
			
		 var prehiddcr=document.getElementById("journalDetails["+length+"].hiddenAmount").value;
		 alert("Prevoius Hidden Credit"+prehiddcr);
		 var add1=document.getElementById("txtCreditAmount").value;
		 alert("Hidden Credit="+add1);
		 document.getElementById("txtCreditAmount").value=parseFloat(prehiddcr)+parseFloat(add1);
		 var finaltotal=document.getElementById("txtCreditAmount").value;
		 alert("final total credit is "+finaltotal);

	 }
	 
		 
 }
 </SCRIPT>

 <script>
function urlSubmit(url,target)
{
	if(target=="1")
		{
		
			window.location.assign(url);
		}
	else
		{
			window.open(url,target);
		}
}
</script>
</head>
<body style="overflow-x: hidden;">
	<div id="wrapper">
	  <%@include file="../header.jsp"%>
		<!-- <div class="container"> -->
		  <%@include file="innerHeader.jsp"%>
			<form:form action="newJournalHead.do" cssClass="form-inline" modelAttribute="viewJournal" name="frmJournalEntry" onsubmit="return validateForm()">
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
								<a href=journal.do><input type="button" name="btnAdd"
									value="Back" class="btn btn-primary" /></a>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
						<div class="row">
							<div class="col-md-5">
								<label style="width:100px">Journal Id: </label>
								<label>${viewJournal.txtjourid}</label>
							</div>	
							<div class="col-md-5">					
								<label style="width:103px">Date : </label> 
								<label>${viewJournal.txtDate}</label>

							</div>
							</div>

							<br>
							<div class="row">
							  <div class="col-md-5">
								  <label style="width:100px">Source : </label>
								  <label>${viewJournal.txtSource}</label>
									
							  </div>	
						    </div>		
															
							</div>
							<br>
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									style="width: 70%;" id="tableID">
									<thead>
										<tr>
											<th style="width: 80px;">Sr No :</th>
											<th style="width: 500px;">Account Name*</th>
											<th style="width: 50px;">Type*</th>
											<th style="width: 100px;">Amount *</th>
											
										</tr>
									</thead>
									<tbody>

										
										<tr>
											<c:forEach items="${viewJournal.journalDetails}" var="viewJournal">
												<tr class="odd gradeX">
													<td>${viewJournal.txtSrNo}</td>
													<td>${viewJournal.txtAccountName}</td>
													<td>${viewJournal.txtType }</td>
													<td>${viewJournal.txtAmount }</td>
												</tr>
												</c:forEach>
										<tr>
											
										</tr>
									</tbody>
								</table>
								<br>
								<div class="col-md-10">
							 <label style="width:100px">Total : </label>
								<input class="form-control" readonly="true" value="${viewJournal.txtCreditAmount}"></input>
								<input  class="form-control" readonly="true" value="${viewJournal.txtDebitAmount}"></input>
							 </div>
								<br>
								<br>
							 <div class="col-md-10">
							 <label style="width:100px">Description : </label>
								<input class="form-control" readonly="true" value="${viewJournal.txtDescription}"></input>
								
							 </div>
							 <br>
							 <br>
							</div>
								<br>
							
							<div class="row">
									<div class="col-md-3"></div>
									<div>
									    
									    <input type="button" value="Print" name="btn" class="btn btn-primary" onclick="urlSubmit('journalEntryPDF.do?voucher_No=${viewJournal.txtjourid}')">
										
									</div>
								</div>
							
							</div>
							


						<div class="row first-column">
							<div class="col-md-4">
								<div class="row">
									<div class="col-md-4">&nbsp;&nbsp;</div>
								</div>
							</div>

						</div>
						<br>
							</div>
						</form:form>
						</div>
						
					<!-- </div> -->
</body>
</html>