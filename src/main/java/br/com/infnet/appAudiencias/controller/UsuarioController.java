package br.com.infnet.appAudiencias.controller;

import br.com.infnet.appAudiencias.model.negocio.Role;
import br.com.infnet.appAudiencias.model.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.infnet.appAudiencias.model.negocio.Usuario;
import br.com.infnet.appAudiencias.model.service.UsuarioService;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;

@Controller
public class UsuarioController {
	
	@Autowired 
	private UsuarioService usuarioService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private AppController appController;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping(value = "/usuario", method = RequestMethod.POST)
	public String incluir(
				Usuario usuario,
				Model model,
				@RequestParam("acesso") String acesso
			) {
		if(usuarioService.notInUse(usuario.getLogin())){
			usuario.setSenha(bCryptPasswordEncoder.encode(usuario.getSenha()));
			Role userRole = roleService.obterPorNome(acesso);
			usuario.setRoles(Arrays.asList(userRole));
			usuarioService.incluir(usuario);

			return "login";
	}	else{
			model.addAttribute("mensagem", "O login '"+usuario.getLogin()+"' já está em uso.");
			return appController.cadastrar(model);
		}
	}
}