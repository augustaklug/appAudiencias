package br.com.infnet.appAudiencias.controller;

import br.com.infnet.appAudiencias.model.service.AudienciaService;
import br.com.infnet.appAudiencias.model.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
public class AppController {

	@Autowired
	private AudienciaService audienciaService;

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showInit(Model model) {
		model.addAttribute("naoCumpridas", audienciaService.naoCumpridas());
		model.addAttribute("presos", audienciaService.presos());
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
		return showInit(model);
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

/*	@RequestMapping(value = "/voltar", method = RequestMethod.GET)
	public String voltar() {		
		return this.showInit();
	}*/
	
/*	@RequestMapping(value = "/sair", method = RequestMethod.GET)
	public String sair(SessionStatus session) {
		
		session.setComplete();		
		
		return "login";
	}*/
}