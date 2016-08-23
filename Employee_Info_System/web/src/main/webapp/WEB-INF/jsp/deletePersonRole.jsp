<%@ page import="com.hibernate.exercise6.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
	<body>
		<c:set var="person" value='${requestScope["person"]}' />
		<c:set var="personId" value='${person.getId()}' />
		<c:set var="resultMessage" value='${requestScope["resultMessage"]}' />
		<c:if test="${resultMessage == null}">
			<c:set var="resultMessage" value="" />
		</c:if>
		<center>
		<br/><br/><h1> <spring:message code='label.PRoleTitle2'/> </h1>
		<p style="color:red;"><c:out value="${resultMessage}"/></p>
		<form action="persons.htm" method="POST" >
			<table align="center" >

				<c:set var="roleNames" value='${requestScope["roleNames"]}' />
				<c:set var="roles" value='${person.roleDTOs}' />
				<tr>
					<input type="hidden" name="personId" size=10 value="<c:out value='${personId}'/>" />
					<td ><b> <spring:message code='label.PRoleRoles'/> <b/></td>
					<td>
						<select name="newRole" >
							<c:forEach var="rolename" items="${roleNames}" >
								<c:set var="tempRoleName" value="${rolename.roleName}" />
								<c:set var="counter" value="1" />
								<c:forEach var="role" items="${roles}" >
									<c:set var="tempRole" value="${role.roleName}" />
									<c:if test="${tempRoleName eq tempRole}">
										<c:set var="counter" value="2" />
									</c:if>
								</c:forEach>
								<c:if test="${counter == '2'}">
								<option value="<c:out value='${tempRoleName}'/>" /> <c:out value='${tempRoleName}'/> </option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>

			</table><br/><br/>
			<button type= "submit" name="action" value="deleteSelectedPersonRole"><spring:message code='label.PRoleDelete'/></button>
			<button type= "submit" name="action" value="cancel"><spring:message code='label.PRoleCancel'/></button>
			</form>
		</center>
	</body>
</html>
