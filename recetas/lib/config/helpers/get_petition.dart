import 'package:dio/dio.dart';
import 'package:recetas/domain/entities/coctel.dart';
import 'package:recetas/infraestructure/model/cocte_model.dart';
import 'package:recetas/infraestructure/model/list_coctel_model.dart';

class GetPetition {
  static const url = 'https://www.thecocktaildb.com/api/json/v1/1';
  final _dio = Dio();

  Future<List<Coctel>> getProducto() async {
    final response = await _dio.get("$url/filter.php?a=Alcoholic");
    List temp = response.data["drinks"];
    List<Coctel> coteles = [];
    ListCoctelModel tc;
    for (var i = 0; i < temp.length; i++) {
      tc = ListCoctelModel.fromJsonMap(temp[i]);
      coteles.add(Coctel(
        id: tc.idDrink,
        bebida: tc.strDrink,
        imagen: tc.strDrinkThumb,
      ));
    }
    return coteles;
  }

  Future<Coctel> getProductoUnico(String id) async {
    final response = await _dio.get("$url/lookup.php?i=$id");
    final drink = response.data["drinks"][0];
    final coctel = CoctelModel.fromJsonMap(drink);
    List tag = coctel.strTags == '' ? [] : coctel.strTags.split(',');
    tag.add(coctel.strAlcoholic);
    return Coctel(
      id: coctel.idDrink,
      bebida: coctel.strDrink,
      imagen: coctel.strDrinkThumb,
      instrucciones: coctel.strInstructions,
      tags: tag,
      ingredientes: [
        {'ingrediente': coctel.strIngredient1, 'cantidad': coctel.strMeasure1},
        {'ingrediente': coctel.strIngredient2, 'cantidad': coctel.strMeasure2},
        {'ingrediente': coctel.strIngredient3, 'cantidad': coctel.strMeasure3},
        {'ingrediente': coctel.strIngredient4, 'cantidad': coctel.strMeasure4},
        {'ingrediente': coctel.strIngredient5, 'cantidad': coctel.strMeasure5},
        {'ingrediente': coctel.strIngredient6, 'cantidad': coctel.strMeasure6},
      ],
    );
  }
}
