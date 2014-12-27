<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<div>
	<div class="col-md-4">
		<div class="row">
			<div class="col-md-5">
				<label >From&nbsp;Account&nbsp;: </label>
			</div>
			<div class="col-md-7">
				<select name="accountNo" class="form-control" style="width:200px;">
					<option value="0">---Select---</option>
					<c:forEach items="${accList}" var="accountList">		 											
						<option value="${accountList.txtNewAccNo}">${accountList.txtAccountName}</option>													
				    </c:forEach>
				</select>
			</div>
		</div>
	</div>
</div>