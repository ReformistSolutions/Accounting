<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%--  <c:choose>
<c:when test="${counter!='0'}">  --%>
<% int count=1;%>
	<div id="linkedDiv">
	<c:forEach items="${linkedTaxList}" var="linkedTaxList">
		<div>
			<label>${linkedTaxList.linkTaxName}&nbsp;@&nbsp;${linkedTaxList.linksalesTax}%&nbsp;:</label>
		</div>
		<div>	
			<input type="hidden" style="width: 20px;" id="serLTax<%=count%>" value="${linkedTaxList.linksalesTax}"/>	
			<input type="hidden" style="width: 20px;" name="linkedTaxList[<%=count%>].linkedTaxId" id="linkedTaxList[<%=count%>].linkedTaxId" value="${linkedTaxList.linkTaxID}"/>	
			<input type="hidden" style="width: 20px;" name="linkedTaxList[<%=count%>].mTaxID" id="linkedTaxList[<%=count%>].mTaxID" value="${linkedTaxList.mTaxID}"/>	
			<input type="text" name="linkedTaxList[<%=count%>].serLinkedTax" readonly="readonly" id="linkedTaxList[<%=count%>].serLinkedTax" value="0.0" class="form-control" onkeypress="return isNumberKey(this)"></input>			
		</div>
		<%count++;%>		
	</c:forEach>
		<input type="hidden" value="${counter}" id="linkTCnt${idCounter}">
		<%-- <input type="text" value="${staticCounter}" id="staticCounter" name="staticCounter"> --%>
	</div>
 <%--  </c:when>
  <c:otherwise> --%>
  <%-- <div>
  	<input type="hidden" value="${counter}" id="linkTCnt${idCounter}">
  	</div>
  </c:otherwise>
</c:choose>	 --%>
			<%-- <table>
			<c:forEach items="${linkedTaxList}" var="linkedTaxList">
			 <tr>
			 	<td>
					<label>${linkedTaxList.linkTaxName}&nbsp;@&nbsp;${linkedTaxList.linkPurTax}%&nbsp;:</label>			 		
			 	</td>
			 	<td style="padding-right: 70px"></td>
			 	<td>
			 		<input type="hidden" id="serLTax<%=count%>" value="${linkedTaxList.linkPurTax}"/>
					<input type="text" name="linkedTax" readonly="readonly" id="linkedTax" value="0.0" class="form-control"></input>
			 	</td>
			 	</tr>
			<%count++; %>
			</c:forEach>
			</table> --%>