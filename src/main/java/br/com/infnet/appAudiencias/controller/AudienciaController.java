package br.com.infnet.appAudiencias.controller;

import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import br.com.infnet.appAudiencias.model.negocio.Usuario;
import br.com.infnet.appAudiencias.model.service.AudienciaService;
import br.com.infnet.appAudiencias.model.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AudienciaController {

    @Autowired
    private AudienciaService audienciaService;

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private AppController appController;

    @RequestMapping(value = "/admin/cadastro.audiencias", method = RequestMethod.GET)
    public String cadastrarAudiencia(Model model){
        model.addAttribute("listaUsuarios", usuarioService.obterLista());
        return "audiencia/cadastro";
    }

    @RequestMapping(value = "/admin/cadastrar.audiencia", method = RequestMethod.POST)
    public String incluir(
            Model model,
            Audiencia audiencia
    ) {
        audienciaService.incluir(audiencia);
        return appController.showInit(model);
    }

    @RequestMapping(value = "/admin/listar.audiencias", method = RequestMethod.GET)
    public String listar(Model model){
        model.addAttribute("listaAudiencias", audienciaService.obterLista());
        model.addAttribute("titulo", "Listagem de audiências");
        model.addAttribute("subtitulo", "Todas as audiências cadastradas no sistema");
        return "audiencia/lista";
    }

    @RequestMapping(value = "/cumprir.audiencias", method = RequestMethod.GET)
    public String cumprir(Model model,
                          @AuthenticationPrincipal Usuario responsavel){
        model.addAttribute("listaAudiencias", audienciaService.aCumprirPorResponsavel(responsavel));
        model.addAttribute("titulo", "Audiências a cumprir");
        model.addAttribute("subtitulo", "Listagem de audiências pendentes do usuário logado");
        return "audiencia/lista";
    }

    @RequestMapping(value = "/admin/audiencias.atrasadas", method = RequestMethod.GET)
    public String listarAtrasadas(Model model){
        model.addAttribute("listaAudiencias", audienciaService.todasAtrasadas());
        model.addAttribute("titulo", "Audiências atrasadas");
        model.addAttribute("subtitulo", "Audiências dos próximos 7 dias não cumpridas");
        return "audiencia/lista";
    }

    @RequestMapping(value = "/audiencias.atrasadas", method = RequestMethod.GET)
    public String atrasadasPorResponsavel(Model model,
                                          @AuthenticationPrincipal Usuario responsavel){
        model.addAttribute("listaAudiencias", audienciaService.atrasadasPorResponsavel(responsavel));
        model.addAttribute("titulo", "Audiências atrasadas");
        model.addAttribute("subtitulo", "Listagem de audiências pendentes do usuário logado nos próximos 7 dias");
        return "audiencia/lista";
    }

    @RequestMapping(value = "/detalhes/{id}", method = RequestMethod.GET)
    public String detalharAudiencia(Model model,
                                    @PathVariable Integer id){
        model.addAttribute("audiencia", audienciaService.obterPorId(id));
        return "audiencia/detalhes";
    }

    @RequestMapping(value = "/admin/excluir.audiencia/{id}", method = RequestMethod.GET)
    public String excluirAudiencia(@PathVariable Integer id,
                                   HttpServletRequest request){
        String referer = request.getHeader("Referer");
        audienciaService.excluir(id);
        return "redirect:"+referer;
    }
}
