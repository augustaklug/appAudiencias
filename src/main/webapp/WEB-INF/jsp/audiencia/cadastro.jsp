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

				<div class="py-4">
					<div class="d-flex justify-content-between w-100 flex-wrap">
						<div class="mb-3 mb-lg-0">
							<h1 class="h4">Cadastrar uma audiência</h1>
							<p class="mb-0">Informe a seguir os dados da audiência.</p>
						</div>
					</div>
				</div>
				<form action="/admin/cadastrar.audiencia" method="post">
				<div class="row">
					<div class="col-12 mb-1">
						<div class="card border-light shadow-sm components-section">
							<div class="card-body">
								<div class="row mb-1 mt-3">
									<div class="col-lg-6 col-sm-6">

										<!-- Form -->
										<div class="mb-3">
											<label for="autos">Número dos autos</label>
											<div class="input-group">
												<span class="input-group-text" id="basic-addon1"><span class="far fa-sticky-note"></span></span>
												<input type="text" class="form-control" id="autos" name="processo" placeholder="Autos nº" required>
											</div>
										</div>
										<!-- End of Form -->
										<div class="mb-3">
											<label for="data">Data</label>
											<div class="input-group">
												<span class="input-group-text"><span class="far fa-calendar-alt"></span></span>
												<input class="form-control" id="data" name="data" type="date" placeholder="dd/mm/aaaa" required>
											</div>
										</div>

										<div class="form-check form-switch pt-2 mb-3">
											<input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" value="true" name="reuPreso">
											<label class="form-check-label" for="flexSwitchCheckDefault">Réu preso</label>
										</div>
									</div>

									<div class="col-lg-6 col-sm-6">

										<!-- Form -->
										<div class="mb-3">
											<label class="my-1 mr-2" for="responsavel">Responsável</label>
											<select class="form-select" id="responsavel" name="responsavel.login" required>
												<c:forEach var="u" items="${listaUsuarios}">
													<option value="${u.login}">${u.nome}</option>
												</c:forEach>
											</select>
										</div>
										<!-- End of Form -->

										<div class="mb-3">
											<label for="hora">Hora</label>
											<div class="input-group">
												<span class="input-group-text"><span class="far fa-clock"></span></span>
												<input class="form-control" id="hora" name="hora" type="time" placeholder="HH:mm" required>
											</div>
										</div>
									</div>
									<button class="btn btn-block mb-2 mr-2 btn-secondary" type="submit"><i class="fas fa-check mr-2"></i>Cadastrar</button>

								</div>
								<div class="row mb-5 mb-lg-5">

									<div class="col-lg-3 col-sm-6 mt-4 mt-md-0">

								</div>

							</div>
						</div>
					</div>
				</div>
				</form>

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