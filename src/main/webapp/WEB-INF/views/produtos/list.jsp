<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Consulta - Produto</title>
</head>
<body>
	<h1>Lista de Produtos</h1>
	
	<h4>${message}</h4>
	<table>
	<thead>
	<tr>
		<th>Título</th>
		<th>Descricao</th>
		<th>Páginas</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${produtos}" var="produto">
			<tr>
				<td>
					<a href="<c:url value='/produtos/detalhe/${produto.id}'/>">
					${produto.titulo}
					</a>
				</td>
				<td>${produto.descricao}</td>
				<td>${produto.paginas}</td>
			</tr>
		</c:forEach>
	</tbody>
	
	
		
	</table>
</body>
</html>