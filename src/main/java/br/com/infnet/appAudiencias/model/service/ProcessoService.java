package br.com.infnet.appAudiencias.model.service;

import br.com.infnet.appAudiencias.model.negocio.Processo;
import br.com.infnet.appAudiencias.model.repository.IProcessoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProcessoService {

	@Autowired private IProcessoRepository processoRepository;
	
	public void incluir(Processo processo) {
		processoRepository.save(processo);
	}
	
	public void excluir(Integer id) {
		processoRepository.deleteById(id);
	}
	
	public List<Processo> obterLista(){
		return (List<Processo>) processoRepository.findAll();
	}

	public Optional<Processo> obterPorId(Integer id) {
		return processoRepository.findById(id);
	}
}