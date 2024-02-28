void main() {
  dynamic numero = "";
  numero = 0;
  numero = "Hola";
  numero = [1,2,3];
  const String nombre = "Julian";

  print("""$nombre $numero""");
  print("Mi nombre se $nombre");

  final Map<String, dynamic> persona = {
    "nombre" : "Julian",
    "apellido" : "Vergel",
    "edad" : 19,
    "vivo" : true,

    "foto" : <int, String>{
      1 : "foto_1.jpg",
      2 : "foto_2.jpg"
    }
  };
  print(persona);
  print(persona["nombre"]);
  print(persona["foto"][2]);

  final List<int> number = [1,2,3,4];
  print(number);
  print("tamaño del arreglo ${number.length}");
  print("primero ${number.first}");
  print("ultimo ${number.last}");



  
}