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
<c:if test="${ not empty customerList}">
 
  <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                        <th>Date</th>
                                            <th>Sales Order</th>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Executed</th>
                                             <th>UnExecuted</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:forEach items="${customerList}" var="customerList">
                                        <tr class="odd gradeX"> 
                                        <td>${customerList.txtDate}</td>
                                            <td>${customerList.txtSOID}</td>
                                            <td>${customerList.product}</td>
                                            <td>${customerList.quantity}</td>
                                            <td>0.0</td>
                                            <td>${customerList.quantity}</td>
                                            
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                </table>
                            </div>
                            </c:if>
                                         
                   					<c:if test="${empty customerList}">
					
					<h5>Record Cannot be located or do not exit.</h5>
					
					</c:if>
                        </div>