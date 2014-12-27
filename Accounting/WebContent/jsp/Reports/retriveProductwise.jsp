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
<c:if test="${ not empty producttypelists}">
 <div class="table-responsive">
 
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                        <th>Product Code</th>
                                            <th>Item Name</th>
                                            <th>Unit of Measure</th>
                                            <th>Reorder Level</th>
                                            <th>Quantity</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:forEach items="${producttypelists}" var="showProductList">
                                        <tr class="odd gradeX">
                                        <td>${showProductList.productCode}</td>
                                            <td>${showProductList.txtName}</td>
                                             
                                            <td>${showProductList.txtUnitOfMeasure}</td>
                                           
                                            <td>${showProductList.txtReorderlevel}</td>
                                            <td>${showProductList.txtOpeningStock}</td>
                                             
                                            
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                </table>
                            </div>
                            </c:if>
<c:if test="${empty producttypelists}">

<h5>Record Cannot be located or do not exit.</h5>

</c:if>
</div>
