package br.com.infnet.appAudiencias.model.negocio;

import javax.persistence.*;

@Entity
@Table(name = "TProcesso")
public class Processo {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String numero;
    private String vara;
    private String magistrado;

    public Processo() {
    }

    public Processo(Integer id, String numero, String vara, String magistrado) {
        this.id = id;
        this.numero = numero;
        this.vara = vara;
        this.magistrado = magistrado;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getVara() {
        return vara;
    }

    public void setVara(String vara) {
        this.vara = vara;
    }

    public String getMagistrado() {
        return magistrado;
    }

    public void setMagistrado(String magistrado) {
        this.magistrado = magistrado;
    }
}
