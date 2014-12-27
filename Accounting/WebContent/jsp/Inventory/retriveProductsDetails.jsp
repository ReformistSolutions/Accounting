<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
    <div >
    <c:if test="${ not empty salesproductList}">
											<div class="row">
											<div class="table-responsive">
												<table id="productTable"  class="table table-striped">
													<thead>
														<tr>
															<th style="text-align: center;">Sr No</th>
															<th style="text-align: center;">Product</th>
															<th style="text-align: center;">Description</th>
															<th style="text-align: center;">Quantity</th>
															<th style="text-align: center;">Unit</th>
															<th style="text-align: center;">Action</th>
														</tr>
													</thead>												
													<tbody>
													<c:forEach items="${salesproductList}"  var="productList">
														<tr>
															<td><input name="productList[${productList.srNo-1}].srNo" id="productList[${productList.srNo-1}].srNo" type="text" value="${productList.srNo}" class="form-control" style="width: 50px; text-align: right;"></td>
															<%-- <td><input type="text" value="${productList.productId}" class="form-control"></td> --%>
															 <td>
															 	<select name="productList[${productList.srNo-1}].productId" id="productList[${productList.srNo-1}].productId" onchange="showProductDetailsI(this.value,this.id);" class="form-control">
															 		<option value=" ">----Select----</option>
															 		<option value="${productList.productId}" selected="selected"> ${productList.productName}</option>
															 		<c:forEach items="${prodID}" var="prodID">
																	<option value="${prodID.productCode}">${prodID.txtName}</option>
																	</c:forEach>
															 	</select>
															 </td> 
															<td><input name="productList[${productList.srNo-1}].desc" id="productList[${productList.srNo-1}].desc" class="form-control" value="${productList.desc}"></td>
															<td><input name="productList[${productList.srNo-1}].quantity" id="productList[${productList.srNo-1}].quantity" type="text" value="${productList.quantity}" class="form-control" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
															<td><input name="unit${productList.srNo-1}" id="unit${productList.srNo-1}" type="text" class="form-control"  value="${productList.unit}" readonly="readonly" style="width: 80px;"></td>
															<td>
																	<input type="button" name="showRaw${productList.srNo-1}" value="Assign" id="showRaw${productList.srNo-1}" onclick="assignRowMaterial(this.id);" class="btn btn-default btn-xs">															
																	<input type="button" name="btnDel${productList.srNo-1}" value="-" id="btnDel${productList.srNo-1}" onclick="deleteProduct(this.id)" class="btn btn-danger btn-xs">
															</td>															
														</tr>													
														<tr> 
															<td id="assignRaw${productList.srNo-1}" colspan="6">															
															</td>
														</tr>
															
														</c:forEach>
													</tbody>
												</table>	
												<!-- <input type="button" name="addRaw" id="addRaw" value="+ Add Product" onClick="addProduct();" class="btn btn-default btn-xs"> -->																												
											</div>
											</div>
											</c:if>
					<c:if test="${empty salesproductList}">
					<div class="row">
											<div class="table-responsive">
												<table id="productTable"  class="table table-striped">
													<thead>
														<tr>
															<th style="text-align: center;">Sr No</th>
															<th style="text-align: center;">Product</th>
															<th style="text-align: center;">Description</th>
															<th style="text-align: center;">Quantity</th>
															<th style="text-align: center;">Unit</th>
															<th style="text-align: center;">Action</th>
														</tr>
													</thead>												
													<tbody>
													
														<tr>
															<td><input name="productList[0].srNo" id="productList[0].srNo" type="text" value="1" class="form-control" style="width: 50px; text-align: right;"></td>
															<%-- <td><input type="text" value="${productList.productId}" class="form-control"></td> --%>
															 <td>
															 	<select name="productList[0].productId" id="productList[0].productId" onchange="showProductDetailsI(this.value,this.id);" class="form-control">
															 		<option value=" ">----Select----</option>															 		
															 		<c:forEach items="${prodID}" var="prodID">
																	<option value="${prodID.productCode}">${prodID.txtName}</option>
																	</c:forEach>
															 	</select>
															 </td> 
															<td><input name="productList[0].desc" id="productList[0].desc" class="form-control"></td>
															<td><input name="productList[0].quantity" id="productList[0].quantity" type="text" class="form-control" style="width: 80px; text-align: right;" onkeypress="return isNumberKey(this)"></td>
															<td><input name="unit0" id="unit0" type="text" class="form-control" readonly="readonly" style="width: 80px;"></td>
															<td>
																	<input type="button" name="showRaw0" value="Assign" id="showRaw0" onclick="assignRowMaterial(this.id);" class="btn btn-default btn-xs">															
																	<input type="button" name="btnDel0" value="-" id="btnDel0" onclick="deleteProduct(this.id)" class="btn btn-danger btn-xs">
															</td>															
														</tr>													
														<tr> 
															<td id="assignRaw0" colspan="6">
															
															</td>
														</tr>
													
													</tbody>
												</table>	
												<input type="button" name="addRaw" id="addRaw" value="+ Add Product" onClick="addProduct();" class="btn btn-default btn-xs">																												
											</div>
											</div>
					
					</c:if>
											</div>