<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!--Menu lateral-->
<nav id="sidebarMenu" class="sidebar d-md-block bg-primary text-white collapse" data-simplebar>
  <div class="sidebar-inner px-4 pt-3">
    <div class="user-card d-flex d-md-none align-items-center justify-content-between justify-content-md-center pb-4">
      <div class="d-flex align-items-center">
        <div class="user-avatar lg-avatar mr-4">
          <img src="../../../assets/img/team/profile-picture-3.png" class="card-img-top rounded-circle border-white" alt="User avatar">
        </div>
        <div class="d-block">
          <h2 class="h6">Olá, ${user.nome}</h2>
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
            <a href="/lista" class="nav-link">
                <span class="sidebar-icon"><span class="fas fa-home"></span></span>
                <span>Home</span>
            </a>
        </li>
      <li class="nav-item">
							  <span class="nav-link  collapsed  d-flex justify-content-between align-items-center" data-toggle="collapse" data-target="#submenu-proc">
								<span>
								  <span class="sidebar-icon"><span class="fas fa-balance-scale"></span></span>
								  Processos
								</span>
								<span class="link-arrow"><span class="fas fa-chevron-right"></span></span>
							  </span>
        <div class="multi-level collapse " role="list" id="submenu-proc" aria-expanded="false">
          <ul class="flex-column nav">
            <li class="nav-item"><a class="nav-link" href="/processo"><span>Cadastro</span></a></li>
            <li class="nav-item"><a class="nav-link" href="/processos"><span>Listagem</span></a></li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
							  <span class="nav-link  collapsed  d-flex justify-content-between align-items-center" data-toggle="collapse" data-target="#submenu-aud">
								<span>
								  <span class="sidebar-icon"><span class="fas fa-chalkboard-teacher"></span></span>
								  Audiências
								</span>
								<span class="link-arrow"><span class="fas fa-chevron-right"></span></span>
							  </span>
        <div class="multi-level collapse " role="list" id="submenu-aud" aria-expanded="false">
          <ul class="flex-column nav">
            <li class="nav-item"><a class="nav-link" href="/audiencia"><span>Cadastro</span></a></li>
            <li class="nav-item"><a class="nav-link" href="/audiencias"><span>Listagem</span></a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
</nav>
<!--Fim do menu lateral-->