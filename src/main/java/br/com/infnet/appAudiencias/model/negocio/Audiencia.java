package br.com.infnet.appAudiencias.model.negocio;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "TAudiencias")
public class Audiencia {
    @Id
    private Integer id;
    private String sala;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate data;
    @OneToOne
    @MapsId
    private Processo processo;

    public Audiencia() {
    }

}
