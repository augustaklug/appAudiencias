<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<html lang="pt-br">
<head>
	<title>AppAudiências</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

	<!--FavIcons-->
	<c:import url="../components/favicons.jsp"/>

	<!-- Fontawesome -->
	<link type="text/css" href="../../../resources/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">

	<!-- Notyf -->
	<link type="text/css" href="../../../resources/vendor/notyf/notyf.min.css" rel="stylesheet">

	<!-- Volt CSS -->
	<link type="text/css" href="../../../resources/css/volt.css" rel="stylesheet">
</head>
<body>
<c:import url="../components/menu_responsivo.jsp"/>
<div class="container-fluid bg-soft">
	<div class="row">
		<div class="col-12">

			<!--Menu lateral-->
			<c:import url="../components/menu_lateral.jsp"/>
			<!--Fim do menu lateral-->

			<main class="content">
				<!--Menu superior-->
				<c:import url="../components/menu_superior.jsp"/>
				<!--Fim do menu superior-->
				<div class="row">
					<div class="col-12 mb-1">
						<%--Card--%>
						<div class="row mb-1 mt-3">
							<div class="col-lg-3 col-sm-3">
								<c:if test="${audiencia.cumprida == true}">
								<div class="card mb-3" style="max-width: 18rem; background: #99ffcc">
									</c:if>
									<c:if test="${audiencia.cumprida == false}">
									<div class="card mb-3" style="max-width: 18rem; background: lightpink">
										</c:if>
										<div class="card-body text-center">
											<h5 class="card-title text-center">Autos nº ${audiencia.processo}</h5>
											<c:if test="${audiencia.reuPreso == true}">
												<p><mark class="text-danger font-weight-bolder">RÉU PRESO!</mark></p>
											</c:if>
											<h6 class="card-subtitle mb-3 text-muted">Responsável: <span class="font-weight-bolder">${audiencia.responsavel.nome}</span></h6>
											<div class="mt-3">
												<p class="mb-2"><strong>Data: </strong><fmt:formatDate type ="date" dateStyle ="short" value = "${audiencia.data}" /></p>
												<p class="mb-2"><strong>Hora: </strong><fmt:formatDate type ="time" timeStyle ="short" value = "${audiencia.hora}" /></p>
												<p class="mb-2"><strong>Cumprida: </strong>
													<c:if test="${audiencia.cumprida == true}">
										<span class="icon icon-sm icon-success">
											<span class="far fa-check-circle font-weight-bolder"></span>
										</span>
													</c:if>
													<c:if test="${audiencia.cumprida == false}">
										<span class="icon icon-sm icon-danger">
											<span class="far fa-times-circle font-weight-bolder"></span>
										</span>
													</c:if>
												</p>
												<c:if test="${audiencia.cumprida == false}">
													<div class="mt-3 mb-3">
														<form action="#" method="post">
															<a><button class="btn btn-gray" type="submit">Verificar cumprimento</button></a>
														</form>
													</div>
												</c:if>
											</div>
										</div>
									</div>
								</div>

								<%--Fim do card--%>

								<div class="col-lg-9 col-sm-9">
									<div class="mb-3">
										<h4>Participantes:</h4>
									</div>
									<table class="table table-hover table-striped text-center" style="overflow-y: hidden">
										<thead>
										<tr>
											<th>Nome</th>
											<th>Telefone</th>
											<th>Intimada</th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td>ABC</td>
											<td>123</td>
											<td>Não</td>
										</tr>
										</tbody>
									</table>
									<div class="mt-4">
										<%--Botão--%>
										<button type="button" class="btn btn-secondary mb-3" data-toggle="modal" data-target="#modal-default">Cadastrar novo</button>
										<%--Modal--%>
										<div class="modal fade" id="modal-default" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered" role="document">
												<div class="modal-content">
													<%--Header--%>
													<div class="modal-header">
														<h2 class="h6 modal-title">Cadastro de participante</h2>
													</div>
													<%--Corpo--%>
													<div class="modal-body">
														<form action="#" method="post">
															<%--Nome--%>
															<div class="mb-3">
																<label for="nome">Nome</label>
																<div class="input-group">
																	<span class="input-group-text" id="basic-addon1"><span class="fas fa-user"></span></span>
																	<input type="text" class="form-control" id="nome" name="nome" placeholder="Nome">
																</div>
															</div>
															<%--Telefone--%>
															<div class="mb-3">
																<label for="telefone">Telefone</label>
																<div class="input-group">
																	<span class="input-group-text" id="basic-addon2"><span class="fas fa-phone"></span></span>
																	<input type="text" class="form-control" id="telefone" name="telefone" placeholder="Telefone">
																</div>
															</div>
															<span class="modal-footer">
															<button type="submit" class="btn btn-md btn-secondary">Cadastrar</button>
																<button type="button" class="btn btn-link text-danger ml-auto" data-dismiss="modal">Cancelar</button>
																	</span>
														</form>
													</div>
												</div>
											</div>
										</div>
										<%--Fim do modal--%>
									</div>

								</div>
							</div>
						</div>
					</div>

					<c:import url="../components/footer.jsp"/>
			</main>
		</div>
	</div>
</div>

<!-- Core -->
<script src="../../../resources/vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="../../../resources/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Vendor JS -->
<script src="../../../resources/vendor/onscreen/dist/on-screen.umd.min.js"></script>

<!-- Slider -->
<script src="../../../resources/vendor/nouislider/distribute/nouislider.min.js"></script>

<!-- Jarallax -->
<script src="../../../resources/vendor/jarallax/dist/jarallax.min.js"></script>

<!-- Smooth scroll -->
<script src="../../../resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

<!-- Count up -->
<script src="../../../resources/vendor/countup.js/dist/countUp.umd.js"></script>

<!-- Notyf -->
<script src="../../../resources/vendor/notyf/notyf.min.js"></script>

<!-- Charts -->
<script src="../../../resources/vendor/chartist/dist/chartist.min.js"></script>
<script src="../../../resources/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>

<!-- Datepicker -->
<script src="../../../resources/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>

<!-- Simplebar -->
<script src="../../../resources/vendor/simplebar/dist/simplebar.min.js"></script>

<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<!-- Volt JS -->
<script src="../../../resources/assets/js/volt.js"></script>
</body>
</html>