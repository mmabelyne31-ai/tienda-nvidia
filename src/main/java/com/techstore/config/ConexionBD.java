package com.techstore.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    // URL de conexión estándar utilizando el driver JDBC de MongoDB para tu base local
    private static final String URL = "jdbc:mongodb://localhost:27017/Tienda_NVIDIA";

    public static Connection obtenerConexion() {
        Connection conexion = null;
        try {
            // Establece el puente JDBC con el motor de base de datos
            conexion = DriverManager.getConnection(URL);
            System.out.println("¡Conexión JDBC establecida con éxito para Tienda_NVIDIA!");
        } catch (SQLException e) {
            System.err.println("Error de conexión JDBC: " + e.getMessage());
        }
        return conexion;
    }
}

