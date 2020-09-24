<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%--Cards da tela inicial--%>
<div class="col-12 col-sm-6 col-xl-4 mb-4">
    <div class="card border-light shadow-sm">
        <a href="/admin/api.audiencias">
        <div class="card-body">
            <div class="row d-block d-xl-flex align-items-center">
                <div class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
                    <div class="icon icon-shape icon-md icon-shape-blue rounded mr-4 mr-sm-0"><span class="fas fa-asterisk"></span></div>
                    <div class="d-sm-none">
                        <h2 class="h5">Não cadastradas</h2>
                        <h3 class="mb-1">${fn:length(aCadastrar)}</h3>
                    </div>
                </div>
                <div class="col-12 col-xl-7 px-xl-0">
                    <div class="d-none d-sm-block">
                        <h2 class="h5">Não cadastradas</h2>
                        <h3 class="mb-1">${fn:length(aCadastrar)}</h3>
                    </div>
                </div>
            </div>
        </div>
        </a>
    </div>
</div>

<div class="col-12 col-sm-6 col-xl-4 mb-4">
    <div class="card border-light shadow-sm">
        <a href="/admin/audiencias.atrasadas">
        <div class="card-body">
            <div class="row d-block d-xl-flex align-items-center">
                <div class="col-12 col-xl-5 text-xl-center mb-3 mb-xl-0 d-flex align-items-center justify-content-xl-center">
                    <div class="icon icon-shape icon-md icon-shape-danger rounded mr-4"><span class="fas fa-clock"></span></div>
                    <div class="d-sm-none">
                        <h2 class="h5">Atrasadas da unidade</h2>
                        <h3 class="mb-1">${fn:length(todasAtrasadas)}</h3>
                    </div>
                </div>
                <div class="col-12 col-xl-7 px-xl-0">
                    <div class="d-none d-sm-block">
                        <h2 class="h5">Atrasadas da unidade</h2>
                        <h3 class="mb-1">${fn:length(todasAtrasadas)}</h3>
                    </div>
                </div>
            </div>
        </div>
        </a>
    </div>
</div>
<div class="col-12 col-sm-6 col-xl-4 mb-4">
</div>

<%--Fim dos cards da tela inicial--%>