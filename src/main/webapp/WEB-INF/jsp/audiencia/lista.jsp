<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<html lang="pt-br">
<head>
  <title>AppAudiências</title>
  <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center py-4">
					<div class="d-block mb-4 mb-md-0">
						<h2 class="h4">${titulo}</h2>
						<p class="mb-0"><em>${subtitulo}</em></p>
					</div>
				</div>
				<div class="card card-body border-light shadow-sm table-wrapper table-responsive pt-0" style="overflow-y: hidden">
					<table class="table table-hover table-striped text-center" style="overflow-y: hidden">
						<thead>
						<tr>
							<th>Responsável</th>
							<th>Processo</th>
							<th>Preso</th>
							<th>Data</th>
							<th>Hora</th>
							<th>Cumprida</th>
							<th>Ações</th>
						</tr>
						</thead>
						<tbody>
						<!-- Item -->
						<c:forEach var="aud" items="${listaAudiencias}">
							<tr>
								<td><span class="font-weight-normal">${aud.responsavel.nome}</span></td>
								<td><span class="font-weight-normal">${aud.processo}</span></td>
								<td><span class="font-weight-normal">
													<c:if test="${aud.reuPreso == true}">
														<span class="icon icon-sm icon-secondary">
															<span class="fas fa-exclamation-triangle"></span>
														</span>
													</c:if></span></td>
								<td><span class="font-weight-normal"><fmt:formatDate type ="date" dateStyle ="short" value = "${aud.data}" /></span></td>
								<td><span class="font-weight-normal"><fmt:formatDate type ="time" timeStyle ="short" value = "${aud.hora}" /></span></td>
								<td><span class="font-weight-normal">
									<c:if test="${aud.cumprida == true}">
										<span class="icon icon-sm icon-success">
											<span class="fas fa-check"></span>
										</span>
									</c:if>
									<c:if test="${aud.cumprida == false}">
										<span class="icon icon-sm icon-danger">
											<span class="fas fa-times"></span>
										</span>
									</c:if>
								</span></td>
								<td>
									<div class="btn-group">
										<button class="btn btn-link text-dark dropdown-toggle dropdown-toggle-split m-0 p-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
														<span class="icon icon-sm">
															<span class="fas fa-ellipsis-h icon-dark"></span>
														</span>
											<span class="sr-only">Abrir menu</span>
										</button>
										<div class="dropdown-menu">
											<a class="dropdown-item text-success" href="/detalhes/${aud.id}"><span class="far fa-check-square"></span>Cumprir</a>
											<security:authorize access="hasRole('ADMIN')">
											<a class="dropdown-item text-danger" href="/admin/excluir.audiencia/${aud.id}"><span class="far fa-trash-alt"></span>Excluir</a>
											</security:authorize>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
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