<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<select name="recordWastageDetailsList[0].txtItem1"
	id="recordWastageDetailsList[0].txtItem1"
	onchange="showWastageQuntity(this.value,this.id);" class="form-control">
	<option value="Select">----Select----</option>
	<c:forEach items="${prodID}" var="prodID">
				<option value="${prodID.productCode}">${prodID.txtName}</option>
		 </c:forEach>
</select>