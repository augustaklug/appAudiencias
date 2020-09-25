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
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center py-4">
					<div class="d-block mb-4 mb-md-0">
						<h2 class="h4">Busca de pessoas por nome</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-12 mb-1">
						<div class="card border-light shadow-sm components-section">
							<div class="card-body">
								<div class="row mb-1 mt-3">
									<div class="col-lg-6 col-sm-6">
										<c:if test="${not empty msgErro}">
											<div class="mb-4 alert text-center" role="alert" style="background: #f8d7da">
												<span style="color: darkred" class="font-weight-bold">${msgErro}</span>
											</div>
										</c:if>

										<!-- Form -->
										<form action="/buscar.pessoa" method="post">
											<div class="mb-3">
												<label for="nome" class="form-label">Informe o nome para busca: </label>
												<input type="text" class="form-control" id="nome" name="nome" placeholder="Nome">
											</div>
											<button class="btn btn-secondary" type="submit">Pesquisar</button>
										</form>
										<!-- End of Form -->
									</div>

									<div class="col-lg-6 col-sm-6">
									</div>
								</div>
								<div class="row mb-5 mb-lg-5">
									<div class="col-lg-3 col-sm-6 mt-4 mt-md-0">
									</div>
								</div>
							</div>
						</div>
					</div>



					<div class="card card-body border-light shadow-sm table-wrapper table-responsive pt-0" style="overflow-y: hidden">
						<c:if test="${not empty listaPessoas}">
							<table class="table table-hover table-striped text-center" style="overflow-y: hidden">
								<thead>
								<tr>
									<th>Nome</th>
									<th>Telefone</th>
									<th>Processo</th>
								</tr>
								</thead>
								<tbody>
								<!-- Item -->
									<c:forEach var="p" items="${listaPessoas}">
                                        <tr>
                                            <td><span class="font-weight-normal">${p.nome}</span></td>
											<td><span class="font-weight-normal">${p.telefone}</span></td>
											<td><a href="/detalhes/${p.audiencia.id}" class="link-gray"><span class="font-weight-normal">${p.audiencia.processo}</span></a></td>
                                            </td>
                                        </tr>
                                    </c:forEach>
								</tbody>
							</table>
						</c:if>
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