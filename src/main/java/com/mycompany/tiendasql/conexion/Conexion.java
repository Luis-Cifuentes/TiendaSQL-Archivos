/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tiendasql.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author lroda
 */
public class Conexion {
    public static Connection dbConexion;
    private final String url = "jdbc:postgresql://localhost:5432/electronichomes";
    private final String usuario = "postgres";
    private final String password = "nbpjxdxd2";
    
    public boolean iniciarConexionDB(){
        try {
            dbConexion = DriverManager.getConnection(this.url, this.usuario, this.password);
            return true;
        } catch (SQLException e){
            System.err.println("Error al conectar con la base de datos" + e.getMessage());
            return false;
        }
    }
}
