import 'package:crud/controllers/producto_controller.dart';
import 'package:crud/models/producto.dart';
import 'package:flutter/material.dart';

class ProductoScreen extends StatefulWidget {
  const ProductoScreen({super.key});

  @override
  State<ProductoScreen> createState() => _ProductoScreenState();
}

class _ProductoScreenState extends State<ProductoScreen> {
  final ProductoController _productoController = ProductoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD con Datos en Memoria'),
      ),
      body: ListView.builder(
        itemCount: _productoController.obtenerProductos().length,
        itemBuilder: (context, index) {
          final producto = _productoController.obtenerProductos()[index];
          return ListTile(
            title: Text(producto.nombre),
            subtitle: Text('S/${producto.precio}'),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    final Producto productoActualizado = Producto(
                      id: producto.id,
                      nombre: 'Producto Actualizado ${producto.id}',
                      precio: producto.precio,
                    );
                    setState(() {
                      _productoController
                          .actualizarProducto(productoActualizado);
                    });
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _productoController.eliminarProducto(producto.id);
                    });
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int id = _productoController.productos.length;
          id++;
          Producto producto =
              Producto(id: id, nombre: 'Producto $id', precio: id * 50);
          setState(() {
            _productoController.agregarProducto(producto);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
