package br.com.infnet.appAudiencias.controller;

import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import br.com.infnet.appAudiencias.model.service.AudienciaService;
import br.com.infnet.appAudiencias.model.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AudienciaController {

    @Autowired
    private AudienciaService audienciaService;

    @Autowired
    private UsuarioService usuarioService;

    @RequestMapping(value = "/cadastro.audiencias", method = RequestMethod.GET)
    public String cadastrarAudiencia(Model model){
        model.addAttribute("listaUsuarios", usuarioService.obterLista());
        return "audiencia/cadastro";
    }

    @RequestMapping(value = "/cadastrar.audiencia", method = RequestMethod.POST)
    public String incluir(
            Audiencia audiencia
    ) {
        audienciaService.incluir(audiencia);
        return "home";
    }

    @RequestMapping(value = "/listar.audiencias", method = RequestMethod.GET)
    public String listar(Model model){
        model.addAttribute("listaAudiencias", audienciaService.obterLista());
        return "audiencia/lista";
    }
}
