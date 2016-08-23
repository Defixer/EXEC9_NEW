<%@ page import = "com.hibernate.exercise6.model.*%">
<%@ page import = "java.io.*%">
<%@ page import = "java.util.*%">
<%@ page import = "com.hibernate.exercise6.model.*%">
<%@ page import = "com.hibernate.exercise6.model.*%">

<html>
	<body>
		<c:set var = "resultMessage" value = '${requestScope["resultMessage"]}'/>
		<c:if test = "${resultMessage == null}">
			<c:set var = "resultMessage" value = ""/>
		</c:if>
		
		<c:set var = "title" value = "${param.title}"/>
		<c:set var = "firstName" value = "${param.firstName}"/>
		<c:set var = "middleName" value = "${param.middleName}"/>
		<c:set var = "lastName" value = "${param.lastName}"/>
		<c:set var = "suffix" value = "${param.suffix}"/>
		
		<c:set var = "streetNo" value = "${param.streetNo}"/>
		<c:set var = "brgy" value = "${param.brgy}"/>
		<c:set var = "cityMunicipality" value = "${param.cityMunicipality}"/>
		<c:set var = "zipcode" value = "${param.zipcode}"/>
		
		<c:set var = "birthday" value = "${param.birthday}"/>
		<c:set var = "gwa" value = "${param.gwa}">
		<c:set var = "dateHired" value = "${param.dateHired}"/>
		<c:set var = "currentlyEmployed" value = "${param.currentlyEmployed}"/>
		
		<c:set var = "landline" value = "${param.landline}"/>
		<c:set var = "mobile" value = "${param.mobile}"/>
		<c:set var = "email" value = "${param.email}"/>	
	</body>
	
	<center>
		<br/><br/><h1><spring:message code = 'label.addPTitle'/></h1>
		<p style = "color:red;"><c:out value = "${resultMessage}"/></p>
		<p><spring:message code = 'label.addPRequired'/></p>
		<form action = "persons.htm" method = "POST">
			<table align = "center">
				<tr>
					<td><b><spring:message code = 'label.addPName'></b></td>
					<td><input type = "text" name = "title" size = 10 value = "<c:out value = '${title}'/>"/></td>
					<td><input type = "text" name = "firstName" value = "<c:out value = '${firstName}'/>"/></td>
					<td><input type = "text" name = "middleName" value = "<c:out value = '${middleName}'/>"/></td>
					<td><input type = "text" name = "lastName" value = "<c:out value = '${lastName}'/>"/></td>
					<td><input type = "text" name = "suffix" value = "<c:out value = '${suffix}'/>"/></td>
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
					<td><b><spring:message code = 'label.addPAddress'/></b></td>
					<td><input type = "text" name = "streetNo" size = 10 value = "<c:out value = '${streetNo}'/>"/></td>
					<td><input type = "text" name = "brgy" value = "<c:out value = '${brgy}'/>"/></td>
					<td><input type = "text" name = "cityMunicipality" value = "<c:out value = '${cityMunicipality}'/>"/></td>
					<td><input type = "text" name = "zipcode" value = "<c:out value = '${zipcode}'/>"/></td>
				</tr>
				<tr>
					<td><spring:message code = 'label.addPStreetNo'></td>
					<td><spring:message code = 'label.addPBrgy'></td>
					<td><spring:message code = 'label.addPCityMunicipality'></td>
					<td><spring:message code = 'label.addPZipcode'></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td><b><spring:message code = 'label.addPContacts'/></b></td>
					<td><input type = "text" name = "landline" size = 10 value = "<c:out value = '${landline}'/>"/></td>
					<td><input type = "text" name = "mobile" value = "<c:out value = '${mobile}'/>"/></td>
					<td><input type = "text" name = "email" value = "<c:out value = '${email}'/>"/></td>
				</tr>
				<tr>
				<td></td>
				<td><spring:message code = 'label.addPLandline'/></td>
				<td><spring:message code = 'label.addPMobile'/></td>
				<td><spring:message code = 'label.addPEmail'/></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td><b><spring:message code = 'label.addPBirthday'/></b></td>
					<td>
						<input type = "text" name = "birthday" size = 10 value = "<c:out value = '${birthday}'/>"/>*
					</td>
				</tr>
				<tr>
					<td><b><spring:message code = 'label.addPGwa'></b></td>
					<td>
						<select name = "gwa" value = "<c:out value = '${gwa}'/>">
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
						</select>
					</td>
				</tr>
				<tr>
					<td><b><spring:message code = 'label.addPDateHired'/></b></td>
					<td>
						<input type = "text" name = "dateHired" size = 10 value = "<c:out value = '${dateHired}'/>">*
					</td>
				</tr>
				<tr>
					<td><b><spring:message code = 'label.addPEmployed'></b></td>
					<td>
						<select name = "currentlyEmployed" value = "<c:out value = '${dateHired}'/>">
							<option value="Yes"><spring:message code='label.addPYes'/></option>
 							<option value="No"><spring:message code='label.addPNo'/></option>
						</select>
					</td>
				</tr>
				
				<c:set var = "roleNames" value= '${requestScope["roleNames"]}'/>
				<tr>
					<td><b><spring:message code = 'label.addPRoles'/></b></td>
					<td>
						<c:forEach var = "roleName" items = "${roleNames}">
							<c:set var = "tempRoleName" value = '${roleName.getRoleName()}'/>
							<input type = "checkbox" name = "role" value = "<c:out value = '${tempRoleName}'/>"><c:out value = '${tempRoleName}'/><br>
						</c:forEach>
					</td>
				</tr>
			</table>
			<button type = "submit" name = "action" value = "saveNewPerson"><spring:message code = 'label.addPSave'/></button>
			<button type = "submit" name = "action" value = "cancel"><spring:message code = 'label.addPCancel'/></button>
		</form>
	</center>
</html>
