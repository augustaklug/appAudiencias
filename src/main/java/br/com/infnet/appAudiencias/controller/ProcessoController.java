package br.com.infnet.appAudiencias.controller;

import br.com.infnet.appAudiencias.model.negocio.Processo;
import br.com.infnet.appAudiencias.model.service.AudienciaService;
import br.com.infnet.appAudiencias.model.service.ProcessoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProcessoController {
    @Autowired
    private ProcessoService processoService;
    @Autowired
    private AudienciaService audienciaService;

    @RequestMapping(value = "/processo", method = RequestMethod.GET)
    public String showDetalhe(
            Model model
    ) {

        model.addAttribute("listaProcesso", processoService.obterLista());

        return "processo/detalhe";
    }

    @RequestMapping(value = "/processos", method = RequestMethod.GET)
    public String obterLista(
            Model model
    ) {

        model.addAttribute("listaProcesso", processoService.obterLista());

        return "processo/lista";
    }

    @RequestMapping(value = "/processo", method = RequestMethod.POST)
    public String incluir(
            Model model,
            Processo processo
    ) {

        processoService.incluir(processo);

        return this.obterLista(model);
    }

    @RequestMapping(value = "/processo/excluir/{id}", method = RequestMethod.GET)
    public String excluir(
            Model model,
            @PathVariable Integer id
    ) {

        processoService.excluir(id);

        return this.obterLista(model);
    }
}
