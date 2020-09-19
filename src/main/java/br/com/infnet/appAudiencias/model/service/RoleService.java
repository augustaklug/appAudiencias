package br.com.infnet.appAudiencias.model.service;

import br.com.infnet.appAudiencias.model.negocio.Role;
import br.com.infnet.appAudiencias.model.repository.IRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {
    @Autowired
    private IRoleRepository repository;

    public void incluir(Role role){repository.save(role);}

    public Role obterPorNome(String nome) {
        return repository.findByNome(nome);
    }

    public List<Role> obterLista(){return (List<Role>) repository.findAll();}
}
