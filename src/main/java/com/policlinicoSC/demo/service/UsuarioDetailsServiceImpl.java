package com.policlinicoSC.demo.service;

import com.policlinicoSC.demo.repository.UsuarioRepository;
import com.policlinicoSC.demo.model.Usuario;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class UsuarioDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UsuarioDAO usuarioDAO;

    @Override
    public UserDetails loadUserByUsername(String dni) throws UsernameNotFoundException {
        Usuario usuario = usuarioDAO.buscarPorDni(dni);
        if (usuario == null) {
            throw new UsernameNotFoundException("DNI no encontrado");
        }

        return new User(
                usuario.getDni(),
                usuario.getContraseña(),
                Collections.singletonList(new SimpleGrantedAuthority(usuario.getRol()))
        );
    }
}
