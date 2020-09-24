package br.com.infnet.appAudiencias.model.service;

import br.com.infnet.appAudiencias.model.negocio.Intimacao;
import br.com.infnet.appAudiencias.model.repository.IIntimacaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IntimacaoService {
    @Autowired
    private IIntimacaoRepository repository;

    public void incluir(Intimacao intimacao){repository.save(intimacao);}
    public void excluir(Integer id){repository.deleteById(id);}
    public Intimacao buscaPorId(Integer id){return repository.porId(id);}
}
