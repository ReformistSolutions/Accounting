<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib  uri="http://www.springframework.org/tags/form" prefix="form" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sales Orders</title>
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
     <script>
     
     
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
             $('#dataTables-example3').dataTable();       
         });
    </script>
 <script type="text/javascript" src="<c:url value="/resources/highslide/highslide-with-html.js" />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/highslide/highslide.css" />"/>
<script type="text/javascript">
    hs.graphicsDir = 'resources/highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>
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
function urlSubmit1(url)
{
	if((confirmDelete()==true))
		{
		
			window.location.assign(url);
		}
	else
		{
			return false;
		}

}
function confirmDelete()
{
	var res=confirm("Are You Sure To Disable Record");
	if(res==true)
		{
			return true;
		}
	else
		{
			return false;
		}
}
</script>
<style>
   
#circleg {
	width: 20px;
	height: 20px;
	background: RGB(96, 169, 23);
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	border-radius: 50px;
}
#circler {
	width: 20px;
	height: 20px;
	background: rgb(229, 20, 0);
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	border-radius: 50px;
}
#circley {
	width: 20px;
	height: 20px;
	background:  RGB(227, 200, 0);
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	border-radius: 50px;
}
   </style>
</head>	
<body style="overflow-x: hidden;">
<div id="wrapper">
<%@ include file="../header.jsp" %>
<div id="container">
<%@ include file="innerHeader.jsp" %>						
<form:form action="" cssClass="form-inline">
<input type="hidden" id="hide" name="hide1" value="0">		
<br>					
<div class="col-md-12">    
<div class="panel panel-default">
						<div class="panel-body">
       <div class="col-md-9">
			            	<ol class="breadcrumb">
			             		<li class="active"> <i class="icon-file-alt"></i> Sales Order</li>          
			             	</ol>
			               </div>            
			             <div class="col-md-3 pull right" >	
			             
			             <button type="button" class="btn btn-primary " onclick="urlSubmit('newOrder.do','1')" data-toggle="tooltip" data-placement="left" title="New Order"><small><i class="fa fa-2x fa-edit"></i></small> Create Sales Order</button>
			                     </div>
			                    </div>
			                    </div>
</div><br>

<c:if test="${message==1}">
	<div class="col-md-12">  
<div class="alert alert-success" role="alert" id="success">${msg}</div>
</div>
<script type="text/javascript">	
  $('#success').fadeOut(4000, function() 
{
  });
</script>
</c:if>
<c:if test="${message==0}">
	<div class="col-md-12">  
<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
</div>
<script type="text/javascript">	
  $('#failure').fadeOut(4000, function() 
{
  });
</script>
</c:if>
<c:if test="${updatemsg==1}">
	<div class="col-md-12">  
<div class="alert alert-success" role="alert" id="success">${msg}</div>
</div>
<script type="text/javascript">	
  $('#success').fadeOut(4000, function() 
{
  });
</script>
</c:if>
<c:if test="${updatemsg==0}">
	<div class="col-md-12">  
<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
</div>
<script type="text/javascript">	
  $('#failure').fadeOut(4000, function() 
{
  });
</script>
</c:if>
<c:if test="${deletemsg==1}">
	<div class="col-md-12">  
<div class="alert alert-success" role="alert" id="success">${msg}</div>
</div>
<script type="text/javascript">	
  $('#success').fadeOut(4000, function() 
{
  });
</script>
</c:if>
<c:if test="${deletemsg==0}">
	<div class="col-md-12">  
<div class="alert alert-danger" role="alert" id="failure">${msg}</div>
</div>
<script type="text/javascript">	
  $('#failure').fadeOut(4000, function() 
{
  });
</script>
</c:if>

<br>
<div class="col-md-12">    
 				<div class="panel panel-default">        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                       		<th>Status</th>
                                            <th>Order ID</th>                                           
                                            <th>Customer</th>
                                            <th>Order Date</th>
                                            <th>Deli. Date</th>
                                            <th>Total</th>
                                            <th>Inv. Created</th>
                                            <th>Details</th>
                                            <th>Actions</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <!-- orderList -->
                                     <c:forEach items="${orderList}"  var="orderList">
                                        <tr class="odd gradeX">
                                        	 <td>                                                                       
		                                        <c:choose>
		    									  <c:when test="${orderList.oc_status=='O'}">		    								
		    									  	<font color="Green">Open</font>
		     									  </c:when>
		     									  <c:when test="${orderList.oc_status=='C'}">		    								
		    									  	<font color="Red">Close</font>
		     									  </c:when>		    									 
												</c:choose>  
												
                                        	</td>
                                            <td>${orderList.txtSOID }</td>                                            
                                            <td>${orderList.txtCName }</td>
                                            <td>${orderList.txtDate }</td>
                                            <td>${orderList.txtDueDate}</td>
                                            <td>${orderList.txtAmtPayble }</td> 
                                            <td>${orderList.invCreated }</td>                                                                           
                                            <td><a href="showSalesOrderDetails.do?orderId=${orderList.txtSOID }" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '500',width: '850' })" data-toggle="tooltip" data-placement="top" title="Details">Details</a></td>
                                            <td>
                                            <div class="btn-group">
											  <button data-toggle="dropdown" class="btn dropdown-toggle btn-xs">Action <span class="caret"></span></button>
											  <ul class="dropdown-menu">	
											    <li><a href="viewOrder.do?orderId=${orderList.txtSOID }" data-toggle="tooltip" data-placement="left" title="View">View</a></li>											
												<c:if test="${orderList.invCreated=='No'}">
												<li><a href="editOrder.do?orderId=${orderList.txtSOID }" data-toggle="tooltip" data-placement="left" title="Edit">Edit</a></li>
												</c:if>
												
												<li><a href="#" onclick="urlSubmit1('deleteSalesOrder.do?orderId=${orderList.txtSOID }')" data-toggle="tooltip" data-placement="left" title="Disable">Disable</a></li>
											  </ul>
											 </div>
											  </td>
                                        </tr>
                                    </c:forEach>
                                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            
	          
       
  			
</form:form>    		
</div>
</div>
</body>
</html>