/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.mycompany.tiendasql;

import com.mycompany.tiendasql.UI.Login;
import com.mycompany.tiendasql.conexion.Conexion;

/**
 *
 * @author lroda
 */
public class TiendaSQL {

    public static void main(String[] args) {
        Conexion cxn = new Conexion();
        if (cxn.iniciarConexionDB()) {
            System.out.println("Conexion realizada con exito");
            Login login = new Login();
        }
    }
}
