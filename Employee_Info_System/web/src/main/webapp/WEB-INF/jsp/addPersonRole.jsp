<%@ page import="com.hibernate.exercise6.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
	<body>
		<c:set var = "employee" value = '${requestScope["employee"]}'/>
		<c:set var = "personId" value = '${employee.getId()}'/>
		<c:set var = "resultMessage" value = '${requestScope["resultMessage"]}'/>
		<c:if test = "${resultMessage == null}">
			<c:set var = "resultMessage" value = ""/>
		</c:if>
	
		<center>
			<br/><br/><h1><spring:message code = 'label.PRoleTitle'/></h1>
			<p style = "color:red;"><c:out value = "${resultMessage}"/></p>
			<form>
				<table align = "center">
					<c:set var = "roleNames" value = '${requestScope["roleNames"]}'/>
					<tr>
						<input type = "hidden" name = "personId" size = 10 value = "<c:out value = '${personId}'/>"/>
						<td><b><spring:message code = 'label.PRoleRoles'/></b></td>
						<td>
							<select name = "newRole">
								<c:forEach var = "roleName" items = "${roleNames}">
									<c:set var = "tempRoleName" value = '${roleName.getRoleName()}'/>
									<option value = "<c:out value = '${tempRoleName}'/>"><c:out value = '${tempRoleName}'/></option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</table><br/><br/>
				<button type = "submit" name = "action" value = "savePersonRole"><spring:message code = 'label.PRoleSave'/></button>
				<button type = "submit" name = "action" value = "cancel"><spring:message code = 'label.PRoleCancel'/></button>
			</form>
		</center>
	</body>
</html>
