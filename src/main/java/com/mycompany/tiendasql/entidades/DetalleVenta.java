/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tiendasql.entidades;

/**
 *
 * @author lroda
 */
public class DetalleVenta {
    
    private String codigoPdt;
    private String nombrePdt;
    private int cantidad;
    private double precioUnidad;
    private double subTotal;

    public DetalleVenta(String codigoPdt, String nombrePdt, int cantidad, double precioUnidad, double subTotal) {
        this.codigoPdt = codigoPdt;
        this.nombrePdt = nombrePdt;
        this.cantidad = cantidad;
        this.precioUnidad = precioUnidad;
        this.subTotal = subTotal;
    }

    public String getCodigoPdt() {
        return codigoPdt;
    }

    public String getNombrePdt() {
        return nombrePdt;
    }

    public int getCantidad() {
        return cantidad;
    }

    public double getPrecioUnidad() {
        return precioUnidad;
    }

    public double getSubTotal() {
        return subTotal;
    }

    
    
}
