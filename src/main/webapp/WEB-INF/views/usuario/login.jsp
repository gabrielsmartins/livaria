<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login da Casa do Código</title>
<c:url value="/" var="contextPath" />
<c:url var="bootstrap" value="/resources/bootstrap" />
<link rel="stylesheet" href="${bootstrap}/css/bootstrap.css" />
</head>
<body>

	<div class="container">
		<h1 class="text-center">Login da Casa do Código</h1>
		<form:form servletRelativeAction="login" method="POST" commandName="produto"
			enctype="multipart/form-data" cssClass="align-items-center">
			<div class="form-group row">
				<label class="col-md-2">E-mail:</label>
				<input type="text" name="username" class="form-control col-md-4"/>
			</div>
			<div class="form-group row">
				<label class="col-md-2">Senha:</label>
				<input type="password" name="password" class="form-control col-md-4"/>
			</div>
			
			<button type="submit" class="btn btn-primary col-offset-4">Logar</button>
		</form:form>
	</div>
</body>


<script src="${bootstrap}/js/jquery-3.2.1.slim.min.js"></script>
<script src="${bootstrap}/js/popper.min.js"></script>
<script src="${bootstrap}/js/bootstrap.js"></script>
</html>