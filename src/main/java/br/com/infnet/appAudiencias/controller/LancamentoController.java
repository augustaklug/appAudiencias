package br.com.infnet.appAudiencias.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.infnet.appAudiencias.model.negocio.Lancamento;
import br.com.infnet.appAudiencias.model.service.LancamentoService;

@Controller
public class LancamentoController {

	@Autowired private LancamentoService lancamentoService;
	
	@RequestMapping(value = "/lista", method = RequestMethod.GET)
	public String home(
				Model model
			) {
		model.addAttribute("filtro", obterTipo(0));
		
		model.addAttribute("listaLancamento", lancamentoService.obterLista());
		
		return "home";
	}
	
	@RequestMapping(value = "/lista/{tipo}", method = RequestMethod.GET)
	public String obterListaPorTipo(
				Model model,
				@PathVariable Integer tipo
			) {

		model.addAttribute("filtro", obterTipo(tipo));
		
		model.addAttribute("listaLancamento", lancamentoService.obterListaPorTipo(tipo));
		
		return "home";
	}

	@RequestMapping(value = "/incluir", method = RequestMethod.POST)
	public String incluir(
				Model model,
				Lancamento lancamento
//				, @RequestParam String dhLanc
			) {

//		DateTimeFormatter dt = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");		
//		lancamento.setDhLancamento(LocalDateTime.parse(dhLanc, dt));
		
		lancamentoService.incluir(lancamento);
		
		return this.obterListaPorTipo(model, lancamento.getTipo());
	}
	
	@RequestMapping(value = "/lancamento/excluir/{id}", method = RequestMethod.GET)
	public String excluir(
			Model model,
			@PathVariable Integer id
			) {
		
		Lancamento lancamento = lancamentoService.obterPorId(id);
		
		lancamentoService.excluir(id);

		return this.obterListaPorTipo(model, lancamento.getTipo());
	}
	
	@RequestMapping(value = "/lancamento/confirmar/{id}", method = RequestMethod.GET)
	public String confirmar(
			Model model,
			@PathVariable Integer id
			) {
		
		Lancamento lancamento = lancamentoService.obterPorId(id);
		
		lancamentoService.confirmar(lancamento);

		return this.obterListaPorTipo(model, lancamento.getTipo());
	}

	private String obterTipo(Integer tipo) {
		if(tipo >= 0 && tipo <= 4) {
			String[] tipos = {"todos", "pagamento", "recebimento", "a pagar", "a receber"};
			
			return tipos[tipo]; 
		}
		
		return "sem filtro";
	}
}
