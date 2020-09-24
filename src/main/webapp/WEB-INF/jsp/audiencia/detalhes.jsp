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
												<p class="mb-2"><strong>Hora: </strong>${audiencia.hora}</p>
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
														<form action="/detalhes/verifica/${audiencia.id}" method="post">
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
											<th>Intimado</th>
											<th>Ações</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach var="pessoa" items="${participantes}">
											<tr>
												<td class="font-weight-bolder">${pessoa.nome}</td>
												<td>${pessoa.telefone}</td>
												<td>
													<c:if test="${pessoa.intimada == true}">
										<span class="icon icon-sm icon-success">
											<span class="far fa-check-circle font-weight-bolder"></span>
										</span>
													</c:if>
													<c:if test="${pessoa.intimada == false}">
										<span class="icon icon-sm icon-danger">
											<span class="far fa-times-circle font-weight-bolder"></span>
										</span>
													</c:if>
												</td>
												<td>
													<div class="btn-group">
														<button class="btn btn-link text-dark dropdown-toggle dropdown-toggle-split m-0 p-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
														<span class="icon icon-sm">
															<span class="fas fa-ellipsis-h icon-dark"></span>
														</span>
															<span class="sr-only">Abrir menu</span>
														</button>
														<div class="dropdown-menu">
															<c:if test="${pessoa.intimada == false}">
																<button type="button" class="dropdown-item text-success" data-toggle="modal" data-target="#modal-intimacao-${pessoa.id}"><span class="far fa-check-square"></span>Intimar</button>
															</c:if>
															<c:if test="${pessoa.intimada == true}">
																<button type="button" class="dropdown-item text-info" data-toggle="modal" data-target="#modal-visualizar-${pessoa.id}"><span class="far fa-eye"></span>Visualizar</button>
															</c:if>
															<form action="/excluir.pessoa/${pessoa.id}" method="post">
																<button type="submit" class="dropdown-item text-danger"><span class="far fa-trash-alt"></span>Excluir</button>
															</form>
														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
									<div class="mt-4">
										<c:if test="${audiencia.cumprida == false}">
											<%--Botão do modal--%>
											<button type="button" class="btn btn-secondary mb-3" data-toggle="modal" data-target="#modal-cadastro-participante">Cadastrar novo</button>
											<%--Modal de Cadastro--%>
											<div class="modal fade" id="modal-cadastro-participante" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered" role="document">
													<div class="modal-content">
															<%--Header--%>
														<div class="modal-header">
															<h2 class="h6 modal-title">Cadastro de participante</h2>
														</div>
															<%--Corpo--%>
														<div class="modal-body">
															<form action="/cadastrar.participante" method="post">
																<input type="text" hidden name="audiencia.id" value="${audiencia.id}">
																	<%--Nome--%>
																<div class="mb-3">
																	<label for="nome">Nome</label>
																	<div class="input-group">
																		<span class="input-group-text" id="basic-addon1"><span class="fas fa-user"></span></span>
																		<input type="text" class="form-control" id="nome" name="nome" placeholder="Nome" required>
																	</div>
																</div>
																	<%--Telefone--%>
																<div class="mb-3">
																	<label for="telefone">Telefone</label>
																	<div class="input-group">
																		<span class="input-group-text" id="basic-addon2"><span class="fas fa-phone"></span></span>
																		<input type="text" class="form-control" id="telefone" name="telefone" placeholder="Telefone" required>
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
											<%--Fim do modal de cadastro--%>
										</c:if>

								</div>

							</div>
						</div>
					</div>
				</div>

				<c:import url="../components/footer.jsp"/>
			</main>
			<c:forEach var="pessoa" items="${participantes}">
				<%--Modal de Intimação--%>
				<div class="modal fade" id="modal-intimacao-${pessoa.id}" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
								<%--Header--%>
							<div class="modal-header">
								<h2 class="h6 modal-title">Registro de intimação de participante: <em>${pessoa.nome}</em></h2>
							</div>
								<%--Corpo--%>
							<div class="modal-body">
								<form action="/cadastrar.intimacao" method="post">
									<input hidden name="pessoaId" value="${pessoa.id}">
										<%--Data--%>
									<div class="mb-3">
										<label for="data">Data</label>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon3"><span class="fas fa-calendar"></span></span>
											<input type="date" class="form-control" id="data" name="data" placeholder="dd/mm/aaaa" required>
										</div>
									</div>
										<%--Hora--%>
									<div class="mb-3">
										<label for="hora">Hora</label>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon4"><span class="fas fa-clock"></span></span>
											<input type="time" class="form-control" id="hora" name="hora" placeholder="HH:mm" required>
										</div>
									</div>
										<%--Forma--%>
									<div class="mb-3">
										<label for="forma">Forma</label>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon5"><span class="fas fa-clock"></span></span>
											<select class="form-select" id="forma" name="forma" required>
												<option value="Telefone">Telefone</option>
												<option value="WhatsApp">WhatsApp</option>
												<option value="Mandado">Mandado</option>
												<option value="Requisição">Requisição</option>
											</select>
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
				<%--Fim do modal de intimação--%>
			</c:forEach>

			<c:forEach var="pessoa" items="${participantes}">
				<%--Modal de Visualização--%>
			<div class="modal fade" id="modal-visualizar-${pessoa.id}" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
							<%--Header--%>
						<div class="modal-header">
							<h2 class="h6 modal-title">Dados da intimação de participante: <em>${pessoa.nome}</em></h2>
						</div>
							<%--Corpo--%>
						<div class="modal-body">
							<h6>Data: <fmt:formatDate type ="date" dateStyle ="short" value = "${pessoa.intimacao.data}" /> </h6>
							<h6>Hora: ${pessoa.intimacao.hora}</h6>
							<h6>Forma: ${pessoa.intimacao.forma}</h6>
						</div>
						<span class="modal-footer">
																<button type="button" class="btn btn-link text-danger ml-auto" data-dismiss="modal">Fechar</button>
																	</span>

					</div>
				</div>
			</div>
		</div>
			<%--Fim do modal de visualização--%>
		</c:forEach>
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