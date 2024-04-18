class Coctel {
  final String id;
  final String? bebida;
  final String? imagen;
  final String? instrucciones;
  final List? ingredientes;
  final List? tags;
  Coctel(
      {required this.id,
      this.bebida,
      this.imagen,
      this.instrucciones,
      this.ingredientes,
      this.tags});
}
