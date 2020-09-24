package br.com.infnet.appAudiencias.clients;

import br.com.infnet.appAudiencias.model.negocio.Audiencia;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@FeignClient(url = "https://audiencias-api.herokuapp.com", name = "audienciaClient")
public interface IAudienciaClient {
    @GetMapping("/api/audiencia")
    public List<Audiencia> obterLista();
}
