<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:choose>
	<c:when test="${not empty invProductList}">
	<div class="table-responsive" style="width: 70%;">
<table id="tableID" class="table table-striped">	
<thead>
	<tr>
		<th align="center">Sr No</th>
		<th align="center">Product</th>
		<th align="center">Unit</th>
		<th align="center">Total Qty</th>
		<th align="center">Rem. Qty</th>
		<th align="center">Quantity</th>
		<th></th>
	</tr>
</thead>
<tbody>
<c:forEach items="${invProductList}" var="invProductList">
	<tr>
		<td><input type="text" name="deliveryChallandetails[${invProductList.srNo-1}].srNo" value="${invProductList.srNo}" id="deliveryChallandetails[${invProductList.srNo-1}].srNo" style="width: 50px;text-align: right;" class="form-control" ></input></td>
		<td>
			<select name="deliveryChallandetails[${invProductList.srNo-1}].itemCode" id="deliveryChallandetails[${invProductList.srNo-1}].itemCode" onchange="showMUnit(this.value,this.id);" class="form-control" >
				<option value="">---Select Product---</option>		
				<option value="${invProductList.prodId }" selected="selected">${invProductList.itemCode }</option>										
				<c:forEach items="${deliProdList}" var="deliProdList">
				<option value="${deliProdList.productId }">${deliProdList.txtName }</option>
				</c:forEach>
			</select>
		</td>
		<td><input type="text" name="unit${invProductList.srNo-1}" id="unit${invProductList.srNo-1}" value="${invProductList.unit}" class="form-control" readonly="readonly" style="width:80px;"></td>
		<td><input type="text" value="${invProductList.quantity}" name="totalQty${invProductList.srNo-1}" id ="totalQty${invProductList.srNo-1}" style="width: 80px;text-align: right;" readonly="readonly" class="form-control" ></input></td>
		<td><input type="text" value="${invProductList.rQty}" name="remQty${invProductList.srNo-1}" id ="remQty${invProductList.srNo-1}" style="width: 80px;text-align: right;" class="form-control" readonly="readonly" ></input></td>
		<td><input type="text" value="${invProductList.rQty}" name="deliveryChallandetails[${invProductList.srNo-1}].quantity" id ="deliveryChallandetails[${invProductList.srNo-1}].quantity" onblur="checkQuantity(this.id);" style="width: 80px;text-align: right;" class="form-control" ></input></td>
												
		<td><input type="button" name="btndel${invProductList.srNo-1}" id="btndel${invProductList.srNo-1}" value="-" onclick="delrow(this)" class="btn btn-danger"></td>
												
	</tr>	
</c:forEach>										
</tbody>
</table>
<div><input type="button" name="btnadd1" id="btnadd1" value="+ Add New Row" onclick="addRow();" class="btn btn-default btn-xs"></div>
</div>
	</c:when>
	<c:otherwise>
	<div class="table-responsive" style="width: 70%;">
		<table id="tableID" class="table table-striped">
										<thead>
											<tr>
												<th align="center">Sr No</th>
												<th align="center">Product</th>
												<th align="center">Unit</th>
												<th align="center">Quantity</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="text" name="deliveryChallandetails[0].srNo" value="1" id="deliveryChallandetails[0].srNo" style="width: 50px;text-align: right;" class="form-control" ></input></td>
												<td><select name="deliveryChallandetails[0].itemCode" id="deliveryChallandetails[0].itemCode" onchange="showMUnit(this.value,this.id);" class="form-control" >
												<!-- deliProdList -->
												<option value="">---Select Code---</option>												
												<c:forEach items="${deliProdList}" var="deliProdList">
													<option value="${deliProdList.productId }">${deliProdList.txtName }</option>
												</c:forEach>
												</select></td>
												<td><input type="text" name="unit0" id="unit0" class="form-control" readonly="readonly" style="width:80px;"></td>
												<td><input type="text" name="deliveryChallandetails[0].quantity" id ="deliveryChallandetails[0].quantity" style="width: 80px;text-align: right;" class="form-control" ></input></td>
												<td><input type="button" name="btndel0" id="btndel0" value="-" onclick="delrow(this)" class="btn btn-danger"></td>
												
											</tr>											
											</tbody>
										</table>
										<div><input type="button" name="btnadd1" id="btnadd1" value="+ Add New Row" onclick="addRow();" class="btn btn-default btn-xs"></div>
</div>
	</c:otherwise>	
</c:choose>
