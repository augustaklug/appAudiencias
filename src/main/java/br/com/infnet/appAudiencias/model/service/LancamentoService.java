package br.com.infnet.appAudiencias.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import br.com.infnet.appAudiencias.model.negocio.Lancamento;
import br.com.infnet.appAudiencias.model.repository.ILancamentoRepository;

@Service
public class LancamentoService {

	@Autowired private ILancamentoRepository lancamentoRepository;
	
	public void incluir(Lancamento lancamento) {
		lancamentoRepository.save(lancamento);
	}
	
	public void confirmar(Lancamento lancamento) {
		Integer tipo = 0;
		
		switch (lancamento.getTipo()) {
		case 3:
			tipo = 1;
			break;

		case 4:
			tipo = 2;
			break;

		default:
			tipo = lancamento.getTipo();
			break;
		}
		
		lancamento.setTipo(tipo);
		
		lancamentoRepository.save(lancamento);
	}
	
	public void excluir(Integer id) {
		lancamentoRepository.deleteById(id);
	}
	
	public List<Lancamento> obterLista(){
		return lancamentoRepository.findAll(Sort.by(Sort.Direction.DESC, "data"));
	}

	public List<Lancamento> obterListaPorTipo(Integer tipo) {
		return lancamentoRepository.obterListaPorTipo(tipo);
	}
	
	public Lancamento obterPorId(Integer id) {
		return lancamentoRepository.findById(id).orElse(new Lancamento(0));
	}
}