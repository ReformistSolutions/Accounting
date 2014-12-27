<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>DashBoard</title>
    <link href="<c:url value="resources/css/bootstrap.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="resources/css/sb-admin.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="resources/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
    <script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>


<script type="text/javascript">
$(document).ready(function(){

$("#${index}").addClass("active");
$("#${sales}").addClass("active");
$("#${purchase}").addClass("active");
$("#${banking}").addClass("active");
$("#${accounting}").addClass("active");
$("#${payroll}").addClass("active");
$("#${inventory}").addClass("active");
$("#${reports}").addClass("active");
});
</script>
<script type="text/javascript">
function getValue(id,name)
{			
	document.getElementById("empId").value = id;	
	document.getElementById("userName").innerHTML = "Hello "+name;	
}
</script>
<script type="text/javascript">
$(document).ready(function(){
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
});
</script>
  </head>
  <body>
    <div id="wrapper">
      <!-- Sidebar -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>	
            <span class="icon-bar"></span> 
            <span class="icon-bar"></span> 
          </button>
          
          <a class="navbar-brand" href="index.do">Accounting</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li id="${index}"><a href="index.do"  accesskey="h"><i class="fa fa-dashboard"></i> Das<span style="text-decoration: underline;">h</span>board</a></li>
         	<li id="${sales}"><a href="sales.do"  accesskey="s"><i class="fa fa-tags"></i><span style="text-decoration: underline;">S</span>ales</a></li>
          	<li id="${purchase}"><a href="purchase.do"  accesskey="p"><i class="fa fa-table"></i> <span style="text-decoration: underline;">P</span>urchase</a></li>
            <li id="${inventory}"><a href="inventory.do"  accesskey="i"><i class="fa fa-edit"></i> <span style="text-decoration: underline;">I</span>nventory</a></li>
            <li id="${payroll}"><a href="payroll.do"  accesskey="y"><i class="fa fa-inr"></i> Pa<span style="text-decoration: underline;">y</span>roll</a></li>	
            <li id="${banking}"><a href="banking.do"  accesskey="b"><i class="fa fa-building-o"></i> <span style="text-decoration: underline;">B</span>anking</a></li>
            <li id="${accounting}"><a href="accounting.do"  accesskey="a"><i class="fa fa-building-o"></i> <span style="text-decoration: underline;">A</span>ccounting</a></li>
            <li class="dropdown ">
           
             <!--  <a href="accounting.do" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-book"></i> Accounting<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li class="dropdown-submenu"><a href="accounting.do">Chart of Account</a></li>
                <li class="dropdown-submenu"><a href="createexpense.do">Record Expense</a></li>
                 <li class="dropdown-submenu"><a href="taxesform.do">Taxes</a></li>
                <li class="dropdown-submenu"><a href="journal.do">Journal Entry</a></li>
                <li class="dropdown-submenu"><a href="debitnote.do">Debit Note</a></li>
                <li class="dropdown-submenu"><a href="creditnote.do">Credit Note</a></li>
                <li class="dropdown-submenu"><a href="simpleAccount.do">Simple Accounting Entry</a></li>
                <li class="dropdown-submenu"><a href="auditors.do">Auditors</a></li>
                
              </ul> -->
            </li>           
            <li id="${reports}"><a href="reports.do"  accesskey="r"><i class="fa fa-bar-chart-o"></i> <span style="text-decoration: underline;">R</span>eports</a></li>
           
          </ul>
          <ul class="nav navbar-nav navbar-right navbar-user">
           
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>&nbsp;&nbsp;${userName } <b class="caret"></b></a>
              <ul class="dropdown-menu">
             <!--  <li><a href="#"><i class="fa fa-user"></i> </a></li> -->
                <%-- <li><a href="showProfile.do?empId=${userId}"><i class="fa fa-user"></i> Profile</a></li> --%>
               <li><a href="employeeProfile.do?empId=${userId}&empName=${userName }"><i class="fa fa-user"></i> Profile</a></li>
              <%--  employeeProfile empId empName
                <li><a href="employeeProfile.do?empId=${userId}&empName=${userName }"><i class="fa fa-user"></i> Profile</a></li>
               --%> <%-- <li><a data-toggle="modal" href="#basic" onClick="getValue('${userId}','${userName } ')"> <i class="fa fa-user"></i> Change Password</a></li> --%>
                <li><a href="edircompDetails.do"><i class="fa fa-building-o"></i> Company Details</a></li>
               <!--  <li><a href="#"><i class="fa fa-envelope"></i> Inbox <span class="badge">7</span></a></li>
                <li><a href="#"><i class="fa fa-gear"></i> Settings</a></li> -->
                <li class="divider"></li>
                <li><a href="logout.do"><i class="fa fa-power-off"></i> Log Out</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>
</div>


</body>
</html>
           