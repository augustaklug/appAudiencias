package br.com.infnet.appAudiencias.model.repository;

import br.com.infnet.appAudiencias.model.negocio.Role;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IRoleRepository extends CrudRepository<Role, Integer> {

    @Query("from Role r where r.nome =:nome")
    Role findByNome(String nome);
}
