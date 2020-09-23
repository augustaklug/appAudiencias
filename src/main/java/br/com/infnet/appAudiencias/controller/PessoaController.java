package br.com.infnet.appAudiencias.controller;

import br.com.infnet.appAudiencias.model.negocio.Pessoa;
import br.com.infnet.appAudiencias.model.service.PessoaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PessoaController {
    @Autowired
    private PessoaService service;

    @RequestMapping(value = "/cadastrar.participante", method = RequestMethod.POST)
    public String incluirPessoa(
            Pessoa pessoa,
            HttpServletRequest request
    ) {
        String referer = request.getHeader("Referer");
        service.incluir(pessoa);
        return "redirect:"+referer;
    }

    @RequestMapping(value = "/excluir.pessoa/{id}", method = RequestMethod.POST)
    public String excluirPessoa(@PathVariable Integer id,
                                   HttpServletRequest request){
        String referer = request.getHeader("Referer");
        service.excluir(id);
        return "redirect:"+referer;
    }
}
