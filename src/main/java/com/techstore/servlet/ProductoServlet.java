package com.techstore.servlet;

import com.techstore.dao.ProductoDAO;
import com.techstore.model.Producto;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Controlador Web para gestionar el inventario de la Tienda NVIDIA.
 * Implementa la Historia de Usuario HU-01: Registrar componente tecnológico.
 */
@WebServlet("/ProductoServlet")
public class ProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductoDAO productoDAO = new ProductoDAO();

    // MÉTODO GET: Redirecciona al usuario hacia el formulario principal limpio
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    // MÉTODO POST: Recibe, valida y guarda los datos enviados desde el formulario HTML
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Configurar codificación UTF-8 para aceptar tildes y caracteres especiales
        request.setCharacterEncoding("UTF-8");

        try {
            // 2. Capturar parámetros enviados desde los campos del formulario JSP
            String id = request.getParameter("id");
            String nombreProducto = request.getParameter("nombreProducto");
            String categoria = request.getParameter("categoria");
            String precioTexto = request.getParameter("precioProducto");
            String stockTexto = request.getParameter("stock");

            // 3. Validaciones de negocio: Verificar que ningún campo obligatorio venga vacío
            if (id == null || id.trim().isEmpty() || nombreProducto == null || nombreProducto.trim().isEmpty()) {
                request.setAttribute("mensaje", "Error de validación: El ID y el nombre del producto son obligatorios.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }

            // 4. Convertir datos numéricos y validar que no sean negativos
            double precioProducto = Double.parseDouble(precioTexto);
            int stock = Integer.parseInt(stockTexto);

            if (precioProducto <= 0 || stock < 0) {
                request.setAttribute("mensaje", "Error de validación: El precio debe ser mayor a cero y el stock no puede ser negativo.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }

            // 5. Instanciar el modelo Producto aplicando encapsulamiento
            Producto nuevoProducto = new Producto(id.trim(), nombreProducto.trim(), categoria, precioProducto, stock);

            // 6. Invocar al objeto DAO para insertar en la base de datos mediante JDBC
            productoDAO.insertar(nuevoProducto);

            // 7. Enviar mensaje de confirmación exitosa a la vista JSP
            request.setAttribute("mensaje", "¡Componente " + nombreProducto + " registrado con éxito!");

        } catch (NumberFormatException e) {
            // Capturar error si el usuario ingresa letras en campos numéricos
            request.setAttribute("mensaje", "Error de formato: Precio y stock deben ser valores numéricos válidos.");
        } catch (Exception e) {
            // Capturar cualquier otro error inesperado del servidor o base de datos
            request.setAttribute("mensaje", "Error del sistema al registrar: " + e.getMessage());
        }

        // 8. Retornar la respuesta hacia el formulario index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
