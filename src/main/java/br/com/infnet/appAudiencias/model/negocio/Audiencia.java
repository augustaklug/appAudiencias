package br.com.infnet.appAudiencias.model.negocio;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.deser.std.DateDeserializers;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalTimeDeserializer;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class Audiencia {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String processo;
    @ManyToOne(fetch = FetchType.LAZY)
    private Usuario responsavel;
    private Boolean reuPreso = false;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonDeserialize(using = DateDeserializers.DateDeserializer.class)
    private Date data;
    @DateTimeFormat(pattern="HH:mm")
    @JsonDeserialize(using = LocalTimeDeserializer.class)
    private LocalTime hora;
    @OneToMany(mappedBy = "audiencia", orphanRemoval = true)
    private List<Pessoa> participantes = new ArrayList<>();
    private Boolean cumprida = false;

    public Audiencia() {
    }

    public Audiencia(String processo, Usuario responsavel, Boolean reuPreso, Date data, LocalTime hora) {
        this.processo = processo;
        this.responsavel = responsavel;
        this.reuPreso = reuPreso;
        this.data = data;
        this.hora = hora;
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

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public Boolean getReuPreso() {
        return reuPreso;
    }

    public void setReuPreso(Boolean reuPreso) {
        this.reuPreso = reuPreso;
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

    public Boolean verificaCumprimento(){
        boolean cumprida = true;
        if(this.getParticipantes().isEmpty()){
            cumprida = false;
        }
        for (Pessoa pessoa : this.getParticipantes()) {
            if(!pessoa.getIntimada()){
                cumprida = false;
            }
        }
        return cumprida;
    }
}
