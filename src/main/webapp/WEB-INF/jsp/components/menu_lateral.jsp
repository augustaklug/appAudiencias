<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!--Menu lateral-->
<nav id="sidebarMenu" class="sidebar d-md-block bg-primary text-white collapse" data-simplebar>
  <div class="sidebar-inner px-4 pt-3">
    <div class="user-card d-flex d-md-none align-items-center justify-content-between justify-content-md-center pb-4">
      <div class="d-flex align-items-center">
        <div class="user-avatar lg-avatar mr-4">
          <img src="../../../resources/assets/img/team/profile-picture-3.png" class="card-img-top rounded-circle border-white" alt="User avatar">
        </div>
        <div class="d-block">
          <h2 class="h6">Olá, <security:authentication property="principal.username"/></h2>
          <a href="/sair" class="btn btn-secondary text-dark btn-xs"><span class="mr-2"><span class="fas fa-sign-out-alt"></span></span>Sair</a>
        </div>
      </div>
      <div class="collapse-close d-md-none">
        <a href="#sidebarMenu" class="fas fa-times" data-toggle="collapse"
           data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="true"
           aria-label="Toggle navigation"></a>
      </div>
    </div>
    <ul class="nav flex-column">
        <li class="nav-item ">
            <a href="/" class="nav-link">
                <span class="sidebar-icon icon-primary-app"><span class="fas fa-home"></span></span>
                <span>Home</span>
            </a>
        </li>
        <li class="nav-item ">
            <a href="/cumprir.audiencias" class="nav-link">
                <span class="sidebar-icon icon-primary-app"><span class="fas fa-user-check"></span></span>
                <span>Cumprir audiências</span>
            </a>
        </li>
        <li class="nav-item ">
            <a href="/audiencias.atrasadas" class="nav-link">
                <span class="sidebar-icon icon-primary-app"><span class="fas fa-user-clock"></span></span>
                <span>Audiências atrasadas</span>
            </a>
        </li>
        <security:authorize access="hasRole('ADMIN')">
        <%--Menu Administrador--%>
            <li role="separator" class="dropdown-divider mt-4 mb-3 border-black"></li>
            <li class="nav-item ">
                <a href="#" class="nav-link disabled">
                    <span class="sidebar-icon icon-primary-app"><span class="fas fa-user-shield"></span></span>
                    <span>Administrador</span>
                </a>
            </li>
            <li class="nav-item ">
                <a href="/admin/cadastro.audiencias" class="nav-link">
                    <span class="sidebar-icon icon-primary-app"><span class="fas fa-calendar-plus"></span></span>
                    <span>Cadastrar audiência</span>
                </a>
            </li>
            <li class="nav-item">
                                  <span class="nav-link  collapsed  d-flex justify-content-between align-items-center" data-toggle="collapse" data-target="#submenu-admin">
                                    <span>
                                      <span class="sidebar-icon icon-primary-app"><span class="fas fa-calendar-alt"></span></span>
                                      Audiências
                                    </span>
                                    <span class="link-arrow"><span class="fas fa-chevron-right"></span></span>
                                  </span>
                <div class="multi-level collapse " role="list" id="submenu-admin" aria-expanded="false">
                    <ul class="flex-column nav">
                        <li class="nav-item"><a class="nav-link" href="/admin/listar.audiencias"><span>Todas</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><span>Cumpridas</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><span>Não cumpridas</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="/admin/audiencias.atrasadas"><span>Atrasadas</span></a></li>
                    </ul>
                </div>
            </li>
        <%--Fim menu administrador--%>
        </security:authorize>
    </ul>
  </div>
</nav>
<!--Fim do menu lateral-->