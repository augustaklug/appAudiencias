package br.com.infnet.appAudiencias.model.service;

import br.com.infnet.appAudiencias.clients.IAudienciaClient;
import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import br.com.infnet.appAudiencias.model.negocio.Usuario;
import br.com.infnet.appAudiencias.model.repository.IAudienciaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class AudienciaService {

	@Autowired private IAudienciaRepository audienciaRepository;

	@Autowired private IAudienciaClient client;

	Date dataLimite = Date.from(LocalDate.now().atStartOfDay().plusDays(7).atZone(ZoneId.systemDefault()).toInstant());

	public List<Audiencia> obterListaAPI(){
		return (List<Audiencia>) client.obterLista();
	}

	public List<Audiencia> filtrarAPI(){
		List<Audiencia> listaParaCadastro = new ArrayList<>();
		List<Audiencia> listaAPI = client.obterLista();
		for (Audiencia a : listaAPI) {
			if(audienciaRepository.obterPorAutos(a.getProcesso()).isEmpty()){
				listaParaCadastro.add(a);
			}
		}
		return listaParaCadastro;
	}

	public void incluir(Audiencia audiencia){
		audienciaRepository.save(audiencia);
	}

	public Audiencia obterPorId(Integer id){return audienciaRepository.obterPorId(id);}

	public void excluir(Integer id) {
		audienciaRepository.deleteById(id);
	}

	public void verificar(Integer id){
		Audiencia a = audienciaRepository.obterPorId(id);
		if(a.verificaCumprimento()){
			a.setCumprida(true);
			audienciaRepository.save(a);
		}
	}

	public List<Audiencia> obterLista(){
		return (List<Audiencia>) audienciaRepository.ordenadasPorData();
	}

	public List<Audiencia> listaSituacao(Boolean situacao){return (List<Audiencia>) audienciaRepository.listaPorSituacao(situacao);}

	public List<Audiencia> presos(){return (List<Audiencia>) audienciaRepository.presos();}

	public List<Audiencia> aCumprirPorResponsavel(Usuario responsavel){return (List<Audiencia>) audienciaRepository.aCumprirPorResponsavel(responsavel);}

	public List<Audiencia> todasAtrasadas(){return (List<Audiencia>) audienciaRepository.todasAtrasadas(dataLimite);}

	public List<Audiencia> atrasadasPorResponsavel(Usuario responsavel){return (List<Audiencia>) audienciaRepository.atrasadasPorResponsavel(dataLimite, responsavel);}

}