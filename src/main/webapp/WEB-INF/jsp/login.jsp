<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<body class="bg-soft">
<main>

  <!-- Section -->
  <section class="vh-lg-100 d-flex align-items-center">
    <div class="container">
      <div class="row justify-content-center form-bg-image" data-background-lg="../../resources/assets/img/illustrations/sign_logo.svg">
        <div class="col-12 d-flex align-items-center justify-content-center">
          <div class="signin-inner my-3 my-lg-0 bg-white shadow-soft border rounded border-light p-4 p-lg-5 w-100 fmxw-500">
            <div class="text-center text-md-center mb-4 mt-md-0">
              <h1 class="mb-0 h3">Acesse o AppAudiências</h1>
            </div>
            <c:if test="${not empty mensagem}">
              <div class="col-sm-10">
                <p class="text-danger mb-4"><strong>${mensagem}</strong></p>
              </div>
            </c:if>
            <form action="login" method="POST" class="mt-4">
              <!-- Form -->
              <div class="form-group mb-4">
                <label for="username">Seu login</label>
                <div class="input-group">
                  <span class="input-group-text" id="basic-addon1"><span class="fas fa-user"></span></span>
                  <input type="text" class="form-control" placeholder="Login" id="username" name="username" autofocus required>
                </div>
              </div>
              <!-- End of Form -->
              <div class="form-group">
                <!-- Form -->
                <div class="form-group mb-4">
                  <label for="password">Sua senha</label>
                  <div class="input-group">
                    <span class="input-group-text" id="basic-addon2"><span class="fas fa-unlock-alt"></span></span>
                    <input type="password" placeholder="Senha" class="form-control" id="password" name="password" required>
                  </div>
                </div>
                <!-- End of Form -->
              </div>
              <button type="submit" class="btn btn-block btn-primary">Entrar</button>
            </form>

            <div class="d-flex justify-content-center align-items-center mt-4">
                                <span class="font-weight-normal">
                                    Não registrado?
                                    <a href="/cadastrar" class="font-weight-bold">Criar conta</a>
                                </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>

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