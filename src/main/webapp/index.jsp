<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechStore | Tienda NVIDIA Colombia</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background-color: #f4f6f8; color: #212529; display: flex; flex-direction: column; min-height: 100vh; }

        .navbar { background-color: #1f2428; padding: 14px 40px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 15px; }
        .nav-left { display: flex; align-items: center; gap: 30px; }
        .brand { color: #ffffff; font-size: 20px; font-weight: bold; text-decoration: none; display: flex; align-items: center; gap: 8px; }
        .brand-icon { background-color: #13884e; color: #fff; padding: 3px 7px; border-radius: 4px; font-size: 14px; font-weight: 900; }
        .nav-links { list-style: none; display: flex; gap: 22px; }
        .nav-links a { color: #adb5bd; text-decoration: none; font-size: 15px; }
        .nav-links a.active { color: #ffffff; font-weight: 500; }
        .search-box { display: flex; align-items: center; background-color: #2c3237; border-radius: 4px; padding: 5px 12px; border: 1px solid #3f474e; }
        .search-box input { background: transparent; border: none; color: #ffffff; outline: none; font-size: 14px; width: 200px; margin-left: 8px; }

        .promo-banner { background-color: #13884e; color: #ffffff; text-align: center; padding: 9px 15px; font-size: 14px; font-weight: 500; }

        .container { max-width: 1140px; margin: 30px auto; padding: 0 20px; flex: 1; }
        .hero-box { background-color: #ffffff; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.06); padding: 30px; display: flex; flex-wrap: wrap; align-items: center; gap: 35px; border: 1px solid #e9ecef; }
        
        .hero-visual { flex: 1; min-width: 280px; text-align: center; padding: 20px; background-color: #f8f9fa; border-radius: 8px; border: 1px solid #edf0f2; }
        .gpu-badge { display: inline-block; background-color: #1f2428; color: #76b900; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: bold; margin-bottom: 12px; }
        .hero-visual h2 { font-size: 24px; color: #1f2428; margin-bottom: 8px; }
        .hero-visual p { color: #6c757d; font-size: 14px; margin-bottom: 18px; }
        .gpu-card-art { background: linear-gradient(135deg, #1a1e21 0%, #2d3436 100%); color: #fff; border-radius: 10px; padding: 22px; border-left: 6px solid #13884e; text-align: left; margin: 0 auto; max-width: 320px; }
        .gpu-card-art .series { color: #76b900; font-size: 11px; font-weight: bold; }
        .gpu-card-art .model { font-size: 26px; font-weight: 900; margin: 4px 0; }
        .gpu-card-art .specs { font-size: 12px; color: #ced4da; border-top: 1px solid #495057; padding-top: 8px; margin-top: 8px; display: flex; justify-content: space-between; }

        .hero-form { flex: 1; min-width: 320px; background-color: #1f2428; color: #ffffff; padding: 25px; border-radius: 8px; border-top: 5px solid #13884e; }
        .hero-form h3 { font-size: 19px; margin-bottom: 4px; text-align: center; }
        .hero-form .subtitle { color: #adb5bd; font-size: 12px; text-align: center; margin-bottom: 16px; }
        .form-group { margin-bottom: 12px; }
        label { display: block; margin-bottom: 4px; font-size: 13px; color: #e9ecef; }
        input[type="text"], select { width: 100%; padding: 9px 11px; border-radius: 4px; border: 1px solid #495057; background-color: #2b3035; color: #ffffff; font-size: 14px; }
        .row { display: flex; gap: 12px; }
        .col { flex: 1; }
        .btn-submit { width: 100%; background-color: #13884e; color: #ffffff; border: none; padding: 11px; border-radius: 5px; font-size: 15px; font-weight: bold; cursor: pointer; margin-top: 8px; }
        .btn-submit:hover { background-color: #0f6e3f; }

        .alert { margin-top: 14px; padding: 12px; border-radius: 5px; background-color: #14361d; border: 1px solid #28a745; color: #75f092; text-align: center; font-size: 13px; font-weight: bold; display: none; }
        .alert-error { background-color: #4a151b; border-color: #dc3545; color: #ff8591; }

        .table-box { background-color: #ffffff; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.06); padding: 25px; margin-top: 30px; border: 1px solid #e9ecef; }
        .table-box h3 { color: #13884e; margin-bottom: 15px; font-size: 20px; }
        table { width: 100%; border-collapse: collapse; text-align: left; font-size: 14px; }
        th { background-color: #1f2428; color: #ffffff; padding: 12px; }
        td { padding: 12px; border-bottom: 1px solid #dee2e6; }
        .btn-edit { background-color: #ffc107; color: #000; padding: 6px 12px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; font-size: 12px; margin-right: 5px; }
        .btn-del { background-color: #dc3545; color: #fff; padding: 6px 12px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; font-size: 12px; }

        footer { background-color: #1f2428; color: #adb5bd; text-align: center; padding: 18px; font-size: 13px; margin-top: 40px; border-top: 3px solid #13884e; }
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-left">
            <a href="index.jsp" class="brand"><span class="brand-icon">TS</span> TechStore</a>
            <ul class="nav-links">
                <li><a href="index.jsp" class="active">Inicio</a></li>
                <li><a href="#tabla-inventario">Inventario</a></li>
            </ul>
        </div>
        <div class="search-box">
            <span>🔍</span>
            <input type="text" placeholder="Buscar componente...">
        </div>
    </nav>

    <div class="promo-banner">
        🚚 Envíos gratis a toda Colombia | Garantía oficial | Atención 24/7
    </div>

    <main class="container">
        <div class="hero-box">
            <!-- Izquierda: Vitrina Hardware -->
            <div class="hero-visual">
                <span class="gpu-badge">NUEVA GENERACIÓN NVIDIA</span>
                <h2>Bienvenido a TechStore</h2>
                <p>Gestión integral de inventario hardware con operaciones CRUD en tiempo real.</p>
                <div class="gpu-card-art">
                    <div class="series">GIGABYTE / ASUS TUF GAMING</div>
                    <div class="model">GEFORCE RTX 5070</div>
                    <div class="specs"><span>12GB GDDR7</span><span>PCIe 5.0</span><span>DLSS 4</span></div>
                </div>
            </div>

            <!-- Derecha: Formulario CRUD -->
            <div class="hero-form">
                <h3 id="form-titulo">Registro de Inventario (HU-01)</h3>
                <p class="subtitle">Base de datos: Tienda_NVIDIA | Colección: Techstore</p>
                
                <div id="formProducto">
                    <input type="hidden" id="modo" value="crear">
                    
                    <div class="form-group">
                        <label for="id">Código del Componente (ID):</label>
                        <input type="text" id="id" name="id" placeholder="Ej: NV-RTX5070">
                    </div>

                    <div class="form-group">
                        <label for="nombreProducto">Nombre del Producto:</label>
                        <input type="text" id="nombreProducto" name="nombreProducto" placeholder="Ej: GeForce RTX 5070 12GB">
                    </div>

                    <div class="form-group">
                        <label for="categoria">Categoría:</label>
                        <select id="categoria" name="categoria">
                            <option value="Tarjetas Graficas">Tarjetas Gráficas</option>
                            <option value="Procesadores">Procesadores</option>
                            <option value="Memorias RAM">Memorias RAM</option>
                            <option value="Sistemas de Enfriamiento">Sistemas de Enfriamiento</option>
                        </select>
                    </div>

                    <div class="row">
                        <div class="col form-group">
                            <label for="precioProducto">Precio (USD):</label>
                            <input type="text" id="precioProducto" name="precioProducto" placeholder="0.00">
                        </div>
                        <div class="col form-group">
                            <label for="stock">Stock:</label>
                            <input type="text" id="stock" name="stock" placeholder="0">
                        </div>
                    </div>

                    <button type="button" id="btn-guardar" class="btn-submit" onclick="procesarFormulario()">Guardar en Inventario</button>
                </div>

                <!-- Alerta en vivo y elemento JSP -->
                <div id="caja-alerta" class="alert"></div>
                <% String infoServidor = "Servidor Tomcat 9.0 Activo - Módulo Tienda NVIDIA"; %>
                <p style="text-align:center; font-size:11px; color:#6c757d; margin-top:10px;"><%= infoServidor %></p>
            </div>
        </div>

        <!-- Tabla de Inventario CRUD en vivo -->
        <div class="table-box" id="tabla-inventario">
            <h3>📦 Inventario Registrado (Base de Datos: Tienda_NVIDIA)</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Producto</th>
                        <th>Categoría</th>
                        <th>Precio (USD)</th>
                        <th>Stock</th>
                        <th>Acciones CRUD</th>
                    </tr>
                </thead>
                <tbody id="cuerpo-tabla">
                </tbody>
            </table>
        </div>
    </main>

    <footer>
        TechStore Colombia &copy; 2026 - Proyecto Formativo ADSO SENA
    </footer>

    <script>
        var inventario = [
            { id: "NV-RTX4090", nombre: "NVIDIA GeForce RTX 4090", categoria: "Tarjetas Graficas", precio: 1599.99, stock: 15 },
            { id: "NV-RTX4080", nombre: "NVIDIA GeForce RTX 4080", categoria: "Tarjetas Graficas", precio: 1199.99, stock: 6 },
            { id: "NV-RTX4060", nombre: "NVIDIA GeForce RTX 4060", categoria: "Tarjetas Graficas", precio: 399.99, stock: 20 }
        ];

        function dibujarTabla() {
            var tbody = document.getElementById("cuerpo-tabla");
            tbody.innerHTML = "";
            if (inventario.length === 0) {
                tbody.innerHTML = '<tr><td colspan="6" style="text-align:center; color:#6c757d;">No hay componentes registrados.</td></tr>';
                return;
            }
            for (var i = 0; i < inventario.length; i++) {
                var p = inventario[i];
                var fila = '<tr>' +
                    '<td><strong>' + p.id + '</strong></td>' +
                    '<td>' + p.nombre + '</td>' +
                    '<td>' + p.categoria + '</td>' +
                    '<td>$' + parseFloat(p.precio).toFixed(2) + '</td>' +
                    '<td>' + p.stock + ' und.</td>' +
                    '<td>' +
                        '<button type="button" class="btn-edit" onclick="cargarEditar(\'' + p.id + '\')">✏️ Editar</button>' +
                        '<button type="button" class="btn-del" onclick="eliminarProducto(\'' + p.id + '\')">🗑️ Eliminar</button>' +
                    '</td>' +
                '</tr>';
                tbody.innerHTML += fila;
            }
        }

        function mostrarAlerta(texto, esError) {
            var alerta = document.getElementById("caja-alerta");
            alerta.textContent = texto;
            alerta.className = esError ? "alert alert-error" : "alert";
            alerta.style.display = "block";
        }

        function limpiarCampos() {
            document.getElementById("id").value = "";
            document.getElementById("nombreProducto").value = "";
            document.getElementById("precioProducto").value = "";
            document.getElementById("stock").value = "";
        }

        function procesarFormulario() {
            var modo = document.getElementById("modo").value;
            var id = document.getElementById("id").value.trim();
            var nombre = document.getElementById("nombreProducto").value.trim();
            var categoria = document.getElementById("categoria").value;
            var precioTexto = document.getElementById("precioProducto").value.trim();
            var stockTexto = document.getElementById("stock").value.trim();

            if (id === "" || nombre === "" || precioTexto === "" || stockTexto === "") {
                mostrarAlerta("❌ Error de validación: Todos los campos son obligatorios.", true);
                return;
            }

            var precio = parseFloat(precioTexto);
            var stock = parseInt(stockTexto);

            if (isNaN(precio) || precio <= 0 || isNaN(stock) || stock < 0) {
                mostrarAlerta("❌ Error de validación: El precio debe ser mayor a 0 y el stock un número positivo.", true);
                return;
            }

            if (modo === "actualizar") {
                for (var i = 0; i < inventario.length; i++) {
                    if (inventario[i].id === id) {
                        inventario[i] = { id: id, nombre: nombre, categoria: categoria, precio: precio, stock: stock };
                        mostrarAlerta("✏️ ¡Componente " + nombre + " (ID: " + id + ") actualizado con éxito!", false);
                        break;
                    }
                }
                document.getElementById("modo").value = "crear";
                document.getElementById("id").readOnly = false;
                document.getElementById("form-titulo").textContent = "Registro de Inventario (HU-01)";
                document.getElementById("btn-guardar").textContent = "Guardar en Inventario";
            } else {
                for (var j = 0; j < inventario.length; j++) {
                    if (inventario[j].id === id) {
                        mostrarAlerta("❌ Error: El código " + id + " ya existe en la base de datos.", true);
                        return;
                    }
                }
                inventario.push({ id: id, nombre: nombre, categoria: categoria, precio: precio, stock: stock });
                mostrarAlerta("✅ ¡Componente " + nombre + " (ID: " + id + ") registrado en Tienda_NVIDIA!", false);
            }

            limpiarCampos();
            dibujarTabla();
        }

        function cargarEditar(id) {
            for (var i = 0; i < inventario.length; i++) {
                if (inventario[i].id === id) {
                    var prod = inventario[i];
                    document.getElementById("id").value = prod.id;
                    document.getElementById("id").readOnly = true;
                    document.getElementById("nombreProducto").value = prod.nombre;
                    document.getElementById("categoria").value = prod.categoria;
                    document.getElementById("precioProducto").value = prod.precio;
                    document.getElementById("stock").value = prod.stock;
                    document.getElementById("modo").value = "actualizar";
                    document.getElementById("form-titulo").textContent = "Modificar Componente (HU-02)";
                    document.getElementById("btn-guardar").textContent = "Actualizar Componente";
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                    break;
                }
            }
        }

        function eliminarProducto(id) {
            var nuevoInventario = [];
            for (var i = 0; i < inventario.length; i++) {
                if (inventario[i].id !== id) {
                    nuevoInventario.push(inventario[i]);
                }
            }
            inventario = nuevoInventario;
            mostrarAlerta("🗑️ Componente " + id + " eliminado correctamente de la base de datos.", false);
            dibujarTabla();
        }

        dibujarTabla();
    </script>

</body>
</html>
