<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<html lang="pt-br" style="overflow-x: hidden">
<head>
	<title>AppAudiências</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

	<!--FavIcons-->
	<c:import url="components/favicons.jsp"/>

	<!-- Fontawesome -->
	<link type="text/css" href="../../resources/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">

	<!-- Notyf -->
	<link type="text/css" href="../../resources/vendor/notyf/notyf.min.css" rel="stylesheet">

	<!-- Volt CSS -->
	<link type="text/css" href="../../resources/css/volt.css" rel="stylesheet">
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
						<p class="lead"><strong>Painel de  <mark> <security:authentication property="principal.authorities[0]"/></mark>:</strong></p>
					</div>
					<%--Cards da tela inicial--%>
					<security:authorize access="hasRole('ADMIN')">
						<c:import url="components/home_admin.jsp"/>
					</security:authorize>
					<security:authorize access="hasRole('USER')">
						<c:import url="components/home_user.jsp"/>
					</security:authorize>
				</div>

				<c:import url="components/footer.jsp"/>
			</main>
		</div>
	</div>
</div>

<!-- Core -->
<script src="../../resources/vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="../../resources/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Vendor JS -->
<script src="../../resources/vendor/onscreen/dist/on-screen.umd.min.js"></script>

<!-- Slider -->
<script src="../../resources/vendor/nouislider/distribute/nouislider.min.js"></script>

<!-- Jarallax -->
<script src="../../resources/vendor/jarallax/dist/jarallax.min.js"></script>

<!-- Smooth scroll -->
<script src="../../resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

<!-- Count up -->
<script src="../../resources/vendor/countup.js/dist/countUp.umd.js"></script>

<!-- Notyf -->
<script src="../../resources/vendor/notyf/notyf.min.js"></script>

<!-- Charts -->
<script src="../../resources/vendor/chartist/dist/chartist.min.js"></script>
<script src="../../resources/vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>

<!-- Datepicker -->
<script src="../../resources/vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>

<!-- Simplebar -->
<script src="../../resources/vendor/simplebar/dist/simplebar.min.js"></script>

<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<!-- Volt JS -->
<script src="../../resources/assets/js/volt.js"></script>
</body>
</html>