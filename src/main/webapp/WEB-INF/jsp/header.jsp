<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

		<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		  <a class="navbar-brand" href="/sair">AppGrana: ${user.nome}</a>
		  <ul class="navbar-nav">
		    <li class="nav-item">
		      <a class="nav-link" href="/lista">Todos</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="/lista/1">Pagamentos</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="/lista/2">Recebimentos</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="/lista/3">A pagar</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="/lista/4">A receber</a>
		    </li>
		  </ul>
		</nav>	
		
	    <h3>Projeto AppGrana</h3>
	    <p>Sistema para gerenciamento financeiro</p>
