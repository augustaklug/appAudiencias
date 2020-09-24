package br.com.infnet.appAudiencias.controller;

import br.com.infnet.appAudiencias.model.negocio.Intimacao;
import br.com.infnet.appAudiencias.model.negocio.Pessoa;
import br.com.infnet.appAudiencias.model.service.IntimacaoService;
import br.com.infnet.appAudiencias.model.service.PessoaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IntimacaoController {
    @Autowired
    private IntimacaoService intimacaoService;

    @Autowired
    private PessoaService pessoaService;

    @RequestMapping(value = "/cadastrar.intimacao", method = RequestMethod.POST)
    public String cadastrarIntimacao(Intimacao intimacao,
                                     @RequestParam("pessoaId") Integer idPessoa,
                                     HttpServletRequest request){
        String referer = request.getHeader("Referer");
        intimacaoService.incluir(intimacao);
        Pessoa pessoa = pessoaService.buscaPorId(idPessoa);
        pessoa.setIntimacao(intimacao);
        pessoa.setIntimada(true);
        pessoaService.incluir(pessoa);
        return "redirect:"+referer;
    }
}
