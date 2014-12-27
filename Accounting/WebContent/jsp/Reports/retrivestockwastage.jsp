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
<c:if test="${ not empty stockwastelist}">
 <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                       <tr>
                                            <th>Voucher Number</th>
                                            <th>Voucher Date</th>
                                            <th>Warehouse</th>
                                            <th>Product</th>
                                            <th>Remark</th>
                                            <th>Avialable Qty</th>
                                            
                                                                                      
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${stockwastelist}" var="showwastage">
                                        <tr class="odd gradeX">
                                            <td>${showwastage.voucherno}</td>                                             
                                            <td>${showwastage.voucherdate}</td>
                                            <td>${showwastage.warehouse}</td>
                                             <td>${showwastage.product}</td>                                             
                                            <td>${showwastage.remark}</td>
                                            <td>${showwastage.qty}</td>
                                      </tr>
                                       </c:forEach>
                                        </tbody>
                                </table>
                            </div>
                            </c:if>
					<c:if test="${empty stockwastelist}">
					
					<h5>Record Cannot be located or do not exit.</h5>
					
					</c:if>
</div>

                            