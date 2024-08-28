class Producto {
  final int? id;
  final String nombre;
  final double precio;

  Producto({
    this.id,
    required this.nombre,
    required this.precio,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'precio': precio,
    };
  }

  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      id: map['id'],
      nombre: map['nombre'],
      precio: map['precio'],
    );
  }
}
