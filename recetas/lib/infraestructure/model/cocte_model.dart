class CoctelModel {
  String idDrink;
  String strDrink;
  String strDrinkThumb;
  String strInstructions;
  String strTags;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  String strIngredient5;
  String strIngredient6;
  String strMeasure1;
  String strMeasure2;
  String strMeasure3;
  String strMeasure4;
  String strMeasure5;
  String strMeasure6;
  String strAlcoholic;

  CoctelModel({
    required this.idDrink,
    required this.strDrink,
    required this.strDrinkThumb,
    required this.strInstructions,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
    required this.strTags,
    required this.strAlcoholic,
  });

  factory CoctelModel.fromJsonMap(Map<dynamic, dynamic> json) => CoctelModel(
        idDrink: json["idDrink"],
        strDrink: json["strDrink"],
        strDrinkThumb: json["strDrinkThumb"],
        strTags: json["strTags"] = '',
        strInstructions: json["strInstructions"],
        strIngredient1: json["strIngredient1"] ?? '',
        strIngredient2: json["strIngredient2"] ?? '',
        strIngredient3: json["strIngredient3"] ?? '',
        strIngredient4: json["strIngredient4"] ?? '',
        strIngredient5: json["strIngredient5"] ?? '',
        strIngredient6: json["strIngredient6"] ?? '',
        strMeasure1: json["strMeasure1"] ?? '',
        strMeasure2: json["strMeasure2"] ?? '',
        strMeasure3: json["strMeasure3"] ?? '',
        strMeasure4: json["strMeasure4"] ?? '',
        strMeasure5: json["strMeasure5"] ?? '',
        strMeasure6: json["strMeasure6"] ?? '',
        strAlcoholic: json["strAlcoholic"] ?? '',
      );
}
