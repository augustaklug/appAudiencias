package br.com.infnet.appAudiencias.model.repository;

import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import br.com.infnet.appAudiencias.model.negocio.Usuario;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAudienciaRepository extends CrudRepository<Audiencia, Integer> {

    @Query("from Audiencia a where a.cumprida =true ORDER BY a.data")
    List<Audiencia> cumpridas();

    @Query("from Audiencia a where a.cumprida =false ORDER BY a.data")
    List<Audiencia> naoCumpridas();

    @Query("from Audiencia a where a.reuPreso =true ORDER BY a.data")
    List<Audiencia> presos();

    @Query("from Audiencia a ORDER BY a.data")
    List<Audiencia> ordenadasPorData();

    @Query("from Audiencia a where a.responsavel =:responsavel and a.cumprida =false ORDER BY a.data")
    List<Audiencia> aCumprirPorResponsavel(Usuario responsavel);

    @Query("from Audiencia a where a.data <= current_date + 7 and a.cumprida =false ORDER BY a.data")
    List<Audiencia> todasAtrasadas();

    @Query("from Audiencia a where a.data <= current_date + 7 and a.responsavel =:responsavel and a.cumprida =false ORDER BY a.data")
    List<Audiencia> atrasadasPorResponsavel(Usuario responsavel);

    @Query("from Audiencia a where a.id =:id")
    Audiencia obterPorId(Integer id);

}