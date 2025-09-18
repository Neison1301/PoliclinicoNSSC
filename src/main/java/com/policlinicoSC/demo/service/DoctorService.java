package com.policlinicoSC.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.policlinicoSC.demo.dao.DoctorDAO;
import com.policlinicoSC.demo.dao.EspecialidadDAO;
import com.policlinicoSC.demo.dto.DoctorDTO;

@Service
public class DoctorService {

    @Autowired
    private DoctorDAO doctorDAO;

    @Autowired
    private EspecialidadDAO especialidadDAO;

    public int obetenerEspecialidadID(int doctorID) {
        return doctorDAO.obetenerEspecialidadID(doctorID);
    }

    public List<DoctorDTO> obtenerTodosLosDoctores() {
        return doctorDAO.obtenerTodosLosDoctores();
    }

    public List<DoctorDTO> filtrarDoctores(String nombreFiltro, String especialidadFiltro) {
        return doctorDAO.filtrarDoctores(nombreFiltro, especialidadFiltro);
    }

    public DoctorDTO obtenerPorId(int id) {
        return doctorDAO.obtenerPorId(id);
    }

    public void insertar(DoctorDTO doctor) {
        int especialidadID = especialidadDAO.obtenerIdPorNombre(doctor.getEspecialidad());
        doctorDAO.insertar(doctor, especialidadID);

    }

    public void actualizar(DoctorDTO doctor) {
        int especialidadID = especialidadDAO.obtenerIdPorNombre(doctor.getEspecialidad());
        doctorDAO.actualizar(doctor, especialidadID);

    }

    public List<String> obtenerEspecialidadesUnicas() {
        return especialidadDAO.obtenerEspecialidadesUnicas();
    }

    public void cambiarActivado(int iddoctor){
        doctorDAO.cambiarActivado(iddoctor);
    }

    public void cambiarDesactivado(int iddoctor){
        doctorDAO.cambiarDesactivado(iddoctor);
    }
    /*
     * METODO ES REVISION, RECORDAR QUE SI SE ELIMINAR SE ELIMINARIA TODO LOS
     * HROARIOS Y CITAS QUE TIENEN VINCULADO, MEJOR OPCION PONER ESTADO INACTIVO
     * public void eliminar(int id){
     * doctorDAO.eliminar(id);
     * }
     */
}
