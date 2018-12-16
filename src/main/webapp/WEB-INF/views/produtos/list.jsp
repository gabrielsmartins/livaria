<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta - Produto</title>
<c:url var="contextPath" value="/" />
<c:url var="bootstrap" value="/resources/bootstrap" />
<link rel="stylesheet" href="${bootstrap}/css/bootstrap.css" />
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
						<a class="dropdown-item" href="${contextPath}produtos">Consultar
							Produtos</a> <a class="dropdown-item"
							href="${contextPath}produtos/form">Cadastrar Produtos</a>
					</div></li>


			</ul>


			<ul class="navbar-nav my-2 my-md-0">
				<li class="nav-item dropdown mt-2 mt-md-0"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <security:authentication
							property="principal" var="usuario" /> Usuário :
						${usuario.username }
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="<c:url value='/logout' />">Logout</a>
					</div></li>
			</ul>
		</div>

	</nav>


	<div class="container">
		<h1>Lista de Produtos</h1>

		<h4>${message}</h4>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>Título</th>
					<th>Descricao</th>
					<th>Preços</th>
					<th>Páginas</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${produtos}" var="produto">
					<tr>
						<td><a href="<c:url value='/produtos/detalhe/${produto.id}'/>">
								${produto.titulo} </a></td>
						<td>${produto.descricao}</td>
						<td>${produto.precos}</td>
						<td>${produto.paginas}</td>
					</tr>
				</c:forEach>
			</tbody>



		</table>

	</div>
</body>

<script src="${bootstrap}/js/jquery-3.2.1.slim.min.js"></script>
<script src="${bootstrap}/js/popper.min.js"></script>
<script src="${bootstrap}/js/bootstrap.js"></script>
</html>