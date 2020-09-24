package br.com.infnet.appAudiencias.controller;

import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import br.com.infnet.appAudiencias.model.negocio.Usuario;
import br.com.infnet.appAudiencias.model.service.AudienciaService;
import br.com.infnet.appAudiencias.model.service.PessoaService;
import br.com.infnet.appAudiencias.model.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AudienciaController {

    @Autowired
    private AudienciaService audienciaService;

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private AppController appController;

    @Autowired
    private PessoaService pessoaService;

    @RequestMapping(value = "/admin/cadastro.audiencias", method = RequestMethod.GET)
    public String cadastrarAudiencia(Model model){
        model.addAttribute("listaUsuarios", usuarioService.obterLista());
        return "audiencia/cadastro";
    }

    @RequestMapping(value = "/admin/cadastro.audiencias", method = RequestMethod.POST)
    public String cadastrarAudienciaAPI(Model model,
                                        @RequestParam("processoAPI") String processo,
                                        @RequestParam("dataAPI") String data,
                                        @RequestParam("horaAPI") String hora)
                                        {
        model.addAttribute("listaUsuarios", usuarioService.obterLista());
        model.addAttribute("processoAPI", processo);
        model.addAttribute("dataAPI", data);
        model.addAttribute("horaAPI", hora);
        return "audiencia/cadastroAPI";
    }

    @RequestMapping(value = "/admin/cadastrar.audiencia", method = RequestMethod.POST)
    public String incluir(
            Audiencia audiencia,
            Model model
            ) {
        audienciaService.incluir(audiencia);
        model.addAttribute("mensagem", "Audiência cadastrada com sucesso - autos nº "+audiencia.getProcesso());
        return this.listarAPI(model);
    }

    @RequestMapping(value = "/admin/listar.audiencias", method = RequestMethod.GET)
    public String listar(Model model){
        model.addAttribute("listaAudiencias", audienciaService.obterLista());
        model.addAttribute("titulo", "Listagem de audiências");
        model.addAttribute("subtitulo", "Todas as audiências cadastradas no sistema");
        return "audiencia/lista";
    }

    @RequestMapping(value = "/admin/api.audiencias", method = RequestMethod.GET)
    public String listarAPI(Model model){
        model.addAttribute("listaAudiencias", audienciaService.filtrarAPI());
        return "audiencia/listagemcadastro";
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

    @RequestMapping(value = "/admin/audiencias.nao.cumpridas", method = RequestMethod.GET)
    public String naoCumpridas(Model model){
        model.addAttribute("listaAudiencias", audienciaService.naoCumpridas());
        model.addAttribute("titulo", "Audiências não cumpridas");
        model.addAttribute("subtitulo", "Listagem de todas as audiências não cumpridas");
        return "audiencia/lista";
    }

    @RequestMapping(value = "/admin/audiencias.cumpridas", method = RequestMethod.GET)
    public String cumpridas(Model model){
        model.addAttribute("listaAudiencias", audienciaService.cumpridas());
        model.addAttribute("titulo", "Audiências cumpridas");
        model.addAttribute("subtitulo", "Listagem de todas as audiências cumpridas");
        return "audiencia/lista";
    }

    @RequestMapping(value = "/detalhes/{id}", method = RequestMethod.GET)
    public String detalharAudiencia(Model model,
                                    @PathVariable Integer id){
        model.addAttribute("audiencia", audienciaService.obterPorId(id));
        model.addAttribute("participantes", pessoaService.participantesPorId(id));
        return "audiencia/detalhes";
    }

    @RequestMapping(value = "/admin/excluir.audiencia/{id}", method = RequestMethod.POST)
    public String excluirAudiencia(@PathVariable Integer id,
                                   HttpServletRequest request){
        String referer = request.getHeader("Referer");
        audienciaService.excluir(id);
        return "redirect:"+referer;
    }

    @RequestMapping(value = "/detalhes/verifica/{id}", method = RequestMethod.POST)
    public String verificaCumprimento(@PathVariable Integer id,
                                      HttpServletRequest request
                                      ){
        String referer = request.getHeader("Referer");
        audienciaService.verificar(id);
        return "redirect:"+referer;
    }
}
