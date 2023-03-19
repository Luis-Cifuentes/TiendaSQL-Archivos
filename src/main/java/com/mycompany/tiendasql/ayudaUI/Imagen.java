/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tiendasql.ayudaUI;

import java.awt.Image;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JLabel;

/**
 *
 * @author lroda
 */
public class Imagen {
    
    
    public Icon editarFondo(JLabel fondo, String ruta){//Cambia el fondo del JFrame
        ImageIcon imagenFondo = new ImageIcon(getClass().getResource(ruta));
        Icon fondoImagen = new ImageIcon(imagenFondo.getImage().getScaledInstance(fondo.getWidth(), fondo.getHeight(), Image.SCALE_DEFAULT));
        return fondoImagen;
    }
    
    public Image editarIconoApp(){//Cambia el icono de las ventanas
        ImageIcon imagenFondo = new ImageIcon(getClass().getResource("/Icono-App.png"));
        Image fondoImagen = imagenFondo.getImage();
        return fondoImagen;
    }
}
