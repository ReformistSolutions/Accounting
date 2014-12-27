<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function closePage()
{
	alert("ok");
	window.close();
}
</script>
    
</head>
<body >
<center>
<c:if test="${message==1}">                     
<h4 class="msg-succ">
<font color="Green">
Company Registered Successfully.</font>
</h4> 
</c:if>
<c:if test="${message==0}">                     
<h4 class="msg-error"> 
<font color="Green">
Company Not Registered Successfully.</font>
</h4>
</c:if>
<button name="btn" onclick="urlSubmit('login.do','_blank')">For Login Click Here</button>
</center> 
</body>
</html>
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