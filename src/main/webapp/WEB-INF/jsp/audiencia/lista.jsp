<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="pt-br">
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
				  <th>Data</th>
				  <th>Sala</th>
		      </tr>
		    </thead>
		    <tbody>
		  		<c:forEach var="aud" items="${listaAudiencia}">
			      <tr>
				    <td>${aud.processo.numero}</td>
			        <td>${aud.data}</td>
			        <td>${aud.sala}</td>

			        <td><a href="/audiencia/excluir/${aud.id}">Excluir</a></td>
			      </tr>
				</c:forEach>
		    </tbody>
		  </table>

        </div>
		<c:import url="/WEB-INF/jsp/footer.jsp"/>		
	</div>
</body>
</html>