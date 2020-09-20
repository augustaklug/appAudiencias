package br.com.infnet.appAudiencias.model.negocio;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Audiencia {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String processo;
    @ManyToOne(fetch = FetchType.LAZY)
    private Usuario responsavel;
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date data;
    @DateTimeFormat(pattern="HH:mm")
    private Time hora;
    @OneToMany(mappedBy = "audiencia")
    private List<Pessoa> participantes = new ArrayList<>();
    private Boolean cumprida;

    public Audiencia() {
        this.cumprida = false;
    }

    public Audiencia(String processo, Usuario responsavel, Date data, Time hora) {
        this.processo = processo;
        this.responsavel = responsavel;
        this.data = data;
        this.hora = hora;
        this.cumprida = false;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProcesso() {
        return processo;
    }

    public void setProcesso(String processo) {
        this.processo = processo;
    }

    public Usuario getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(Usuario responsavel) {
        this.responsavel = responsavel;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public List<Pessoa> getParticipantes() {
        return participantes;
    }

    public void setParticipantes(List<Pessoa> participantes) {
        this.participantes = participantes;
    }

    public Boolean getCumprida() {
        return cumprida;
    }

    public void setCumprida(Boolean cumprida) {
        this.cumprida = cumprida;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Audiencia )) return false;
        return id != null && id.equals(((Audiencia) o).getId());
    }

    @Override
    public int hashCode() {
        return 31;
    }

    public void addParticipante(Pessoa pessoa) {
        participantes.add(pessoa);
        pessoa.setAudiencia(this);
    }

    public void removeParticipante(Pessoa pessoa) {
        participantes.remove(pessoa);
        pessoa.setAudiencia(null);
    }
}
