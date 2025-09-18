package com.policlinicoSC.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.policlinicoSC.demo.dao.RecepcionistaDAO;
import com.policlinicoSC.demo.dao.UsuarioDAO;
import com.policlinicoSC.demo.dto.RecepcionistaDTO;
import com.policlinicoSC.demo.model.Usuario;

@Service
public class RecepcionistaService {

    @Autowired
    private RecepcionistaDAO recepcionistaDAO;
    
    @Autowired
    private UsuarioDAO usuarioDAO;

    @Autowired
    BCryptPasswordEncoder encoder;

    public RecepcionistaDTO obtenerPorDni(String dni) {
        return recepcionistaDAO.buscarPorDni(dni);
    }

    public List<RecepcionistaDTO> obtenerTodos(){
        return recepcionistaDAO.obtenerTodos();
    }

    public RecepcionistaDTO obtenerPorId(int id){
        return recepcionistaDAO.obtenerPorId(id);
    }

    public void actualizar(RecepcionistaDTO recepcionista){
        String passEncriptada = encoder.encode(recepcionista.getContraseña());
        recepcionista.setContraseña(passEncriptada);
        recepcionistaDAO.actualizar(recepcionista);
    }

    public void insertar(RecepcionistaDTO recepcionista){
        System.out.println("aqui estoyyyy 22222222222222222222222222222");
        String passEncriptada = encoder.encode(recepcionista.getContraseña());
        recepcionista.setContraseña(passEncriptada);
        Usuario usuario = new Usuario();
        usuario.setDni(recepcionista.getDni());
        usuario.setContraseña(recepcionista.getContraseña());
        usuario.setRol("RECEPCIONISTA");

        System.out.println(passEncriptada);
        System.out.println(recepcionista.getContraseña());
        System.out.println("aqui estoyyyy 333333333333333333333");
        usuarioDAO.insertar(usuario);
        System.out.println("aqui estoyyyy 4444444444444444444444444");
        int usuario_id = usuarioDAO.obternerId(recepcionista.getDni());
        System.out.println(usuario_id);
        recepcionistaDAO.insertar(recepcionista,usuario_id);
        System.out.println("ya inserto pe gaaaaaaaaaaaaaaaaaaa");
    }

    public void activar(String dni){
        
        recepcionistaDAO.activar(dni);
        
    }

    public void desactivar(String dni){
        
        recepcionistaDAO.desactivar(dni);
        
    }
}
