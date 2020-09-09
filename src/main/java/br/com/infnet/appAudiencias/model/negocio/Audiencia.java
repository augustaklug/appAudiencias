package br.com.infnet.appAudiencias.model.negocio;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "TAudiencias")
public class Audiencia {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String sala;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate data;
    @OneToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "idProcesso")
    private Processo processo;

    public Audiencia() {
    }

    public Audiencia(String sala, LocalDate data, Processo processo) {
        this.sala = sala;
        this.data = data;
        this.processo = processo;
    }

    public Audiencia(Integer id, String sala, LocalDate data, Processo processo) {
        this.id = id;
        this.sala = sala;
        this.data = data;
        this.processo = processo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSala() {
        return sala;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public Processo getProcesso() {
        return processo;
    }

    public void setProcesso(Processo processo) {
        this.processo = processo;
    }
}
