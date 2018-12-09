<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro - Produto</title>
<c:url value="/" var="contextPath" />
<c:url var="bootstrap" value="/resources/bootstrap" />
<link rel="stylesheet" href="${bootstrap}/css/bootstrap.css" />
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="${contextPath}">Casa do Código</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Produtos </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${contextPath}produtos">Consultar Produtos</a> <a
							class="dropdown-item" href="${contextPath}produtos/form">Cadastrar Produtos</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<h1>Cadastro de Produtos</h1>
		<c:url var="post_url" value="/produtos" />
		<form:form action="${post_url} " method="POST" commandName="produto"
			enctype="multipart/form-data">
			<div class="form-group">
				<label>Título:</label>
				<form:input path="titulo" cssClass="form-control" />
				<form:errors path="titulo" />
			</div>
			<div class="form-group">
				<label>Descrição:</label>
				<form:textarea path="descricao" cssClass="form-control" />
				<form:errors path="descricao" />
			</div>
			<div class="form-group">
				<label>Data Lançamento:</label>
				<form:input path="dataLancamento" cssClass="form-control" />
				<form:errors path="dataLancamento" />
			</div>
			<div class="form-group">
				<label>Páginas</label>
				<form:input path="paginas" cssClass="form-control" />
				<form:errors path="paginas" />
			</div>

			<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
				<div class="form-group">
					<label>${tipoPreco}</label>
					<form:input path="precos[${status.index}].valor"
						cssClass="form-control" />
					<form:hidden path="precos[${status.index}].tipo"
						value="${tipoPreco}" />
				</div>
			</c:forEach>

			<div class="form-group">
				<label>Sumário</label> <input name="sumario" type="file"
					class="form-control" />
			</div>

			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form:form>
	</div>
</body>


<script src="${bootstrap}/js/jquery-3.2.1.slim.min.js"></script>
<script src="${bootstrap}/js/popper.min.js"></script>
<script src="${bootstrap}/js/bootstrap.js"></script>
</html>