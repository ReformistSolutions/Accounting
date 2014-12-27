<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@ page import="java.io.*" %>
	 <%-- <%! Connection con; %>
     <%! Statement stm; %>
     <%! int cnt; %>
     <%! ResultSet rs; %> 
   <%! public void openConnection()throws SQLException,ClassNotFoundException 
    {
	    Class.forName("com.mysql.jdbc.Driver");
  	   	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invoice", "root", "scott");
    	stm=con.createStatement();
    }   
  	%>
	<%! public int getCount()throws SQLException
	{
		  rs = stm.executeQuery("SELECT COUNT(*) FROM login" );
	      rs.next();
	      cnt = rs.getInt(1);
		return(cnt);
	}
	%> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Log In</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/icon">
<head>
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
    <script type="text/javascript" src="<c:url value="/resources/highslide/highslide-with-html.js" />"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/highslide/highslide.css" />"/>
	<script type="text/javascript">
    hs.graphicsDir = 'resources/highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>
<%-- onload="<% openConnection();int c=getCount();%>" --%>
</head> 
<body  background="resources/images/images.jpg" style="overflow-x: hidden;" >

      <div class="main padder" > 
        <div class="row">
          <div class="col-md-4 col-md-offset-4 m-t-large">
            <br>
            <div class="panel panel-default" >
            <p align="center">            
              <img  disposition="inline" src="resources/images/logo.png" width="auto" height="auto" />              
            </p>
            </div>
            <c:if test="${res > 0 }">
            <div>
            <label id="changed"><h5><font color="green" size="3" face="Times New Roman">Password is Changed Successfully Please Login Again</font></h5></label>
            <script type="text/javascript">
            	$('#changed').fadeOut(4000,function()
            			{            		
            	});
            </script>
            </div>
             
            </c:if>
            <div class="panel panel-default" >
				        	<div class="panel-body">
				              <form:form method="post" action="loginuser.do" commandName="login"> 
				                    <!-- error msg end -->
							${error}
				                <div>
				                 	<!-- <label class="control-label"> Username </label> -->
				                 	<input type="text" class="form-control" name="txtUname" placeholder="UserName">
				                </div><br>
				                <div>
				                  <!-- <label class="control-label">Password</label> -->
				                  <input type="password" name="txtPassword" id="txtPassword" placeholder="password" class="form-control">
				                </div><br>
				                <a href="#" class="pull-right m-t-mini"><small>Forgot password?</small></a>
				                	<span class="loading" style="display: none;">Please wait..</span>
				                	<input type="submit" name="submit" class="btn btn-primary" value="Sign in" /><br>
				                <div class="line line-dashed"></div>
				              <c:if test="${count < 1 }">
				                <p class="text-muted text-center"><small>Do not have an account?</small></p>
				           		<a data-toggle="modal" class="btn btn-white btn-block" href="#wide" >Create an account</a>
				              </c:if>
				              <!-- <div id="compRegForm">
				                <p class="text-muted text-center"><small>Do not have an account?</small></p>				                
				                <a href="compDetails.do" class="btn btn-white btn-block" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '550',width: '1000' })">Create an account</a>
				           		<a data-toggle="modal" class="btn btn-white btn-block" href="#wide" >Create an account</a>
				               <a class="btn btn-white btn-block" href="checkRegi.do" >Create an account</a>				               
				              </div> -->
				              </form:form>
				        </div>
				        </div>            
  </div>
        </div>
      </div>
		<div>
    <div class="text-center padder clearfix">
      <p>
       <small>&copy; Reformist Solutions </small><br><br>        
      </p>
    </div>
  </div>	
   <%-- <c:if test="<%=c > 0 %>">
            <script type="text/javascript">
           			var link=document.getElementById("compRegForm").style.display="none";
            </script>
   </c:if> --%>
  <form:form action="addCompany.do" cssClass="form-inline" id="formMain"  modelAttribute="companyDetails" onsubmit="reloadpage()" >
							<div class="modal fade" id="wide" tabindex="-1" role="basic" aria-hidden="true" >
								<div class="modal-dialog modal-wide" style="width: 950px">
 									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title">Company Registration</h4>
										</div>
							<div class="modal-body">               
								<div class="row">
									<div class="col-md-12">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>Company&nbsp;Name&nbsp;: </label>
													</div>												
													<div class="col-md-4">
														<input type="text" name="compName" class="form-control" >
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>Date: </label>
													</div>												
													 <div class="col-md-4"> 
														<% 
															 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");	     
															/*  Date date = new Date();	     
														  	 String dt=dateFormat.format(date); */
														  	java.sql.Timestamp dt=new java.sql.Timestamp(new java.util.Date().getTime());
														  	 String date=dateFormat.format(dt);
														%> 
														<input type="text" name="txtdate" value="<%=date %>" readonly="readonly" class="form-control" >
													</div>
												</div>
											</div>
									</div>
								</div><br>
								<div class="row">
									<div class="col-md-12">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>Address&nbsp;: </label>
													</div>												
													<div class="col-md-4">
														<textarea name="compAddress" rows="3" cols="25" class="form-control"> </textarea>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>&nbsp;Nature&nbsp;of&nbsp;Business: </label>
													</div>												
													<div class="col-md-4">
														<textarea name="compDesc" rows="3" cols="25" class="form-control"></textarea>
													</div>
												</div>
											</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>&nbsp;Tax Declaration: </label>
													</div>												
													<div class="col-md-4">
														<textarea name="compTerms" rows="3" cols="40" class="form-control"></textarea>
													</div>
												</div>
											</div>											
									</div>
								</div>
							<br>
								<div class="row">
									<div class="col-md-12">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>Contact&nbsp;No&nbsp;: </label>
													</div>												
													<div class="col-md-4">
														<input type="text" name="contactNo" class="form-control"></input>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>E-Mail&nbsp;: </label>
													</div>												
													<div class="col-md-4">
														<input name="email" class="form-control"></input>
													</div>
												</div>
											</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>VAT TIN&nbsp;No&nbsp;: </label>
													</div>												
													<div class="col-md-4">
														<input type="text" name="vatNo" class="form-control"></input>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>CST TIN&nbsp;No: </label>
													</div>												
													<div class="col-md-4">
														<input type="text" name="cstNo" class="form-control"></input>
													</div>
												</div>
											</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>Website: </label>
													</div>												
													<div class="col-md-4">
														<input type="text" name="website" class="form-control"></input>
													</div>
												</div>
											</div>
									</div>
								</div>
								
								<br>
								<div class="row">
									<div class="col-md-12">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>User Name: </label>
													</div>												
													<div class="col-md-4">
														<input name="Ausername" class="form-control"></input>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-4">
														<label>&nbsp;Password: </label>
													</div>												
													<div class="col-md-4">
														<input type="password" name="Apassword" class="form-control">
													</div>
												</div>
											</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
											<button type="submit" class="btn btn-primary"  style="float: left;">Save</button>
											<button type="button" class="btn btn-default" data-dismiss="modal"  style="float: left;">Close</button>
											
										</div>
							</div>
							</div>
							</div> 
					<br>	
					</form:form>
</body>
</html>