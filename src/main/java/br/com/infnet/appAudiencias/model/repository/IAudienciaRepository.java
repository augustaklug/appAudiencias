package br.com.infnet.appAudiencias.model.repository;

import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IAudienciaRepository extends CrudRepository<Audiencia, Integer> {

}