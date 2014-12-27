<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div>
		<div class="col-md-6">
			<select name="Designation" class="form-control">
				<option value="0">---Select---</option>
				<c:forEach items="${desigList}" var="desigList">
					<option value="${desigList.txtDesigId}">${desigList.txtDesigName}</option>
				</c:forEach>
			</select>
		</div>
</div>
