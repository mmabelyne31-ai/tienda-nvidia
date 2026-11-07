package com.techstore.dao;

import com.techstore.config.ConexionBD;
import com.techstore.model.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    // 1. INSERCIÓN (Crear Producto)
    public void insertar(Producto producto) {
        String sql = "INSERT INTO productos (id, nombreProducto, categoria, precioProducto, stock) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = ConexionBD.obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, producto.getId());
            ps.setString(2, producto.getNombreProducto());
            ps.setString(3, producto.getCategoria());
            ps.setDouble(4, producto.getPrecioProducto());
            ps.setInt(5, producto.getStock());
            
            ps.executeUpdate();
            System.out.println("¡Componente NVIDIA registrado correctamente!");
        } catch (SQLException e) {
            System.err.println("Error al insertar producto: " + e.getMessage());
        }
    }

    // 2. CONSULTA (Leer todos los productos)
    public List<Producto> consultar() {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT * FROM productos";
        try (Connection con = ConexionBD.obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getString("id"));
                p.setNombreProducto(rs.getString("nombreProducto"));
                p.setCategoria(rs.getString("categoria"));
                p.setDouble(4, rs.getDouble("precioProducto"));
                p.setInt(5, rs.getInt("stock"));
                productos.add(p);
            }
        } catch (SQLException e) {
            System.err.println("Error al consultar productos: " + e.getMessage());
        }
        return productos;
    }

    // 3. ACTUALIZACIÓN (Modificar Producto)
    public void actualizar(Producto producto) {
        String sql = "UPDATE productos SET nombreProducto = ?, categoria = ?, precioProducto = ?, stock = ? WHERE id = ?";
        try (Connection con = ConexionBD.obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, producto.getNombreProducto());
            ps.setString(2, producto.getCategoria());
            ps.setDouble(3, producto.getPrecioProducto());
            ps.setInt(4, producto.getStock());
            ps.setString(5, producto.getId());
            
            ps.executeUpdate();
            System.out.println("¡Componente NVIDIA actualizado correctamente!");
        } catch (SQLException e) {
            System.err.println("Error al actualizar producto: " + e.getMessage());
        }
    }

    // 4. ELIMINACIÓN (Borrar Producto)
    public void eliminar(String id) {
        String sql = "DELETE FROM productos WHERE id = ?";
        try (Connection con = ConexionBD.obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, id);
            ps.executeUpdate();
            System.out.println("¡Componente NVIDIA eliminado correctamente!");
        } catch (SQLException e) {
            System.err.println("Error al eliminar producto: " + e.getMessage());
        }
    }
}

