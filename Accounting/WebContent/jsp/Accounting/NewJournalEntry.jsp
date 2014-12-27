
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
		

		j++;

		var firstCell = row.insertCell(0);
		var inputAccount = document.createElement("select");
		inputAccount.type = "select";
		inputAccount.id = "selectaccount" + i;
		inputAccount.name = "selectaccount" + i;
		inputAccount.className="form-control";
		inputAccount.onchange=function(){populatdes(this);};
		
			var ln = document.getElementById("selectaccount1").length;
			
		for ( var k = 0; k < ln; k++) //Edited by Makarand.

		{
			var xVal = document.getElementById("selectaccount1").options[k].value;
			var xText = document.getElementById("selectaccount1").options[k].text;
			desc = document.getElementById("selectaccount1").options[k].label;
			//alert("OK="+desc);
			var opt = document.createElement("option");
			opt.text = xText;
			opt.value = xVal;
			inputAccount.add(opt, null);
		}

		firstCell.appendChild(inputAccount);
		
		
		
		 var secondCell = row.insertCell(1);
         var inputDebit= document.createElement("input");
         inputDebit.type = "text";
         inputDebit.name = "txtdebit" + i;
         inputDebit.id = "txtdebit" + i;     
         inputDebit.className="form-control";
         inputDebit.style.textAlign="right";
         secondCell.appendChild(inputDebit);
		
		

		var thirdCell = row.insertCell(2);
		var inputCredit = document.createElement("input");
		inputCredit.type = 'text';
		inputCredit.id = "txtcredit" + i;
		inputCredit.name = "txtcredit" + i;
		inputCredit.className="form-control";
		inputCredit.style.textAlign="right";
		thirdCell.appendChild(inputCredit);
		
		var fourthCell = row.insertCell(3);
		var inputDelete = document.createElement("input");
		inputDelete.type = 'button';
		inputDelete.id = "btndel" + i;
		inputDelete.name = "btndel" + i;
		inputDelete.value="-";	
		inputDelete.className="btn btn-primary";	
		inputDelete.onclick=function(){delrow(this);};
		fourthCell.appendChild(inputDelete);

		
		
		
		i++;
		  document.getElementById("hide").value=i;
		  //alert("hide:" +  document.getElementById("hide").value );
		
		
	}
	 
	 function delrow(obj)
	 {
		 var tbl = document.getElementById('tableID');
 		 var last = tbl.rows.length;
 		 var txtSrNo,ItemCode,Des,Quantity,btndel,next;
		
		 if(last == 2)
			 {
			 	var account = document.getElementById("selectaccount1"); 
			 	var debit = document.getElementById("txtdebit1");
			 	var credit = document.getElementById("txtcerdit1");
			 	
			 	account.value = 'select';
			 	debit.value = ""; 
			 	credit.value = "";
			 	
			 }
		 
		 else
		 {
			 var current = window.event.srcElement;	
		
			 while ( (current = current.parentElement)  && current.tagName !="TR");
       		 current.parentElement.removeChild(current);
         
        
       			  i--;
      			  j--;
       		  document.getElementById("hide").value = i;
 		
 			 var counter = obj.id.slice(6);
      
         
 			
 			 while(counter<last)
 				 {
 				 	next = counter;
 				 	next++;
 			 	
	 			 	var  inputAccount= document.getElementById("selectaccount"+next);
	 			 	inputAccount.id = "selectaccount" + counter;
	 			 	inputAccount.name = "selectaccount" + counter;
	 			 
 			 	
	 			 	var inputDebit = document.getElementById("txtdebit"+next);
	 			 	inputDebit.id = "txtdebit" + counter;
	 			 	inputDebit.name = "txtdebit"+counter;
 			 	
 				 	var inputCredit = document.getElementById("txtcredit"+next);
 				 	inputCredit.id = "txtcredit" + counter;
 				 	inputCredit.name = "txtcredit"+counter;
 			 	
 				 	 			 	
 				 	btndel = document.getElementById("btndel"+next);
 				 	btndel.id = "btndel" + counter;
 				 	btndel.name = "btndel"+counter;
 			 	
 					counter++;
 							 	
 			 
 			 }
		 }
 		 
         
	 }
	 
