package br.com.infnet.appAudiencias.security;

import br.com.infnet.appAudiencias.model.negocio.Role;
import br.com.infnet.appAudiencias.model.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class SetupDataLoader implements ApplicationListener<ContextRefreshedEvent> {
    boolean alreadySetup = false;
    @Autowired private RoleService roleService;

    @Override
    @Transactional
    @EventListener
    public void onApplicationEvent(ContextRefreshedEvent event) {

        if (alreadySetup)
            return;
        createRoleIfNotFound("ROLE_ADMIN");
        createRoleIfNotFound("ROLE_USER");

        alreadySetup = true;
    }

    @Transactional
    Role createRoleIfNotFound(String name) {

        Role role = roleService.obterPorNome(name);
        if (role == null) {
            role = new Role(name);
            roleService.incluir(role);
        }
        return role;
    }
}
