package com.policlinicoSC.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.policlinicoSC.demo.dao.AdministradorDAO;
import com.policlinicoSC.demo.dto.AdministradorDTO;

@Service
public class AdministradorService {

    @Autowired
    private AdministradorDAO administradorDAO;

    public AdministradorDTO obtenerPorDni(String dni) {
        return administradorDAO.buscarPorDni(dni);
    }
}
