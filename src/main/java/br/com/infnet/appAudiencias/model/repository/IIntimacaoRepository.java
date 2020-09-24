package br.com.infnet.appAudiencias.model.repository;

import br.com.infnet.appAudiencias.model.negocio.Intimacao;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IIntimacaoRepository extends CrudRepository<Intimacao, Integer> {
    @Query("from Intimacao i where i.id=:id")
    Intimacao porId(Integer id);
}