</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>New Journal Entry</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accounts Chart</title>

<link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/table.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/main.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/css/MoneAdmin.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">

<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
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
      alert("Date should be wrong..");
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
 </SCRIPT>
 <script>
	function back() {
		window.history.back();

	}
</script>
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
	<%@include file="../header.jsp"%>
	<!-- <div class="container"> -->
		<%@include file="innerHeader.jsp"%>
    	
		<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-10">
								<ul class="breadcrumb">
									<li class="active"><small><i class="fa fa-2x fa-table"></i></small>&nbsp;New Journal Entry</li>
								</ul>
							</div>
							<div class="col-md-2">
							<button name="btnBack" class="btn btn-primary btn-large" onclick="back()"><i class="fa fa-reply"></i>Back</button>
							</div>
						</div>
					</div>
</div>.<form:form action="newJournalEntry.do" cssClass="form-inline" modelAttribute="newEntryJournal" name="frmJournalEntry" onsubmit="return validateForm()">
	 	<br>
	 	<div class="col-md-12">
    <div class="panel panel-default">
       <div class="panel-body">
	 	<div>
	 	   <label>Voucher No : </label>
	 	   <form:input path="txtVchrNo" cssClass="form-control" onkeypress="return AllowCharacters(this);"></form:input>
	 	   <label>Date : </label>
    	   <input  type="date" name="txtDate" class="form-control"></input>
        </div>
        <br>
           <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="tableID">
                                    <thead>
                                        <tr>
                                            <th style="width: 600px;">From Account *</th>
                                            <th>Debit *</th>
                                            <th>Credit *</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                        <tr>
                                            
                                            <td><form:select path="txtAccountGroup" id="txtAcGrp" cssClass="form-control">
                            		<form:option value="0">----Select----</form:option>
                            		
                            	</form:select></td>
                                            <td><form:input cssClass="form-control" path="txtdebit1" onkeypress="return isNumberKey(this)" cssStyle="text-align: right;"></form:input></td>
                                            <td><form:input cssClass="form-control" path="txtcredit1" id="txtcerdit1" onkeypress="return isNumberKey(this)" cssStyle="text-align: right;"></form:input></td>
                                            <td>													
											  <input type="button" value="-" name="btndel1" class="btn btn-primary" onclick="delrow()">
											  </td>
                                        </tr>
                                         
                                        </tbody>
                                </table>
                                <div class="btn-group">
								  <input type="button" name="btnadd1" id="btnadd1" value="+" onclick="addRow()" class="btn btn-primary">
											  
                               </div>
                               <div class="page-header">
	 		                   
	 	                       </div>
	 	                      	<div class="row first-column">
												<div class="col-md-4">
													<div class="row">
														<div class="col-md-4">
															<label>Description: </label>
																<form:textarea onkeypress="return AllowCharacters(this);" path="txtDescription" rows="4" cols="35"  cssClass="form-control"></form:textarea>															
														</div>
													</div>
												</div>																							
												 <div class="col-md-6">
													<div class="row">
														<div class="col-md-4">
															<label>Tags : </label>
														<form:textarea path="txtTag" onkeypress="return AllowCharacters(this);" rows="4" cols="35" cssClass="form-control"></form:textarea>
														</div>
													</div>
												</div>
												</div>
								<br>
											
										<div class="row">
							              <div class="col-md-3"></div>
							               <div>
												<button id="submit" name="btn" value="Save" class="btn btn-primary">Save</button>	
									 			<button id="reset" name="btn" value="Cancel" class="btn btn-primary">Cancel</button>									 	
									 		</div>												
										</div>
  </div>
</div>
</div>
</div>
	</form:form>
</div>
<!-- </div> -->
</body>
</html>