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

		<form action="/audiencia" method="post">
            <div class="form-group" style="display: none">
                <label for="usr">Processo:</label>
                <select name="processo.id" class="form-control">
                        <option value="${idProcesso}">${idProcesso}</option>
                </select>
            </div>
		<div class="form-group">
		  <label for="sala">Sala: </label>
		  <input type="text" class="form-control" id="sala" name="sala">
		</div>

        <div class="form-group">
           <label for="data">Data: </label>
           <input type="date" class="form-control" id="data" name="data">
        </div>
		
		<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form>

        </div>
		<c:import url="/WEB-INF/jsp/footer.jsp"/>		
	</div>

</body>
</html>