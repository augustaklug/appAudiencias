<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="pt-br">
<head>
  <title>AppAudiências</title>
  <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Fontawesome -->
	<link type="text/css" href="../../../vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">

	<!-- Notyf -->
	<link type="text/css" href="../../../vendor/notyf/notyf.min.css" rel="stylesheet">

	<!-- Volt CSS -->
	<link type="text/css" href="../../../css/volt.css" rel="stylesheet">
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
						<h2 class="h4">Listagem de processos</h2>
						<p class="mb-0">Todos os processos cadastrados no sistema.</p>
					</div>
				</div>
				<div class="card card-body border-light shadow-sm table-wrapper table-responsive pt-0" style="overflow-y: hidden">
					<table class="table table-hover table-striped" style="overflow-y: hidden">
						<thead>
						<tr>
							<th>ID</th>
							<th>Processo</th>
							<th>Vara</th>
							<th>Magistrado</th>
						</tr>
						</thead>
						<tbody>
						<!-- Item -->
						<c:forEach var="p" items="${listaProcesso}">
							<tr>
								<td><span class="font-weight-normal">${p.id}</span></td>
								<td><span class="font-weight-normal">${p.numero}</span></td>
								<td><span class="font-weight-normal">${p.vara}</span></td>
								<td><span class="font-weight-normal">${p.magistrado}</span></td>
								<td>
									<div class="btn-group">
										<button class="btn btn-link text-dark dropdown-toggle dropdown-toggle-split m-0 p-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
														<span class="icon icon-sm">
															<span class="fas fa-ellipsis-h icon-dark"></span>
														</span>
											<span class="sr-only">Abrir menu</span>
										</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="#"><span class="fas fa-eye mr-2"></span>Detalhes</a>
											<a class="dropdown-item" href="#"><span class="fas fa-edit mr-2"></span>Editar</a>
											<a class="dropdown-item text-danger" href="/processo/excluir/${p.id}"><span class="fas fa-trash-alt mr-2"></span>Excluir</a>
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
<script src="../../../vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="../../../vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Vendor JS -->
<script src="../../../vendor/onscreen/dist/on-screen.umd.min.js"></script>

<!-- Slider -->
<script src="../../../vendor/nouislider/distribute/nouislider.min.js"></script>

<!-- Jarallax -->
<script src="../../../vendor/jarallax/dist/jarallax.min.js"></script>

<!-- Smooth scroll -->
<script src="../../../vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

<!-- Count up -->
<script src="../../../vendor/countup.js/dist/countUp.umd.js"></script>

<!-- Notyf -->
<script src="../../../vendor/notyf/notyf.min.js"></script>

<!-- Charts -->
<script src="../../../vendor/chartist/dist/chartist.min.js"></script>
<script src="../../../vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>

<!-- Datepicker -->
<script src="../../../vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>

<!-- Simplebar -->
<script src="../../../vendor/simplebar/dist/simplebar.min.js"></script>

<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<!-- Volt JS -->
<script src="../../../assets/js/volt.js"></script>
</body>
</html>