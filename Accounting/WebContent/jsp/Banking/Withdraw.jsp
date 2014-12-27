<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>New Transaction</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />"
	type="image/icon">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/plugins/bootstrap/css/bootstrap.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/main.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/theme.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/MoneAdmin.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" />
<link
	href="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.css" />"
	rel="stylesheet" />
<script
	src="<c:url value="/resources/assets/plugins/jquery-2.0.3.min.js" />"></script>
<script
	src="<c:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js" />"></script>
<script
	src="<c:url value="/resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>
<script
	src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />"> </script>
<script
	src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />">

<script>
	$(document).ready(function() {
		$('#dataTables-example1').dataTable();
		$('#dataTables-example2').dataTable();
		$('#dataTables-example3').dataTable();

	});
</script>
<link href="<c:url value="/resources/datepicker/css/datepicker.css"  />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {            	
                $('#dp1').datepicker({
                    format: "yyyy-mm-dd"
                });
                $('#dp2').datepicker({
                    format: "yyyy-mm-dd"
                });
                $('#dp3').datepicker({
                    format: "yyyy-mm-dd"
                });
                
                $( document).ready(function() {
               	  $('#dp1').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
               	    $(this).datepicker('hide');
               	});
               	});
               $( document).ready(function() {
               	  $('#dp2').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
               	    $(this).datepicker('hide');
               	});
               	});
               $( document).ready(function() {
                	  $('#dp3').datepicker({ format: "yyyy-mm-dd" }).on('changeDate', function(ev){
                	    $(this).datepicker('hide');
                	});
                	});
            });
                </script>


<!-- <script>
function validateForm1()
{
	if(document.frmWithdraw.txtwithVchrNo.value=="")
    {
        alert("VchrNo Should not be Empty....");
        document.frmWithdraw. txtwithVchrNo.focus();
        return false;
      }
	 else if(document.frmWithdraw.txtwithdate.value=="")
     {
         alert("Date field Should not be empty....");
         document.frmWithdraw.txtwithdate.focus();
         return false;
       }
	
	 else if(document.frmWithdraw.txtwithFrmAccnt.value=="")
     {
         alert("Account field Should not be empty....");
         document.frmWithdraw.txtwithFrmAccnt.focus();
         return false;
       }
	
	 else if(document.frmWithdraw.txtwithToAccnt.value=="")
     {
         alert("Account field Should not be empty....");
         document.frmWithdraw.txtwithToAccnt.focus();
         return false;
       }
	
	 else if(document.frmWithdraw.txtwithTransType.value=="0")
     {
         alert("Transaction field Should not be empty....");
         document.frmWithdraw.txtwithTransType.focus();
         return false;
       }
	
	
	 else if(document.frmWithdraw.txtwithAmount.value=="")
     {
         alert("Amount field Should not be empty....");
         document.frmWithdraw.txtwithAmount.focus();
         return false;
       }
	
	 else if(document.frmWithdraw.txtwithDesc.value=="")
     {
         alert("Description field Should not be empty....");
         document.frmWithdraw.txtwithDesc.focus();
         return false;
       }
	
	 else
     {
   	  alert("Data Inserted Successfully....");
   	}
   
 }
 
function validateForm2()
{
	 if(document.frmDeposit.txtdepoVchrNo.value=="")
    {
        alert("VchrNo Should not be Empty....");
        document.frmDeposit. txtdepoVchrNo.focus();
        return false;
      }
	 else if(document.frmDeposit.txtdepodate.value=="")
     {
         alert("Date field Should not be empty....");
         document.frmDeposit.txtdepodate.focus();
         return false;
       }
	
	 else if(document.frmDeposit.txtdepoFrmAccnt.value=="")
     {
         alert("Account field Should not be empty....");
         document.frmDeposit.txtdepoFrmAccnt.focus();
         return false;
       }
	
	 else if(document.frmDeposit.txtdepoToAccnt.value=="")
     {
         alert("Account1 field Should not be empty....");
         document.frmDeposit.txtdepoToAccnt.focus();
         return false;
       }
	 
	 else if(document.frmDeposit.txtdepoTransType.value=="")
     {
         alert("Transaction Type field Should not be empty....");
         document.frmDeposit.txtdepoTransType.focus();
         return false;
       }
	
	 else if(document.frmDeposit.txtdepoAmount.value=="")
     {
         alert("Amount field Should not be empty....");
         document.frmDeposit.txtdepoAmount.focus();
         return false;
       }
	
	 else if(document.frmDeposit.txtdepoDesc.value=="")
     {
         alert("Description field Should not be empty....");
         document.frmDeposit.txtdepoDesc.focus();
         return false;
       }
	 else
     {
   	  alert("Data Inserted Successfully....");
   	}
   
 }
 
