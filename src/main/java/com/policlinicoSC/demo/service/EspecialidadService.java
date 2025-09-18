package com.policlinicoSC.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.policlinicoSC.demo.dao.ListaDAO;
import com.policlinicoSC.demo.model.Especialidad;

@Service
public class EspecialidadService {

    @Autowired
    private ListaDAO listaDAO;

    public List<Especialidad> listarTodas(){
        return listaDAO.listarTodas();
    }
}
