<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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


			<div class="card text-center mb-3 bg-info" style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Processo</h5>
					<p class="card-text">Cadastre aqui um processo</p>
					<a href="/processo" class="btn btn-dark">Cadastro</a>
				</div>
			</div>


			<div class="card text-center mb-3 bg-info" style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Processo</h5>
					<p class="card-text">Acessar a listagem de processos</p>
					<a href="/processos" class="btn btn-dark">Lista</a>
				</div>
			</div>



			<div class="card text-center mb-3 bg-success" style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Audiência</h5>
					<p class="card-text">Cadastre aqui uma audiência</p>
					<a href="/audiencia" class="btn btn-dark">Cadastro</a>
				</div>
			</div>



			<div class="card text-center mb-3 bg-success" style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Audiência</h5>
					<p class="card-text">Acessar a listagem de audiências</p>
					<a href="/audiencias" class="btn btn-dark">Lista</a>
				</div>
			</div>


	</div>
		<c:import url="/WEB-INF/jsp/footer.jsp"/>

</body>
</html>