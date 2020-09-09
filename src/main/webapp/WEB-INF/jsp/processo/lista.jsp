<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>AppAudiências</title>
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

		<table class="table table-striped">
		    <thead>
		      <tr>
		        <th>Processo</th>
		        <th>Vara</th>
		        <th>Magistrado</th>
		      </tr>
		    </thead>
		    <tbody>
		  		<c:forEach var="p" items="${listaProcesso}">
			      <tr>
			        <td>${p.numero}</td>
			        <td>${p.vara}</td>
                    <td>${p.magistrado}</td>
					  <td><a href="/audienciacadastro/${p.id}">Cadastrar audiência</a></td>
			        <td><a href="/processo/excluir/${p.id}">Excluir</a></td>
			      </tr>
				</c:forEach>
		    </tbody>
		  </table>

        </div>
		<c:import url="/WEB-INF/jsp/footer.jsp"/>		
	</div>
</body>
</html>