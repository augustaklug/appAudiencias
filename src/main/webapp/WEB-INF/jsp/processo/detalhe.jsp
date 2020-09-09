<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <title>AppAudi�ncias</title>
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

		<form action="/processo" method="post">

		  <div class="form-group">
		    <label for="numero">N�mero:</label>
		    <input type="text" class="form-control" id="numero" name="numero">
		  </div>

            <div class="form-group">
                <label for="vara">Vara:</label>
                <input type="text" class="form-control" id="vara" name="vara">
            </div>

            <div class="form-group">
                <label for="magistrado">Magistrado:</label>
                <input type="text" class="form-control" id="magistrado" name="magistrado">
            </div>
		
		  <button type="submit" class="btn btn-primary">Cadastrar</button>
		</form>

        </div>
		<c:import url="/WEB-INF/jsp/footer.jsp"/>		
	</div>

</body>
</html>