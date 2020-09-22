package br.com.infnet.appAudiencias.model.negocio;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Entity
public class Usuario implements UserDetails {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique = true)
	private String login;
	private String nome;
	private String senha;
	@OneToMany(mappedBy = "responsavel")
	private List<Audiencia> audiencias = new ArrayList<>();
	@ManyToMany(fetch = FetchType.EAGER)
	private List<Role> roles = new ArrayList<Role>();

	public Usuario() {
	}

	public Usuario(String login, String nome, String senha) {
		this.login = login;
		this.nome = nome;
		this.senha = senha;
	}

	public void addAudiencia(Audiencia audiencia) {
		audiencias.add(audiencia);
		audiencia.setResponsavel(this);
	}

	public void removeAudiencia(Audiencia audiencia) {
		audiencias.remove(audiencia);
		audiencia.setResponsavel(null);
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.getRoles();
	}

	@Override
	public String getPassword() {
		return this.getSenha();
	}

	@Override
	public String getUsername() {
		return this.getLogin();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}