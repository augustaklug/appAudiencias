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
	<link type="text/css" href="../../vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">

	<!-- Notyf -->
	<link type="text/css" href="../../vendor/notyf/notyf.min.css" rel="stylesheet">

	<!-- Volt CSS -->
	<link type="text/css" href="../../css/volt.css" rel="stylesheet">
</head>
<body>
<c:import url="components/menu_responsivo.jsp"/>
<div class="container-fluid bg-soft">
	<div class="row">
		<div class="col-12">

			<!--Menu lateral-->
			<c:import url="components/menu_lateral.jsp"/>
			<!--Fim do menu lateral-->

			<main class="content">
				<!--Menu superior-->
					<c:import url="components/menu_superior.jsp"/>
				<!--Fim do menu superior-->

				<div class="row justify-content-md-center">
					<div class="ml-3 mb-4">
						<h4 class="display-4">Bem-vindo ao AppAudiências, ${user.nome}!</h4>
					</div>
				<div class="col-12 col-sm-6 col-xl-4 mb-4">
					<div class="card border-light shadow-sm">
						<div class="card-body">
							<div class="row d-block d-xl-flex align-items-center">
								<div class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
									<div class="icon icon-shape icon-md icon-shape-blue rounded mr-4 mr-sm-0"><span class="fas fa-balance-scale"></span></div>
									<div class="d-sm-none">
										<h2 class="h5">Processos</h2>
										<h3 class="mb-1">10</h3>
									</div>
								</div>
								<div class="col-12 col-xl-7 px-xl-0">
									<div class="d-none d-sm-block">
										<h2 class="h5">Processos</h2>
										<h3 class="mb-1">10</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-xl-4 mb-4">
					<div class="card border-light shadow-sm">
						<div class="card-body">
							<div class="row d-block d-xl-flex align-items-center">
								<div class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
									<div class="icon icon-shape icon-md icon-shape-secondary rounded mr-4"><span class="fas fa-chalkboard-teacher"></span></div>
									<div class="d-sm-none">
										<h2 class="h5">Audiências</h2>
										<h3 class="mb-1">15</h3>
									</div>
								</div>
								<div class="col-12 col-xl-7 px-xl-0">
									<div class="d-none d-sm-block">
										<h2 class="h5">Audiências</h2>
										<h3 class="mb-1">15</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-xl-4 mb-4">
					<div class="card border-light shadow-sm" style="display: none">
						<div class="card-body">
							<div class="row d-block d-xl-flex align-items-center">
								<div class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
									<div class="ct-chart-traffic-share ct-golden-section ct-series-a"></div>
								</div>
								<div class="col-12 col-xl-7 px-xl-0">
									<h2 class="h5 mb-3">Traffic Share</h2>
									<h6 class="font-weight-normal text-gray"><span class="icon w-20 icon-xs icon-secondary mr-1"><span class="fas fa-desktop"></span></span> Desktop <a href="#" class="h6">60%</a></h6>
									<h6 class="font-weight-normal text-gray"><span class="icon w-20 icon-xs icon-primary mr-1"><span class="fas fa-mobile-alt"></span></span> Mobile Web <a href="#" class="h6">30%</a></h6>
									<h6 class="font-weight-normal text-gray"><span class="icon w-20 icon-xs icon-tertiary mr-1"><span class="fas fa-tablet-alt"></span></span> Tablet Web <a href="#" class="h6">10%</a></h6>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
				<c:import url="components/footer.jsp"/>
			</main>
		</div>
	</div>
</div>

<!-- Core -->
<script src="../../vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="../../vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Vendor JS -->
<script src="../../vendor/onscreen/dist/on-screen.umd.min.js"></script>

<!-- Slider -->
<script src="../../vendor/nouislider/distribute/nouislider.min.js"></script>

<!-- Jarallax -->
<script src="../../vendor/jarallax/dist/jarallax.min.js"></script>

<!-- Smooth scroll -->
<script src="../../vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

<!-- Count up -->
<script src="../../vendor/countup.js/dist/countUp.umd.js"></script>

<!-- Notyf -->
<script src="../../vendor/notyf/notyf.min.js"></script>

<!-- Charts -->
<script src="../../vendor/chartist/dist/chartist.min.js"></script>
<script src="../../vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>

<!-- Datepicker -->
<script src="../../vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>

<!-- Simplebar -->
<script src="../../vendor/simplebar/dist/simplebar.min.js"></script>

<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<!-- Volt JS -->
<script src="../../assets/js/volt.js"></script>
</body>
</html>