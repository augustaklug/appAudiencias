package br.com.infnet.appAudiencias.model.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.infnet.appAudiencias.model.negocio.Lancamento;

@Repository
public interface ILancamentoRepository extends CrudRepository<Lancamento, Integer> {
	
	@Query("from Lancamento l where l.tipo =:tipo order by l.data DESC")
	List<Lancamento> obterListaPorTipo(Integer tipo);

	List<Lancamento> findAll(Sort by);
}