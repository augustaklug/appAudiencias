<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>AppGrana</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">

		<div class="container-fluid" style="margin-top:80px">

			<c:import url="/WEB-INF/jsp/header.jsp"/>
				
			<form class="form-inline" action="/incluir" method="post">
			  <label for="tipo" class="mr-sm-2">Tipo:</label>		  
				<select name="tipo" class="form-control mb-2 mr-sm-2">
					<option value="1">Pagamento</option>
					<option value="2">Recebimento</option>
					<option value="3">A pagar</option>
					<option value="4">A receber</option>
				</select>
	
			  <label for="data" class="mr-sm-2">Data:</label>
			  <input type="date" class="form-control mb-2 mr-sm-2" name="data">
			  
<!-- 			  <label for="dhLanc" class="mr-sm-2">Data:</label> -->
<!-- 			  <input type="datetime-local" class="form-control mb-2 mr-sm-2" name="dhLanc"> -->

			  <label for="descricao" class="mr-sm-2">Descrição:</label>
			  <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Entre com a descrição" name="descricao">
	
			  <label for="valor" class="mr-sm-2">Valor:</label>
			  <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Entre com o valor" name="valor">
	
			  <button type="submit" class="btn btn-primary mb-2">Lançar</button>
			</form>	
	
			<h5>Lançamentos financeiros: ${filtro}</h5>
			<table class="table table-striped">
			    <thead>
			      <tr>
			        <th>Descrição</th>
			        <th>Data</th>
			        <th>Valor</th>
			        <th>Tipo</th>
			        <th></th>
			        <th></th>
			      </tr>
			    </thead>
			    <tbody>
			  		<c:forEach var="o" items="${listaLancamento}">
			  		
				      <c:choose>         
				         <c:when test = "${o.tipo == 1}"><c:set var = "tipo" value = "Pagamento"/></c:when>			         
				         <c:when test = "${o.tipo == 2}"><c:set var = "tipo" value = "Recebimento"/></c:when>			         
				         <c:when test = "${o.tipo == 3}"><c:set var = "tipo" value = "A pagar"/></c:when>			
				         <c:when test = "${o.tipo == 4}"><c:set var = "tipo" value = "A receber"/></c:when>
				         <c:otherwise><c:set var = "tipo" value = "Outro tipo"/></c:otherwise>
				      </c:choose>
	
	  				  <fmt:parseDate value="${o.data}" pattern="yyyy-MM-dd" var="dataFormatada" type="date"/>
	      		  		
				      <tr>
				        <td>${o.descricao}</td>
				        <td><fmt:formatDate value="${dataFormatada}" type="date" pattern="dd/MM/yyyy"/></td>
				        <td>${o.valor}</td>
				        <td>${tipo}</td>
				        <td><a href="/lancamento/excluir/${o.id}">Excluir</a></td>
				        <td><a href="/lancamento/confirmar/${o.id}">Confirmar</a></td>
				      </tr>
					</c:forEach>
			    </tbody>
			  </table>
		</div>			
	</div>	
	
</body>
</html>