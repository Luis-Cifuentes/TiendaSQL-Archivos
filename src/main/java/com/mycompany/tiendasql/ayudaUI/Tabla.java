/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tiendasql.ayudaUI;

import com.mycompany.tiendasql.entidades.DetalleVenta;
import java.awt.Color;
import java.awt.Font;
import javax.swing.BorderFactory;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
/**
 *
 * @author lroda
 */
public class Tabla{
    
    public static void cambiarEncabezado(JTable tabla, String[] titulos) {
        JTableHeader header = tabla.getTableHeader();
        header.setBackground(new Color (94, 96, 98));
        header.setForeground(Color.white);
        header.setFont(new Font("Tahoma", Font.PLAIN, 18));
        DefaultTableModel modelo = new DefaultTableModel();
        for (int i = 0; i < titulos.length; i++) {
            modelo.addColumn(titulos[i]);
        }
        tabla.setRowHeight(20);
        tabla.setFont(new Font("Tahoma", Font.PLAIN, 18));
        tabla.setEnabled(false);
        tabla.setBorder(BorderFactory.createLineBorder(Color.black));
        tabla.setModel(modelo);
    }
    
    public static void insertarProductos(JTable tabla, DetalleVenta venta) {
        DefaultTableModel model = (DefaultTableModel)tabla.getModel();
        model.addRow(new Object[]{venta.getCodigoPdt(), venta.getNombrePdt(), venta.getCantidad(), venta.getPrecioUnidad(), venta.getSubTotal()});
    }
    

    
}
