<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
	<head>
	</head>
	<body>
		<center>
			<br/><br/><h2> <spring:message code="label.title"/> </h2><br/>
			<span style="float: right">
			<a href="?lang=en">en</a> 
			| 
			<a href="?lang=fl">fl</a>
			</span>

			<form action="persons.htm" method="get"  >
				<button type= "submit" name="action" value="view"><spring:message code='label.view'/></button>
				<button type= "submit" name="action" value="addNewPerson"><spring:message code='label.addNewPerson'/></button>
				<button type= "submit" name="action" value="addNewPersonByFile"><spring:message code='label.addNewPersonF'/></button>
			</form>
		</center>
	</body>
</html>
