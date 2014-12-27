<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
<div class="table-responsive">
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>Pay Head</th>
				<th>Pay Head Type</th>
				<th>Applicable</th>
				<th>Amount*</th>
			</tr>
		</thead>
		<tbody>
			<%int cnt=0; %>
			<c:forEach items="${payheadList}" var="payheadList">
				<tr>
					<td><input type="hidden" name="salaryBeans[<%=cnt%>].payheadname" value="${payheadList.txtPayId}">${payheadList.txtPayheadName}</td>
					<td><input type="hidden" name="salaryBeans[<%=cnt%>].payheadtype" id="salaryBeans[<%=cnt%>].payheadtype" value="${payheadList.txtPayheadType}">${payheadList.txtPayheadType}
					<input type="hidden" name="salaryBeans[<%=cnt%>].applicable_type" value="${payheadList.applicable_type}">
					</td>
					<td>${payheadList.applicable}</td>
					<td>
					<input type="text" name="salaryBeans[<%=cnt%>].payamt" id="txtpayhead<%=cnt %>" class="form-control" value="0.0" onblur="onTotal(this.id);" />					
					</td>
					<td><input type="hidden" name="prevpayamt<%=cnt%>" id="prevpayamt<%=cnt%>" class="form-control" value="0.0" /></td>
				</tr>
				<%cnt++; %>
			</c:forEach>
			
			<tr>
				<td><input type="hidden" id="payHedCnt" value="<%=cnt%>"></td>
				<td></td>
				<td>Total</td>
				<td><input type="text" name="payheadtotal" id="payheadtotal" value="0.0" readonly="readonly" class="form-control"></td>
			</tr>
		</tbody>
	</table>
</div>
</div>