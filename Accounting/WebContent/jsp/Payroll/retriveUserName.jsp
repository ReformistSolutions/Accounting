<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div>
	<c:if test="${UN==0}">
		<div id="retriveUserName">
			<font color="red">Please...Enter Different UserName..!</font>
		</div>
	</c:if>
	<%-- <c:if test="${UN==1}">
		<div id="retriveUserName">
			<font color="green">UserName is Valid..!</font>
		</div>
	</c:if> --%>
</div>