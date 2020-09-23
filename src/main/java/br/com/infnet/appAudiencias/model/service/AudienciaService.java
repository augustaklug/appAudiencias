package br.com.infnet.appAudiencias.model.service;

import br.com.infnet.appAudiencias.clients.IAudienciaClient;
import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import br.com.infnet.appAudiencias.model.negocio.Usuario;
import br.com.infnet.appAudiencias.model.repository.IAudienciaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AudienciaService {

	@Autowired private IAudienciaRepository audienciaRepository;

	@Autowired private IAudienciaClient client;

	public List<Audiencia> obterListaAPI(){
		return (List<Audiencia>) client.obterLista();
	}

	public List<Audiencia> filtrarAPI(){
		List<Audiencia> listaParaCadastro = new ArrayList<>();
		List<Audiencia> listaAPI = client.obterLista();
		for (Audiencia a : listaAPI) {
			if(audienciaRepository.obterPorAutos(a.getProcesso()) == null){
				listaParaCadastro.add(a);
			}
		}
		for (Audiencia a : listaParaCadastro){
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String strDate = dateFormat.format(a.getData());
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

	public List<Audiencia> naoCumpridas(){return (List<Audiencia>) audienciaRepository.naoCumpridas();}

	public List<Audiencia> cumpridas(){return (List<Audiencia>) audienciaRepository.cumpridas();}

	public List<Audiencia> presos(){return (List<Audiencia>) audienciaRepository.presos();}

	public List<Audiencia> aCumprirPorResponsavel(Usuario responsavel){return (List<Audiencia>) audienciaRepository.aCumprirPorResponsavel(responsavel);}

	public List<Audiencia> todasAtrasadas(){return (List<Audiencia>) audienciaRepository.todasAtrasadas();}

	public List<Audiencia> atrasadasPorResponsavel(Usuario responsavel){return (List<Audiencia>) audienciaRepository.atrasadasPorResponsavel(responsavel);}

}