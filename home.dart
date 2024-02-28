void main() async {
  // dynamic numero = "";
  // numero = 0;
  // numero = "Hola";
  // numero = [1,2,3];
  // const String nombre = "Julian";

  // print("""$nombre $numero""");
  // print("Mi nombre se $nombre");

  // final Map<String, dynamic> persona = {
  //   "nombre" : "Julian",
  //   "apellido" : "Vergel",
  //   "edad" : 19,
  //   "vivo" : true,

  //   "foto" : <int, String>{
  //     1 : "foto_1.jpg",
  //     2 : "foto_2.jpg"
  //   }
  // };
  // print(persona);
  // print(persona["nombre"]);
  // print(persona["foto"][2]);

  // final List<int> number = [1,2,3,4,5,4,4,6,7,9,9,0];
  // print(number);
  // print("tamaño del arreglo ${number.length}");
  // print("primero ${number.first}");
  // print("ultimo ${number.last}");

  // final contrario = number.reversed;
  // print(contrario);
  // print(contrario.toList());
  // print(contrario.toSet());

  // print(saludo());
  // print(saludo_dos());

  // print(sumar(a: 1));

  // final person2 = Person(nombre: "Julian", apellido: "Vergel");
  // final person1 = {
  //   "nombre" : "Julian",
  //   "apellido" : "Vergel"
  // };
  // final person = Person.fromJson(person1);
  // print(person);
  // print(person.nombre);
  // print(person.apellido);

  // print("inicio");
  // try {
  //   final pet = await httpGet("dklfjalasdad");
  //   print(pet);
  //   print("final");
  // } on Exception {
  //   print("esto es un error exception");
  // } 
  // catch (e) {
  //   print("error $e");
  // } finally {
  //   print("siempre");
  // }

  emitirNumeros().listen((event) {
    print("stream $event");
  });
}

Stream<int> emitirNumeros() async* {
  final valorEmitir = [1,2,3,4,5];
  for(int i in valorEmitir){
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }

  // return Stream.periodic(const Duration(seconds: 1), (value){
  //   return value;
  // }).take(5);
}

// Future<String> httpGet(String url) async {
//   final pet = await Future.delayed(const Duration(seconds: 3));
//   throw Exception("error");
//   return "llegue";
// }

// int sumar({required int a, int b = 0}) {
//   return a + b;
// }

// saludo() {
//   return "HOla";
// }
// String saludo_dos() => "Hola X2";

// class Person {
//   String nombre;
//   String apellido;

//   Person({required this.nombre, required this.apellido});

//   Person.fromJson(Map<String, dynamic> json) :
//     nombre = json["nombre"] ?? "No hay nombre",
//     apellido = json["apellido"] ?? "No hay apellido"
//   ;

//   @override
//   String toString() {
//     return "Esto es la clase";
//   }
// }