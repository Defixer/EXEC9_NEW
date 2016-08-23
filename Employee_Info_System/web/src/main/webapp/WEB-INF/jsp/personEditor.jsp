<%@ page import="com.hibernate.exercise6.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
	<body>
		<c:set var = "employee" value = '${requestScope["employee"]}'/>
		<c:set var = "personId" value = '${employee.getId()}'/>
		
		<c:set var = "name" value = '${employee.getName()}'/>
		<c:set var = "title" value = '${name.getTitle()}'/>
		<c:set var = "firstName" value = '${name.getFirstName()}'/>
		<c:set var = "middleName" value = '${name.getMiddleName()}'/>
		<c:set var = "lastName" value = '${name.getLastName()}'/>
		<c:set var = "suffix" value = '${name.getSuffix()}'/>
		
		<c:set var = "address" value = '${employee.getAddress()}'/>
		<c:set var = "streetNo" value = '${address.getStreetNo()}'/>
		<c:set var = "brgy" value = '${address.getBrgy()}'/>
		<c:set var = "cityMunicipality" value = '${address.getCityMunicipality()}'/>
		<c:set var = "zipcode" value = '${address.getZipcode()}'/>
		
		<c:set var = "otherInfo" value = '${employee.getOtherInfo()}'/>
		<c:set var = "birthday" value = '${otherInfo.getBirthday()}'/>
		<c:set var = "gwa" value = '${otherInfo.getGwa()}'/>
		<c:set var = "dateHired" value = '${otherInfo.getHireDate()}'/>
		<c:set var = "isEmployed" value = '${otherInfo.getIsEmployed()}'/>
		
		<c:choose>
			<c:when test = "${isEmployed == true}">
				<c:set var = "isEmployed" value = "Yes"/>
			</c:when>
			<c:otherwise>
				<c:set var = "isEmployed" value = "No"/>
			</c:otherwise>
		</c:choose>
		<c:set var = "roleNames" value = '${employee.getRole()}'/>
		
		<c:set var = "resultMessage" value = '${requestScope["resultMessage"]}'/>
		<c:if test = "${resultMessage == null}">
			<c:set var = "resultMessage" value = ""/>
		</c:if>
		
		<center>
			<br/><br/><h1> <spring:message code='label.addETitle'/> </h1>
			<p style="color:red;"><c:out value="${resultMessage}"/></p>
			<p> <spring:message code='label.addPRequired'/> </p>
			<form action="persons.htm" method="POST" >
				<table align="center" >
					<tr>
						<td align="right"><b><spring:message code='label.addPName'/>&nbsp;&nbsp;&nbsp;<b/></td>
						<input style="display:none" type="text" name="personId" size=10 value="<c:out value='${personId}'/>"/>
						<td><input type="text" name="title" size=10 value="<c:out value='${title}'/>"/></td>
						<td><input type="text" name="firstName" value="<c:out value='${firstName}'/>"/></td>
						<td><input type="text" name="middleName" value="<c:out value='${middleName}'/>"/></td>
						<td><input type="text" name="lastName" value="<c:out value='${lastName}'/>"/></td>
						<td><input type="text" name="suffix" size=10 value="<c:out value='${firstName}'/>"/></td>
					</tr>
					<tr>
						<td></td>
						<td><spring:message code='label.addPTName'/></td>
						<td><spring:message code='label.addPFName'/>*</td>
						<td><spring:message code='label.addPMName'/>*</td>
						<td><spring:message code='label.addPLName'/>*</td>
						<td><spring:message code='label.addPSName'/></td>
					</tr>
					
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td align="right"><b><spring:message code='label.addPAddress'/>&nbsp;&nbsp;&nbsp;<b/></td>
						<td><input type="text" name="streetNo" value="<c:out value='${streetNo}'/>" size=10 /></td>
						<td><input type="text" name="brgy" value="<c:out value='${brgy}'/>" /></td>
						<td><input type="text" name="cityMunicipality" value="<c:out value='${cityMunicipality}'/>" /></td>
						<td><input type="text" name="zipcode" value="<c:out value='${zipcode}'/>" /></td>
					</tr>
					<tr>
						<td></td>
						<td><spring:message code='label.addPStreetNo'/>*</td>
						<td><spring:message code='label.addPBrgy'/></td>
						<td><spring:message code='label.addPCityMunicipality'/>*</td>
						<td><spring:message code='label.addPZipcode'/>*</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<c:forEach var="contact" items="${contacts}" >
						<c:set var="mobileNumber" value='${contact.getMobileNumber()}' />
						<c:set var="landLineNumber" value='${contact.getLandLineNumber()}' />
						<c:set var="emailAddress" value='${contact.getEmailAddress()}' />
						                
						<tr>
							<td align="right"><b><spring:message code='label.addPContacts'/>&nbsp;&nbsp;&nbsp;<b/></td>
							<td><input type="text" name="landline" value="<c:out value='${landline}'/>" size=10/></td>
							<td><input type="text" name="mobile" value="<c:out value='${mobile}'/>" /></td>
							<td><input type="text" name="email" value="<c:out value='${email}'/>" /></td>
						</tr>						
					</c:forEach>
					<tr>
						<td></td>
						<td><spring:message code='label.addPLandline'/></td>
						<td><spring:message code='label.addPMobile'/></td>
						<td><spring:message code='label.addPEmail'/></td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td align="right"><b><spring:message code='label.addPBirthday'/>&nbsp;&nbsp;&nbsp;<b/></td>
						<td>
						<input type="text" name="birthday" value="<c:out value='${birthday}'/>" size=10>*
						</td>
					</tr>
					<tr>
						<td align="right"><b><spring:message code='label.addPGwa'/>&nbsp;&nbsp;&nbsp;<b/></td>
						<td>
							<select name="gwa" value="<c:out value='${gwa}'/>" >
								<option value="1.00">1.00</option>
								<option value="1.25">1.25</option>
								<option value="1.50">1.50</option>
								<option value="1.75">1.75</option>
								<option value="2.00">2.00</option>
								<option value="2.25">2.25</option>
								<option value="2.50">2.50</option>
								<option value="2.75">2.75</option>
								<option value="3.00">3.00</option>
								<option value="5.00">5.00</option>
							</select>*
						</td>
					</tr>
					<tr>
						<td align="right"><b><spring:message code='label.addPDateHired'/>&nbsp;&nbsp;&nbsp;<b/></td>
						<td>
						<input type="text" name="dateHired" value="<c:out value='${dateHired}'/>" size=10>*
						</td>
					</tr>
					<tr>
						<td><b><spring:message code='label.addPEmployed'/>&nbsp;&nbsp;&nbsp;<b/></td>
						<td>
						<select name="isEmployed" value="<c:out value='${isEmployed}'/>" >
							<option value="Yes"><spring:message code='label.addPYes'/></option>
							<option value="No"><spring:message code='label.addPNo'/></option>
						</select>*
						</td>
					</tr>
					
					<c:set var="roleNames" value='${requestScope["roleNames"]}' />
					<c:set var="roles" value='${employee.roleDTOs}' />
					<tr>
						<td align="right"><b><spring:message code='label.addPRoles'/>&nbsp;&nbsp;&nbsp;<b/></td>
						<td>
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
								<input type="checkbox" name="role" value="<c:out value='${tempRoleName}'/>" checked/> <c:out value='${tempRoleName}'/> <br>
								</c:if>
								<c:if test="${counter == '1'}">
									<input type="checkbox" name="role" value="<c:out value='${tempRoleName}'/>" /> <c:out value='${tempRoleName}'/> <br>
								</c:if>
							</c:forEach>
						</td>
					</tr>
				</table><br/><br/>
				<button type= "submit" name="action" value="savePerson"><spring:message code='label.addESave'/></button>
<button type= "submit" name="action" value="cancel"><spring:message code='label.addPCancel'/></button>
			</form>
		</center>
	</body>
</html>
