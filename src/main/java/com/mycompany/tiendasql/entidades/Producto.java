/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tiendasql.entidades;

/**
 *
 * @author lroda
 */
public class Producto {
    
    //Atributos
    private String codigoPdt;
    private int inventario;
    private String nombrePdt;
    private String marca;
    private double precioUnidad;
    private int cantidad;

    //Constructor
    public Producto(String codigoPdt, int inventario, String nombrePdt, String marca, double precioUnidad, int cantidad) {
        this.codigoPdt = codigoPdt;
        this.inventario = inventario;
        this.nombrePdt = nombrePdt;
        this.marca = marca;
        this.precioUnidad = precioUnidad;
        this.cantidad = cantidad;
    }

    
    //Getters y Setters

    public String getCodigoPdt() {
        return codigoPdt;
    }

    public int getInventario() {
        return inventario;
    }

    public String getNombrePdt() {
        return nombrePdt;
    }

    public String getMarca() {
        return marca;
    }

    public double getPrecioUnidad() {
        return precioUnidad;
    }

    public int getCantidad() {
        return cantidad;
    }
    
}
