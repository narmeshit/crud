import '../models/producto.dart';

class ProductoController {
  List<Producto> productos = [
    Producto(id: 1, nombre: 'Producto 1', precio: 50),
    Producto(id: 2, nombre: 'Producto 2', precio: 100),
  ];

  List<Producto> obtenerProductos() {
    return productos;
  }

  void agregarProducto(Producto producto) {
    productos.add(producto);
  }

  void actualizarProducto(Producto productoActualizado) {
    final index = productos
        .indexWhere((producto) => producto.id == productoActualizado.id);
    if (index != -1) {
      productos[index] = productoActualizado;
    }
  }

  void eliminarProducto(int id) {
    productos.removeWhere((producto) => producto.id == id);
  }
}
