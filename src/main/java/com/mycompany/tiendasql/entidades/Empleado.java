/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tiendasql.entidades;

import java.util.Date;

/**
 *
 * @author lroda
 */
public class Empleado {

    //Atributos
    private int codUsuario;
    private String password;
    private String instalacion;
    private String nombreEmpleado;
    private Date fechaNacimiento;
    private String rol;
    private int sueldo;

    //Constructor
    public Empleado(int codUsuario, String password, String instalacion, String nombreEmpleado, Date fechaNacimiento, String rol, int sueldo) {
        this.codUsuario = codUsuario;
        this.password = password;
        this.instalacion = instalacion;
        this.nombreEmpleado = nombreEmpleado;
        this.fechaNacimiento = fechaNacimiento;
        this.rol = rol;
        this.sueldo = sueldo;
    }

    //Getter
    public int getCodUsuario() {
        return codUsuario;
    }

    public String getPassword() {
        return password;
    }

    public String getInstalacion() {
        return instalacion;
    }

    public String getNombreEmpleado() {
        return nombreEmpleado;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public String getRol() {
        return rol;
    }

    public int getSueldo() {
        return sueldo;
    }

}
