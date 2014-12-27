	 <%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");	     
		Date date = new Date();	     
		String dt=dateFormat.format(date);
	%>
<div class="panel panel-default" id="testTable">
						<div class="panel-body">						  
							<div class="panel panel-default">				         
				                <div class="panel-heading"><center>Outstanding Receipts</center><br><center> As On <%=dt%></center> </div>	
								<div class="table-responsive">
                                <table border="1" width="820" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                       		<th width="50" style="text-align: center;">Invoice</th>
                                            <th width="200" style="text-align: center;">Customer Name</th>                                           
                                            <th width="50" style="text-align: center;">Date</th>
                                            <th width="50" style="text-align: center;">Due Date</th>
                                            <th width="90" style="text-align: center;">Pending Amt   (<i class="fa fa-inr"></i>)</th>                                                                                
                                            <th width="50" style="text-align: center;">Extra Days</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                    	<c:when test="${not empty outsReceiptList}">                                    	
                                    <c:forEach items="${outsReceiptList}" var="outsReceiptList">
                                    	<tr>
                                    		<td>${outsReceiptList.txtInvID}</td>
                                    		<td>${outsReceiptList.txtCName}</td>
                                    		<td>${outsReceiptList.txtDate}</td>
                                    		<td>${outsReceiptList.txtDueDate}<%-- <input type="text" value="${outsReceiptList.txtDueDate}"> --%></td>
                                    		<td style="text-align: right;">${outsReceiptList.balance}</td>
                                    		<td style="text-align: right;"></td>
                                    	</tr>   
                                    	</c:forEach>                                     	                       	
                                    	<tr style="border-collapse: collapse;">
                                    		<td colspan="4" style="text-align: right;">Total</td>
                                    		<td style="text-align: right;text-decoration: underline;"> ${outsReceiptTotal}</td>
                                    		<td></td>
                                    	</tr>
                                    	</c:when>
                                    	<c:otherwise>
                                    	<tr>   
                                    		<td colspan="6">                                		
                                    			<h5>Records Not Available</h5>
                                    		</td> 
                                    	</tr>
                                    	<tr style="border-collapse: collapse;">
                                    		<td colspan="4" style="text-align: right;">Total</td>
                                    		<td style="text-align: right;text-decoration: underline;">00.0</td>
                                    		<td></td>
                                    	</tr>
                                    	</c:otherwise>
                                    </c:choose>    
                                    </tbody>
                                </table>
                            </div>
							</div>   
						</div>
					</div>