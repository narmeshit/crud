import 'package:flutter/material.dart';

import '../controllers/producto_controller.dart';
import '../models/producto.dart';

class ProductoScreen extends StatefulWidget {
  const ProductoScreen({super.key});

  @override
  State<ProductoScreen> createState() => _ProductoScreenState();
}

class _ProductoScreenState extends State<ProductoScreen> {
  final ProductoController _controller = ProductoController();

  List<Producto> productos = [];

  @override
  void initState() {
    super.initState();
    _controller.initDatabase().then((_) {
      cargarProductos();
    });
  }

  Future<void> cargarProductos() async {
    final dataProductos = await _controller.obtenerProductos();
    setState(() {
      productos = dataProductos;
    });
  }

  Future<void> agregarProducto() async {
    final producto = Producto(nombre: 'Producto', precio: 100);
    await _controller.agregarProducto(producto);
    cargarProductos();
  }

  Future<void> actualizarProducto(Producto productoActualizar) async {
    final producto = Producto(
      id: productoActualizar.id,
      nombre: '${productoActualizar.nombre} actualizado',
      precio: productoActualizar.id! * 50,
    );
    await _controller.actualizarProducto(producto);
    cargarProductos();
  }

  Future<void> eliminarProducto(int id) async {
    await _controller.eliminarProducto(id);
    cargarProductos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD con SQLite'),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return ListTile(
            title: Text('${producto.nombre} ${producto.id}'),
            subtitle: Text('id: ${producto.id}, S/${producto.precio}'),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () => actualizarProducto(producto),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () => eliminarProducto(producto.id!),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregarProducto,
        child: const Icon(Icons.add),
      ),
    );
  }
}
