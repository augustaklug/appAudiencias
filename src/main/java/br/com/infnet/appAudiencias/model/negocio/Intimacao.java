package br.com.infnet.appAudiencias.model.negocio;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;
import java.sql.Time;

@Entity
public class Intimacao {
    @Id
    private Integer id;
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date data;
    @DateTimeFormat(pattern = "HH:mm")
    private Time hora;
    private String forma;

    public Intimacao() {
    }

    public Intimacao(Date data, Time hora, String forma) {
        this.data = data;
        this.hora = hora;
        this.forma = forma;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getForma() {
        return forma;
    }

    public void setForma(String forma) {
        this.forma = forma;
    }
}
