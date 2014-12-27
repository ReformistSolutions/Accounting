<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script src="<c:url value="/resources/assets/plugins/dataTables/jquery.dataTables.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/plugins/dataTables/dataTables.bootstrap.js" />" type="text/javascript"></script>
     <script>
         $(document).ready(function () {
             $('#dataTables-example1').dataTable();
              });
    </script>
<div>
<c:if test="${ not empty productList}">
	<div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                        <th>Product Code</th>
                                            <th>Product</th>
                                            <th>Available Qty</th>
                                            <th>Description</th>
                                            <th>Inventory Valuation</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                   <c:forEach items="${productList}" var="productList">
                                        <tr class="odd gradeX">
                                        <td>${productList.productCode}</td>
                                            <td>${productList.txtName}</td>
                                            <td>${productList.txtOpeningStock}</td>
                                            <td>${productList.txtDes}</td>
                                            <td>${productList.inventoryvalue}</td>
                                            
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                </table>
                            </div>
                            </c:if>
                                         
                   					<c:if test="${empty productList}">
					
					<h5>Record Cannot be located or do not exit.</h5>
					
					</c:if>
                        </div>



                