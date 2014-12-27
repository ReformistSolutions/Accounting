<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<div class="form-group" id="showAccountName">
    <label for="inputPassword3" class="col-md-3 control-label">Select account Name</label>    
    <div class="col-md-3">
      <select class="form-control" name="txtAccountName">
      	<option>---Select---</option>
      	<c:forEach items="${accountList}" var="accountList">
			<option value="${accountList.accId}">${accountList.txtAccountName}</option>
      	</c:forEach>
      </select>
      <label style="font-size: 12px">(Select an account for this payhead)</label>
    </div>
  </div>