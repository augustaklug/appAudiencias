package br.com.infnet.appAudiencias.model.service;

import br.com.infnet.appAudiencias.model.negocio.Pessoa;
import br.com.infnet.appAudiencias.model.repository.IPessoaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PessoaService {
    @Autowired
    private IPessoaRepository pessoaRepository;

    public void incluir(Pessoa pessoa){pessoaRepository.save(pessoa);}

    public void excluir(Integer id){pessoaRepository.deleteById(id);}

    public Pessoa buscaPorId(Integer id){return pessoaRepository.porId(id);}

    public List<Pessoa> participantesPorId(Integer id){return pessoaRepository.participantesPorId(id);}

    public List<Pessoa> findPessoasByNome(String nome){return pessoaRepository.findPessoasByNomeContains(nome);}
}
