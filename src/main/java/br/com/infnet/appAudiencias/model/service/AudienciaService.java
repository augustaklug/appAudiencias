package br.com.infnet.appAudiencias.model.service;

import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import br.com.infnet.appAudiencias.model.negocio.Processo;
import br.com.infnet.appAudiencias.model.repository.IAudienciaRepository;
import br.com.infnet.appAudiencias.model.repository.IProcessoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AudienciaService {

	@Autowired private IAudienciaRepository audienciaRepository;

	public void incluir(Audiencia audiencia){
		audienciaRepository.save(audiencia);
	}

	public void excluir(Integer id) {
		audienciaRepository.deleteById(id);
	}

	public List<Audiencia> obterLista(){
		return (List<Audiencia>) audienciaRepository.findAll();
	}

	public Optional<Audiencia> obterPorId(Integer id) {
		return audienciaRepository.findById(id);
	}
}