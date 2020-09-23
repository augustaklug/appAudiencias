package br.com.infnet.appAudiencias.model.negocio;

import javax.persistence.*;

@Entity
public class Pessoa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nome;
    private String telefone;
    @ManyToOne(fetch = FetchType.LAZY)
    private Audiencia audiencia;
    private Boolean intimada = false;
    @OneToOne(cascade = CascadeType.DETACH)
    private Intimacao intimacao;

    public Pessoa() {
    }

    public Pessoa(String nome, String telefone) {
        this.nome = nome;
        this.telefone = telefone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Boolean getIntimada() {
        return intimada;
    }

    public void setIntimada(Boolean intimada) {
        this.intimada = intimada;
    }

    public Intimacao getIntimacao() {
        return intimacao;
    }

    public void setIntimacao(Intimacao intimacao) {
        this.intimacao = intimacao;
    }

    public Audiencia getAudiencia() {
        return audiencia;
    }

    public void setAudiencia(Audiencia audiencia) {
        this.audiencia = audiencia;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Pessoa )) return false;
        return id != null && id.equals(((Pessoa) o).getId());
    }

    @Override
    public int hashCode() {
        return 31;
    }
}
