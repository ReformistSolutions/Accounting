<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
		<div class="col-md-6">
			<select name="dept" class="form-control">
				<option value="0">---Select---</option>
				<c:forEach items="${deptList}" var="deptList">
					<option value="${deptList.txtDeptId}">${deptList.txtDeptName}</option>
				</c:forEach>
			</select>
		</div>
</div>