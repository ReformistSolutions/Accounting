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
    <c:if test="${ not empty banktypeList}">
     <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                    <thead>
                                        <tr>
                                            <th>Voucher No</th>
                                            <th>Date</th>
                                            <th>From Account </th>
                                            <th>To Account</th>
                                            <th>Amount</th>
                                            <th>Description</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${banktypeList}" var="banklist">
                                        <tr class="odd gradeX">
                                             <td>${banklist.txtvchno}</td>
                                            <td>${banklist.txtdate }</td>
                                            <td>${banklist.txtfromaccnt }</td>
                                            <td>${banklist.txttoaccnt }</td>
                                            <td>${banklist.txtamt }</td>
                                            <td>${banklist.txtdescr }</td>         
                                        </tr>
                                       </c:forEach>
                                        </tbody>
                                </table>
                                </div>
                                </c:if>
					<c:if test="${empty banklist}">
					
					<h5>Record Cannot be located or do not exit.</h5>
					
					</c:if>
</div>