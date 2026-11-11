<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda NVIDIA | Gestión de Inventario</title>
    <!-- Carga de Bootstrap 5.3.3 igual que en los ejemplos del instructor -->
    <link href="https://jsdelivr.net" rel="stylesheet">
    <style>
        body { background-color: #121212; color: #f8f9fa; }
        .bg-nvidia { background-color: #1a1a1a; border-bottom: 3px solid #76b900; }
        .btn-nvidia { background-color: #76b900; color: #000; font-weight: bold; }
        .btn-nvidia:hover { background-color: #5d9300; color: #fff; }
        .card-nvidia { background-color: #1e1e1e; border: 1px solid #333; border-top: 4px solid #76b900; }
    </style>
</head>
<body>

    <!-- Barra de navegación semántica adaptable (Navbar) -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-nvidia sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-success" href="index.jsp">⚡ TIENDA NVIDIA</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menuNvidia">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="menuNvidia">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">Registro de Productos</a></li>
                    <li class="nav-item"><a class="nav-link" href="#catalogo">Catálogo Destacado</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Encabezado principal -->
    <header class="py-4 text-center bg-dark">
        <div class="container">
            <h1 class="fw-bold">Módulo de Inventario Hardware</h1>
            <p class="lead text-secondary">Historia de Usuario HU-01: Registro y validación de componentes tecnológicos</p>
        </div>
    </header>

    <!-- Contenido principal con rejilla responsive de Bootstrap -->
    <main class="container py-5">
        <div class="row g-4 justify-content-center">
            
            <!-- Columna del Formulario Funcional (Servlet POST) -->
            <div class="col-12 col-lg-6">
                <div class="card card-nvidia p-4 shadow">
                    <h2 class="h4 text-center mb-3 text-success">Registrar Nuevo Componente</h2>
                    
                    <form action="ProductoServlet" method="POST">
                        <div class="mb-3">
                            <label for="id" class="form-label">Código del Componente (ID):</label>
                            <input type="text" class="form-control bg-dark text-white border-secondary" id="id" name="id" placeholder="Ej: NV-RTX4090" required>
                        </div>

                        <div class="mb-3">
                            <label for="nombreProducto" class="form-label">Nombre del Producto:</label>
                            <input type="text" class="form-control bg-dark text-white border-secondary" id="nombreProducto" name="nombreProducto" placeholder="Ej: NVIDIA GeForce RTX 4090" required>
                        </div>

                        <div class="mb-3">
                            <label for="categoria" class="form-label">Categoría:</label>
                            <select class="form-select bg-dark text-white border-secondary" id="categoria" name="categoria">
                                <option value="Tarjetas Graficas">Tarjetas Gráficas</option>
                                <option value="Procesadores">Procesadores</option>
                                <option value="Memorias RAM">Memorias RAM</option>
                                <option value="Sistemas de Enfriamiento">Sistemas de Enfriamiento</option>
                            </select>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="precioProducto" class="form-label">Precio (USD):</label>
                                <input type="number" class="form-control bg-dark text-white border-secondary" id="precioProducto" name="precioProducto" step="0.01" placeholder="0.00" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="stock" class="form-label">Cantidad en Stock:</label>
                                <input type="number" class="form-control bg-dark text-white border-secondary" id="stock" name="stock" placeholder="0" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-nvidia w-100 py-2 mt-2">Guardar en Base de Datos</button>
                    </form>

                    <!-- Elemento JSP para mostrar respuestas del Servlet -->
                    <% 
                        String mensaje = (String) request.getAttribute("mensaje");
                        if (mensaje != null) {
                    %>
                        <div class="alert alert-info mt-3 text-center fw-bold" role="alert">
                            <%= mensaje %>
                        </div>
                    <% 
                        } 
                    %>
                </div>
            </div>

        </div>
    </main>

    <!-- Pie de página semántico -->
    <footer class="bg-nvidia text-white py-3 mt-5">
        <div class="container text-center">
            <small>Tienda NVIDIA TechStore &copy; 2026 - Proyecto Formativo ADSO SENA</small>
        </div>
    </footer>

    <!-- Script de Bootstrap 5.3.3 -->
    <script src="https://jsdelivr.net"></script>
</body>
</html>
