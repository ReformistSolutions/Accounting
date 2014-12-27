<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<div class="row">
	<div class="col-md-4">
		<label>Customer&nbsp;Name&nbsp;:- </label>
	</div>
	<div class="col-md-3">
		<select name="customerName" id="customerName" onchange="retriveAdd(this.value,this.id)" class="form-control">
			<option value="0">--Select Name--</option>			
			<c:forEach items="${cName}" var="cName"> 
			<option value="${cName.custId}" selected="selected">${cName.txtCName}</option>
			</c:forEach>
			<c:forEach items="${customerList}" var="customerList"> 
			<option value="${customerList.txtCustID}">${customerList.txtCustName}</option>
			</c:forEach>
		</select>
	</div>
</div>