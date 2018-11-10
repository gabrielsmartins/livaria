<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Cadastro - Produto</title>
</head>
<body>
     <c:url var="post_url"  value="/produtos" />
	<form:form action= "${post_url} " method="POST" commandName="produto" enctype="multipart/form-data">
		<div>
			<label>Título:</label>
			<form:input path="titulo" />
			<form:errors path="titulo"/>
		</div>
		<div>
			<label>Descrição:</label>
			<form:textarea path="descricao"/>
			<form:errors path="descricao"/>
		</div>
		<div>
		<label>Data Lançamento:</label>
			<form:input  path="dataLancamento"/>
			<form:errors path="dataLancamento"/>
		</div>
		<div>
			<label>Páginas</label>
			<form:input path="paginas"/>
			<form:errors path="paginas"/>
		</div>
		
		<c:forEach items="${tipos}" var="tipoPreco" varStatus="status" >
			<div>
				<label>${tipoPreco}</label>
				<form:input path="precos[${status.index}].valor"/>
				<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}"/>
			</div>
		</c:forEach>
		
		<div>
			<label>Sumário</label>
			<input name="sumario" type="file"/>
		</div>
		
		<button type="submit">Cadastrar</button>
    </form:form>
</body>
</html>