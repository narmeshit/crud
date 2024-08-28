import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/producto.dart';

class ProductoController {
  static final ProductoController _instance = ProductoController._internal();
  late Database _database;

  ProductoController._internal();

  factory ProductoController() {
    return _instance;
  }

  Future<void> initDatabase() async {
    String path = join(Directory.current.path, 'lib', 'db', 'database.db');
    // String path = join(await getDatabasesPath(), 'database.db');
    
    _database = await openDatabase(path,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE productos(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, precio double)');
      },
      version: 1,
    );
  }

  Future<void> agregarProducto(Producto producto) async {
    await _database.insert(
      'productos',
      producto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Producto>> obtenerProductos() async {
    final List<Map<String, dynamic>> maps = await _database.query('productos');
    return List.generate(
      maps.length,
      (index) {
        return Producto.fromMap(maps[index]);
      },
    );
  }

  Future<void> actualizarProducto(Producto productoActualizar) async {
    await _database.update(
      'productos',
      productoActualizar.toMap(),
      where: 'id=?',
      whereArgs: [productoActualizar.id],
    );
  }

  Future<void> eliminarProducto(int id) async {
    await _database.delete(
      'productos',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}
