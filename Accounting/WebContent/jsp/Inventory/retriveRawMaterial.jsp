<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
   <c:if test="${ not empty rawMaterialList}">
 <div>
<!--   	<div class="row"> -->
			<div class="table-responsive">
				<table  id="rawMaterialTable${cnt}"  class="table table-striped">
					<thead>
						<tr>
							<th style="text-align: center;">Sr No</th>
							<th style="text-align: center;">Product</th>
							<th style="text-align: center;">Description</th>
							<th style="text-align: center;">Avl. Qty</th>
							<th style="text-align: center;">Rq. Qty Per ${unit}</th>
							<th style="text-align: center;">Quantity</th>
							<th style="text-align: center;">Action</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${rawMaterialList}" var="rawMaterialList">
						<tr>
							<td><input type="text" id="rawMaterialList[${cnt}${rawMaterialList.srno-1}].srno" name="rawMaterialList[${cnt}${rawMaterialList.srno-1}].srno" value="${rawMaterialList.srno}" class="form-control" style="width: 50px; text-align: right;"></td>
							<td>
								<select id="rawMaterialList[${cnt}${rawMaterialList.srno-1}].rawMId" name="rawMaterialList[${cnt}${rawMaterialList.srno-1}].rawMId" onchange="showRawMDesc(this.value,this.id);" class="form-control">
									<option value=" ">---select---</option>
									<option value="${rawMaterialList.rawMId}" selected="selected">${rawMaterialList.productName}</option>
									<c:forEach items="${rmList}" var="rmList">
										<option value="${rmList.productId}">${rmList.productName}</option>
									</c:forEach>
								</select>
							</td>
							<td><input id="rawMaterialList[${cnt}${rawMaterialList.srno-1}].desc" name="rawMaterialList[${cnt}${rawMaterialList.srno-1}].desc" value="${rawMaterialList.desc}" style="width: 120px;"" class="form-control"></td>
							<td><input type="text" name="rawMaterialList[${cnt}${rawMaterialList.srno-1}].avlqty" id="rawMaterialList[${cnt}${rawMaterialList.srno-1}].avlqty" value="${rawMaterialList.avlqty}" class="form-control" readonly="readonly" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
							<td><input type="text" name="rawMaterialList[${cnt}${rawMaterialList.srno-1}].reqty" id="rawMaterialList[${cnt}${rawMaterialList.srno-1}].reqty" value="${rawMaterialList.reqty}" class="form-control" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
							<td><input type="text" name="rawMaterialList[${cnt}${rawMaterialList.srno-1}].quantity" id="rawMaterialList[${cnt}${rawMaterialList.srno-1}].quantity" value="${rawMaterialList.quantity}" class="form-control" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
							<td><input type="button" class="btn btn-danger btn-xs" name="btndels${cnt}${rawMaterialList.srno-1}" id="btndels${cnt}${rawMaterialList.srno-1}" value="-" onclick="delassigedraw(this.id);"></td>
							<td><input type="hidden" name="rawMaterialList[${cnt}${rawMaterialList.srno-1}].productId" id="rawMaterialList[${cnt}${rawMaterialList.srno-1}].productId" value="${rawMaterialList.productId}" class="form-control" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>	
				<input type="button" name="addRec${cnt}" id="addRec${cnt}" value="+ Add Raw Material" onClick="assignRaw(this.id);" class="btn btn-default btn-xs">
			</div>
	</div>
<!-- </div> -->
</c:if>
	<c:if test="${empty rawMaterialList}">
	<h5>Raw Material Not Assigned</h5>
	</c:if>