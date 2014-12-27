<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
<div class="table-responsive">
	<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>Variable Name</th>
				<th>Amount</th>
			</tr>
		</thead>
		<tbody>
			<%int cnt=0; %>
			<c:forEach items="${verialbeList}" var="verialbeList">
				<tr>
					<td><input type="hidden" name="veriableList[<%=cnt%>].payhead_id" value="${verialbeList.txtPayId}">
					<input type="hidden" name="veriableList[<%=cnt%>].payhead_type" value="${verialbeList.txtPayheadType}">${verialbeList.txtPayheadName}
					<input type="hidden" name="veriableList[<%=cnt%>].applicable_type" value="${verialbeList.applicable_type}"></td>
					<td><input type="text" name="veriableList[<%=cnt%>].amount" class="form-control"></td>
				</tr>
				<%cnt++; %>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>