function validateForm3()
{
	 if(document.frmTransfer.txttransVchrNo.value=="")
    {
        alert("VchrNo Should not be Empty....");
        document.frmTransfer. txttransVchrNo.focus();
        return false;
      }
	 else if(document.frmTransfer.txttransdate.value=="")
     {
         alert("Date field Should not be empty....");
         document.frmTransfer.txttransdate.focus();
         return false;
       }
	
	 else if(document.frmTransfer.txttransFrmAccnt.value=="")
     {
         alert("Account field Should not be empty....");
         document.frmTransfer.txttransFrmAccnt.focus();
         return false;
       }
	
	 else if(document.frmTransfer.txttransToAccnt.value=="")
     {
         alert("Account1 field Should not be empty....");
         document.frmTransfer.txttransToAccnt.focus();
         return false;
       }
	 
	 else if(document.frmTransfer.txttransTransType.value=="")
     {
         alert("Transaction type field Should not be empty....");
         document.frmTransfer.txttransTransType.focus();
         return false;
       }
	
	 else if(document.frmTransfer.txttransAmount.value=="")
     {
         alert("Amount field Should not be empty....");
         document.frmTransfer.txttransAmount.focus();
         return false;
       }
	
	 else if(document.frmTransfer.txttransDesc.value=="")
     {
         alert("Description field Should not be empty....");
         document.frmTransfer.txttransDesc.focus();
         return false;
       }
	
	 
	
	 else
     {
   	  alert("Data Inserted Successfully....");
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

 </SCRIPT> -->

</head>
<body style="overflow-x: hidden;"> 
	<div id="wrapper">
		<%@ include file="../header.jsp"%>
		<!-- <div class="container"> -->
			<%@ include file="innerHeader.jsp"%>
			<input type="hidden" id="hide" name="hide1" value="0"> <br>
			<div class="col-md-12">
				<div class="panel">
					<div class="panel-body">
						<div class="col-md-10">
							<ul class="breadcrumb">
								<li class="active"><small><i
										class="fa fa-2x fa-table"></i></small>&nbsp;New<small>&nbsp;Transaction</small>
							</ul>
						</div>
						<div class="col-md-2">
							<a href="banking.do" class="btn btn-primary btn-large"><i class="fa fa-reply"></i> Back</a>
								
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab"><i
									class="fa fa-sign-in"></i> Withdraw Cash</a></li>
							<li><a href="#tab2" data-toggle="tab"><i
									class="fa fa-download"></i> Deposit</a></li>
							<li><a href="#tab3" data-toggle="tab"><i
									class="fa fa-exchange"></i> Transfer Cash</a></li>
						</ul>
						<div class="tab-content">

							<!--START WITHDRAW CASH -->

							<div class="tab-pane fade in active" id="tab1">
								<form:form action="withdrawCash.do" cssClass="form-inline"
									commandName="withdrawCash" name="frmWithdraw">
									<!-- onsubmit="return validateForm1()" -->
									<!-- <div class="col-md-12"> -->
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Voucher Number :</label>
														</div>
														<div class="col-md-6">
															<div class="input-group-btn">
																<form:input path="txtwithVchrNo" cssClass="form-control"
																	readonly="true"></form:input>

															</div>
														</div>
													</div>
												</div>

											</div>

											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Transaction Date* :</label>
														</div>
														<div class="col-md-6">

															<input type="text" id="dp1" name="txtwithdate"
																class="form-control" style="width: 160px;" />

														</div>
													</div>
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>From Account</label>
														</div>

														<div class="col-md-6">
															<div class="input-group">

																<form:select path="txtwithFrmAccnt"
																	cssClass="form-control">
																	<option>----Select----</option>
																	<c:forEach items="${acList}" var="acList">
																		<option value="${acList.txtNewAccNo}">${acList.txtAccountName}</option>

																	</c:forEach>
																</form:select>



															</div>
														</div>
													</div>
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>To Account</label>
														</div>
														<div class="col-md-6">
															<div class="input-group">


																<form:select path="txtwithToAccnt"
																	cssClass="form-control">
																	<option>----Select----</option>
																	<c:forEach items="${acList}" var="acList">
																		<option value="${acList.txtNewAccNo}">${acList.txtAccountName}</option>

																	</c:forEach>

																</form:select>
															</div>
														</div>
													</div>
												</div>

											</div>
											<br>

											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Transaction Type :</label>
														</div>
														<div class="col-md-6">
														<input name="txtwithTransType" value="Withdraw" class="form-control" readonly="true"/>
																	
															<%-- <div class="input-group-btn">
																<form:select path="txtwithTransType"
																	cssClass="form-control">

																	<option value="Withdraw">Withdraw</option>
																</form:select>
															</div> --%>
														</div>
													</div>
												</div>

											</div>

											<br>

											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Amount</label>

														</div>
														<div class="col-md-6">
															<div class="input-group-bin">
																<form:input path="txtwithAmount" cssClass="form-control"></form:input>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Description</label>

														</div>
														<div class="col-md-6">
															<div class="input-group-bin">
																<form:textarea cssClass="form-control" rows="3"
																	cols="22" path="txtwithDesc"></form:textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<button id="submit" name="btn" value="Save"
														class="btn btn-primary">Save</button>
													<a href="banking.do" class="btn btn-primary btn-large"> Cancle</a>
												</div>
												<div class="col-md-6"></div>
											</div>
										</div>
									</div>
									<!-- </div> -->
								</form:form>
							</div>

							<!-- END WITHDRAW CASH -->
							<!--START DIPOSIT CASH -->

							<div class="tab-pane fade" id="tab2">
								<form:form action="deposit.do" cssClass="form-inline"
									commandName="depositCash" name="frmDeposit">
									<!-- onsubmit="return validateForm2()" -->
									<!-- <div class="col-md-12"> -->
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Voucher Number :</label>
														</div>
														<div class="col-md-6">
															<div class="input-group-btn">
																<form:input path="txtdepoVchrNo" cssClass="form-control"
																	readonly="true"></form:input>

															</div>
														</div>
													</div>
												</div>
											</div>

											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Transaction Date* :</label>
														</div>
														<div class="col-md-6">

															<input type="text" id="dp2" name="txtdepodate"
																class="form-control" style="width: 160px;" />
														</div>
													</div>
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>From Account</label>
														</div>
														<div class="col-md-6">
															<div class="input-group">


																<form:select path="txtdepoFrmAccnt"
																	cssClass="form-control">
																	<option>----Select----</option>
																	<c:forEach items="${acList}" var="acList">
																		<option value="${acList.txtNewAccNo}">${acList.txtAccountName}</option>

																	</c:forEach>

																</form:select>
															</div>
														</div>
													</div>
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>To Account</label>
														</div>
														<div class="col-md-6">
															<div class="input-group">


																<form:select path="txtdepoToAccnt"
																	cssClass="form-control">
																	<option>----Select----</option>
																	<c:forEach items="${acList}" var="acList">
																		<option value="${acList.txtNewAccNo}">${acList.txtAccountName}</option>

																	</c:forEach>

																</form:select>
															</div>
														</div>
													</div>
												</div>

											</div>
											<br>

											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Transaction Type :</label>
														</div>
														<div class="col-md-6">
														<input name="txtdepoTransType" value="Deposit" class="form-control" readonly="true"/>
															<%-- <div class="input-group-btn">
																<form:select path="txtdepoTransType"
																	cssClass="form-control">

																	<option value="Deposit">Deposit</option>
																</form:select>

															</div> --%>
														</div>
													</div>
												</div>

											</div>

											<br>

											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Amount</label>

														</div>
														<div class="col-md-6">
															<div class="input-group-bin">
																<form:input path="txtdepoAmount" cssClass="form-control"></form:input>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Description</label>

														</div>
														<div class="col-md-6">
															<div class="input-group-bin">
																<form:textarea cssClass="form-control" rows="3"
																	cols="22" path="txtdepoDesc"></form:textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<button id="submit" name="btn" value="Save"
														class="btn btn-primary">Save</button>
													<a href="banking.do" class="btn btn-primary btn-large"> Cancle</a>
												</div>
												<div class="col-md-6"></div>
											</div>
										</div>
									</div>
									<!-- </div> -->
								</form:form>
							</div>

							<!-- END DIPOSIT CASH -->
							<!--START TRANSFER CASH -->


							<div class="tab-pane fade" id="tab3">
								<form:form action="Transfer.do" cssClass="form-inline"
									commandName="transferCash" name="frmTransfer">
									<!-- onsubmit="return validateForm3()" -->
									<!-- <div class="col-md-12"> -->
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Voucher Number :</label>
														</div>
														<div class="col-md-6">
															<div class="input-group-btn">
																<form:input path="txttransVchrNo"
																	cssClass="form-control" readonly="true"></form:input>

															</div>
														</div>
													</div>
												</div>

											</div>

											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Transaction Date* :</label>
														</div>
														<div class="col-md-6">
															<input type="text" id="dp3" name="txttransdate"
																class="form-control" style="width: 160px;" />
														</div>
													</div>
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Transfer From</label>
														</div>
														<div class="col-md-6">
															<div class="input-group">


																<form:select path="txttransFrmAccnt"
																	cssClass="form-control">
																	<option>----Select----</option>
																	<c:forEach items="${acList}" var="acList">
																		<option value="${acList.txtNewAccNo}">${acList.txtAccountName}</option>
																	</c:forEach>

																</form:select>
															</div>
														</div>
													</div>
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Transfer To</label>
														</div>
														<div class="col-md-6">
															<div class="input-group">


																<form:select path="txttransToAccnt"
																	cssClass="form-control">
																	<option>----Select----</option>
																	<c:forEach items="${acList}" var="acList">
																		<option value="${acList.txtNewAccNo}">${acList.txtAccountName}</option>

																	</c:forEach>

																</form:select>
															</div>
														</div>
													</div>
												</div>

											</div>
											<br>

											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Transaction Type :</label>
														</div>
														<div class="col-md-6">
														<input name="txttransTransType" value="Transfer" class="form-control" readonly="true"/>
															<%-- <div class="input-group-btn">
																<form:select path="txttransTransType"
																	cssClass="form-control">

																	<option value="Transfer">Transfer</option>
																</form:select>

															</div> --%>
														</div>
													</div>
												</div>

											</div>

											<br>

											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Amount</label>

														</div>
														<div class="col-md-6">
															<div class="input-group-bin">
																<form:input path="txttransAmount"
																	cssClass="form-control"></form:input>
																<%-- onkeypress="return isNumberKey(this)" maxlength="10" --%>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<label>Description</label>

														</div>
														<div class="col-md-6">
															<div class="input-group-bin">
																<form:textarea cssClass="form-control" rows="3"
																	cols="22" path="txttransDesc"></form:textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-md-6">
													<button id="submit" name="btn" value="Save"
														class="btn btn-primary">Save</button>
													<a href="banking.do" class="btn btn-primary btn-large"> Cancle</a>
												</div>
												<div class="col-md-6"></div>
											</div>
										</div>
									</div>
									<!-- </div> -->
								</form:form>
							</div>

							<!--END TRANSFER CASH -->


						</div>
					</div>
				</div>
			</div>

		</div>

	<!-- </div> -->
	<script
		src="<c:url value="/resources/datepicker/js/bootstrap-datepicker.js" />"></script>

</body>

</html>