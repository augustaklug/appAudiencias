package br.com.infnet.appAudiencias.model.repository;

import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAudienciaRepository extends CrudRepository<Audiencia, Integer> {

    @Query("from Audiencia a where a.cumprida =false")
    List<Audiencia> naoCumpridas();

    @Query("from Audiencia a where a.reuPreso =true")
    List<Audiencia> presos();

}