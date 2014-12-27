<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
<div class="col-md-7">
<label>From&nbsp;Account&nbsp;: </label>
</div>
<div class="col-md-3">
<select name="fromaccount" id="fromaccount" onchange="checkSame(this.id)" style="width: 195px;" class="form-control">
 <c:forEach items="${retriveAccount}" var="accountList">
<option value="${accountList.txtNewAccNo}">${accountList.txtAccountName}</option>
</c:forEach>
</select>
</div>
</div>