package br.com.infnet.appAudiencias.model.repository;

import br.com.infnet.appAudiencias.model.negocio.Pessoa;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IPessoaRepository extends CrudRepository<Pessoa, Integer> {

    @Query("from Pessoa p where p.audiencia.id =:id")
    List<Pessoa>  participantesPorId(Integer id);

    @Query("from Pessoa p where p.id=:id")
    Pessoa porId(Integer id);
}
