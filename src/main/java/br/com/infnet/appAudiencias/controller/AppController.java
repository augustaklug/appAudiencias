package br.com.infnet.appAudiencias.controller;

import br.com.infnet.appAudiencias.model.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import br.com.infnet.appAudiencias.model.service.UsuarioService;

@Controller
@SessionAttributes("user")
public class AppController {

	@Autowired 
	private UsuarioService usuarioService;

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showInit() {
		return "home";
	}

	@RequestMapping(value = "/cadastrar", method = RequestMethod.GET)
	public String cadastrar(Model model){
		model.addAttribute("roles", roleService.obterLista());
		return "usuario/detalhe";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLogin() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loggedIn(Model model){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String nomeAtual = authentication.getName();
		model.addAttribute("nome", nomeAtual);
		return showInit();
	}

	//Metódo de autenticação anterior ao Spring Security
	/*
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String showHome(
				Model model,
				@RequestParam String login,
				@RequestParam String senha
			) {

		Usuario usuario = usuarioService.userExist(login);

		if(usuario == null) {
			model.addAttribute("mensagem", "Usuário não cadastrado: " + login);
			return "usuario/detalhe";

		}else if (!usuarioService.isValid(login, senha)) {
			model.addAttribute("mensagem", "Credenciais inválidas: " + login);
			return "login";

		}  else {
			model.addAttribute("user", usuario);
			return "redirect:/lista";
		}
	}*/

	@RequestMapping(value = "/voltar", method = RequestMethod.GET) 
	public String voltar() {		
		return this.showInit();
	}
	
/*	@RequestMapping(value = "/sair", method = RequestMethod.GET)
	public String sair(SessionStatus session) {
		
		session.setComplete();		
		
		return "login";
	}*/
}