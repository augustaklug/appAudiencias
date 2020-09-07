package br.com.infnet.appAudiencias.model.repository;

import br.com.infnet.appAudiencias.model.negocio.Processo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IProcessoRepository extends CrudRepository<Processo, Integer> {

}