package br.com.infnet.appAudiencias.controller;

import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import br.com.infnet.appAudiencias.model.service.AudienciaService;
import br.com.infnet.appAudiencias.model.service.ProcessoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AudienciaController {

    @Autowired
    private AudienciaService audienciaService;
    @Autowired
    private ProcessoService processoService;

    @RequestMapping(value = "/audiencia", method = RequestMethod.GET)
    public String showDetalhe(
            Model model
    ) {

        model.addAttribute("listaProcesso", processoService.obterLista());

        return "processo/lista";
    }

    @RequestMapping(value = "/audienciacadastro/{id}", method = RequestMethod.GET)
    public String cadastrarAudiencia(
            Model model,
            @PathVariable Integer id
    ){
        model.addAttribute("listaAudiencia", audienciaService.obterLista());
        model.addAttribute("idProcesso", id);
        return "audiencia/detalhe";
    }

    @RequestMapping(value = "/audiencias", method = RequestMethod.GET)
    public String obterLista(
            Model model
    ) {

        model.addAttribute("listaAudiencia", audienciaService.obterLista());

        return "audiencia/lista";
    }

    @RequestMapping(value = "/audiencia", method = RequestMethod.POST)
    public String incluir(
            Model model,
            Audiencia audiencia
    ) {

        audienciaService.incluir(audiencia);

        return this.obterLista(model);
    }

    @RequestMapping(value = "/audiencia/excluir/{id}", method = RequestMethod.GET)
    public String excluir(
            Model model,
            @PathVariable Integer id
    ) {

        audienciaService.excluir(id);

        return this.obterLista(model);
    }

}
