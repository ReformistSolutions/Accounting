<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link href="<c:url value="resources/assets/plugins/Font-Awesome/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<script src="<c:url value="resources/assets/plugins/jquery-2.0.3.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
<!-- <link class="cssdeck" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" class="cssdeck"> -->

     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
             $('#dataTables-example2').dataTable();
         });
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
 </script>
    <script type="text/javascript" src="<c:url value="/resources/highslide/highslide-with-html.js" />"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/highslide/highslide.css" />"/>
	<script type="text/javascript">
    hs.graphicsDir = 'resources/highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.lang.creditsText = '';
    hs.lang.creditsTitle = '';
</script>
</head>
<body>

      <div class="main padder">
        <div class="row">
          <div class="col-md-4 col-md-offset-4 m-t-large">
            <br>
            <p align="center">
              <img alt="Profitbooks logo" disposition="inline" src="resources/images/logo.png" width="auto" height="auto" />
            </p>
            
            <div class="panel">
				        	<div class="panel-body">
				              <form:form method="post" action="loginuser.do" commandName="login"> 
				                    <!-- error msg end -->
								${error}
				                <div>
				                 	<label class="control-label"> Username </label>
				                 	<input type="text"  class="form-control" name="txtUname">
				                </div><br>
				                <div>
				                  <label class="control-label">Password</label>
				                  <input type="password" name="txtPassword" id="txtPassword" class="form-control">
				                </div><br>
				                <a href="#" class="pull-right m-t-mini"><small>Forgot password?</small></a>
				                	<span class="loading" style="display: none;">Please wait..</span>
				                	
				                	<input type="submit" name="submit" class="btn btn-primary" value="Sign in" />
				                <div class="line line-dashed"></div>
				                <p class="text-muted text-center"><small>Do not have an account?</small></p>				                
				                <a href="compDetails.do" class="btn btn-white btn-block" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType:   'iframe',height: '550',width: '1000' })">Create an account</a>
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
</body>
</html>