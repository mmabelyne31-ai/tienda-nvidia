package com.techstore;

import com.techstore.dao.ProductoDAO;
import com.techstore.model.Producto;
import java.util.List;

public class App {
    public static void main(String[] args) {
        System.out.println("=== INICIANDO MÓDULO TIENDA NVIDIA ===");
        
        // Instanciamos el objeto DAO para acceder a las funciones del CRUD
        ProductoDAO productoDAO = new ProductoDAO();

        // 1. PRUEBA DE INSERCIÓN: Creamos un componente tecnológico de prueba
        Producto nuevaGrafica = new Producto("NV-RTX4060", "NVIDIA RTX 4060 Ti", "Tarjetas Graficas", 1599.99, 12);
        System.out.println("\nProbando insercion...");
        productoDAO.insertar(nuevaGrafica);

        // 2. PRUEBA DE CONSULTA: Listamos los productos en la base de datos
        System.out.println("\nProbando consulta general de inventario:");
        List<Producto> lista = productoDAO.consultar();
        
        if (lista.isEmpty()) {
            System.out.println("No se encontraron componentes registrados.");
        } else {
            for (Producto p : lista) {
                System.out.println("- [" + p.getId() + "] " + p.getNombreProducto() + " | Categoria: " + p.getCategoria() + " | Precio: $" + p.getPrecioProducto() + " | Stock: " + p.getStock());
            }
        }
        
        System.out.println("\n=== EJECUCIÓN DEL MÓDULO FINALIZADA ===");
    }
}


