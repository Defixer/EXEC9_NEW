<%@ page import="com.hibernate.exercise6.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
	<body>
		<c:set var = "employee" value = '${requestScope["employee"]}'/>
		<c:set var = "personId" value = '${employee.getId()}'/>
		<c:set var = "contacts" value = '${employee.getContacts()}'/>
		<c:set var = "resultMessage" value = '${requestScope["resultMessage"]}'/>
		<c:if test = "${resultMessage == null}">
			<c:set var = "resultMessage" value = ""/>
		</c:if>
		
		<center>
			<br/><br/><h1><spring:message code = 'label.EditTitle'/></h1>
			<p style = "color:red;"><c:out value = "${resultMessage}"/></p>
			<form action = "contact.htm" method = "POST">
				<table align = "center">
					<input type = "hidden" name = "personId" value = "<c:out value = '${personId}'/>"/>
					<c:forEach var = "contact" items = "${contacts}">
						<c:set var = "contactId" value = '${contact.getId()}'/>
						<c:set var = "landline" value = '${contact.getLandline()}'/>
						<c:set var = "mobile" value = '${contact.getMobile()}'/>
						<c:set var = "email" value = '${contact.getEmail()}'/>
						
						<tr>
							<td align = "right"><b><spring:message code = 'label.EditExist'/>&nbsp;&nbsp;&nbsp;</b></td>
							<td><input type = "text" name = "landline" value = "<c:out value = '${landline}'/>" size = 10/></td>
							<td><input type = "text" name = "mobile" value = "<c:out value = '${mobile}'/>"/></td>
							<td><input type = "text" name = "email" value = "<c:out value = '${email}'/>"/></td>
							<td><a href = "contact.htm?action=deleteContact&personId=<c:out value='${personId}'/>&contactId=<c:out value='${contactId}'/>"><spring:message code = 'label.HrefDelete'/></a></td>
						</tr>
					</c:forEach>
					
					<tr>
						<td align="right"><b><spring:message code='label.EditAddNEw'/>&nbsp;&nbsp;&nbsp;<b/></td>
						<td><input type = "text" name = "newLandLine" value = "" size=10/></td>
						<td><input type = "text" name = "newMobile" value = ""/></td>
						<td><input type = "text" name = "newEmail" value = ""/></td>
					</tr>
					<tr>
						<td></td>
						<td><spring:message code = 'label.EditLandline'/></td>
						<td><spring:message code = 'label.EditMobile'/></td>
						<td><spring:message code = 'label.EditEmail'/></td>
					</tr>
				</table><br/><br/>
				<input type="hidden" name="personId" size=10 value="<c:out value='${personId}'/>" />
				<button type= "submit" name="action" value="saveContacts"><spring:message code='label.EditSave'/></button>
				<button type= "submit" name="action" value="cancel"><spring:message code='label.EditCancel'/></button>
			</form>
		</center>
	</body>
</html>
