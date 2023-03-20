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
public class Venta {
    
    //Atributos
    private String sucursal;
    private Date fechaVenta;
    private int codigoUsuario;
    private int nit;
    private boolean cf;
    private double total;

    //Constructor
    public Venta(String sucursal, Date fechaVenta, int codigoUsuario, int nit, boolean cf, double total) {
        this.sucursal = sucursal;
        this.fechaVenta = fechaVenta;
        this.codigoUsuario = codigoUsuario;
        this.nit = nit;
        this.cf = cf;
        this.total = total;
    }
    
    //Getters y Setters

    public String getSucursal() {
        return sucursal;
    }

    public void setSucursal(String sucursal) {
        this.sucursal = sucursal;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }

    public int getNit() {
        return nit;
    }

    public void setNit(int nit) {
        this.nit = nit;
    }

    public boolean isCf() {
        return cf;
    }

    public void setCf(boolean cf) {
        this.cf = cf;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
    
}
