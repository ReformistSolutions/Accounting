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
<c:if test="${ not empty stocktransferlist}">
<div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Voucher No</th>
                                            <th>Voucher Date</th>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Destination Warehouse</th>
                                            <th>Description</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:forEach items="${stocktransferlist}" var="stocktransfer">
                                        <tr class="odd gradeX">
                                        <td>${stocktransfer.stktrnvno}</td>
                                        <td>${stocktransfer.stktrnvdate}</td>
                                        <td>${stocktransfer.stktrnproduct}</td>
                                        <td>${stocktransfer.stktrnqty}</td>
                                        <td>${stocktransfer.stktrndestwarehouse}</td>
                                        <td>${stocktransfer.stktrndesc}</td>
                                             
                                            
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                </table>
                            </div>
                            </c:if>
					<c:if test="${empty stocktransferlist}">
					
					<h5>Record Cannot be located or do not exit.</h5>
					
					</c:if>
</div>